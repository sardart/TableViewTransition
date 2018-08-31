//
//  ActorTableViewCell.swift
//  TableViewTransition
//
//  Created by Artur on 31/08/2018.
//  Copyright © 2018 Artur Sardaryan. All rights reserved.
//

import UIKit

class ActorTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bornLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        photo.layer.cornerRadius = photo.frame.height / 2
        photo.layer.masksToBounds = true
    }
    
    func configure(with actor: Actor) {
        nameLabel.text = actor.name
        bornLabel.text = actor.born
        photo.image = actor.image
    }
    
    
}
