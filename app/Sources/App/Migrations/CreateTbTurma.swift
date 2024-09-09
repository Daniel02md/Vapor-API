//
//  File.swift
//  
//
//  Created by Marcos Bezerra on 02/09/24.
//

import Foundation
import Fluent

final class CreateTbTurma: AsyncMigration{
    func prepare(on database: any FluentKit.Database) async throws {
        try await database.schema("turma")
            .field("cd_turma", .int, .identifier(auto: false))
            .field("cd_tutor", .int, .required, .references("tutor", "cd_tutor"))
            .field("nome", .string, .required)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) async throws {
        try await database.schema("turma").delete()
    }
}
