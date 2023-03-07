//
//  ArticleTVCell.swift
//  newsApp
//
//  Created by Acesso Leandro MP on 06/03/2023.
//

import UIKit

class ArticleTVCell: UITableViewCell {

    @IBOutlet weak var imageArticle: UIImageView!
    @IBOutlet weak var descArticle: UILabel!
    @IBOutlet weak var titleArticle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageArticle.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
