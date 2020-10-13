import SwiftUI

public struct Table: ListView {
    public var content: TableContent
    public var axis: Axis.Set = .vertical
    public var showsIndicators = true

    public var body: some View {
        AnyTable(self, content)
            .tableStyle(DefaultTableStyle())
    }
}

public extension Table {
//    init<V: View>(@ViewBuilder content: @escaping () -> V) {
//        self.content = TableContent(elements, content: content)
//    }
}

public extension Table {
    init<E: Hashable, V: View>(_ elements: [E],
                               @ViewBuilder content: @escaping (E) -> V) {
        self.content = TableContent(elements, content: content)
    }

    enum SeparatorStyle: View {
        case none, plain, dashed
        public var body: some View {
            if self == .plain {
                Divider()
            } else if self == .dashed {
                Separator(lineWidth: 0.75, dash: [2])
            } else {
                EmptyView()
            }
        }
    }
}
