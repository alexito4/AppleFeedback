//
//  ContentView.swift
//  wwdc21
//
//  Created by Alejandro Martinez on 8/6/21.
//

import SwiftUI

@available(iOS 15.0, *)
struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Go") {
                    DetailView()
                }
            }
        }
    }
}

@available(iOS 15.0, *)
struct DetailView: View {
    @State var list = Array(1...10)
    var body: some View {
        List(list, id: \.self) { n in
            Text("-> \(n)")
        }
        .refreshable {
            await longOperation("refresh")
        }
        .task {
            await longOperation("task")
        }
    }
    
    func longOperation(_ s: String) async {
        for i in 0...5 {
            await takesALotOfTime()
            guard !Task.isCancelled else { return }
            print("\(s) -> \(i)")
        }
        list.append(42)
    }
}

@available(iOS 15.0, *)
func takesALotOfTime() async {
    await withUnsafeContinuation { continuation in
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            continuation.resume()
        }
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UInt64 {
    static func seconds(_ seconds: Double) -> Self {
        UInt64(seconds * 1000000000)
    }
}
