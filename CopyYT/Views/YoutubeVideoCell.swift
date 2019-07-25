//
//  YoutubeVideoCell.swift
//  CopyYT
//
//  Created by George on 7/24/19.
//  Copyright © 2019 Chaozhang Huang. All rights reserved.
//

import UIKit

class YouTubeVideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    let videoThumbnailView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.image = UIImage(named: "t01")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 160, green: 160, blue: 160)
        return view
    }()
    
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.image = UIImage(named: "t02")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello world!!"
        return label
    }()
    
    let subtitileTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isUserInteractionEnabled = false
        textView.text = "ME • 123910 views"
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.textColor = UIColor.rgb(red: 160, green: 160, blue: 160)
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
