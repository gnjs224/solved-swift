import Foundation
func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var answer: [Int] = [Int](repeating: 0, count: id_list.count) //id_list 크기만큼 answer 초기화
    var complaint_id: [String:Set<String>] = [:]
    var id_index:[String:Int] = [:]
    for (i, id) in id_list.enumerated(){
        complaint_id[id] = Set<String>() // 딕셔너리 초기화
        id_index[id] = i // 해당 유저가 answer의 몇번 째 인덱스인지
    }
    for r in report{
        let temp = r.split(separator: " ")
        complaint_id[String(temp[1]) as String]?.insert(String(temp[0])) // key: 신고 당한사람, value: 신고한 사람들 (set)
    }
    //신고한 사람들(value.count)이 k이상일 경우 해당 value의 사람들의 index를 찾아 answer값 증가
    for value in complaint_id.values{
        if value.count >= k{
            for v in value{
                answer[id_index[v]!] += 1
            }
        }
    }
    return answer
}
