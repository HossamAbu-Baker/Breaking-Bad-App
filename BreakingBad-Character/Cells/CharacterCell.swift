//
//  CharacterCell.swift
//  BreakingBad-Character
//
//  Created by Hossam-Abubaker on 12/04/2022.
//

import UIKit

class CharacterCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
            }
    
//    MARK: addData to cell
    func addDataToCell(name:String,img:String){
        nameLabel.text = name
        
        let url = URL(string: img)!
        do{
            let data = try Data(contentsOf: url)
            photo.image = UIImage(data: data)
        }catch{
            print(error)
        }
        
    }
}
