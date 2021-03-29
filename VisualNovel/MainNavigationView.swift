//
//  MainNavigationView.swift
//  VisualNovel
//
//  Created by Daniil Zavodchanovich on 25.03.2021.
//

import Foundation
import UIKit

class MainNavigationView : UINavigationController{
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


public class ButtonInfo{
    var Color: String
    var LabelText: String
    var Segue: String
    
    init(LabelText: String, Segue: String, Color: String){
        self.Color = Color
        self.LabelText = LabelText
        self.Segue = Segue
    }
}

extension UIButton {
    func setButtonAppearance(text: String, color: String, fontSize: CGFloat){
        layer.backgroundColor = UIColor(named: "BlueColor")?.cgColor
        titleLabel?.font = UIFont(name:"roboto", size: fontSize)

        setTitle(text, for: .normal)
        setTitleColor(UIColor.lightText, for: .highlighted)
    }
}

extension UIViewController{
    func setButtons(buttons: [ButtonInfo]){
        let screenSize = UIScreen.main.bounds
        let buttonHeight = (screenSize.midY / 8.0)
        for i in 0..<buttons.count{
            let button = UIButton(frame: CGRect(x: 0, y: screenSize.midY + 50, width: screenSize.width, height: buttonHeight))
            button.setButtonAppearance(text: buttons[i].LabelText, color: buttons[i].Color, fontSize: buttonHeight/2)
            self.view.addSubview(button)
        }
    }
}
