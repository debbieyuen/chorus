//
//  HomeARViewRepresentable.swift
//  chorus
//
//  Created by Debbie Yuen on 3/29/25.
//

import SwiftUI

struct HomeARViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> HomeARView {
        return HomeARView()
    }
    
    func updateUIView(_ uiView: HomeARView, context: Context) {}
}
