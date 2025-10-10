//
//  NetworkRelatedTests.swift
//  EaseKit
//
//  Created by ASM Anik on 10/10/25.
//

import XCTest
@testable import EaseKit

@MainActor
final class NetworkRelatedTests: XCTestCase {
    /// Tests that a valid resource URL is returned when the file exists in the bundle.
    func testValidLocalResourceURL() {
        // Arrange
        let fileName = "Sample"        // Must exist in the test bundle
        let fileExtension = "json"
        
        // Act
        let url = URL(localResourceName: fileName, extensionName: fileExtension, bundle: .module)
        
        // Assert
        XCTAssertNotNil(url, "URL should not be nil for an existing resource.")
        XCTAssertTrue(url!.path.hasSuffix("\(fileName).\(fileExtension)"))
    }
    
    /// Tests that the initializer returns nil when the resource does not exist.
    func testMissingResourceReturnsNil() {
        // Act
        let url = URL(localResourceName: "NonExistentFile", extensionName: "json", bundle: .module)
        
        // Assert
        XCTAssertNil(url, "URL should be nil for a missing resource.")
    }
    
    /// Tests that the initializer works when no extension is provided.
    func testResourceWithoutExtension() {
        // Arrange
        let fileName = "Config"  // Add "Config" file with no extension to your bundle for this test
        
        // Act
        let url = URL(localResourceName: fileName, bundle: .module)
        
        // Assert
        XCTAssertNotNil(url, "URL should be valid when a resource without extension exists.")
    }
    
    /// Tests performance for repeated initialization calls.
    func testPerformanceExample() {
        measure {
            _ = URL(localResourceName: "Sample", extensionName: "txt")
        }
    }
}
