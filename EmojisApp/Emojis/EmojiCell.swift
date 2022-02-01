//
//  EmojiCell.swift
//  EmojisApp
//
//  Created by Charles Prado on 01/02/2022.
//

import UIKit

class EmojiCell: UICollectionViewCell {
    var emojiImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(emojiImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
