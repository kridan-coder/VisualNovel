//
//  ViewModel.swift
//  VisualNovel
//
//  Created by Daniil Zavodchanovich on 03.04.2021.
//

import Foundation

class SceneViewModel{
    
    let scene: Scene
    
    let data: SceneData
    
    var userName: String{get {return GameData.userName} set(newUserName) {GameData.userName = newUserName} }
    
    init(scene: Scene){
        self.scene = scene
        data = GameData.getData(sceneName: scene)
    }
    
}


