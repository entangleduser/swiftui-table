import SwiftUI

public struct Table: ListView {
  public var content: TableContent
  @State public var axis: Axis.Set = .vertical
  @State public var showsIndicators = true

  public var body: some View {
    AnyTable(
      self, content
    )
  }
}

public extension Table {
  init<E: Hashable, V: View>(
    _ elements: [E],
    @ViewBuilder content: @escaping (E) -> V) {
    self.content = TableContent(data: elements, content: content)
  }

  enum SeparatorStyle: View {
    case none,
         plain(UIColor? = nil),
         dashed(UIColor? = nil)
    public var body: some View {
      switch self {
      case let .plain(color):
        Divider()
          .background(Color(color ?? .separator))
      case let .dashed(color):
        Separator(
          color: color,
          lineWidth: 0.75, dash: [2]
        )
      default: EmptyView()
      }
    }
  }
}

public extension Table {
  init(
    @TableBuilder content: @escaping () -> TableContent.Wrapper
  ) {
    let wrapper = content()
    self.content = TableContent(data: wrapper.data, wrapper)
  }
}

@_functionBuilder
public enum TableBuilder {
  public static func buildBlock<V>(_ views: V...) -> TableContent.Wrapper
    where V: View {
    ForEach(Array(0 ..< views.count), id: \.self) { element in
      guard let value = element as? Int else {
        return TableRow()
      }
      return TableRow(views[value])
    }
  }
}
