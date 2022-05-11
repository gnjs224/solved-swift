import Foundation

func solution(_ new_id:String) -> String {
    var answer :String = new_id.lowercased().filter({ $0.isNumber || $0.isLowercase || ["-","_","."].contains($0)}) //1, 2단계
    while answer.contains("..") {//3단계
        answer = answer.replacingOccurrences(of: "..", with: ".")
    }
    answer = answer.trimmingCharacters(in: ["."])//4단계
    if answer.count == 0 {//5단계
        answer = "a"
    }else if answer.count > 15 {//6단계
        answer = String(answer[...answer.index(answer.startIndex, offsetBy: 14)])
        if answer.last == "."{
            answer.removeLast()
        }
    }
    while answer.count < 3 {//7단계
        answer += String(answer.last!)
    }
    return answer
}
