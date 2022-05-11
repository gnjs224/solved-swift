import Foundation

var answer = 0
var sum = 0
var depth = 0
func findPrimeCase(_ nums:[Int], _ k: Int) -> Void{
    if depth > 2{// depth가 3인 경우 소수인지 판별하고 return
        var isPrime = true
        for i in 2 ... Int(sqrt(Double(sum))) {
            if sum % i == 0{
                isPrime = false
                break
            }
        }
        if isPrime{
            answer += 1
        }
        return
    }
    
    //i+1을 k로 받으면서 재귀호출
    for i in k..<nums.count{
        depth+=1
        sum += nums[i]
        findPrimeCase(nums, i + 1)
        depth-=1
        sum -= nums[i]
    }
}
func solution(_ nums:[Int]) -> Int {
    findPrimeCase(nums, 0)
    return answer
}
