//
//  UploadTweetController.swift
//  Twitter
//
//  Created by Jose David Torres Perez on 22/11/23.
//

import Foundation
import UIKit
class UploadTweetController : UIViewController {
    
    
    
    private let user: User
    
    //MARK: - Properties
    private lazy var actionButton : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .twitterBlue
        button.setTitle("Tweet", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 64, height: 32)
        button.layer.cornerRadius = 32 / 2
        button.addTarget(self, action: #selector(handleUploadTweet), for: .touchUpInside)
        return button
    }()
    
    private let profileImageView : UIImageView = {
      let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.setDimensions(width: 48, height: 48)
        iv.layer.cornerRadius = 48 / 2
        iv.backgroundColor = .twitterBlue
        return iv
    }()
    
    private let captionTextView = CaptionTextView()
    //MARK: - Lifecycle
    init(user: User){
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureNavigationBar()
    }
    
    //MARK: - Selectors
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleUploadTweet(){
        guard let caption = captionTextView.text else { return }
        TweetService.shared.uploadTweet(caption: caption) { (error, ref) in
            if let error = error {
                print("Failed top upload tweet with\(error.localizedDescription)")
                return
            }
            self.dismiss(animated: true, completion: nil)
        }
    }

    //MARK: - API
    
    
    //MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .white
        configureNavigationBar()
        let stack = UIStackView(arrangedSubviews: [profileImageView,captionTextView])
        stack.axis = .horizontal
        stack.spacing = 12
        view.addSubview(stack)
        stack.anchor(top:view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor ,  paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        profileImageView.sd_setImage(with: user.profileImageUrl, completed: nil)
    }
    
    func configureNavigationBar(){
        view.backgroundColor = .white
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: actionButton)
    }
}
