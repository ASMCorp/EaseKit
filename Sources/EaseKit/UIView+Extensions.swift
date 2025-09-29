//
//  UIView+Extensions.swift
//  EaseKit
//
//  Created by ASM Anik on 29/9/25.
//

import UIKit

/// Extension to UIView that provides convenience methods for setting Auto Layout constraints,
/// centering views, and rendering a view as an image.
public extension UIView{
    /// Anchors the view's edges to the specified anchors with optional padding.
    ///
    /// - Parameters:
    ///   - top: The top anchor to constrain to. Defaults to nil.
    ///   - leading: The leading anchor to constrain to. Defaults to nil.
    ///   - bottom: The bottom anchor to constrain to. Defaults to nil.
    ///   - trailing: The trailing anchor to constrain to. Defaults to nil.
    ///   - paddingTop: The padding to apply from the top anchor. Defaults to 0.
    ///   - paddingLeft: The padding to apply from the leading anchor. Defaults to 0.
    ///   - paddingBottom: The padding to apply from the bottom anchor. Defaults to 0.
    ///   - paddingRight: The padding to apply from the trailing anchor. Defaults to 0.
    ///
    /// This method disables `translatesAutoresizingMaskIntoConstraints` and activates constraints for the provided anchors.
    func anchorView(top: NSLayoutYAxisAnchor? = nil,
                    leading: NSLayoutXAxisAnchor? = nil,
                    bottom: NSLayoutYAxisAnchor? = nil,
                    trailing: NSLayoutXAxisAnchor? = nil,
                    paddingTop: CGFloat = 0,
                    paddingLeft: CGFloat = 0,
                    paddingBottom: CGFloat = 0,
                    paddingRight: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top  {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeft).isActive = true
        }
        
        if let bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingRight).isActive = true
        }
    }
    
    /// Sets fixed width and/or height constraints on the view.
    ///
    /// - Parameters:
    ///   - width: The fixed width to apply. If nil, width constraint is not set.
    ///   - height: The fixed height to apply. If nil, height constraint is not set.
    ///
    /// This method disables `translatesAutoresizingMaskIntoConstraints` and activates width and/or height constraints if provided.
    func setDimension(width: CGFloat? = nil, height: CGFloat? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        if let width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    /// Anchors the view to fill its superview's bounds.
    ///
    /// This method sets the view's top, leading, bottom, and trailing anchors equal to its superview's anchors.
    func fillSuperView() {
        anchorView(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    /// Centers the view within the specified view.
    ///
    /// - Parameter view: The view in which to center this view.
    ///
    /// This method centers the view horizontally and vertically in the given view,
    /// regardless of whether it is the direct superview.
    func center(in view: UIView) {
        centerX(inView: view)
        centerY(inView: view)
    }
    
    /// Centers the view within its immediate superview.
    ///
    /// This method requires that the view already has a superview.
    /// If no superview is found, it logs an error and does nothing.
    func centerInsideParent(){
        guard let superview else{print("🛑 centerXY failed. Superview not found"); return}
        centerX(inView: superview)
        centerY(inView: superview)
    }
    
    /// Centers the view horizontally in the specified view.
    ///
    /// - Parameter view: The view in which to center this view horizontally.
    func centerX(inView view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    /// Centers the view vertically in the specified view.
    ///
    /// - Parameter view: The view in which to center this view vertically.
    func centerY(inView view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    /// Renders the view into a UIImage.
    ///
    /// - Returns: A UIImage representation of the current view.
    ///
    /// This method uses UIGraphicsImageRenderer if available (iOS 10+), otherwise falls back to older APIs.
    func asImage() -> UIImage {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContext(self.frame.size)
            self.layer.render(in:UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return UIImage(cgImage: image!.cgImage!)
        }
    }
}
