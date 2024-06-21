//
//  ContentView.swift
//  WebPage
//
//  Created by Flavio Nunes on 09/06/24.
//  Copyright © 2024 Flavio Nunes. All rights reserved.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    @State private var selectedSegment = 0
    @State private var websites = ["www.flavionunesprojects.net", "www.ecode10.academy"]
    
    var body: some View {
        
        NavigationView{
            VStack{
                HStack{
                    Picker(selection: $selectedSegment, label: Text("Selecione aqui")){
                        ForEach(0 ..< websites.count){
                            Text(self.websites[$0]).tag($0)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                WebView(request: URLRequest(url: URL(string: "https://\(websites[selectedSegment])")!))
                
            }.navigationBarTitle(Text("WebPages"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//webview
struct WebView: UIViewRepresentable {
    
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
        
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
}
