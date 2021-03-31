//
//  MainNavigationView.swift
//  VisualNovel
//
//  Created by Daniil Zavodchanovich on 25.03.2021.
//

import Foundation
import UIKit


class MainNavigationView : UINavigationController{

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.buttonClicked(_:)), name: Notification.Name("NotificationButtonClicked"), object: nil)
        
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: nil)
            .compactMap {$0.object as? UITextField}
            .map {$0.text}
            .sink(receiveValue: {GameData.userName = $0 ?? "Ксюша"})

        
        
    }

    
    @objc func buttonClicked(_ notification: NSNotification){
        
        guard let sender = notification.userInfo?["sender"] as? UIButton else { return }
        
        let vc = storyboard?.instantiateViewController(identifier: "main") as! CustomViewController
        
        switch sender.tag {
        case Scene.Welcome.rawValue:
            vc.scene = .Welcome
        case Scene.RoomKiriusha1.rawValue:
            vc.scene = .RoomKiriusha1
        case Scene.RoomKiriusha2.rawValue:
            vc.scene = .RoomKiriusha2
        case Scene.Jogging.rawValue:
            vc.scene = .Jogging
        case Scene.Campfire.rawValue:
            vc.scene = .Campfire
        case Scene.Field.rawValue:
            vc.scene = .Field
        case Scene.FilmQuestion.rawValue:
            vc.scene = .FilmQuestion
        case Scene.FilmPositive.rawValue:
            vc.scene = .FilmPositive
        case Scene.FilmNegative.rawValue:
            vc.scene = .FilmNegative
        case Scene.Halloween.rawValue:
            vc.scene = .Halloween
        case Scene.CostumesOpinion.rawValue:
            vc.scene = .CostumesOpinion
        case Scene.CostumesNegative.rawValue:
            vc.scene = .CostumesNegative
        case Scene.CostumesPositive.rawValue:
            vc.scene = .CostumesPositive
        case Scene.Farewell.rawValue:
            vc.scene = .Farewell
        default: break
        }
        
        pushViewController(vc, animated: true)
    }
    

}
