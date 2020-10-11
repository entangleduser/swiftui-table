import SwiftUI

public struct Table<Element: Hashable>: ListView {
    public var elements: [Element]
    public var content: TableContent
    public var axis: Axis.Set = .vertical
    public var showsIndicators = true

    public var body: some View {
        AnyTable(self, content)
            .tableStyle(DefaultTableStyle())
    }
}

public extension Table where Element == Never {
//    init<V: View>(@ViewBuilder content: @escaping () -> V) {
//        self.content = TableContent(elements, content: content)
//    }
}

public extension Table where Element: Hashable {
    init<V: View>(_ elements: [Element],
         @ViewBuilder content: @escaping (Element) -> V) {
        self.elements = elements
        self.content = TableContent(elements, content: content)
    }
}
