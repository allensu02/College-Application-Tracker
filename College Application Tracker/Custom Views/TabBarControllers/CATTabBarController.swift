//
//  CATTabBarController.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/12.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class CATTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isHidden = false
        self.viewControllers = [configureProgressNC(), configureSubmittedNC()]
        
    }
    
    func configureProgressNC() -> UINavigationController {
        let progressVC = InProgressVC()
        let boldConfiguration = UIImage.SymbolConfiguration(weight: .semibold)
        progressVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "pencil.and.ellipsis.rectangle", withConfiguration: boldConfiguration)?.withTintColor(Colors.darkBlue), tag: 0)
        
        progressVC.title = ""
        let progressNC = UINavigationController(rootViewController: progressVC)
        return progressNC
    }
    
    func configureSubmittedNC () -> UINavigationController {
        let submittedVC = SubmittedVC()
        let boldConfiguration = UIImage.SymbolConfiguration(weight: .semibold)
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "checkmark", withConfiguration: boldConfiguration)?.withTintColor(Colors.darkBlue), tag: 1)
        submittedVC.tabBarItem = tabBarItem
        submittedVC.title = ""
        let submittedNC = UINavigationController(rootViewController: submittedVC)
        return submittedNC
    }
    
}
