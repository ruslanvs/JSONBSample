import Fluent
import Vapor

struct Details: Content {
    var itemA: String
    var itemB: String
}

final class Todo: Model, Content {
    static let schema = "todos"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "details")
    var details: Details

    init() { }

    init(id: UUID? = nil, details: Details) {
        self.id = id
        self.details = details
    }
}
