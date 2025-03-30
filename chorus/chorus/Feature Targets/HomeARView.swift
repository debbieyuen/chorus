//
//  HomeARView.swift
//  chorus
//
//  Created by Debbie Yuen on 3/29/25.
//

import ARKit
import RealityKit
import SwiftUI

class HomeARView: ARView {
    // Call our ARView initializer
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    
    // Initializer
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implmented")
    }
    
    // ARView will fill out the entire screen
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
    }

}
