import Fluent
import Foundation

struct TodoSeed: AsyncMigration {

    let todo = Todo(
        id: UUID("00000000-0000-0000-0000-000000000001"),
        details: Details(itemA: "A", itemB: "B")
    )

    func prepare(on database: Database) async throws {
        try await todo.create(on: database)
    }

    func revert(on database: Database) async throws {
        try await todo.delete(on: database)
    }
}
