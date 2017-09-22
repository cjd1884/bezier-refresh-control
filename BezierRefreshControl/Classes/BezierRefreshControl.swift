//
//  BezierRefreshControl.swift
//  BezierRefreshControl
//
//  Created by Konstantinos Dimitros on 18/09/2017.
//  Copyright © 2017 k.dimitros@gmail.com. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Delegate declaration
@objc public protocol BezierRefreshControlDelegate {
    
    // Inform developer when the loading has started (from the UI) in order for him to take appropriate actions (e.g. network call) and pass him a reference to the reset function in order for him to call it when these actions are finished (e.g. network call is completed)
    @objc optional func loadingDidStart(terminateLoading: @escaping () -> Void)
    
    // Inform developer that user canceled refresh (canceled pull-to-refresh action - dragged scroll view to the top)
    @objc optional func loadingDidCanceled()
}

public class BezierRefreshControlSizing {
    public static func calculateLayerTotalHeight(topOffset: CGFloat, shapeLayerHeight: CGFloat, verticalPadding: CGFloat) -> CGFloat {
        return topOffset + shapeLayerHeight + 2*verticalPadding
    }
    
    public static func calculateLayerBoundsOffsetX(viewWidth: CGFloat, shapeLayerWidth: CGFloat) -> CGFloat {
        return -viewWidth/2 + shapeLayerWidth/2
    }
    
    public static func calculateLayerBoundsOffsetY(shapeLayerTotalHeight: CGFloat, shapeLayerHeight: CGFloat) -> CGFloat {
        return shapeLayerTotalHeight/2 + shapeLayerHeight/2
    }
}

public class BezierRefreshControl: NSObject, UIScrollViewDelegate {
    
    // Delegate
    public var delegate: BezierRefreshControlDelegate?
    
    // MARK: - Public Properties
    public var color: UIColor {
        didSet {
            self.rectShape.strokeColor = color.cgColor
        }
    }
    public var lineWidth: CGFloat {
        didSet {
            self.rectShape.lineWidth = lineWidth
        }
    }
    
    // MARK: - Private Properties
    // Host scrollView - the initialized one
    fileprivate let hostScrollView: UIScrollView
    fileprivate let path:UIBezierPath
    
    // Sizing properties
    fileprivate let topOffset = CGFloat(0.0) // For future use
    fileprivate let verticalPadding = CGFloat(10.0)
    fileprivate var scale = CGFloat(1.0)
    fileprivate var pathRect : CGRect?
    fileprivate let loadingItemHeight = CGFloat(50.0)
    fileprivate var shapeLayerTotalHeight = CGFloat(0)
    
    // Animation properties
    fileprivate let rectShape = CAShapeLayer()
    fileprivate let animationLoop = CAAnimationGroup()
    fileprivate let kAnimationLoopKey = "animationLoop"
    fileprivate let animationScrollFeedbackDuration = 0.3
    
    // Scrolling properties
    fileprivate var currentOffset = CGFloat(0.0)
    fileprivate var isLoading = false
    fileprivate var isInitialDirectionDown = false
    fileprivate var isDragginJustStarted = false
    
    // MARK: - Initializers
    public init(inScrollView scrollView: UIScrollView, withPath path:UIBezierPath, bindsScrollViewDelegate: Bool) {
        
        self.hostScrollView = scrollView
        self.path = path
        self.color = UIColor(red: 1.0, green: 149.0/255.0, blue: 0.0, alpha: 1.0)
        self.lineWidth = 2.0
        
        self.hostScrollView.clipsToBounds = false
        
        super.init()
        
        self.initAnimations()
        
        // Set the delegate in case it is not going to be used by parent class any more (user preference)
        if (bindsScrollViewDelegate) {
            scrollView.delegate = self
        }
    }
    
    // MARK: - Animation initialization
    fileprivate func initAnimations() {
        //        let sizingControl = BezierRefreshControlSizing()
        
        // Update path rect (bounding box)
        self.pathRect = path.cgPath.boundingBoxOfPath;
        
        // Calculate scale (predefined loading item height / pathRect height)
        self.scale = loadingItemHeight / pathRect!.height
        
        // Calculate shape layer width (taking scale into consideration)
        let shapeLayerWidth = pathRect!.width * scale
        
        // Calculate shape layer height (taking scale into consideration)
        let shapeLayerHeight = pathRect!.height * scale
        
        // Calculate shape layer total height
        self.shapeLayerTotalHeight =  BezierRefreshControlSizing.calculateLayerTotalHeight(topOffset: topOffset, shapeLayerHeight: shapeLayerHeight, verticalPadding: verticalPadding)
        
        // Scale path to fit predefined loading item height
        path.apply(CGAffineTransform(scaleX: scale, y: scale))
        
        // Calculate shape layer bounds
        //        let xOffset = -hostScrollView.frame.size.width/2 + scale*(pathRect!.width)
        let xOffset = BezierRefreshControlSizing.calculateLayerBoundsOffsetX(viewWidth: hostScrollView.frame.size.width, shapeLayerWidth: shapeLayerWidth)
        //        let yOffset = shapeLayerHeight + verticalPadding // Pinned at the bottom of the available space
        let yOffset = BezierRefreshControlSizing.calculateLayerBoundsOffsetY(shapeLayerTotalHeight: shapeLayerTotalHeight, shapeLayerHeight: shapeLayerHeight) // Centered vertically in the available space
        let bounds = CGRect(x: xOffset, y: yOffset, width: 0, height: 0)
        
        // Create CAShapeLayer
        rectShape.bounds = bounds
        hostScrollView.layer.addSublayer(rectShape)
        
        // Apply effects here
        rectShape.path = path.cgPath
        rectShape.lineWidth = self.lineWidth
        rectShape.strokeColor = self.color.cgColor
        rectShape.fillColor = UIColor.clear.cgColor
        rectShape.strokeStart = 1.0
        rectShape.opacity = 0.25
        
        // Define animations (stroke and opacity)
        let strokeAnimation = CABasicAnimation(keyPath: "strokeStart")
        strokeAnimation.toValue = 0.0
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.toValue = 1.0
        
        // Set the animation array and properties
        animationLoop.animations = [strokeAnimation, opacityAnimation]
        animationLoop.duration = 0.7
        animationLoop.autoreverses = true
        animationLoop.repeatCount = HUGE // repeat forver
    }
    
    // MARK: - Scroll view delegate
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        // Remove all animations
        rectShape.removeAllAnimations()
        
        // Set isDragginJustStarted flag
        self.isDragginJustStarted = true
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let sublayers = self.hostScrollView.layer.sublayers {
            if !sublayers.contains(rectShape) {
                self.hostScrollView.layer.addSublayer(rectShape)
            }
        }
        
        let offsetY = scrollView.contentOffset.y
        
        // Update scrolling direction
        if (self.isDragginJustStarted) {
            if (offsetY < 0) {
                self.isInitialDirectionDown = true
            } else {
                self.isInitialDirectionDown = false
            }
            self.isDragginJustStarted = false
        }
        if (self.isLoading) { // Case of loading
            self.isInitialDirectionDown = true
        }
        
        // Calculate offsets and animations
        if (isInitialDirectionDown) {
            self.currentOffset += offsetY
            if (self.currentOffset < 0 )//&& offsetY < 0 )
            {
                // Scrollview transformation
                scrollView.setContentOffset(CGPoint.zero, animated: false)
                let translate = CGAffineTransform(translationX: 0, y: -self.currentOffset)
                scrollView.transform = translate
                
                // Update path animation properties
                if (offsetY > -self.shapeLayerTotalHeight) {
                    rectShape.strokeStart = 1.0 - abs(self.currentOffset)/self.shapeLayerTotalHeight
                    rectShape.opacity = Float.init(abs(self.currentOffset)/self.shapeLayerTotalHeight)
                }
            }
            else {
                // Reset content offset
                if (isInitialDirectionDown) {
                    scrollView.setContentOffset(CGPoint.zero, animated: false)
                }
            }
        }
    }
    
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        // Update animation properties
        rectShape.strokeStart = 1.0
        rectShape.opacity = 0.25
        
        if (self.currentOffset < -self.shapeLayerTotalHeight) {
            // Enter loading state
            self.enterLoadingState()
            
            // Update delegate method
            self.delegate?.loadingDidStart?(terminateLoading: resetState)
            
        } else {
            // Inform developer that user canceled refresh
            self.delegate?.loadingDidCanceled?()
            
            // Reset state
            self.resetState()
        }
        
        
    }
    
    // MARK: - Scroll view state update
    fileprivate func enterLoadingState() {
        // Set isLoading flag
        self.isLoading = true
        
        // Translate scroll view to the height of the shape layer
        UIView.animate(withDuration: animationScrollFeedbackDuration, animations: { () -> Void in
            let translate = CGAffineTransform(translationX: 0.0, y: self.shapeLayerTotalHeight)
            self.hostScrollView.transform = translate
        })
        
        // Set offset the minus height of the shape layer
        self.currentOffset = -self.shapeLayerTotalHeight
        
        // Add loading animation
        rectShape.add(animationLoop, forKey: kAnimationLoopKey)
    }
    
    fileprivate func resetState() {
        // Set isLoading flag
        self.isLoading = false
        
        // Reset scroll view position
        UIView.animate(withDuration: animationScrollFeedbackDuration, animations: { () -> Void in
            let translate = CGAffineTransform(translationX: 0.0, y: 0.0)
            self.hostScrollView.transform = translate
        })
        
        // Reset offset
        self.currentOffset = CGFloat(0.0)
        
        // Remove shape
        rectShape.removeFromSuperlayer()
        
    }
    
}
