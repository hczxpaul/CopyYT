//
//  ViewController.swift
//  CopyYT
//
//  Created by George on 7/6/19.
//  Copyright © 2019 Chaozhang Huang. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Home"
        collectionView?.backgroundColor = .white
        collectionView?.register(YouTubeVideoCell.self, forCellWithReuseIdentifier: "HomeCellId")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCellId", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size: CGSize = CGSize(width: view.frame.width, height: 200.0)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    class YouTubeVideoCell: UICollectionViewCell {
        override init(frame: CGRect) {
            super.init(frame: frame)
            setUpViews()
        }
        
        let videoThumbnailView: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = .blue
            return imageView
        }()
        
        let separatorView: UIView = {
            let view = UIView()
            view.backgroundColor = .black
            return view
        }()
        
        let userImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.backgroundColor = .black
            return imageView
        }()
        
        let titleLable: UILabel = {
            let label = UILabel()
            label.backgroundColor = .green
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let subtitileTextView: UITextView = {
            let textView = UITextView()
            textView.backgroundColor = .yellow
            textView.translatesAutoresizingMaskIntoConstraints = false
            return textView
        }()
        
        func setUpViews() {
            addSubview(videoThumbnailView)
            addSubview(separatorView)
            addSubview(userImageView)
            addSubview(titleLable)
            addSubview(subtitileTextView)
            
            // v0(1) means width = 1 point
            addConstrainWithVisualFormats(format: "H:|-10-[v0]-10-|", views: videoThumbnailView)
            addConstrainWithVisualFormats(format: "H:|-10-[v0(44)]", views: userImageView)
            addConstrainWithVisualFormats(format: "V:|-10-[v0]-10-[v1(44)]-10-[v2(1)]|", views: videoThumbnailView, userImageView, separatorView)
            addConstrainWithVisualFormats(format: "H:|[v0]|", views: separatorView)
            
            // title label constraint
            // top
            addConstraints([NSLayoutConstraint(item: titleLable, attribute: .top, relatedBy: .equal, toItem: videoThumbnailView, attribute: .bottom, multiplier: 1, constant: 8)])
            // left
            addConstraints([NSLayoutConstraint(item: titleLable, attribute: .left, relatedBy: .equal, toItem: userImageView, attribute: .right, multiplier: 1, constant: 8)])
            // right
            addConstraints([NSLayoutConstraint(item: titleLable, attribute: .right, relatedBy: .equal, toItem: videoThumbnailView, attribute: .right, multiplier: 1, constant: 0)])
            // height
            addConstraints([NSLayoutConstraint(item: titleLable, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20)])
            
            // subtitleTextView constraint
            // top
            addConstraints([NSLayoutConstraint(item: subtitileTextView, attribute: .top, relatedBy: .equal, toItem: titleLable, attribute: .bottom, multiplier: 1, constant: 8)])
            // left
            addConstraints([NSLayoutConstraint(item: subtitileTextView, attribute: .left, relatedBy: .equal, toItem: userImageView, attribute: .right, multiplier: 1, constant: 8)])
            // right
            addConstraints([NSLayoutConstraint(item: subtitileTextView, attribute: .right, relatedBy: .equal, toItem: videoThumbnailView, attribute: .right, multiplier: 1, constant: 0)])
            // height
            addConstraints([NSLayoutConstraint(item: subtitileTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20)])
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        
    }
}

extension UIView {
    func addConstrainWithVisualFormats(format: String, views: UIView...) {
        
        var viewsDict = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDict[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDict))
    }
}
