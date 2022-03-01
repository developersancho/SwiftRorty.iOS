//
//  Endpoint.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 28.02.2022.
//

import Foundation

protocol Endpoint {
    var url: URL { get }
    var path: String { get }
}
