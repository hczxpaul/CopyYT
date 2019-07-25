//
//  ViewController.swift
//  CopyYT
//
//  Created by George on 7/6/19.
//  Copyright © 2019 Chaozhang Huang. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Display label "Home"
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-30, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        self.navigationController!.navigationBar.isTranslucent = false
        
        collectionView?.backgroundColor = .white
        collectionView?.register(YouTubeVideoCell.self, forCellWithReuseIdentifier: "HomeCellId")
        
        setupNavBarButtons()
    }
    
    func setupNavBarButtons() {
        let searchImage = UIImage(named: "search")?.withRenderingMode(.automatic)
        let searchButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        searchButton.setBackgroundImage(searchImage, for: .normal)
        searchButton.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
        let searchButtonItem = UIBarButtonItem(customView: searchButton)
        searchButtonItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        searchButtonItem.customView?.heightAnchor.constraint(equalToConstant: 24).isActive = true
        searchButtonItem.customView?.widthAnchor.constraint(equalToConstant: 24).isActive = true

        let moreImage = UIImage(named: "more")?.withRenderingMode(.alwaysOriginal)
        let moreButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        moreButton.setBackgroundImage(moreImage, for: .normal)
        moreButton.addTarget(self, action: #selector(handleMore), for: .touchUpInside)
        let moreButtonItem = UIBarButtonItem(customView: moreButton)
        moreButtonItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        moreButtonItem.customView?.heightAnchor.constraint(equalToConstant: 24).isActive = true
        moreButtonItem.customView?.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        //navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: moreButton), UIBarButtonItem(customView: searchButton)]
        navigationItem.rightBarButtonItems = [moreButtonItem, searchButtonItem]

    }
    
    @objc func handleSearch(){
        print("search")
    }
    
    @objc func handleMore(){
        print("more")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCellId", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 20) * 9/16
        return CGSize(width: view.frame.width, height: height + 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
