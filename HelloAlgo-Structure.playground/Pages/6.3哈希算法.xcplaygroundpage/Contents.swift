//: [Previous](@previous)

import Foundation

/* 简单哈希算法 */

/// 加法哈希
/// 对输入的每个字符的 ASCII 码进行相加，将得到的总和作为哈希值。
func addHash(key: String) -> Int {
    var hash = 0
    let MODULUS = 1_000_000_007
    for c in key {
        for scalar in c.unicodeScalars {
            hash = (hash + Int(scalar.value)) % MODULUS
        }
    }
    return hash
}

/// 乘法哈希
/// 利用乘法的不相关性，每轮乘以一个常数，将各个字符的 ASCII 码累积到哈希值中。
func mulHash(key: String) -> Int {
    var hash = 0
    var MODULUS = 1_000_000_007
    for c in key {
        for scalar in c.unicodeScalars {
            hash = (31 * hash + Int(scalar.value)) % MODULUS
        }
    }
    return hash
}

/// 异或哈希
/// 将输入数据的每个元素通过异或操作累积到一个哈希值中。
func xorHash(key: String) -> Int {
    var hash = 0
    var MODULUS = 1_000_000_007
    for c in key {
        for scalar in c.unicodeScalars {
            hash ^= Int(scalar.value)
        }
    }
    return hash & MODULUS
}

/// 旋转哈希
/// 将每个字符的 ASCII 码累积到一个哈希值中，每次累积之前都会对哈希值进行旋转操作。
func rotHash(key: String) -> Int {
    var hash = 0
    let MODULUS = 1_000_000_007
    for c in key {
        for scalar in c.unicodeScalars {
            hash = ((hash << 4) ^ (hash >> 28) ^ Int(scalar.value)) % MODULUS
        }
    }
    return hash
}

/* 
 Swift 内置哈希值 每次编译结果都不同。
 哈希值在不同的运行时环境、Swift版本或编译器设置下会发生变化。
 Swift的哈希算法会受到底层平台、编译器版本和其他因素的影响，
 因此在不同的环境下，同一段代码会产生不同的哈希值。
 */

let num = 3
let hashNum = num.hashValue
// -3,320,462,800,473,418,431
// -6,927,012,715,119,280,882

let bol = true
let hashBol = bol.hashValue
// 3,324,483,666,200,687,309
// 8,505,234,286,599,632,123

let dec = 3.14159
let hashDec = dec.hashValue
// 8,514,113,951,134,313,513
// 4,486,115,913,318,275,717

let str = "Hello 算法"
let hashStr = str.hashValue
// -8,440,251,058,690,080,704
// -3,777,008,248,773,346,209

let arr = [AnyHashable(12836), AnyHashable("小哈")]
let hashTup = arr.hashValue
// -3,480,153,804,108,085,009
// -9,142,078,019,926,761,781

//: [Next](@next)
