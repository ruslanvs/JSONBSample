import Fluent

struct CreateTodo: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("todos")
            .id()
            .field("details", .custom("JSONB"), .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("todos").delete()
    }
}
