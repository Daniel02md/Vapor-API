//
//  File.swift
//  
//
//  Created by Marcos Bezerra on 03/09/24.
//

import Foundation
import Fluent

final class CreateTbParticipaTurma: AsyncMigration{
    func prepare(on database: any FluentKit.Database) async throws {
        try await database.schema("participa_turma")
            .field("cd_participa_turma", .int, .identifier(auto: false))
            .field("turma_cd_turma", .int, .required, .references("turma", "cd_turma"))
            .field("aluno_nr_matricula", .int, .required, .references("aluno", "nr_matricula"))
            .create()
    }
    
    func revert(on database: any FluentKit.Database) async throws {
        try await database.schema("participa_turma").delete()
    }
}
