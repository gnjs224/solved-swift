import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    return zip(a, b).map(*).reduce(0, +) //a, b를 zip해서 두 수를 곱해준 뒤 그 결과를 다 더한 값
}
