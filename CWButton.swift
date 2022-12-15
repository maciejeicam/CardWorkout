//
//  CWButton.swift
//  CardWorkoutNew
//
//  Created by Maciej Michalik on 15/12/2022.
//

import UIKit

class CWButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(Color: UIColor, title: String, systemImageName: String) {
        super.init(frame: CGRect .zero)
        
        
        configuration = .tinted()
        configuration?.title = title
        configuration?.baseForegroundColor = Color
        configuration?.baseBackgroundColor = Color
        configuration?.cornerStyle = .medium
        
        configuration?.image = UIImage(systemName: systemImageName)
        configuration?.imagePadding = 5
        configuration?.imagePlacement = .leading
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}

