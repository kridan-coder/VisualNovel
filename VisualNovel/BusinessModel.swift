//
//  Model.swift
//  VisualNovel
//
//  Created by Daniil Zavodchanovich on 29.03.2021.
//

import Foundation


public class LabelInfo{
    var LabelText: String
    var Color: String
    
    init(LabelText: String, Color: String){
        self.Color = Color
        self.LabelText = LabelText
    }
}


public class ButtonInfo : LabelInfo{
    var Segue: String
    
    init(LabelText: String, Color: String, Segue: String){
        self.Segue = Segue
        super.init(LabelText: LabelText, Color: Color)
    }
}
