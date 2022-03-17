//
//  ContentView.swift
//  WiggleStack
//
//  Created by Chris Davis on 17/03/2022.
//

import SwiftUI

struct ExampleView { }

extension ExampleView: View {

  var body: some View {

    WiggleStack {

      Text("Hello, world!")
        .padding()

      Text("Hello, mars!")
        .background(Color.green)

      Rectangle()
        .fill(Color.orange)
        .frame(width: 40, height: 40)
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ExampleView()
  }
}
