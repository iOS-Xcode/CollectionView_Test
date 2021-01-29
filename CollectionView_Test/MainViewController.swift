//
//  MainViewController.swift
//  CollectionView_Test
//
//  Created by Seokhyun Kim on 2021-01-27.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        navigationController?.setStatusBar(backgroundColor: UIColor(hex: "#FFFFFFFF")!)

    }
    @IBAction func goToAchievmentsView(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AVC") as? AchievementsViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: false)

    }
    
}

