//
//  DetailTableViewCell.swift
//  NewsApp
//
//  Created by Ripon sk on 01/06/22.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
   
    @IBOutlet weak var newsdes: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var imgv: LazyImageLoaderView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    }


