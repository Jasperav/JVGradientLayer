public extension Array where Element: ContentTypeGroup & Copyable {
    public func copy() -> [Element] {
        return map { $0.copy() }
    }
}
