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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInfoView()
    }
    
    func setupInfoView(){
        self.infoView.layer.cornerRadius = 16
        self.infoView.layer.masksToBounds = false
        self.infoView.layer.shadowRadius = 4
        self.infoView.layer.shadowOpacity = 0.8
        self.infoView.layer.shadowColor = UIColor.lightGray.cgColor
        self.infoView.layer.shadowOffset = CGSize(width: 0 , height:3)
    }
    
    //MARK: - IBAction
    @IBAction func sendEmailAction(_ sender: Any) {
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
