//
//  ViewController.swift
//  VisualNovel
//
//  Created by Daniil Zavodchanovich on 25.03.2021.
//

import UIKit

class CustomViewController: UIViewController {

    var MainWindowText: String!
    var ButtonText: String!
    var SceneButtonLeadsTo: String!
    
    convenience init(MainWindowText: String, ButtonText: String, SceneButtonLeadsTo: String){
        self.init()
        self.MainWindowText = MainWindowText
        self.ButtonText = ButtonText
        self.SceneButtonLeadsTo = SceneButtonLeadsTo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldWithLabelAndButton(label: LabelInfo(LabelText: "Привет! Меня зовут Кирюша. А тебя?", Color: "DarkBlueColor"), fieldPlaceholder: "Введите свое имя...", button: ButtonInfo(LabelText: "Подтвердить", Color: "DarkBlueColor", Segue: "da"))
        
        // Do any additional setup after loading the view.
    }
//writing this from a library
}


