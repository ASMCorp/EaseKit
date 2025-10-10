//
//  NetworkRelated.swift
//  EaseKit
//
//  Created by ASM Anik on 10/10/25.
//

import Foundation

public extension URL {
    /// Creates a `URL` pointing to a resource file in the specified bundle.
    ///
    /// This initializer searches the provided `Bundle` for a file resource matching the given
    /// name and optional file extension. If the resource exists, it returns a valid `URL`
    /// pointing to it. Otherwise, it returns `nil`.
    ///
    /// - Parameters:
    ///   - localResourceName: The name of the resource file without its file extension.
    ///   - extensionName: The file extension of the resource (for example, `"json"`, `"txt"`).
    ///                    Defaults to `nil` if the resource has no extension or the extension
    ///                    is not required.
    ///   - bundle: The `Bundle` in which to search for the resource. Defaults to `Bundle.main`.
    ///
    /// - Returns: A `URL` pointing to the resource if found, otherwise `nil`.
    ///
    /// - Important:
    ///   - Ensure the resource is included in the target’s **Copy Bundle Resources** phase
    ///     for the specified bundle.
    ///   - This initializer is failable and will return `nil` if the file does not exist.
    ///
    /// ### Example Usage:
    /// ```swift
    /// if let url = URL(localResourceName: "Data", extensionName: "json") {
    ///     print("Resource found at \(url)")
    /// } else {
    ///     print("Resource not found")
    /// }
    /// ```
    ///
    /// - Note: In Swift Packages, if the resource is part of the package, you should provide
    ///         `Bundle.module` as the `bundle` parameter instead of the default `Bundle.main`.
    init?(
        localResourceName: String,
        extensionName: String? = nil,
        bundle: Bundle = Bundle.main
    ) {
        guard let url = bundle.url(forResource: localResourceName, withExtension: extensionName) else {
            return nil
        }
        self = url
    }
}
