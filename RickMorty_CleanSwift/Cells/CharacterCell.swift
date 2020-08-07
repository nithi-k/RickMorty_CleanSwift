//
//  CharacterCell.swift
//  RickMorty_CleanSwift
//
//  Created by Nithi Kulasiriswatdi on 6/8/2563 BE.
//  Copyright © 2563 Nithi Kulasiriswatdi. All rights reserved.
//

import UIKit
import AlamofireImage

class CharacterCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    
    func updateUI(imageURL:String){
        
        guard let imageURL = URL(string: imageURL) else{
            return
        }
        characterImage.image = nil
        characterImage.af_cancelImageRequest()
        characterImage.af_setImage(withURL: imageURL)
    }
    
}
