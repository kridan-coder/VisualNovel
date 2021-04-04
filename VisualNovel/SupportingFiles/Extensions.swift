//
//  Extension.swift
//  VisualNovel
//
//  Created by Daniil Zavodchanovich on 29.03.2021.
//

import Foundation
import UIKit

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
    
    func setTextFieldDelegate(delegate: UITextFieldDelegate)
    {
        self.delegate = delegate
    }
    
}

extension UILabel {
    func setLabelAppearance(text: String, color: String, fontSize: CGFloat, superLabel: Bool = false){
        layer.backgroundColor = UIColor(named: color)?.cgColor
        self.text = text
        self.font = (superLabel)
            ? UIFont(name:"quattrocento", size: fontSize)
            : UIFont(name:"roboto", size: fontSize)
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
        titleLabel?.adjustsFontSizeToFitWidth = true
        setTitle(text, for: .normal)
        setTitleColor(UIColor.lightText, for: .highlighted)
    }
    
    @objc private func postNotificationButtonClicked() {
        NotificationCenter.default.post(
            name: Notification.Name("NotificationButtonClicked"),
            object: nil,
            userInfo: ["sender" : self])
    }
    
    func setButtonTarget(target: Scene){
        self.tag = target.rawValue
        self.addTarget(self, action: #selector(postNotificationButtonClicked), for: .touchUpInside)
    }
    
}


