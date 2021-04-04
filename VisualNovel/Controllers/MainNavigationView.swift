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
    }

    
    @objc func buttonClicked(_ notification: NSNotification){
        
        guard let sender = notification.userInfo?["sender"] as? UIButton else { return }
        
        let vc = storyboard?.instantiateViewController(identifier: "main") as! SceneViewController
        
        switch sender.tag {
        case Scene.Welcome.rawValue:
            vc.viewModel = SceneViewModel(scene: .Welcome)
        case Scene.RoomKiriusha1.rawValue:
            vc.viewModel = SceneViewModel(scene: .RoomKiriusha1)
        case Scene.RoomKiriusha2.rawValue:
            vc.viewModel = SceneViewModel(scene: .RoomKiriusha2)
        case Scene.Jogging.rawValue:
            vc.viewModel = SceneViewModel(scene: .Jogging)
        case Scene.Campfire.rawValue:
            vc.viewModel = SceneViewModel(scene: .Campfire)
        case Scene.Field.rawValue:
            vc.viewModel = SceneViewModel(scene: .Field)
        case Scene.FilmQuestion.rawValue:
            vc.viewModel = SceneViewModel(scene: .FilmQuestion)
        case Scene.FilmPositive.rawValue:
            vc.viewModel = SceneViewModel(scene: .FilmPositive)
        case Scene.FilmNegative.rawValue:
            vc.viewModel = SceneViewModel(scene: .FilmNegative)
        case Scene.Halloween.rawValue:
            vc.viewModel = SceneViewModel(scene: .Halloween)
        case Scene.CostumesOpinion.rawValue:
            vc.viewModel = SceneViewModel(scene: .CostumesOpinion)
        case Scene.CostumesNegative.rawValue:
            vc.viewModel = SceneViewModel(scene: .CostumesNegative)
        case Scene.CostumesPositive.rawValue:
            vc.viewModel = SceneViewModel(scene: .CostumesPositive)
        case Scene.Farewell.rawValue:
            vc.viewModel = SceneViewModel(scene: .Farewell)
        default: break
        }
        
        pushViewController(vc, animated: true)
    }
    

}
