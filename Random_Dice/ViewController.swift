/////////
//  ViewController.swift
//  Random_Dice
//
//  Created by SWU mac on 2020/05/03.
//  Copyright © 2020 SWU mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    
    // 변수 선언
    @IBOutlet var NickName: UITextField!
    @IBOutlet var pickerView: UIPickerView!
    
    @IBOutlet var GameStart: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    
    
    // picker 항목 정의
    
    let HighORLow: [String] = ["High", "Low"]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return HighORLow.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return HighORLow[row]
    } // picker 항목 정의
    
    
    // 닉네임과 룰을 RandomDiceVC 로 전달
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDiceView" {
            let destVC = segue.destination as! RandomDiceViewController
            
            destVC.info = NickName.text
            
            // 닉네임 전달
            
            let highORlow = pickerView.selectedRow(inComponent: 0)
            
            destVC.rule = highORlow
            
            // 룰 전달
            // 0이면 high / 1이면 low
            // high는 숫자가 높은 사람이 승리, low는 숫자가 낮은 사람이 승리한다.
            
        }
    }
    
    
    
    

}

