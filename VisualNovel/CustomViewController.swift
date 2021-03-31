//
//  ViewController.swift
//  VisualNovel
//
//  Created by Daniil Zavodchanovich on 25.03.2021.
//

import UIKit

class CustomViewController: UIViewController {

    var scene: Scene = .Welcome

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpScene(data: GameData.getData(sceneName: scene))
    }



}


