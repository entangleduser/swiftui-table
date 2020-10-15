import SwiftUI

#if os(iOS)
public typealias NativeColor = UIColor
let defaultTableStyle = DefaultTableStyle()
let defaultButtonStyle = DefaultButtonStyle()
public let separatorColor: NativeColor = .separator
public let groupedBackgroundColor: NativeColor = .systemGroupedBackground
public let backgroundColor: NativeColor = .systemBackground
public let secondaryLabelColor: NativeColor = .secondaryLabel

#elseif os(macOS)
let defaultTableStyle = PlainTableStyle()
let defaultButtonStyle = BorderlessButtonStyle()
public typealias NativeColor = NSColor
public let separatorColor: NativeColor = .separatorColor
public let groupedBackgroundColor: NativeColor = .underPageBackgroundColor
public let backgroundColor: NativeColor = .windowBackgroundColor
let secondaryLabelColor: NativeColor = .secondaryLabelColor
#endif

public struct Table: ListView {
    public var content: TableContent
    public var axis: Axis.Set = .vertical
    public var showsIndicators = true

    public var body: some View {
        AnyTable(self, content)
            .tableStyle(defaultTableStyle)
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
            switch self {
            case .plain: Divider()
            case .dashed: Separator(lineWidth: 0.75, dash: [2])
            default: EmptyView()
            }
        }
    }
}
