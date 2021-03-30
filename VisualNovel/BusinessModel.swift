//
//  Model.swift
//  VisualNovel
//
//  Created by Daniil Zavodchanovich on 29.03.2021.
//

import Foundation

public enum SceneType{
    case Main, Input, Choice
}

public struct ViewControllerData{
    let sceneType: SceneType
    let backgroundImageName: String
    let additionalImageName: String?
    let label: LabelInfo
    let buttons: [ButtonInfo]
    let textFieldPlaceholder: String?
}

public class LabelInfo{
    var Text: String
    var Color: String
    
    init(Text: String, Color: String){
        self.Color = Color
        self.Text = Text
    }
}


public class ButtonInfo : LabelInfo{
    var Segue: Scene
    
    init(Text: String, Color: String, Segue: Scene){
        self.Segue = Segue
        super.init(Text: Text, Color: Color)
    }
}
