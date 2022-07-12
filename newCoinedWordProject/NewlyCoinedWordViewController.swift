//
//  NewlyCoinedWordViewController.swift
//  newCoinedWordProject
//
//  Created by 권민서 on 2022/07/09.
//

import UIKit

class NewlyCoinedWordViewController: UIViewController {

    
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet var bottomMenuButton : [UIButton]!
    @IBOutlet weak var readingGlassesButton: UIButton!
    @IBOutlet weak var wordResultLabel: UILabel!
    
    var newCoinedWord : [String : String] = [
        "삼귀자" : "사귀기전 썸을 시작하는 단계",
        "버카충" : "버스 카드 충전",
        "만반잘부" : "만나서 잘 부탁드립니다",
        "꾸안꾸" : "꾸민듯 안 꾸민듯",
        "알잘딱깔센" : "알아서 잘하고 딱 깔금하고 센스있다",
        "700" : "귀여워",
        "우유남" : "우월한 유전자를 가진 남자",
        "점메추" : "점심 메뉴 추천",
        "빠태" : "빠른 태세 전환",
        "나일리지": "나이 + 마일리지, 꼰대를 의미"
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designTextField()
        randomNewCoinedWord()
        
    }
    
    func designTextField() {
        wordTextField.keyboardType = .emailAddress
        wordTextField.font = .systemFont(ofSize: 14)
        wordTextField.textColor = .systemGray
        wordTextField.attributedPlaceholder = NSAttributedString(string: "입력 해주세요!", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        wordTextField.textAlignment = .left
        wordTextField.layer.borderColor = UIColor.black.cgColor
        
    
    
    for btn in bottomMenuButton {
        btn.backgroundColor = .white
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.black.cgColor
        btn.setTitleColor(.black, for: .normal)
        
    }
        
        wordResultLabel.textColor = .black
        wordResultLabel.text = "안녕하세요!"
        wordResultLabel.font = UIFont.systemFont(ofSize: 20)
        
    }
    
    func randomNewCoinedWord() {
        var randomKeys : [String] = []
        
        while randomKeys.count < 4 {
            let randomkey = newCoinedWord.keys.randomElement()!
            
            if !randomKeys.contains(randomkey) {
                randomKeys.append(randomkey)
            }
            print(randomKeys.sorted())
        }
        
        for i in 0...3 {
            bottomMenuButton[i].setTitle("\(randomKeys[i])", for: .normal)
            bottomMenuButton[i].setTitleColor(.black, for: .normal)
            bottomMenuButton[i].backgroundColor = .white
            bottomMenuButton[i].layer.cornerRadius = 10
            bottomMenuButton[i].clipsToBounds = true
            bottomMenuButton[i].layer.borderWidth = 1
            bottomMenuButton[i].layer.borderColor = UIColor.black.cgColor
        }
        
        
    }
    
    @IBAction func readingGlassesButtonClicked(_ sender: UIButton) {
        
        if !(wordTextField.text?.isEmpty)! {
            wordResultLabel.text = newCoinedWord[wordTextField.text!]
        }
        randomNewCoinedWord()
    }
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func didEndOnExit(_ sender: UITextField) {
        randomNewCoinedWord()
        view.endEditing(true)
    }
    
    
}
