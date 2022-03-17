//
//  WiggleStack.swift
//  WiggleStack
//
//  Created by Chris Davis on 17/03/2022.
//

import SwiftUI

public struct Wiggler: Identifiable, Hashable {

  public static func == (lhs: Wiggler, rhs: Wiggler) -> Bool {
    lhs.id == rhs.id
  }

  public func hash(into hasher: inout Hasher) {
    hasher.combine(self.id)
  }

  public let id: UUID
  public let view: AnyView
  public let offset: CGSize
}

@resultBuilder
public struct ShapeContentBuilder<V> where V: View {

  static func buildBlock(_ components: V...) -> [V] {
    return components
  }

  //  public static func buildBlock(_ components: V) -> V {
  //    components
  //  }
  //
  //  public static func buildEither(first component: V) -> V {
  //    component
  //  }
  //
  //  public static func buildEither(second component: AnyView) -> AnyView {
  //    component
  //  }

}

struct WiggleStack<V> where V: View {

  private let innerContent: () -> [V]
  private let other: [V]
  private var items: [Wiggler] = []

  init(@ShapeContentBuilder<V> innerContent: @escaping () -> [V]) {
    self.innerContent = innerContent
    self.other = innerContent()
    var offset: CGSize = .zero
    for item in self.other   {
      items.append(Wiggler(id: UUID(), view: AnyView(item), offset: offset))
      offset.width += 0
      offset.height += 20
    }
  }

}

extension WiggleStack: View {

  var body: some View {
    ZStack {
      ForEach(items, id: \.self) { item in
        item.view
          .offset(item.offset)
      }
    }
  }

}
