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
    
    static func getData(sceneName: Scene) -> SceneData {
        switch sceneName {
        case .Welcome:
            return SceneData(
                sceneType: .Main,
                backgroundImageName: "1SceneBackground",
                additionalImageName: nil,
                label: LabelInfo(Text: "Моя визуальная новелла", Color: "BlueColor"),
                buttons: [ButtonInfo(Text: "Начать", Color: "DarkBlueColor", Segue: Scene.RoomKiriusha1)],
                textFieldPlaceholder: nil
            )
        case .RoomKiriusha1:
            return SceneData(
                sceneType: .Input,
                backgroundImageName: "1SceneBackground",
                additionalImageName: "KiriushaPNG",
                label: LabelInfo(Text: "Привет! Меня зовут Кирюша. А тебя?", Color: "DarkBlueColor"),
                buttons: [ButtonInfo(Text: "Подтвердить", Color: "DarkBlueColor", Segue: Scene.RoomKiriusha2)],
                textFieldPlaceholder: "Введите имя..."
            )
        case .RoomKiriusha2:
            return SceneData(
                sceneType: .Choice,
                backgroundImageName: "1SceneBackground",
                additionalImageName: "KiriushaPNG",
                label: LabelInfo(Text: "Отлично, \(userName)! Чем займемся?", Color: "DarkBlueColor"),
                buttons: [ButtonInfo(Text: "Пойдем на пробежку", Color: "BlueColor", Segue: Scene.Jogging), ButtonInfo(Text: "Пойдем в поход", Color: "BlueColor", Segue: Scene.Campfire), ButtonInfo(Text: "Погуляем по полю", Color: "BlueColor", Segue: Scene.Field)],
                textFieldPlaceholder: nil
            )
        case .Jogging:
            return SceneData(
                sceneType: .Choice,
                backgroundImageName: "2_1SceneBackground",
                additionalImageName: nil,
                label: LabelInfo(Text: "Может, пойдем домой?", Color: "DarkBlueColor"),
                buttons: [ButtonInfo(Text: "Да, и посмотрим фильм", Color: "BlueColor", Segue: Scene.FilmQuestion), ButtonInfo(Text: "Да, и отпразднуем Хэллоуин", Color: "BlueColor", Segue: Scene.Halloween)],
                textFieldPlaceholder: nil
            )
        case .Campfire:
            return SceneData(
                sceneType: .Choice,
                backgroundImageName: "2_2SceneBackground",
                additionalImageName: nil,
                label: LabelInfo(Text: "Как уютно... Но уже темнеет", Color: "DarkBlueColor"),
                buttons: [ButtonInfo(Text: "Пойдем домой и посмотрим фильм", Color: "BlueColor", Segue: Scene.FilmQuestion), ButtonInfo(Text: "Пойдем домой и отпразднуем Хэллоуин", Color: "BlueColor", Segue: Scene.Halloween)],
                textFieldPlaceholder: nil
            )
        case .Field:
            return SceneData(
                sceneType: .Choice,
                backgroundImageName: "2_3SceneBackground",
                additionalImageName: nil,
                label: LabelInfo(Text: "Тебе грустно... Пойдем домой?", Color: "DarkBlueColor"),
                buttons: [ButtonInfo(Text: "Может, посмотрим фильм?", Color: "BlueColor", Segue: Scene.FilmQuestion), ButtonInfo(Text: "Да, отпразднуем Хэллоуин", Color: "BlueColor", Segue: Scene.Halloween)],
                textFieldPlaceholder: nil
            )
        case .FilmQuestion:
            return SceneData(
                sceneType: .Choice,
                backgroundImageName: "3_1SceneBackground",
                additionalImageName: nil,
                label: LabelInfo(Text: "Как тебе фильм?", Color: "DarkBlueColor"),
                buttons: [ButtonInfo(Text: "Мне понравился!", Color: "BlueColor", Segue: Scene.FilmPositive), ButtonInfo(Text: "Не очень", Color: "BlueColor", Segue: Scene.FilmNegative)],
                textFieldPlaceholder: nil
            )
        case .FilmPositive:
            return SceneData(
                sceneType: .Choice,
                backgroundImageName: "3_1SceneBackground",
                additionalImageName: nil,
                label: LabelInfo(Text: "Отлично! А теперь пора спать...", Color: "DarkBlueColor"),
                buttons: [ButtonInfo(Text: "Да, уже поздно...", Color: "BlueColor", Segue: Scene.Farewell)],
                textFieldPlaceholder: nil
            )
        case .FilmNegative:
            return SceneData(
                sceneType: .Choice,
                backgroundImageName: "3_1SceneBackground",
                additionalImageName: nil,
                label: LabelInfo(Text: "Жаль... Тогда идем спать?", Color: "DarkBlueColor"),
                buttons: [ButtonInfo(Text: "Да, уже поздно...", Color: "BlueColor", Segue: Scene.Farewell)],
                textFieldPlaceholder: nil
            )
        case .Halloween:
            return SceneData(
                sceneType: .Choice,
                backgroundImageName: "3_2SceneBackground",
                additionalImageName: nil,
                label: LabelInfo(Text: "Получается очень красиво!", Color: "DarkBlueColor"),
                buttons: [ButtonInfo(Text: "Да! Может, посмотрим фильм?", Color: "BlueColor", Segue: Scene.FilmQuestion), ButtonInfo(Text: "Да! Давай сделаем костюмы!", Color: "BlueColor", Segue: Scene.CostumesOpinion)],
                textFieldPlaceholder: nil
            )
        case .CostumesOpinion:
            return SceneData(
                sceneType: .Choice,
                backgroundImageName: "4SceneBackground",
                additionalImageName: nil,
                label: LabelInfo(Text: "Мне нравится твой костюм...", Color: "DarkBlueColor"),
                buttons: [ButtonInfo(Text: "Твой тоже очень красивый!", Color: "BlueColor", Segue: Scene.CostumesPositive), ButtonInfo(Text: "А мне, если честно, не нравится твой...", Color: "BlueColor", Segue: Scene.CostumesNegative)],
                textFieldPlaceholder: nil
            )
        case .CostumesPositive:
            return SceneData(
                sceneType: .Choice,
                backgroundImageName: "4SceneBackground",
                additionalImageName: nil,
                label: LabelInfo(Text: "Спасибо! Ну, идем спать?", Color: "DarkBlueColor"),
                buttons: [ButtonInfo(Text: "Да, уже поздно...", Color: "BlueColor", Segue: Scene.Farewell)],
                textFieldPlaceholder: nil
            )
        case .CostumesNegative:
            return SceneData(
                sceneType: .Choice,
                backgroundImageName: "4SceneBackground",
                additionalImageName: nil,
                label: LabelInfo(Text: "Ничего, я не в обиде. Пойдем спать?", Color: "DarkBlueColor"),
                buttons: [ButtonInfo(Text: "Да, уже поздно...", Color: "BlueColor", Segue: Scene.Farewell)],
                textFieldPlaceholder: nil
            )
        case .Farewell:
            return SceneData(
                sceneType: .Main,
                backgroundImageName: "1SceneBackground",
                additionalImageName: nil,
                label: LabelInfo(Text: "Спасибо, что поиграли!", Color: "BlueColor"),
                buttons: [ButtonInfo(Text: "Пройти еще раз", Color: "DarkBlueColor", Segue: Scene.Welcome)],
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
