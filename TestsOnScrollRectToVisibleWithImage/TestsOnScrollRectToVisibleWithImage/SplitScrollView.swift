//
//  ImageContainerScrollView.swift
//  ReplaceScrollViewTest
//
//  Created by SeoGiwon on 24/08/2017.
//  Copyright © 2017 SeoGiwon. All rights reserved.
//

import UIKit

@IBDesignable
class SplitScrollView: UIScrollView {
    
    
    /**
     The image is contained in this scroll view, and it behaves as if it is contained in
     ScaleAspectFill mode.
    */
    @IBInspectable var image: UIImage? {
        didSet {
            imageView.image = image
            updateImageViewConstraints()
//            reflectInitialVisibleRect()
        }
    }
    
    @IBInspectable var zoomScaleForImage: CGFloat = 1.0
    @IBInspectable var normalizedContentOffsetX: CGFloat = 0.0
    @IBInspectable var normalizedContentOffsetY: CGFloat = 0.0
    
    /*
     view hierarchy:
        self(scrollview)
                            - imageView
    */
    fileprivate var imageView = UIImageView()
    
    private var imageViewWidthConstraint = NSLayoutConstraint()
    private var imageViewHeightConstraint = NSLayoutConstraint()
    
    private var viewWidthConstraint = NSLayoutConstraint()
    private var viewHeightConstraint = NSLayoutConstraint()
    private var viewLeftConstraint = NSLayoutConstraint()
    private var viewTopConstraint = NSLayoutConstraint()
    
    // MARK: - Initializer
    init() {
        super.init(frame: CGRect.zero)
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.addSubview(imageView)
        
        configureView()
        setupImageViewConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateImageViewConstraints()
    }
    
    private func configureView() {
        
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.clipsToBounds = true
        self.minimumZoomScale = 1.0
        self.maximumZoomScale = 4.0
        self.delegate = self
    }
    
    
    // MARK: - Setting AutoLayout
    /// SplitScrollView installs constraints by itself by calling this function.
    func setupConstraints(superview: UIView, size: CGSize, offset: CGPoint) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        viewTopConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy:.equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: offset.y)
        viewLeftConstraint = NSLayoutConstraint(item: self, attribute: .left, relatedBy:.equal, toItem: superview, attribute: .left, multiplier: 1.0, constant: offset.x)
        viewWidthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy:.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: size.width)
        viewHeightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy:.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: size.height)
        
        NSLayoutConstraint.activate([viewTopConstraint, viewLeftConstraint, viewWidthConstraint, viewHeightConstraint])
        
    }
    /*
    /// SplitScrollView updates its position by given CGPoint value
    func update(offsetDelta: CGPoint) {
        
        viewLeftConstraint.constant += offsetDelta.x
        viewTopConstraint.constant += offsetDelta.y
        
    }
    
    /// SplitScrollView updates its size by given CGSize value
    func update(sizeDelta: CGSize) {
        
        viewWidthConstraint.constant += sizeDelta.width
        viewHeightConstraint.constant += sizeDelta.height
        
        imageFrameSize = CGSize(width: (imageFrameSize?.width ?? 0) + sizeDelta.width,
                                       height: (imageFrameSize?.height ?? 0) + sizeDelta.height)
    }
    */
    /**
        It installs constraints for imageview against its parent view(SplitScrollView) for the first
        time ever. This function must not be called more than once.
    */
    private func setupImageViewConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        
        imageViewWidthConstraint = NSLayoutConstraint(item: self.imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: imageSizeForThisViewFrame().width)
        
        imageViewHeightConstraint = NSLayoutConstraint(item: self.imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: imageSizeForThisViewFrame().height)
        
        NSLayoutConstraint.activate([imageViewHeightConstraint, imageViewWidthConstraint])
        
    }
    
    /**
        It updates the very constraints about how much the size of the image view will be in
        SplitScrollView. If the given image view size is bigger than SplitScrollView's bounds, the
        image view zooms in, otherwise, zooms out by itself.
    */
    private func updateImageViewConstraints() {
        
        imageViewWidthConstraint.constant = imageSizeForThisViewFrame().width + 0.25
        imageViewHeightConstraint.constant = imageSizeForThisViewFrame().height + 0.25
        self.layoutIfNeeded()
        
        
        
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
//        print("\(self.contentOffset.x), \(self.contentOffset.y), \(self.bounds.size.width), \(self.bounds.size.height)")
    }
    
    func imageSizeForThisViewFrame() -> CGSize {
        
        if let image = image {
            let viewFrame = self.bounds
            let imgSize = image.size
            
            
            
            let result = image.scaleAspectFillSize(against: viewFrame.size)
//            print(result.height)
            
            return result
            
        } else {
            return CGSize.zero
        }
    }
    
    func reflectInitialVisibleRect(rect: CGRect) {
        self.scrollRectToVisible(rect, animated: false)
    }
    
    func toCenter() {
//        self.setContentOffset(<#T##contentOffset: CGPoint##CGPoint#>, animated: false)
    }
    
}

extension SplitScrollView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}
