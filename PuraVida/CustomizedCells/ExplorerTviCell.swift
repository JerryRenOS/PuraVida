//
//  ExplorerTviCell.swift
//  PuraVida
//
//  Created by Jerry Ren on 5/9/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

protocol ButtonActionDelegate {
    func transitionToMappiness()
}

class ExplorerTviCell: UITableViewCell {
    
    @IBOutlet weak var tvicImageView: UIImageView!
    @IBOutlet weak var tvicRabel: UILabel!
    @IBOutlet weak var tvicButton: CurvedButton!
    
    var actionDelegate: ButtonActionDelegate?
    
    @IBAction func tvicButtonAction(_ sender: CurvedButton) {
        actionDelegate?.transitionToMappiness()
    }
    
}                     

