//
//  StoreTableViewCell.swift
//  ProntoApp
//
//  Created by Rafael Ramos Sánchez on 9/27/19.
//  Copyright © 2019 reramos. All rights reserved.
//

import UIKit
import Nuke

class StoreTableViewCell: UITableViewCell {

    @IBOutlet weak var imagenView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configure(result: Results){
        if let imageURL = URL(string: result.icon ?? "") {
            Nuke.loadImage(with: imageURL, options: ProntoAppConstants.defaultNukeOptions, into: imagenView)
        }
        name.text = result.name
        address.text = result.formatted_address
        imagenView.layer.cornerRadius = 6
        imagenView.layer.masksToBounds = true
    }
    
}
