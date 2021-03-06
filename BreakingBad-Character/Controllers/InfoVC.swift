//
//  InfoVC.swift
//  BreakingBad-Character
//
//  Created by Hossam-Abubaker on 12/04/2022.
//

import UIKit

class InfoVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var neckName: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var catagoryLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    var char : Character!
    var key = Constants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        navigationController?.navigationBar.isHidden = true
        nameLabel.text = char.name
        neckName.text = "nickName :\(char.nickname ?? "")"
        birthday.text = " birthday : \(char.birthday?.rawValue ?? "")"
        catagoryLabel.text = " catagory : \(char.category?.rawValue ?? "")"
        statusLabel.text = "status : \(char.status?.rawValue ?? "")"
        
        let urlImage = URL(string: char.img ?? "")!
        let url = try! Data(contentsOf: urlImage)
        photo.image = UIImage(data: url)
        
        NotificationCenter.default.addObserver(self, selector: #selector(addNewColor), name: NSNotification.Name(key.newNotifacationKey), object: nil)
        
    }
   @objc func addNewColor(){
       view.backgroundColor = .yellow
    }
}
