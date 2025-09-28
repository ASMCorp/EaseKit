import XCTest
import UIKit
import SwiftUI
@testable import EaseKit

@MainActor
final class EaseKitTests: XCTestCase {
    
    // MARK: - UIView+Extensions Tests
    
    func testAnchorView_setsConstraintsCorrectly() {
        let view = UIView()
        let superview = UIView()
        superview.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.anchorView(top: superview.topAnchor,
                        leading: superview.leadingAnchor,
                        bottom: superview.bottomAnchor,
                        trailing: superview.trailingAnchor,
                        paddingTop: 10,
                        paddingLeft: 15,
                        paddingBottom: 20,
                        paddingRight: 25)
        
        XCTAssertEqual(view.constraints.count, 0, "Should not have constraints on itself")
        XCTAssertEqual(superview.constraints.count, 4, "Superview should have 4 constraints")
        
        let topConstraint = superview.constraints.first(where: { $0.firstAnchor == view.topAnchor })
        XCTAssertEqual(topConstraint?.constant, 10)
        
        let leadingConstraint = superview.constraints.first(where: { $0.firstAnchor == view.leadingAnchor })
        XCTAssertEqual(leadingConstraint?.constant, 15)
        
        let bottomConstraint = superview.constraints.first(where: { $0.firstAnchor == view.bottomAnchor })
        XCTAssertEqual(bottomConstraint?.constant, -20)
        
        let trailingConstraint = superview.constraints.first(where: { $0.firstAnchor == view.trailingAnchor })
        XCTAssertEqual(trailingConstraint?.constant, -25)
    }
    
    func testSetDimension_setsWidthAndHeight() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.setDimention(width: 100, height: 200)
        
        let widthConstraint = view.constraints.first(where: { $0.firstAttribute == .width })
        XCTAssertEqual(widthConstraint?.constant, 100)
        
        let heightConstraint = view.constraints.first(where: { $0.firstAttribute == .height })
        XCTAssertEqual(heightConstraint?.constant, 200)
    }
    
    func testFillSuperView_setsConstraintsToSuperviewBounds() {
        let view = UIView()
        let superview = UIView()
        superview.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.fillSuperView()
        
        XCTAssertEqual(superview.constraints.count, 4)
        
        let topConstraint = superview.constraints.first(where: { $0.firstAnchor == view.topAnchor })
        XCTAssertEqual(topConstraint?.constant, 0)
        
        let leadingConstraint = superview.constraints.first(where: { $0.firstAnchor == view.leadingAnchor })
        XCTAssertEqual(leadingConstraint?.constant, 0)
        
        let bottomConstraint = superview.constraints.first(where: { $0.firstAnchor == view.bottomAnchor })
        XCTAssertEqual(bottomConstraint?.constant, 0)
        
        let trailingConstraint = superview.constraints.first(where: { $0.firstAnchor == view.trailingAnchor })
        XCTAssertEqual(trailingConstraint?.constant, 0)
    }
    
    func testCenter_setsCenterConstraints() {
        let view = UIView()
        let superview = UIView()
        superview.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.center(in: superview)
        
        XCTAssertEqual(superview.constraints.count, 2)
        
        let centerX = superview.constraints.first(where: { $0.firstAnchor == view.centerXAnchor })
        XCTAssertEqual(centerX?.constant, 0)
        
        let centerY = superview.constraints.first(where: { $0.firstAnchor == view.centerYAnchor })
        XCTAssertEqual(centerY?.constant, 0)
    }
    
    func testCenterX_setsCenterXConstraint() {
        let view = UIView()
        let superview = UIView()
        superview.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.centerX(inView: superview)
        
        XCTAssertEqual(superview.constraints.count, 1)
        
        let centerX = superview.constraints.first(where: { $0.firstAnchor == view.centerXAnchor })
        XCTAssertEqual(centerX?.constant, 0)
    }
    
    func testCenterY_setsCenterYConstraint() {
        let view = UIView()
        let superview = UIView()
        superview.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.centerY(inView: superview)
        
        XCTAssertEqual(superview.constraints.count, 1)
        
        let centerY = superview.constraints.first(where: { $0.firstAnchor == view.centerYAnchor })
        XCTAssertEqual(centerY?.constant, 0)
    }
    
    func testAsImage_returnsImageOfView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.backgroundColor = .red
        
        let image = view.asImage()
        
        XCTAssertNotNil(image)
        XCTAssertEqual(image.size.width, 50)
        XCTAssertEqual(image.size.height, 50)
        
        // Optionally, test that image is not blank by checking pixel data or similar
    }
    
    // MARK: - UIColor+Extensions Tests
    
    func testHexStringInitializer_with3DigitHex() {
        let color = UIColor(hexString: "#F0A")
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        XCTAssertEqual(red, 1.0, accuracy: 0.01)
        XCTAssertEqual(green, 0.0, accuracy: 0.01)
        XCTAssertEqual(blue, 0.6667, accuracy: 0.01)
        XCTAssertEqual(alpha, 1.0, accuracy: 0.01)
    }
    
    func testHexStringInitializer_with6DigitHex() {
        let color = UIColor(hexString: "#FF00AA")
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        XCTAssertEqual(red, 1.0, accuracy: 0.01)
        XCTAssertEqual(green, 0.0, accuracy: 0.01)
        XCTAssertEqual(blue, 0.6667, accuracy: 0.01)
        XCTAssertEqual(alpha, 1.0, accuracy: 0.01)
    }
    
    func testHexStringInitializer_with8DigitHex() {
        let color = UIColor(hexString: "#CCFF00AA")
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        XCTAssertEqual(alpha, 0.8, accuracy: 0.01)
        XCTAssertEqual(red, 1.0, accuracy: 0.01)
        XCTAssertEqual(green, 0.0, accuracy: 0.01)
        XCTAssertEqual(blue, 0.6667, accuracy: 0.01)
    }
    
    func testRandomColor_returnsColorWithinRange() {
        let color = UIColor.random
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        XCTAssertTrue(red >= 0 && red <= 1)
        XCTAssertTrue(green >= 0 && green <= 1)
        XCTAssertTrue(blue >= 0 && blue <= 1)
        XCTAssertEqual(alpha, 1.0, accuracy: 0.01)
    }
    
}
