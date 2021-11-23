//
//  SecondView.swift
//  SwitfUINavDemo
//
//  Created by Diego on 22-11-21.
//

import SwiftUI

struct SecondView: View {
    @Binding var isPresentingView: Bool
    
    var param1: String
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Hello, World! \(param1)")
                .padding()
                .navigationBarTitle(Text("SecondView"))
                .toolbar {
                    if isPresentingView {
                        Button("Close") {
                            print("press")
                            isPresentingView.toggle()
                        }
                    }
                }
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    @State static var isPresentingView = true
    static var previews: some View {
        SecondView(isPresentingView: $isPresentingView, param1: "Demo")
    }
}
