//
//  ViewController.swift
//  VisualNovel
//
//  Created by Daniil Zavodchanovich on 25.03.2021.
//

import UIKit

class CustomViewController: UIViewController, UITextFieldDelegate {

    var scene: Scene = .Welcome

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let safeText = textField.text
        {
            GameData.userName = safeText
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScene(data: GameData.getData(sceneName: scene), delegate: self)
    }



}


