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

public class LabelInfo{
    var LabelText: String
    var Color: String
    
    init(LabelText: String, Color: String){
        self.Color = Color
        self.LabelText = LabelText
    }
}


public class ButtonInfo : LabelInfo{
    var Segue: String
    
    init(LabelText: String, Color: String, Segue: String){
        self.Segue = Segue
        super.init(LabelText: LabelText, Color: Color)
    }
}

extension UILabel {
    func setLabelAppearance(text: String, color: String, fontSize: CGFloat){
        layer.backgroundColor = UIColor(named: color)?.cgColor
        self.text = text
        self.font = UIFont(name:"roboto", size: fontSize)
        self.textAlignment = .center
        self.textColor = UIColor.white
    }
}

extension UIButton {
    func setButtonAppearance(text: String, color: String, fontSize: CGFloat){
        layer.backgroundColor = UIColor(named: color)?.cgColor
        titleLabel?.font = UIFont(name:"roboto", size: fontSize)

        setTitle(text, for: .normal)
        setTitleColor(UIColor.lightText, for: .highlighted)
    }
}

extension UIViewController{
    
    func setLabelAndButtons(label: LabelInfo, buttons: [ButtonInfo]){
        let screenSize = UIScreen.main.bounds
        
        let buttonHeight =
            (((screenSize.midY / 8.0) * CGFloat(buttons.count + 2) * 2) <= screenSize.midY)
            ? (screenSize.midY / 8.0)
            : screenSize.midY / CGFloat((buttons.count * 2 + 2))
        
        let UIlabel = UILabel(frame: CGRect(x: 0, y: screenSize.midY + buttonHeight, width: screenSize.width, height: buttonHeight))
        UIlabel.setLabelAppearance(text: label.LabelText, color: label.Color, fontSize: buttonHeight/2)
        self.view.addSubview(UIlabel)
        
        var currY = screenSize.midY + (screenSize.midY + buttonHeight - CGFloat(buttons.count*2 - 2)*buttonHeight)/2
        
        for i in 0..<buttons.count{
            let button = UIButton(frame: CGRect(x: 0, y: currY, width: screenSize.width, height: buttonHeight))
            button.setButtonAppearance(text: buttons[i].LabelText, color: buttons[i].Color, fontSize: buttonHeight/2)
            self.view.addSubview(button)
            
            currY += buttonHeight*2
        }
    }
}
