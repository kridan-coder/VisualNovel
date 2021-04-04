//
//  ViewController.swift
//  VisualNovel
//
//  Created by Daniil Zavodchanovich on 25.03.2021.
//

import UIKit

class SceneViewController: UIViewController, UITextFieldDelegate {
    
    var viewModel = SceneViewModel(scene: .Welcome)
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let safeText = textField.text
        {
            if !safeText.isEmpty
            {
                viewModel.userName = safeText
            }
        }
        return true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpScene(data: viewModel.data, delegate: self)
    }
    
    
    // set layout programmatically
    
    var screenSize: CGRect {
        get
        {return UIScreen.main.bounds}
    }
    
    var buttonHeight: CGFloat {
        get {return (screenSize.midY / 8.0)}
    }
    
    var labelHeight: CGFloat {
        get {return (screenSize.midY / 2.5)}
    }
    
    private var magicConstantForSmallLabel: CGFloat { get {return 0.46}}
    private var magicConstantForBigLabel: CGFloat { get {return 0.28}}
    
    func setUpScene(data: SceneData, delegate: UITextFieldDelegate){
        
        setBackgroundImage(
            backgroundImageName: data.backgroundImageName, additionalImageName: data.additionalImageName)
        
        switch data.sceneType
        {
        case .Main:
            setLabelAndButton(label: data.label, button: data.buttons[0])
        case .Input:
            setTextFieldWithLabelAndButton(delegate: delegate, label: data.label, fieldPlaceholder: data.textFieldPlaceholder, button: data.buttons[0])
        case .Choice:
            setLabelAndButtons(label: data.label, buttons: data.buttons)
        }
        
    }
    
    
    private func setBackgroundImage(backgroundImageName: String, additionalImageName: String?){
        
        let backgroundImage = UIImageView(frame: screenSize)
        
        backgroundImage.image = UIImage(named: backgroundImageName)
        
        backgroundImage.contentMode = .scaleToFill
        
        self.view.addSubview(backgroundImage)
        
        guard let safeAdditionalImageName = additionalImageName else {
            return
        }
        
        let additionalImage = UIImageView(frame: CGRect(x:0, y:0, width: screenSize.width/1.5, height: screenSize.height))
        
        additionalImage.image = UIImage(named: safeAdditionalImageName)
        additionalImage.contentMode = .scaleToFill
        additionalImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(additionalImage)
        
    }
    
    private func setTextFieldWithLabelAndButton(delegate: UITextFieldDelegate, label: LabelInfo, fieldPlaceholder: String?, button: ButtonInfo){
        
        let UIlabel = UILabel(frame: CGRect(x: 0, y: screenSize.midY + buttonHeight, width: screenSize.width, height: buttonHeight))
        UIlabel.setLabelAppearance(text: label.Text, color: label.Color, fontSize: buttonHeight*magicConstantForSmallLabel)
        
        self.view.addSubview(UIlabel)
        
        var currY = screenSize.midY + (screenSize.midY - buttonHeight * 2)/2
        
        let UItextField = UITextField(frame: CGRect(x:0, y:currY, width: screenSize.width, height: buttonHeight*2)
        )
        UItextField.setTextFieldAppearance(placeholder: fieldPlaceholder ?? "Введите текст...", fontSize: buttonHeight*magicConstantForSmallLabel)
        UItextField.setTextFieldDelegate(delegate: delegate)
        
        self.view.addSubview(UItextField)
        
        currY += buttonHeight * 2.5
        
        let UIbutton = UIButton(frame: CGRect(x: 0, y: currY, width: screenSize.width, height: buttonHeight))
        UIbutton.setButtonAppearance(text: button.Text, color: button.Color, fontSize: buttonHeight*magicConstantForSmallLabel)
        UIbutton.setButtonTarget(target: button.Segue)
        self.view.addSubview(UIbutton)
        
        
        
    }
    
    private func setLabelAndButton(label: LabelInfo, button: ButtonInfo){
        
        let UIlabel = UILabel(frame: CGRect(x: 0, y: screenSize.midY - labelHeight, width: screenSize.width, height: labelHeight))
        UIlabel.setLabelAppearance(text: label.Text, color: label.Color, fontSize: labelHeight*0.28, superLabel: true)
        
        self.view.addSubview(UIlabel)
        
        
        let UIbutton = UIButton(frame: CGRect(x: 0, y: screenSize.midY + screenSize.midY/2 - buttonHeight/2, width: screenSize.width, height: buttonHeight))
        UIbutton.setButtonAppearance(text: button.Text, color: button.Color, fontSize: buttonHeight*magicConstantForSmallLabel)
        UIbutton.setButtonTarget(target: button.Segue)
        
        self.view.addSubview(UIbutton)
        
    }
    
    private func setLabelAndButtons(label: LabelInfo, buttons: [ButtonInfo]){
        let buttonHeight =
            (((screenSize.midY / 8.0) * CGFloat(buttons.count + 2) * 2) <= screenSize.midY)
            ? (screenSize.midY / 8.0)
            : screenSize.midY / CGFloat((buttons.count * 2 + 2))
        
        let UIlabel = UILabel(frame: CGRect(x: 0, y: screenSize.midY + buttonHeight, width: screenSize.width, height: buttonHeight))
        UIlabel.setLabelAppearance(text: label.Text, color: label.Color, fontSize: buttonHeight*magicConstantForSmallLabel)
        
        self.view.addSubview(UIlabel)
        
        var currY = screenSize.midY + (screenSize.midY + buttonHeight - CGFloat(buttons.count*2 - 2)*buttonHeight)/2
        
        for i in 0..<buttons.count{
            
            let button = UIButton(frame: CGRect(x: 0, y: currY, width: screenSize.width, height: buttonHeight))
            
            button.setButtonAppearance(text: buttons[i].Text, color: buttons[i].Color, fontSize: buttonHeight*magicConstantForSmallLabel)
            
            button.setButtonTarget(target: buttons[i].Segue)
            
            self.view.addSubview(button)
            
            currY += buttonHeight*2
        }
    }
    
}
