//
//  File.swift
//  
//
//  Created by Marcos Bezerra on 04/09/24.
//

import Foundation
import Vapor

final class TutorController: RouteCollection{
    func boot(routes: any Vapor.RoutesBuilder) throws {
        let tutor = routes.grouped("tutor")
        tutor.get(use: list)
        tutor.post(use: create)
        tutor.delete(use: delete)
    }
    
    @Sendable
    func list(req: Request) async throws -> [TutorDTO]{
        let tutores = try? await Tutor.query(on: req.db).all()
        let result = tutores?.map({
            tutor in
            tutor.toDTO()
        })
        return result ?? []
    }
    
    @Sendable
    func create(req: Request) async throws -> HTTPStatus{
        guard let nome: String = req.query["nome"],
              let idStr: String = req.query["id"],
              let nascimentoStr: String = req.query["nascimento"] else { throw Abort(.notModified) }
        var tutor = Tutor()
        tutor.nome = nome
        tutor.id = Int(idStr)
        tutor.dataNascimento = Date()
        try await tutor.create(on: req.db)
        return .created
    }
    
    @Sendable
    func delete(req: Request) async throws -> HTTPStatus{
        guard let id: String = req.query["id"],
              let id = Int(id) else { throw Abort(.notModified) }
        guard let tutor = try? await Tutor.find(id, on: req.db) else { throw Abort(.notModified) }
        try await tutor.delete(on: req.db)
        return .ok
    }
}
