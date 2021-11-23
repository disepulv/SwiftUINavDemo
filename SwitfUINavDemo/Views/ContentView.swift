//
//  ContentView.swift
//  SwitfUINavDemo
//
//  Created by Diego on 22-11-21.
//

import SwiftUI

struct ContentView: View {
    @State var isPresentingView = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Navigation throught views with params")
                .padding()
                .navigationBarTitle(Text("Nav demo"))
                .toolbar {
                    Button("Info") {
                        print("pending...")
                    }
                }
                NavigationLink(destination: SecondView(isPresentingView: $isPresentingView, param1: "Pushed")) {
                    Text("Push to next view")
                }
                
                Button("Modal view") {
                    self.isPresentingView = true
                }
            }
        }
        .sheet(isPresented: $isPresentingView) {
            SecondView(isPresentingView: $isPresentingView, param1: "from modal")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
