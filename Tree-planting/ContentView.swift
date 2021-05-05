//
//  ContentView.swift
//  Tree-planting
//
//  Created by Ahmed Alharbi on 22/09/1442 AH.
//

import SwiftUI
import GoogleMaps

struct ContentView: View {
  @ObservedObject  var myLocation = LocationManager()
    var body: some View {
        
        VStack {
            GoogleMapsView()
                .edgesIgnoringSafeArea(.all)
            
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
