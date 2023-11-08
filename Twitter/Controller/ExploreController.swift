//
//  ExploreController.swift
//  Twitter
//
//  Created by Jose David Torres Perez on 07/11/23.
//

import Foundation
import UIKit

class ExploreController: UIViewController {
    // MARK: - Properties
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    // MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .white
        navigationItem.title = "Explore"
    }

}
