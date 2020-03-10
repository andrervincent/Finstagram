//
//  PostViewCell.swift
//  Finstagram
//
//  Created by Andre Vincent on 3/9/20.
//  Copyright © 2020 Andre Vincent. All rights reserved.
//

import UIKit

class PostViewCell: UITableViewCell {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
