//
//  ViewController.swift
//  VisualNovel
//
//  Created by Daniil Zavodchanovich on 25.03.2021.
//

import UIKit

class HiByeViewController: UIViewController {

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
        setButtons(buttons: [ButtonInfo(LabelText: "Начать", Segue: "da", Color: "DarkBlueColor")])
        // Do any additional setup after loading the view.
    }
//writing this from a library
}


