import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var answer = ""
    var keypad:[Int:[Int]] = [0: [3, 1]] // 숫자: [행, 열] (해당 숫자의 위치 저장)
    for n in 1...9 {// 숫자 위치 지정
        keypad[n] = [(n - 1) / 3, (n - 1) % 3]
    }
    var loc_l = [3,0] //왼손의 첫 위치
    var loc_r = [3,2] //오른손의 첫 위치
    for push in numbers {
        let loc_p:[Int] = keypad[push]! // 누르려고하는 숫자의 위치
        if loc_p[1] == 0 { //누르려고 하는 숫자 위치의 열 값이 0이면 왼손으로 해당 숫자를 누른다
            loc_l = loc_p //왼손의 위치 변경
            answer += "L"
        }else if loc_p[1] == 2 {//누르려고 하는 숫자 위치의 열 값이 2이면 오른손으로 해당 숫자를 누른다
            loc_r = loc_p //오른손 위치 변경
            answer += "R"
        }else {
            let distance_l: Int = abs(loc_l[0] - loc_p[0]) + abs(loc_l[1] - loc_p[1]) //왼손과의 거리
            let distance_r: Int = abs(loc_r[0] - loc_p[0]) + abs(loc_r[1] - loc_p[1]) //오른손과의 거리
            var temp = hand //hand우선
            
            //왼손이 가까우면 left, 오른손이 가까우면 right
            if distance_l < distance_r {
                temp = "left"
            } else if distance_l > distance_r {
                temp = "right"
            }
            
            //temp값에 따라 누를 손 지정
            if temp == "left" {
                loc_l = loc_p
                answer += "L"
            }else {
                loc_r = loc_p
                answer += "R"
            }
            
        }
    }
    return answer
}
