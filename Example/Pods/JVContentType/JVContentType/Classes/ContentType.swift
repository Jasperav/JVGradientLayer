// TODO: create separete .swift files for every different protocol/class/extension

/// Only final classes can adopt this protocol
public protocol ContentType: Hashable {
    //  associatedtype T: Hashable
    /// All reusable content types should be in here with a non-nil id.
    static var allTypes: Set<Self> { get set }
    /// Querying a reusable content type
    static func getContentType(contentTypeId: String) -> Self
    
    /// For base/reusable contenttypes, the id is filled. Those content types should be in allTypes with a non-nil id.
    /// The implementing class should conform to Hashable and return the hashValue of contentTypeId
    var contentTypeId: String? { get set }
    
    func addToAllTypes()
}

public extension ContentType {
    func addToAllTypes() {
        assert(!Self.allTypes.contains(self))
        
        Self.allTypes.insert(self)
    }
    
    static func getContentType(contentTypeId: String) -> Self {
        return Self.allTypes.first(where: { $0.contentTypeId == contentTypeId })!
    }
    
    var hashValue: Int {
        get {
            return contentTypeId!.hashValue
        }
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
