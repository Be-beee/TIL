//
//  main.swift
//  AC_5430
//
//  Created by 서보경 on 2021/04/15.
//

// MARK:- 5430 AC
// https://www.acmicpc.net/problem/5430
// 요구하는 출력을 잘 확인하자ㅠㅠ

func main() {
    let testcase = Int(readLine()!)!
    var answer: [String] = []
    
    
    for _ in 0 ..< testcase {
        let queries = readLine()!
        let _ = Int(readLine()!)!
        var arrInput = readLine()!
        arrInput = String(arrInput.dropFirst())
        arrInput.removeLast()
        let arr = arrInput.split(separator: ",").map{ Int(String($0))! }

        let result = AC(queries: queries, arr: arr)
        answer.append(result)
    }
    
    for item in answer {
        print(item)
    }
}

func AC(queries: String, arr: [Int]) -> String {
    var startIdx = 0
    var endIdx = arr.count-1
    var isReversed = false
    
    for q in queries {
        switch q {
        case "D":
            if arr.isEmpty || startIdx > endIdx {
                return "error"
            }
            if !isReversed {
                startIdx += 1
            } else {
                endIdx -= 1
            }
        case "R":
            isReversed.toggle()
            
        default:
            break
        }
    }
    
    if arr.isEmpty || startIdx > endIdx {
        return "[]"
    }
    
    var result = "["
    if !isReversed {
        for i in startIdx ... endIdx {
            result += "\(arr[i]),"
        }
    } else {
        var i = endIdx
        while i >= startIdx {
            result += "\(arr[i]),"
            i -= 1
        }
    }
    result.removeLast()
    result += "]"
    
    return result
}

main()
