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
        setLabelAndButtons(label: LabelInfo(LabelText: "Hello", Color: "DarkBlueColor"), buttons: [ButtonInfo(LabelText: "1", Color: "BlueColor", Segue: "da"), ButtonInfo(LabelText: "2", Color: "BlueColor", Segue: "da"),ButtonInfo(LabelText: "3", Color: "BlueColor", Segue: "da")])
        
        // Do any additional setup after loading the view.
    }
//writing this from a library
}


