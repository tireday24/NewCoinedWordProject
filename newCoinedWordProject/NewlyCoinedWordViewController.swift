//
//  NewlyCoinedWordViewController.swift
//  newCoinedWordProject
//
//  Created by 권민서 on 2022/07/09.
//

import UIKit

enum bottomMenuText: String, CaseIterable {
    case 만반잘부 = "만나서 잘 부탁드립니다"
    case 꾸안꾸 = "꾸민듯 안 꾸민듯"
    case 알잘딱깔센 = "알아서 잘하고 딱 깔끔하고 센스있다"
    case 칠백 = "귀여워"
    case 우유남 = "우월한 유전자의 남자"
    case 점메추 = "점심 메뉴 추천"
    case 빠테 = "빠른 태세 전환"
    case 나일리지 = "나이 + 마일리지, 꼰대"
    case 버카충 = "버스카드 충전"
    case 삼귀자 = "사귀기 전 썸 단계"
}

/*
 let xyz = bottomMenuText.실매
 label 의 텍스트를 xyz 의 로우밸류로 넣기
 */

class NewlyCoinedWordViewController: UIViewController {

    
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet var bottomMenuButton : [UIButton]!
    @IBOutlet weak var readingGlassesButton: UIButton!
    @IBOutlet weak var wordResultLabel: UILabel!
    
    var newCoinedWord : [String : bottomMenuText] = [
        "삼귀자" : bottomMenuText.삼귀자,
        "버카충" : bottomMenuText.버카충,
        "만반잘부" : bottomMenuText.만반잘부,
        "꾸안꾸" : bottomMenuText.꾸안꾸,
        "알잘딱깔센" : bottomMenuText.알잘딱깔센,
        "700" : bottomMenuText.칠백,
        "우유남" : bottomMenuText.우유남,
        "점메추" : bottomMenuText.점메추,
        "빠태" : bottomMenuText.빠테,
        "나일리지": bottomMenuText.나일리지
    ]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designTextField()
        randomNewCoinedWord()
        
        
        
    }
    
    //func designBottomMenuButton(_ buttonName:  )
    
    
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
        var randomKeys : [bottomMenuText] = []
        
        while randomKeys.count < 4 {
            let randomkey = bottomMenuText.allCases.randomElement()! //random case
            
            if !randomKeys.contains(randomkey) {
                randomKeys.append(randomkey)
            }
            
        }
        
        for (i, btn) in bottomMenuButton.enumerated() {
            btn.setTitle("\(randomKeys[i])", for: .normal)
            btn.setTitleColor(.black, for: .normal)
            btn.backgroundColor = .white
            btn.layer.cornerRadius = 10
            btn.clipsToBounds = true
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.black.cgColor
        }
        
        
    }
    
    @IBAction func readingGlassesButtonClicked(_ sender: UIButton) {
        
        if !(wordTextField.text?.isEmpty)! {
            wordResultLabel.text = newCoinedWord[wordTextField.text!]?.rawValue
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
