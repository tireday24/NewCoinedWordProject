//
//  NewlyCoinedWordViewController.swift
//  newCoinedWordProject
//
//  Created by 권민서 on 2022/07/09.
//

import UIKit

class NewlyCoinedWordViewController: UIViewController {

    
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var readingGlassesButton: UIButton!
    @IBOutlet weak var wordResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designTextField()
        buttonDesign(firstButton, buttonTitle: "윰차", buttonBackgroundColor: .white)
        buttonDesign(secondButton, buttonTitle: "실매", buttonBackgroundColor: .white)
        buttonDesign(thirdButton, buttonTitle: "만반잘부", buttonBackgroundColor: .white)
        buttonDesign(fourthButton, buttonTitle: "꾸안꾸", buttonBackgroundColor: .white)
        //buttonLoopDesign()
       
        

        
    }
    
    func designTextField() {
        wordTextField.keyboardType = .emailAddress
        wordTextField.font = .systemFont(ofSize: 14)
        wordTextField.textColor = .systemGray
        wordTextField.attributedPlaceholder = NSAttributedString(string: "입력 해주세요!", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        wordTextField.textAlignment = .left
        wordTextField.layer.borderColor = UIColor.black.cgColor
        
    }

    
    
    let newCoinedWord : [String : String] = [
        "삼귀자" : "사귀기전 썸을 시작하는 단계",
        "버카충" : "버스 카드 충전",
        "만반잘부" : "만나서 잘 부탁드립니다",
        "꾸안꾸" : "꾸민듯 안 꾸민듯",
        "알잘딱깔센" : "알아서 잘하고 딱 깔금하고 센스있다"
        
    ]
        
    
    func buttonDesign(_ buttonName : UIButton, buttonTitle: String ,buttonBackgroundColor bgcolor: UIColor) {
        buttonName.layer.borderColor = UIColor.black.cgColor
        buttonName.layer.borderWidth = 1
        buttonName.backgroundColor = bgcolor
        buttonName.layer.cornerRadius = 8
    }
    
    
    
    
    
    
    @IBAction func readingGlassesButtonClicked(_ sender: UIButton) {
        
        if !(wordTextField.text?.isEmpty)! {
            wordResultLabel.text = newCoinedWord[wordTextField.text!]
        }
        

        
        
    }
    
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.backgroundColor = .white
        view.endEditing(true)
    }
    
    
    @IBAction func didEndOnExit(_ sender: UITextField) {
        view.endEditing(true)
    }
    
    
}
