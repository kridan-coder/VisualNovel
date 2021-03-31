//
//  GameData.swift
//  VisualNovel
//
//  Created by Daniil Zavodchanovich on 30.03.2021.
//

import Foundation

// singleton
class GameData{
    
    private init() {}
    
    static var shared: GameData = {
        let instance = GameData()
        return instance
    } ()
    
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
                additionalImageName: "KiriushaPNG",
                label: LabelInfo(Text: "Привет! Меня зовут Кирюша. А тебя?", Color: "DarkBlueColor"),
                buttons: [ButtonInfo(Text: "Подтвердить", Color: "DarkBlueColor", Segue: Scene.RoomKiriusha2)],
                textFieldPlaceholder: "Введите имя..."
                )
        case .RoomKiriusha2:
            return ViewControllerData(
                sceneType: .Choice,
                backgroundImageName: "1SceneBackground",
                additionalImageName: "KiriushaPNG",
                label: LabelInfo(Text: "Отлично, \(userName)! Чем займемся?", Color: "DarkBlueColor"),
                buttons: [ButtonInfo(Text: "Пойдем на пробежку", Color: "BlueColor", Segue: Scene.Jogging), ButtonInfo(Text: "Пойдем в поход", Color: "BlueColor", Segue: Scene.Campfire), ButtonInfo(Text: "Погуляем по полю", Color: "BlueColor", Segue: Scene.Field)],
                textFieldPlaceholder: nil
                )
        case .Jogging:
            return ViewControllerData(
                sceneType: .Choice,
                backgroundImageName: "2_1SceneBackground",
                additionalImageName: nil,
                label: LabelInfo(Text: "Может, пойдем домой?", Color: "DarkBlueColor"),
                buttons: [ButtonInfo(Text: "Да, и посмотрим фильм", Color: "BlueColor", Segue: Scene.Campfire), ButtonInfo(Text: "Да, и отпразднуем хэллоуин", Color: "BlueColor", Segue: Scene.Field)],
                textFieldPlaceholder: nil
                )
        default:
            return ViewControllerData(
                sceneType: .Main,
                backgroundImageName: "1SceneBackground",
                additionalImageName: "Kiriusha",
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
