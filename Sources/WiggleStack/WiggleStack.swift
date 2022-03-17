//
//  WiggleStack.swift
//  WiggleStack
//
//  Created by Chris Davis on 17/03/2022.
//

import SwiftUI

extension View {

  public func wiggleable() -> Wiggler {
    return Wiggler(id: UUID(), view: AnyView(self), offset: .zero, rotation: .zero)
  }

}

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
  public let rotation: Angle
}

@resultBuilder
public struct ShapeContentBuilder {

  static func buildBlock(_ components: Wiggler...) -> [Wiggler] {
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

struct WiggleStack {

  private let innerContent: [Wiggler]
  private var items: [Wiggler] = []

  init(@ShapeContentBuilder innerContent: @escaping () -> [Wiggler]) {
    self.innerContent = innerContent()
    var offset: CGSize = .zero
    for item in self.innerContent   {

      let angle = Angle.degrees(Double((0..<15).randomElement()!))
      items.append(Wiggler(id: item.id, view: item.view, offset: offset, rotation: angle))
      //items.append(Wiggler(id: UUID(), view: AnyView(item), offset: offset, rotation: angle))
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
          .rotationEffect(item.rotation)
      }
    }
  }

}
