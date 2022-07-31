//
//  UserDetailsViewController.swift
//  RandomUsers
//
//  Created by Djellza Rrustemi on 31.7.22.
//

import UIKit

class UserDetailsViewController: UIViewController, Storyboarded {
    //MARK: - IBOutlet
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userAgeLabel: UILabel!
    @IBOutlet weak var infoView: UIStackView!
    @IBOutlet weak var userEmailButton: UIButton!
    
    //MARK: - Properties
    var viewModel: UserDetailsViewModelProtocol?
    var coordinator: UserDetailsCoordinator?
    var email = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInfoView()
        if let user = self.viewModel?.user {
            fillUserDetails(user: user)
        }
    }
    
    func setupInfoView(){
        self.infoView.layer.cornerRadius = 16
        self.infoView.layer.masksToBounds = false
        self.infoView.layer.shadowRadius = 4
        self.infoView.layer.shadowOpacity = 0.8
        self.infoView.layer.shadowColor = UIColor.lightGray.cgColor
        self.infoView.layer.shadowOffset = CGSize(width: 0 , height:3)
    }
    
    func fillUserDetails(user:Result){
        if let userImg = user.picture?.large{
            userImage.setImage(with: userImg)
        }
        if let name = user.name?.first, let lastname = user.name?.last {
            self.userNameLabel.text = name + " " + lastname
        }
        self.userAgeLabel.text = "\(user.dob?.age ?? 0)"
        self.userEmailButton.setTitle(user.email, for: .normal)
        self.email = user.email ?? ""
        
    }
    
    //MARK: - IBAction
    @IBAction func sendEmailAction(_ sender: Any) {
        if let url = URL(string: "mailto:\(email)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        coordinator?.stop()
    }
}
//MARK : Coordinated
extension UserDetailsViewController : Coordinated {
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
    
    func setCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator as? UserDetailsCoordinator
    }
}
