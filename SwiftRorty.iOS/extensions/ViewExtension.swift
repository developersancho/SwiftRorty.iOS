//
//  ViewExtension.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 11.03.2022.
//

import Foundation
import SwiftUI

extension View {
  @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
    switch shouldHide {
      case true: self.hidden()
      case false: self
    }
  }
}
