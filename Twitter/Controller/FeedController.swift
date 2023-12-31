//
//  FeedController.swift
//  Twitter
//
//  Created by Jose David Torres Perez on 07/11/23.
//

import Foundation
import UIKit
import SDWebImage

private let reuseIdentifier = "TweetCell"

class FeedController: UICollectionViewController {
    
    
    // MARK: - Properties
    var user: User? {
        didSet { configureLeftBarButton() }
    }
    private var tweets = [Tweet](){
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        fetchTweets()
    }
    // MARK: - Helpers
    func fetchTweets(){
        TweetService.shared.fetchTweets { tweets in
            self.tweets = tweets
        }
    }
    
    func configureUI(){
        view.backgroundColor = .white
        collectionView.register(TweetCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        imageView.setDimensions(width: 44, height: 44)
        navigationItem.titleView = imageView
        
        

    }
    
    func configureLeftBarButton(){
        guard let user = user else { return }
        
        let profileImageView = UIImageView()
        profileImageView.backgroundColor = .twitterBlue
        profileImageView.setDimensions(width: 32, height: 32)
        profileImageView.layer.cornerRadius = 32 / 2
        profileImageView.layer.masksToBounds = true
        
        profileImageView.sd_setImage(with: user.profileImageUrl, completed: nil)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageView)
    }
}

extension FeedController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tweets.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TweetCell
        cell.tweet = tweets[indexPath.row]
        return cell
    }
}

extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
}
