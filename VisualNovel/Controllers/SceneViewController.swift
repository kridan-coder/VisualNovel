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

}
