//
//  RandomDiceViewController.swift
//  Random_Dice
//
//  Created by SWU mac on 2020/05/03.
//  Copyright © 2020 SWU mac. All rights reserved.
//

import UIKit

class RandomDiceViewController: UIViewController {

    
    @IBOutlet var infoNickName: UILabel! // 나의 닉네임을 저장할 라벨
    
    @IBOutlet var Mynumber: UILabel! // 나의 랜덤 주사위 숫자를 나타낼 라벨
    
    @IBOutlet var Phonenumber: UILabel!
        // 상대방의 랜덤 주사위 숫자를 나타낼 라벨
    
    @IBOutlet var resultLabel: UILabel!
        // 승부의 결과를 나타낼 라벨
    
    
    var info: String?
    var rule: Int?
    
    var myRandomnumber: Int = 0
    var phoneRandomnumber: Int = 0
    // 랜덤 주사위 수를 저장할 변수
    
    
    func drawNumber() -> Int {
    
    let random = arc4random_uniform(100) + 1
    // 랜덤 주사위 수 결정
        
        return Int(random)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        myRandomnumber = drawNumber()
        
        Mynumber.text = String(myRandomnumber)
        
        // 내 랜덤 주사위 수 저장/출력
        
        phoneRandomnumber = drawNumber()
        
        Phonenumber.text = String(phoneRandomnumber)
        
        
        if let contentString = info {
            infoNickName.text = contentString
            
            // 닉네임을 받아온다.
        }
        
        if rule == 0
        {
            // High 를 선택한 경우
            // 주사위 수가 높은 사람이 승리
            
            if myRandomnumber > phoneRandomnumber
            {
                let result = infoNickName.text
                
                resultLabel.text = result! + "님이 승리했습니다!"
            }
            else if myRandomnumber == phoneRandomnumber
            {
                resultLabel.text = "비겼습니다!"
            }
            else
            {
                let result = infoNickName.text
                
                resultLabel.text = result! + "님의 패배입니다!"
            }
            
            
        }
        else
        {
            // Low 를 선택한 경우
            // 주사위 수가 낮은 사람이 승리
        
            if myRandomnumber > phoneRandomnumber
            {
                let result = infoNickName.text
                
                resultLabel.text = result! + "님의 패배입니다!"
                
            }
            else if myRandomnumber == phoneRandomnumber
            {
                resultLabel.text = "비겼습니다!"
            }
            else
            {
                let result = infoNickName.text
                
                resultLabel.text = result! + "님이 승리했습니다!"
            }
            
            
        }
        
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
