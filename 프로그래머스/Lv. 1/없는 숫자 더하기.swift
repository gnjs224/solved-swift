import Foundation

func solution(_ numbers:[Int]) -> Int {
    return 45-numbers.reduce(0,+) // 0~9의 합 45 에서 numbers의 합을 뺀다.
}
