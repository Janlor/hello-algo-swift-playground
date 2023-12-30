import UIKit

/// for 循环
func forloop(n: Int) -> Int {
    var res = 0
    for i in 1 ... n {
        res += i
    }
    return res
}
//forloop(n: 100)

/// while 循环
func whileLoop(n: Int) -> Int {
    var res = 0
    var i = 1
    while i <= n {
        res += i
        i += 1
    }
    return res
}
//whileLoop(n: 100)

/// while 循环（两次更新）
func whileLoop2(n: Int) -> Int {
    var res = 0
    var i = 1
    while i <= n {
        print(i)
        res += i
        i += 1
        i *= 2
    }
    return res
}
//whileLoop2(n: 100)

/// 双层 for 循环
func nestedForLoop(n: Int) -> String {
    var res = ""
    for i in 1 ... n {
        for j in 1 ... n {
            res.append("(\(i),\(j)),")
        }
    }
    return res
}
//nestedForLoop(n: 9)


/// 递归
func recursion(n: Int) -> Int {
//    print("n = \(n)")
    // 终止条件
    if n == 1 {
        return 1
    }
    // 递：递归调用
    let res = recursion(n: n - 1)
//    print("res = \(res)")
//    print("n = \(n)")
    // 归：返回结果
    return n + res
}
//recursion(n: 100)

/// 尾递归
func tailRecursion(n: Int, res: Int) -> Int {
    // 终止条件
    if n == 0 {
        return res
    }
    // 尾递归调用
    return tailRecursion(n: n - 1, res: res + n)
}
//tailRecursion(n: 100, res: 0)

/// 给定一个斐波那契数列 0,1,1,2,3,5,8,13,...... ，求该数列的第 n 个数字。
/// 斐波那契数列：递归树
func fib(n: Int) -> Int {
    // 终止条件 f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1
    }
    // 递归调用 f(n) = f(n-1) + f(n-2)
    let res = fib(n: n - 1) + fib(n: n - 2)
    // 返回结果 f(n)
    return res
}
//fib(n: 20)

/// 使用迭代模拟递归
func forLoopRecur(n: Int) -> Int {
    // 使用一个显式的栈来模拟系统调用栈
    var stack: [Int] = []
    var res = 0
    // 递：递归调用
    for i in stride(from: n, to: 0, by: -1) {
        // 通过“入栈操作”模拟“递”
        stack.append(i)
    }
    // 归：返回结果
    while !stack.isEmpty {
        // 通过“出栈操作”模拟“归”
        res += stack.removeLast()
    }
    // res = 1+2+3+...+n
    return res
}
//forLoopRecur(n: 100)
