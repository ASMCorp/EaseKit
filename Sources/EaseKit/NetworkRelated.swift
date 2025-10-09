//
//  NetworkRelated.swift
//  EaseKit
//
//  Created by ASM Anik on 10/10/25.
//

import Foundation

extension URL {
    /// Initializes a `URL` for a local resource within a bundle.
    ///
    /// Automatically resolves the correct bundle:
    /// - In an **app target**, it uses `Bundle.main`.
    /// - In a **Swift Package**, it uses `Bundle.module`.
    ///
    /// - Parameters:
    ///   - localResourceName: The name of the local resource (without file extension).
    ///   - extensionName: The file extension (for example, `"json"` or `"txt"`). Default is `nil`.
    ///   - bundle: (Optional) A custom bundle to search in. Defaults to the appropriate bundle based on context.
    ///
    /// - Returns: A valid `URL` if the resource exists in the bundle, otherwise `nil`.
    ///
    /// ### Example
    /// ```swift
    /// if let url = URL(localResourceName: "Data", extensionName: "json") {
    ///     print("Found resource at \(url)")
    /// }
    /// ```
    public init?(
        localResourceName: String,
        extensionName: String? = nil
    ) {
        let bundle: Bundle
        #if SWIFT_PACKAGE
            bundle = Bundle.module
        #else
            bundle = Bundle.main
        #endif
        
        guard let url = bundle.url(forResource: localResourceName, withExtension: extensionName) else {
            return nil
        }
        self = url
    }
}
