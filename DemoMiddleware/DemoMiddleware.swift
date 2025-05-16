//
//  DemoMiddleware.swift
//  DemoMiddleware
//
//  Created by Greg Neagle on 5/14/25.

import Foundation

class DemoMiddleware: MunkiMiddleware {
    func processRequest(_ request: MunkiMiddlewareRequest) -> MunkiMiddlewareRequest {
        print("*********************************************************")
        print(request.url)
        if !request.headers.isEmpty {
            print(request.headers)
        }
        print("*********************************************************")
        return request
    }
}

// MARK: dylib "interface"

final class DemoMiddlewareBuilder: MiddlewarePluginBuilder {
    override func create() -> MunkiMiddleware {
        return DemoMiddleware()
    }
}

/// Function with C calling style for our dylib.
/// We use it to instantiate the MunkiMiddleware object and return an instance
@_cdecl("createPlugin")
public func createPlugin() -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained(DemoMiddlewareBuilder()).toOpaque()
}
