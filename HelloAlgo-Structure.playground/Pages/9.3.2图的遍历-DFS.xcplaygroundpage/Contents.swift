//: [Previous](@previous)

import Foundation

/// 基于邻接表实现的无向图类
class GraphAdjList {
    /// 邻接表，key：顶点， value：该顶点的所有邻接顶点
    public private(set) var adjList: [Vertex: [Vertex]]
    
    /// 构造方法
    public init(edges: [[Vertex]]) {
        adjList = [:]
        for edge in edges {
            addVertex(vet: edge[0])
            addVertex(vet: edge[1])
            addEdge(vet1: edge[0], vet2: edge[1])
        }
    }
    
    /// 添加边
    func addEdge(vet1: Vertex, vet2: Vertex) {
        if adjList[vet1] == nil || adjList[vet2] == nil || vet1 == vet2 {
            fatalError("参数错误")
        }
        // 添加边 vet1 - vet2
        adjList[vet1]?.append(vet2)
        adjList[vet2]?.append(vet1)
    }
    
    /// 添加顶点
    func addVertex(vet: Vertex) {
        if adjList[vet] != nil {
            return
        }
        // 在邻接表中添加一个新链表
        adjList[vet] = []
    }

    /// 打印邻接表
    func print() {
        Swift.print("邻接表 = ")
        for pair in adjList {
            var tmp: [Int] = []
            for vertex in pair.value {
                tmp.append(vertex.val)
            }
            Swift.print("\(pair.key): \(tmp),")
        }
    }
}

/// 深度优先遍历辅助函数
func dfs(graph: GraphAdjList, visited: inout Set<Vertex>, res: inout [Vertex], vet: Vertex) {
    // 记录访问节点
    res.append(vet)
    // 标记该顶点已被访问
    visited.insert(vet)
    // 遍历该顶点的所有邻接顶点
    for adjVet in graph.adjList[vet] ?? [] {
        if visited.contains(adjVet) {
            // 跳过已被访问的节点
            continue
        }
        // 递归访问邻接顶点
        dfs(graph: graph, visited: &visited, res: &res, vet: adjVet)
    }
}

/// 深度优先遍历
/// 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
func graphDFS(graph: GraphAdjList, startVet: Vertex) -> [Vertex] {
    // 顶点遍历序列
    var res: [Vertex] = []
    // 哈希表，用于记录已被访问过的顶点
    var visited: Set<Vertex> = [startVet]
    dfs(graph: graph, visited: &visited, res: &res, vet: startVet)
    return res
}

func test() {
    /* 初始化无向图 */
    let v = Vertex.valsToVets(vals: [0, 1, 2, 3, 4, 5, 6])
    let edges = [
        [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
        [v[2], v[5]], [v[4], v[5]], [v[5], v[6]],
    ]
    let graph = GraphAdjList(edges: edges)
    print("\n初始化后，图为")
    graph.print()

    /* 深度优先遍历 */
    let res = graphDFS(graph: graph, startVet: v[0])
    print("\n深度优先遍历（DFS）顶点序列为")
    print(Vertex.vetsToVals(vets: res))
}

test()

//: [Next](@next)
