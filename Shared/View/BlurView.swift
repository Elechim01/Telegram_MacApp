//
//  BlurView.swift
//  Telegram_MacApp
//
//  Created by Michele Manniello on 22/02/21.
//

import SwiftUI

struct BlurView: NSViewRepresentable {
    
    func makeNSView(context: Context) ->  NSVisualEffectView {
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        return view
    }
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        
    }
}

