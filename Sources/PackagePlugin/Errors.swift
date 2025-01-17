/*
 This source file is part of the Swift.org open source project

 Copyright (c) 2021-2022 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
 */

public enum PluginContextError: Error {
    /// Could not find a tool with the given name. This could be either because
    /// it doesn't exist, or because the plugin doesn't have a dependency on it.
    case toolNotFound(name: String)

    /// Could not find a target with the given name.
    case targetNotFound(name: String, package: Package)

    /// Could not find a product with the given name.
    case productNotFound(name: String, package: Package)
}

extension PluginContextError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .toolNotFound(let name):
            return "Plugin does not have access to a tool named ‘\(name)’"
        case .targetNotFound(let name, let package):
            return "Package ‘\(package.displayName)’ has no target named ‘\(name)’"
        case .productNotFound(let name, let package):
            return "Package ‘\(package.displayName)’ has no product named ‘\(name)’"
        }
    }
}

public enum PluginDeserializationError: Error {
    /// The input JSON is malformed in some way; the message provides more details.
    case malformedInputJSON(_ message: String)
}

extension PluginDeserializationError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .malformedInputJSON(let message):
            return "Malformed input JSON: \(message)"
        }
    }
}
