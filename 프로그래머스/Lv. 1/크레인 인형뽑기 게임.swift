import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var new_board: [[Int]] = [[Int]]() // 새로운 보드 생성
    var s: [Int] = [Int]() //바구니
    var answer: Int =
    
    /*  기존 보드 (배열)
        0 0 0 0 0
        0 0 1 0 3
        0 2 5 0 1
        4 2 4 4 2
        3 5 1 3 1           */
    for i in 0 ..< board.count{
        new_board.append([Int]())
        var j = board.count - 1
        while j >= 0 && board[j][i] != 0 {
            new_board[i].append(board[j][i])
            j -= 1
        }
    }
    /*  새로운 보드 (스택 배열)
        3 4
        5 2 2
        1 4 5 1
        3 4
        1 2 1 3             */
    
    
    for i in moves {
        if new_board[i-1].count == 0{ // 만약 인형이 없는 곳에서 크레인을 작동시키는 경우에는 아무런 일도 일어나지 않습니다.
            continue
        }
        if s.count == 0{ //바구니가 비어있으면 바구니에 해당 보드에 있는 인형을 뽑아서 넣는다
            s.append(new_board[i-1].popLast()!)
        }else { //바구니가 비어있지 않다면
            if s[s.count-1] == new_board[i-1][new_board[i-1].count-1]{ //바구니의 top과 해당 보드의 top 이 같다면
                s.popLast() // 바구니 pop
                new_board[i-1].popLast() //해당 보드 pop
                answer += 2 // 없어진 인형 2개 추가
            }else{//바구니의 top과 해당 보드의 top 이 다르다면
                s.append(new_board[i-1].popLast()!) // 해당보드 pop을 바구니에 push
            }
        }
    }
    return answer
}
