//
//  AnswerViewController.swift
//  190719_homework
//
//  Created by 辻真緒 on 2019/07/20.
//  Copyright © 2019 辻真緒. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    @IBOutlet weak var resultButton: UIButton!
    
    // 前のページから受け取る値
    var value:[[Any]] = [[]]
    // 正しい答えの配列番号
    var correctNumArray:[Int] = []
    
    // あなたの回答の配列番号
    var yourNumArray:[Int] = [1,2,3]
    // スワイプまたはタップされた回数をカウントする変数
    var count = 0
    
    var inputArrowNum :Int = 0
    
    // クラス記述で省略したい
    ////////////////////////////////////////////////////////////////////////
    // 矢印の表示位置を設定するパラメータ
    // スクリーンの幅・高さを取得
    let screenWidth = Int(UIScreen.main.bounds.size.width)
    let screenHeight = Int(UIScreen.main.bounds.size.height)
    
    let constInterval = 0.2 // 矢印のセルとセルの感覚
    let constEdge = 0.5 // セルの端とスクリーンの端との感覚
    // 各定数に応じたセルサイズの算出
    lazy var molecule = Double(screenWidth)
    lazy var denominator = (1 + constInterval) * Double(arrowNum) + 2 * constEdge - constInterval
    lazy var cellWidth = molecule / denominator     // セルのサイズ
    // ラベルの初期位置、次のセルとの間隔を算出
    lazy var x = constEdge * cellWidth
    lazy var y = Double(screenHeight) * 0.2
    lazy var d = cellWidth + constInterval * cellWidth
    ////////////////////////////////////////////////////////////////////////
    
    
    // 冗長やから省略したい
    ////////////////////////////////////////////////////////////////////////////////
    // FontAwesomeで矢印配列の用意
    let arrowLeft = String.fontAwesomeIcon(name: .arrowLeft)
    let arrowRight = String.fontAwesomeIcon(name: .arrowRight)
    let arrowUp = String.fontAwesomeIcon(name: .arrowUp)
    let arrowDown = String.fontAwesomeIcon(name: .arrowDown)
//    let dotCircle = String.fontAwesomeIcon(name: .dotCircle)
    lazy var arrowArray = [arrowLeft, arrowRight, arrowUp, arrowDown]
    let arrowArrayString = ["arrowLeft", "arrowRight", "arrowUp", "arrowDown"]
    ////////////////////////////////////////////////////////////////////////////////

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultButton.backgroundColor = .lightGray
        resultButton.setTitleColor(UIColor.white, for: UIControl.State.normal)  // 4
        resultButton.layer.cornerRadius = 18
        resultButton.clipsToBounds = true
        
        // 前画面で生成したランダムな数字の配列
        let value0 = value[0]
        
        // 受け取った値をIntに変更
        for num in value0 {
            let numInt = Int(num as? String ?? "")!
            correctNumArray.append(numInt)
        }
        
        print("correctNumArray: \(correctNumArray)")
        // Backボタンを削除
        navigationController?.navigationBar.isHidden = true
    }
    
    // スワイプ、またはタップをした時の処理
    @IBAction func switeLeft(_ sender: UISwipeGestureRecognizer) {
        inputArrowNum = 0
        didAction()
    }
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        inputArrowNum = 1
        didAction()
    }
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
        inputArrowNum = 2
        didAction()
    }
    @IBAction func swipeDown(_ sender: UISwipeGestureRecognizer) {
        inputArrowNum = 3
        didAction()
    }
    
    func insertArray() {
        // 入力値の確認
        let num = inputArrowNum
        yourNumArray.append(num)

    }

    // 入力した時の処理
    func didAction() {
        
        print(value)
        
        let value0 = value[0]
        let value1 = value[1]
        
        print("value0: \(value0)")
        print("value1: \(value1)")

        // 動作したらカウントアップ
        count += 1
        
        // 答えと一致した時テキストカラーを黒、一致しなかったとき赤
//        if count == 1 {
//            inputArrowNum = yourNumArray[0]
//            if correctNumArray[0] == yourNumArray[0] {
//                arrow1.textColor = .black
//            } else {
//                arrow1.textColor = .red
//            }
//
//            arrow2.layer.borderColor = UIColor.darkGray.cgColor // 枠線の色
//
//        } else if count == 2 {
//            inputArrowNum = yourNumArray[1]
//            if correctNumArray[1] == yourNumArray[1] {
//                arrow2.textColor = .black
//            } else {
//                arrow2.textColor = .red
//            }
//
//            arrow3.layer.borderColor = UIColor.darkGray.cgColor // 枠線の色
//
//        } else if count == 3 {
//            inputArrowNum = yourNumArray[2]
//            if correctNumArray[2] == yourNumArray[2] {
//                arrow3.textColor = .black
//            } else {
//                arrow3.textColor = .red
//            }
//        }
        
    }
    
    @IBAction func didClickToResult(_ sender: UIButton) {
        // 複数の配列を送るために、多重配列を用意
        var arrays:[[Int]] = [[],[]]
        arrays[0] = correctNumArray
        arrays[1] = yourNumArray
   
//        print(arrays)
        
        let inputValue = arrays
        performSegue(withIdentifier: "toResult", sender: inputValue)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let nextVC = segue.destination as! ResultViewController
            nextVC.arrayValue = sender as! [[String]]
        }
    }
    
}
