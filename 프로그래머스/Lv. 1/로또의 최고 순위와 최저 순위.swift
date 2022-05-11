import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    var new_win_nums: [Int: Bool] = [:]
    for num in win_nums{
        new_win_nums[num] = true // 정답 번호를 딕셔너리 형태로 변경 (contains의 시간복잡도 O(n)을 O(1)로 접근하기 위함)
    }
    var correct: Int = 0 // 맞춘 갯수
    var zero: Int = 0 // 0 갯수
    for num in lottos {
        if num == 0{
            zero += 1
        }else if new_win_nums[num] != nil {
            correct += 1
        }
    }
    // 1개 이하 정답이면 6등, 2개 이상 정답이면 (7 - 갯수)등
    // answer[0]는 zero 포함, answer[1]는 zero 미포함
    return [correct + zero < 2 ? 6 : 7 - correct - zero, correct < 2 ? 6 : 7 - correct]
}
