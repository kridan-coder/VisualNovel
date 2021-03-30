//
//  GameData.swift
//  VisualNovel
//
//  Created by Daniil Zavodchanovich on 30.03.2021.
//

import Foundation

class GameData{
    
    static var userName = "Ксюша"
    
    static func getData(sceneName: Scene) -> ViewControllerData {
        switch sceneName {
        case .Welcome:
            return ViewControllerData(
                sceneType: .Main,
                backgroundImageName: "1SceneBackground",
                additionalImageName: nil,
                label: LabelInfo(Text: "Моя визуальная новелла", Color: "BlueColor"),
                buttons: [ButtonInfo(Text: "Начать", Color: "DarkBlueColor", Segue: Scene.RoomKiriusha1)],
                textFieldPlaceholder: nil
                )
        case .RoomKiriusha1:
            return ViewControllerData(
                sceneType: .Input,
                backgroundImageName: "1SceneBackground",
                additionalImageName: "Kiriusha",
                label: LabelInfo(Text: "Привет! Меня зовут Кирюша. А тебя?", Color: "DarkBlueColor"),
                buttons: [ButtonInfo(Text: "Подтвердить", Color: "DarkBlueColor", Segue: Scene.RoomKiriusha1)],
                textFieldPlaceholder: "Введите имя..."
                )
        default:
            return ViewControllerData(
                sceneType: .Main,
                backgroundImageName: "1SceneBackground",
                additionalImageName: nil,
                label: LabelInfo(Text: "Моя визуальная новелла", Color: "BlueColor"),
                buttons: [ButtonInfo(Text: "Начать", Color: "DarkBlueColor", Segue: Scene.RoomKiriusha1)],
                textFieldPlaceholder: nil
                )
        }

}
}

public enum Scene : Int{
    case Welcome = 0
    case RoomKiriusha1
    case RoomKiriusha2
    case Jogging
    case Campfire
    case Field
    case FilmQuestion
    case FilmPositive
    case FilmNegative
    case Halloween
    case CostumesOpinion
    case CostumesNegative
    case CostumesPositive
    case Farewell
}
