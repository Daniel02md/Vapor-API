//
//  File.swift
//  
//
//  Created by Marcos Bezerra on 02/09/24.
//

import Foundation
import Fluent

final class CreateTbTutor: AsyncMigration{
    func prepare(on database: any FluentKit.Database) async throws {
        try await database.schema("tutor")
            .field("cd_tutor", .int, .identifier(auto: false))
            .field("nome", .string, .required)
            .field("dt_nasc", .date, .required)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) async throws {
        try await database.schema("tutor").delete()
    }
}
