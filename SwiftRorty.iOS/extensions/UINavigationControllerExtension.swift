//
//  UINavigationControllerExtension.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 1.03.2022.
//

import Foundation
import SwiftUI

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        let standard = UINavigationBarAppearance()
        standard.backgroundColor = UIColor(Color.Primary) //When you scroll or you have title (small one)
        
        let compact = UINavigationBarAppearance()
        compact.backgroundColor = UIColor(Color.Primary) //compact-height
        
        let scrollEdge = UINavigationBarAppearance()
        scrollEdge.backgroundColor = UIColor(Color.Primary) //When you have large title
        
        navigationBar.standardAppearance = standard
        navigationBar.compactAppearance = compact
        navigationBar.scrollEdgeAppearance = scrollEdge
        
        UINavigationBar.appearance().tintColor = UIColor(Color.Text)
        
        //UIView.appearance().backgroundColor = UIColor.red
    }
}
