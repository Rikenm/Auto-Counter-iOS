//
//  CustomSegmentedControl.swift
//  Auto Counter
//
//  Created by Riken Maharjan on 10/23/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit

@IBDesignable
class SegmentedControl: UIControl{
    
    var buttons = [UIButton]()
    
    var selector: UIView!
    
    var selectSegmentIndex = 0
    
    @IBInspectable
    var borderWidth: CGFloat = 0{
        
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable
    var borderColor: UIColor = .clear {
        
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.height/2
    }
    
    @IBInspectable
    var commaSeperatedButtonTitles: String = ""{
        didSet{
            
            updateView()
        }
    }
    
    @IBInspectable
    var selectorColor: UIColor = .white{
        
        didSet{
             updateView()
        }
    }
    
    @IBInspectable
    var selectorTextColor: UIColor = .white{
        
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var TextColor: UIColor = .lightGray {
        
        didSet{
            updateView()
            
        }
    }
    
   
    
    func  updateView(){
        
        buttons.removeAll()
        
        subviews.forEach { $0.removeFromSuperview()}
        
        let buttonTitles =  commaSeperatedButtonTitles.components(separatedBy: ",")
        for buttonTitle in buttonTitles{
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(TextColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button: )), for: .touchUpInside )
            buttons.append(button)
        }
        
        
        
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
        
        let selectorWidth = frame.width/CGFloat(buttonTitles.count)
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selector.backgroundColor = selectorColor
        selector.translatesAutoresizingMaskIntoConstraints = false
        selector.layer.cornerRadius = frame.height/2
        
        addSubview(selector)
        
        
        
        
        let sv = UIStackView(arrangedSubviews: buttons)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(sv)
        sv.topAnchor.constraint(equalTo: topAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        sv.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        sv.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        
        
        
    }
    
    @objc func buttonTapped(button:UIButton){
        for (buttonIndex,btn) in buttons.enumerated(){
            btn.setTitleColor(TextColor, for: .normal)
            if(btn == button){
                selectSegmentIndex = buttonIndex
                let selectorStartPosition = frame.width/CGFloat(buttons.count) * CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selector.frame.origin.x = selectorStartPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
        
        sendActions(for: .valueChanged)
    }
    
    
    
    
}
