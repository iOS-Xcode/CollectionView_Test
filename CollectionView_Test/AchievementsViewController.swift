//
//  AchievementsViewController.swift
//  CollectionView_Test
//
//  Created by Seokhyun Kim on 2021-01-28.
//

import UIKit

private enum CUSTOMCOLOR : String {
    case NAVIGATIONCOLOR = "#63C6D4FF"
}

class AchievementsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let spacing:CGFloat = 6.0
    private let firstHeaderReuseIdentifier = "FIRSTHEADERCELL"
    private let secondHeaderReuseIdentifier = "SECONDHEADERCELL"
    
    private let personallData = [("Longest Run", "00:00", "longest_run"), ("Highest Elevation", "2095 ft", "highest_elevation"), ("Fastest 5K", "00:00", "fastest_5k"), ("10K", "00:00:00", "fastest_10k"), ("Half Marathon", "00:00", "fastest_half_marathon"), ("Marathon", "Not Yet", "fastest_marathon")]

    private let racesData = [("Virtual Half Marathon Race", "00:00", "virtual_half_marathon_race"), ("Tokyo-Hakone Ekiden 2020","00:00:00", "tokyo-hakone-ekiden-2020"), ("Virtual 10K Race", "00:00:00", "virtual_10k_race"), ("Hakone Ekiden", "00:00:00", "hakone_ekiden"), ("Mizuno Singapore Ekiden 2015", "00:00:00", "mizuno_singapore_ekiden"), ("Virtual 5K Race", "23:07", "virtual_5k_race")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FirstCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: firstHeaderReuseIdentifier)
        collectionView.register(SecondCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: secondHeaderReuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
    func setupUI() {
        navigationController?.navigationItem.rightBarButtonItem?.tintColor = .white
        navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil)
        
        let menuButton = UIBarButtonItem(image: UIImage(named: "menuIcon"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItem = menuButton
        
        navigationController?.setStatusBar(backgroundColor: UIColor(hex: CUSTOMCOLOR.NAVIGATIONCOLOR.rawValue)!)
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barTintColor = UIColor(hex: CUSTOMCOLOR.NAVIGATIONCOLOR.rawValue)!
        navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor(hex: "#FFFFFFFF")!, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        navigationItem.title = "Achievements"
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionHeadersPinToVisibleBounds = true
        self.collectionView?.collectionViewLayout = layout
        
    }
    
}

extension AchievementsViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return personallData.count
        } else {
            return racesData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PRCELL", for: indexPath) as! CollectionViewPRCell
            cell.backgroundColor = .white
            cell.title.text = personallData[indexPath.row].0
            cell.subTitle.text = personallData[indexPath.row].1
            let imageName = personallData[indexPath.row].2
            if imageName == "fastest_marathon" {
                cell.image.alpha = 0.5
                cell.image.image = UIImage(named: imageName)
            } else {
                cell.image.alpha = 1.0
                cell.image.image = UIImage(named: imageName)
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VRCELL", for: indexPath) as! CollectionViewVRCell
            cell.backgroundColor = .white
            cell.title.text = racesData[indexPath.row].0
            cell.subTitle.text = racesData[indexPath.row].1
            let imageName = racesData[indexPath.row].2
            cell.image.image = UIImage(named: imageName)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 6
        
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        if let collection = self.collectionView{
            let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
            return CGSize(width: width, height: width)
        }else{
            return CGSize(width: 0, height: 0)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableview = UICollectionReusableView()
        switch kind {
        case UICollectionView.elementKindSectionHeader:

            if indexPath.section == 0 {
                let firstheader: FirstCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: firstHeaderReuseIdentifier, for: indexPath) as! FirstCollectionReusableView
                reusableview = firstheader
            } else {
                let secondHeader: SecondCollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: secondHeaderReuseIdentifier, for: indexPath) as! SecondCollectionReusableView
                reusableview = secondHeader
            }
            
        default:
            assert(false, "Unexpected element kind")
        }
        return reusableview
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 30)
    }
}
