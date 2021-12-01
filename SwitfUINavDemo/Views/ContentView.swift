//
//  ContentView.swift
//  SwitfUINavDemo
//
//  Created by Diego on 22-11-21.
//

import SwiftUI

class NavObject: ObservableObject {
    @Published var isDisplayingChildren = false
}

struct ThirdView: View {
    @EnvironmentObject var navObj: NavObject
    
    var body: some View {
        VStack {
            Text("Some other view!")
            NavigationLink("Next", destination: ThirdView().environmentObject(navObj))
        }.toolbar(content: {
            ToolbarItemGroup {
                Button(action: { navObj.isDisplayingChildren.toggle() }, label: {
                    Text("Pop Back")
                })
            }
        })
    }
}


struct ContentView: View {
    @State var isPresentingView = false
    @StateObject private var navObject = NavObject()

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
                
                
                NavigationLink(
                    destination:
                        ThirdView().environmentObject(navObject)
                    ,
                    isActive: $navObject.isDisplayingChildren,
                    label: {
                        Text("Navigate")
                    }
                )
                
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
