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

      Text("Hello, mars!")

      Text("Hello, venus!")
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ExampleView()
  }
}
