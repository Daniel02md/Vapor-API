//
//  File.swift
//  
//
//  Created by Marcos Bezerra on 30/08/24.
//

import Foundation
import Fluent

final class CreateTbAluno: AsyncMigration{
    func prepare(on database: any FluentKit.Database) async throws {
        try await database.schema("aluno")
            .field("nr_matricula", .int, .identifier(auto: false))
            .field("nome", .string, .required)
            .field("dt_nasc", .date, .required)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) async throws {
        try await database.schema("aluno").delete()
    }
}
