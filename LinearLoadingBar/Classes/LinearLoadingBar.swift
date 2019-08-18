//
//  LinearLoadingBar.swift
//  LinearLoadingBar
//
//  Created by Leyee.H on 2019/8/18.
//  Copyright © 2019 Leyee. All rights reserved.
//

import UIKit

@IBDesignable
open class LinearLoadingBar: UIView {
    
    private let trackView = UIView()
    private let titleLab = UILabel()
    private lazy var trackViewWidthConstraint: NSLayoutConstraint =  { NSLayoutConstraint(item: self.trackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 0) }()
    private lazy var titleLabWidthConstraint: NSLayoutConstraint =  { NSLayoutConstraint(item: titleLab, attribute: .centerX, relatedBy: .equal, toItem: self.trackView, attribute: .centerX, multiplier: 1.0, constant: 0) }()
    private lazy var titleLabHightConstraint: NSLayoutConstraint =  { NSLayoutConstraint(item: titleLab, attribute: .centerY, relatedBy: .equal, toItem: self.trackView, attribute: .centerY, multiplier: 1.0, constant: 0) }()
    
    @IBInspectable
    open var barColor: UIColor = .gray {
        didSet {
            self.layer.backgroundColor = barColor.cgColor
        }
    }
    
    @IBInspectable
    open var titleString: String = "Now loading..." {
        didSet {
            titleLab.text = titleString
        }
    }
    
    @IBInspectable
    open var titleColor: UIColor = .gray {
        didSet {
            titleLab.textColor = titleColor
        }
    }
    
    @IBInspectable
    open var trackColor: UIColor = .green {
        didSet {
            trackView.layer.backgroundColor = trackColor.cgColor
            
            layoutSubviews()
        }
    }
    
    @IBInspectable
    open var isCornersRounded: Bool = true {
        didSet {
            if !isCornersRounded {
                self.layer.cornerRadius = 0
                trackView.layer.cornerRadius = 0
            }
            layoutSubviews()
        }
    }
    
    @IBInspectable
    open var isTitleShowed: Bool = false {
        didSet {
            self.titleLab.isHidden = !isTitleShowed
            layoutSubviews()
        }
    }
    
    @IBInspectable
    open var cornerRadiusValue: Float = 0 {
        didSet {
            if cornerRadiusValue > Float(self.frame.height / 2) {
                cornerRadiusValue = Float(self.frame.height / 2)
            }
            layoutSubviews()
        }
    }
    
    @IBInspectable
    open var maximumValue: Float = 100.0 {
        didSet {
            progress = { progress }()
        }
    }
    
    @IBInspectable
    open var minimumValue: Float = 0.0 {
        didSet {
            progress = { progress }()
        }
    }
    
    @IBInspectable
    open private(set) var progress: Float = 0 {
        didSet {
            if progress > maximumValue {
                progress = maximumValue
            } else if progress < minimumValue {
                progress = minimumValue
            }
            layoutSubviews()
        }
    }
    
    @IBInspectable
    open var barInset: CGFloat = 0 {
        didSet {
            layoutSubviews()
        }
    }
    
    open var animationDuration: TimeInterval = 0.25
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepare()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepare()
    }
    
    open func prepare() {
        self.addSubview(trackView)
        
        trackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: trackView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .leftMargin, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: trackView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .topMargin, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: trackView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottomMargin, multiplier: 1.0, constant: 0),
            trackViewWidthConstraint
            ])
        //        self.layoutMargins = .zero
        
        titleLab.text = titleString
        titleLab.numberOfLines = 0
        let size = calculateSize(text: titleLab.text!, font: titleLab.font, maxSize: trackView.frame.size)
        
        trackView.addSubview(titleLab)
        
        titleLab.translatesAutoresizingMaskIntoConstraints = false
        
        //        let calConstraint = trackView.frame.size.width - size.width
        titleLabWidthConstraint.constant = size.width * 0.6 - CGFloat(cornerRadiusValue)
        self.layoutMargins = .zero
        trackView.addConstraint(titleLabWidthConstraint)
        trackView.addConstraint(titleLabHightConstraint)
        
        titleLab.isHidden = !self.isTitleShowed
        
    }
    
    open func setProgress(_ value: Float, animated: Bool) {
        self.progress = value
        
        titleLab.isHidden = !self.isTitleShowed
        
        if animated {
            UIView.animate(withDuration: animationDuration, animations: {
                self.layoutIfNeeded()
            })
        }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        let maxWidth: CGFloat = max(self.frame.width - barInset * 2, 0) // prevent from becoming negative
        let calculatedWidth: CGFloat = maximumValue - minimumValue != 0 ? CGFloat((progress - minimumValue) / (maximumValue - minimumValue)) * maxWidth : 0
        trackViewWidthConstraint.constant = calculatedWidth
        if isCornersRounded {
            self.layer.cornerRadius = CGFloat(cornerRadiusValue)
            trackView.layer.cornerRadius = CGFloat(cornerRadiusValue) - 0.8 * barInset
        }
        
        self.layoutMargins = UIEdgeInsets(top: barInset, left: barInset, bottom: barInset, right: barInset)
    }
    
    func calculateSize(text : String , font : UIFont , maxSize : CGSize) -> CGSize{
        return text.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font : font], context: nil).size
    }
}
