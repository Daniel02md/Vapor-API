//
//  File.swift
//  
//
//  Created by Marcos Bezerra on 04/09/24.
//

import Vapor
import Fluent

final class TurmaController: RouteCollection{
    func boot(routes: any Vapor.RoutesBuilder) throws {
        let turma = routes.grouped("turma")
        turma.get(use: list)
        turma.post(use: create)
        turma.delete(use: delete)
    }
    
    @Sendable
    func list(req: Request) async throws -> [TurmaDTO]{
        let turmas = try? await Turma.query(on: req.db)
            .join(Tutor.self, on: \Turma.$tutor.$id == \Tutor.$id)
            .all()
        let result = turmas?.map({
            turma in
            turma.toDTO()
        })
        return result ?? []
    }
    
    @Sendable
    func create(req: Request) async throws -> Bool{
        guard let nome: String = req.query["nome"],
              let id: Int = req.query["id_turma"],
              let idTutor: Int = req.query["id_tutor"] else { return false}
        var turma = Turma(id: id, tutorID: idTutor, nome: nome)
        try await turma.create(on: req.db)
        return true
    }
    
    @Sendable
    func delete(req: Request) async throws -> Bool{
        guard let id: String = req.query["id"],
              let id = Int(id),
              let turma = try? await Turma.find(id, on: req.db) else { return false }
        try await turma.delete(on: req.db)
        return true
    }
}

