//
//  BaseError.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 25.02.2022.
//

import Foundation

enum BaseError : Error {
    case parse(description: String)
    case api(description: String)
}
