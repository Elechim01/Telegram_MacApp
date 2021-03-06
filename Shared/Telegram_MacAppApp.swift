//
//  Telegram_MacAppApp.swift
//  Shared
//
//  Created by Michele Manniello on 22/02/21.
//

import SwiftUI

@main
struct Telegram_MacAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
//        Hiding Title
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}
//Hidding Textfield FOcus Ring....
extension NSTextField{
    open override var focusRingType: NSFocusRingType{
        get{.none}
        set{}
    }
}
