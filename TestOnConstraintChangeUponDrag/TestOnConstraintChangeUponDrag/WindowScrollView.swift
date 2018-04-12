//
//  ImageContainerScrollView.swift
//  ReplaceScrollViewTest
//
//  Created by SeoGiwon on 24/08/2017.
//  Copyright © 2017 SeoGiwon. All rights reserved.
//

import UIKit

@IBDesignable
class WindowScrollView: UIScrollView {
    
    /**
     The image is contained in this scroll view, and it behaves as if it is contained in
     ScaleAspectFill mode.
    */
    @IBInspectable weak var image: UIImage? {
        didSet {
            imageView.image = image
            
        }
    }
    
    /**
        This property needs to be constantly updated whenever the size of this view's frame is changed,
        which is caused by user's interaction with the size control. Otherwise, this view's image
        containment will show unruly behaviors.
    */
   
    private var imageSizeAsContentAspectFill: CGSize {
        
        var imageFrameSize = CGSize.zero
        
        if (viewWidthConstraint != nil) && (viewHeightConstraint != nil) {
            imageFrameSize = CGSize(width: viewWidthConstraint!.constant, height: viewHeightConstraint!.constant)
        }
        
        // come up with the size that the image view will fill
        return image?.scaleAspectFillSize(against: imageFrameSize) ?? CGSize.zero
    }
    
    /*
     view hierarchy:
        self(scrollview)
                            - imageView
    */
    fileprivate var imageView = UIImageView()
    
    private var imageViewWidthConstraint = NSLayoutConstraint()
    private var imageViewHeightConstraint = NSLayoutConstraint()
    
    var inheritedViewConstraintValue: [CGFloat] = [0, 0, 0, 0]
    
    @IBOutlet private(set) weak var viewWidthConstraint: NSLayoutConstraint? {
        didSet {
            updateImageViewConstraints()            
        }
    }
    @IBOutlet private(set) weak var viewHeightConstraint: NSLayoutConstraint? {
        didSet { updateImageViewConstraints() }
    }
    @IBOutlet private(set) weak var viewLeftConstraint: NSLayoutConstraint!
    @IBOutlet private(set) weak var viewTopConstraint: NSLayoutConstraint!
    
    
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
    
    private func configureView() {
        
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.clipsToBounds = true
        self.minimumZoomScale = 1.0
        self.maximumZoomScale = 4.0
        self.delegate = self
    }
    
    
    // MARK: - Setting View Constraints
    /// WindowScrollView installs constraints by itself by calling this function.
    func setupConstraints(superview: UIView, size: CGSize, offset: CGPoint) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        viewTopConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy:.equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: offset.y)
        viewLeftConstraint = NSLayoutConstraint(item: self, attribute: .left, relatedBy:.equal, toItem: superview, attribute: .left, multiplier: 1.0, constant: offset.x)
        viewWidthConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy:.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: size.width)
        viewHeightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy:.equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: size.height)
        
        NSLayoutConstraint.activate([viewTopConstraint, viewLeftConstraint, viewWidthConstraint!, viewHeightConstraint!])
        
    }
    
    // MARK: - Updating View Constraints
    func constraintValues() -> [CGFloat] {
        
        return [viewTopConstraint.constant, viewLeftConstraint.constant, viewWidthConstraint?.constant ?? 0, viewHeightConstraint?.constant ?? 0]
    }
    
    func setConstraintValues(values: [CGFloat]) {
        
        guard values.count == 4 else {
            print("setConstraintValues wrong values")
            return
        }
        
        viewTopConstraint.constant = values[0]
        viewLeftConstraint.constant = values[1]
        viewWidthConstraint?.constant = values[2]
        viewHeightConstraint?.constant = values[3]
        
        UIView.animate(withDuration: 1.0) {
            self.layoutIfNeeded()
        }
    }
    
    func setInheritedConstraintValues(top: CGFloat, left: CGFloat, width: CGFloat, height: CGFloat, shouldUpdateCurrentValues isUpdated: Bool) {
        
        inheritedViewConstraintValue = [top, left, width, height]
        
        if (isUpdated) {
            viewTopConstraint.constant = top
            viewLeftConstraint.constant = left
            viewWidthConstraint?.constant = width
            viewHeightConstraint?.constant = height
        }
        
    }
    
    func resetCurrentConstraintsToInheritedValues() {
        viewTopConstraint.constant = inheritedViewConstraintValue[0]
        viewLeftConstraint.constant = inheritedViewConstraintValue[1]
        viewWidthConstraint?.constant = inheritedViewConstraintValue[2]
        viewHeightConstraint?.constant = inheritedViewConstraintValue[3]
    }
    
    /// WindowScrollView updates its position by given CGPoint value
    func update(offsetDelta: CGPoint) {
        
        viewLeftConstraint.constant += offsetDelta.x
        viewTopConstraint.constant += offsetDelta.y
        
    }
    
    /// WindowScrollView updates its size by given CGSize value
    func update(sizeDelta: CGSize) {
        
        viewWidthConstraint!.constant += sizeDelta.width
        viewHeightConstraint!.constant += sizeDelta.height
        
        updateImageViewConstraints()
    }
    
    
    // MARK: - Setting/Updating Image View Constraints
    /**
     It installs constraints for imageview against its parent view(WindowScrollView) for the first
     time ever. This function must not be called more than once.
     */
    private func setupImageViewConstraints() {
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        
        imageViewWidthConstraint = NSLayoutConstraint(item: self.imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: imageSizeAsContentAspectFill.width)
        
        imageViewHeightConstraint = NSLayoutConstraint(item: self.imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: imageSizeAsContentAspectFill.height)
        
        NSLayoutConstraint.activate([imageViewHeightConstraint, imageViewWidthConstraint])
        
    }
    
    /**
     It updates the very constraints about how much the size of the image view will be in
     WindowScrollView. If the given image view size is bigger than WindowScrollView's bounds, the
     image view zooms in, otherwise, zooms out by itself.
     */
    func updateImageViewConstraints() {
        
        imageViewWidthConstraint.constant = imageSizeAsContentAspectFill.width + 0.25
        imageViewHeightConstraint.constant = imageSizeAsContentAspectFill.height + 0.25
        
    }
    
    
    
    // MARK: - Image view values
    func imgSizeToFrameSizeRatio() -> CGFloat {
        
        guard let image = self.image else { return 0 }
        
        return imageSizeAsContentAspectFill.width / image.size.width
    }
    
    func imgContentFramePCT() -> CGRect {
        
        let rectPCT = CGRect(x: self.contentOffset.x / self.contentSize.width,
                             y: self.contentOffset.y / self.contentSize.height,
                             width: self.bounds.size.width / self.contentSize.width,
                             height: self.bounds.size.height / self.contentSize.height)
        
        return rectPCT
    }
}

extension WindowScrollView: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}
