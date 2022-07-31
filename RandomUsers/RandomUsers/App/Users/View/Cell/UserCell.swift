//
//  UserCell.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    
    var users: Result!{
        didSet{
            setUserValues()
        }
    }
    
    //returns Flags
    func flag(from country: String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.uppercased().unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return s
    }
    
    func setUserValues(){
        nameLabel.text = (users.name?.first ?? "" ) + " " + (users.name?.last ?? "")
        ageLabel.text = "\(users.dob?.age ?? 0)"
        nationalityLabel.text = users.location?.country
        if let nat = users.nat {
            flagLabel.text = flag(from: nat)
        }
        if let usrImage = users.picture?.medium{
            userImage.setImage(with: usrImage)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setupView(){
        self.contentView.layer.masksToBounds = false
        self.contentView.layer.shadowRadius = 4
        self.contentView.layer.shadowOpacity = 0.8
        self.contentView.layer.shadowColor = UIColor.lightGray.cgColor
        self.contentView.layer.shadowOffset = CGSize(width: 0 , height:3)
    }
}
