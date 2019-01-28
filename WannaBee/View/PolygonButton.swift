//
//  PolygonButton.swift
//  WannaBee
//
//  Created by Paweł Ambrożej on 16/01/2019.
//  Copyright © 2019 Pawel Ambrozej. All rights reserved.
//

import UIKit

class PolygonButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var icon: UIImage?
    
    var text: String?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    
    convenience init(imageName: String, buttonTitle: String) {
        self.init()
        self.icon = UIImage(named: imageName)
        self.text = buttonTitle
        configureButton()
        configureInsets()
    }
    
    func configureButton() {
        setImage(icon ?? UIImage(), for: .normal)
        setTitle(text ?? "", for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 16)
    }
    
    func configureInsets() {
        if let image = icon {
            let imageSize: CGSize = image.size
            let spacing: CGFloat = 10.0
            self.titleEdgeInsets = UIEdgeInsets(top: spacing, left: -imageSize.width, bottom: -(imageSize.height), right: 0.0)
            let labelString = NSString(string: self.titleLabel!.text!)
            let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: self.titleLabel!.font])
            self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
        }
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
