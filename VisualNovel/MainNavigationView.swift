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

extension UITextField {
    func setTextFieldAppearance(placeholder: String, fontSize: CGFloat){
        self.placeholder = placeholder
        self.font = UIFont(name:"roboto", size: fontSize)
        
        self.borderStyle = .none
        self.backgroundColor = UIColor(named: "LightGrayColor")
        self.autocorrectionType = .no
        self.keyboardType = .default
        self.returnKeyType = .done
        self.clearButtonMode = .whileEditing
        self.contentHorizontalAlignment = .leading
        self.contentVerticalAlignment = .center
    }
}

extension UILabel {
    func setLabelAppearance(text: String, color: String, fontSize: CGFloat, superLabel: Bool = false){
        layer.backgroundColor = UIColor(named: color)?.cgColor
        self.text = text
        
        self.font = (superLabel) ? UIFont(name:"quattrocento", size: fontSize) : UIFont(name:"roboto", size: fontSize)
        self.adjustsFontSizeToFitWidth = true
        self.textAlignment = .center
        self.textColor = UIColor.white
        self.numberOfLines = (superLabel) ? 3 : 1
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
    
    func setTextFieldWithLabelAndButton(label: LabelInfo, fieldPlaceholder: String, button: ButtonInfo){
        let screenSize = UIScreen.main.bounds
        
        let labelHeight =
            (screenSize.midY / 8.0)
        
        let UIlabel = UILabel(frame: CGRect(x: 0, y: screenSize.midY + labelHeight, width: screenSize.width, height: labelHeight))
        UIlabel.setLabelAppearance(text: label.LabelText, color: label.Color, fontSize: labelHeight/2)
        self.view.addSubview(UIlabel)
        
        var currY = screenSize.midY + (screenSize.midY - labelHeight * 2)/2
        
        let UItextField = UITextField(frame: CGRect(x:0, y:currY, width: screenSize.width, height: labelHeight*2)
        )
        UItextField.setTextFieldAppearance(placeholder: fieldPlaceholder, fontSize: labelHeight/2 - 1)
        
        self.view.addSubview(UItextField)

        currY += labelHeight * 2.5
        
        let UIbutton = UIButton(frame: CGRect(x: 0, y: currY, width: screenSize.width, height: labelHeight))
        UIbutton.setButtonAppearance(text: button.LabelText, color: button.Color, fontSize: labelHeight/2)
        self.view.addSubview(UIbutton)
            


    }
    
    func setLabelAndButton(label: LabelInfo, button: ButtonInfo){
        let screenSize = UIScreen.main.bounds
        
        let buttonHeight =
            (screenSize.midY / 8.0)
 
        let labelHeight =
            (screenSize.midY / 2.5)
        
        let UIlabel = UILabel(frame: CGRect(x: 0, y: screenSize.midY - labelHeight, width: screenSize.width, height: labelHeight))
        UIlabel.setLabelAppearance(text: label.LabelText, color: label.Color, fontSize: labelHeight*0.28, superLabel: true)
        self.view.addSubview(UIlabel)
        

        let UIbutton = UIButton(frame: CGRect(x: 0, y: screenSize.midY + screenSize.midY/2 - buttonHeight/2, width: screenSize.width, height: buttonHeight))
        UIbutton.setButtonAppearance(text: button.LabelText, color: button.Color, fontSize: buttonHeight/2)
        self.view.addSubview(UIbutton)
            


    }
    
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
