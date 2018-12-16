public protocol ContentTypeGroup: ContentType {
    /// Querying reusable content types which are in the specified groep id
    static func getContentTypes(contentTypeGroupId: String) -> [Self]
    var contentTypeGroupId: [String]? { get }
}

public extension ContentTypeGroup {
    static func getContentTypes(contentTypeGroupId: String) -> [Self] {
        return Self.allTypes.filter { $0.contentTypeGroupId?.contains(contentTypeGroupId) ?? false }
    }
}
