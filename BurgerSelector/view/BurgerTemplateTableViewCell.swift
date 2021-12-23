//
//  BurgerTemplateTableViewCell.swift
//  BurgerSelector
//
//  Created by Florian Panten / BBS2H20A BBM3H18M on 23.12.21.
//

import UIKit

class BurgerTemplateTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pricelabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myImageView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
