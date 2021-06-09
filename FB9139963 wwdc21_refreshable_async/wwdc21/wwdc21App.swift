//
//  wwdc21App.swift
//  wwdc21
//
//  Created by Alejandro Martinez on 8/6/21.
//

import SwiftUI

@main
struct wwdc21App: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 15.0, *) {
                ContentView()
            } else {
                
            }
        }
    }
}
