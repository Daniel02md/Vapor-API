//
//  File.swift
//  
//
//  Created by Marcos Bezerra on 03/09/24.
//

import Foundation
import Vapor

struct AlunoController: RouteCollection{
    func boot(routes: any Vapor.RoutesBuilder) throws {
        var alunos = routes.grouped("alunos")
        alunos.get(use: self.list)
        alunos.post(use: self.create)
        alunos.delete(use: delete)
    }
    
    @Sendable
    func list(req: Request) async throws -> [AlunoDTO]{
        let alunos = try? await Aluno.query(on: req.db).all()
        let result = alunos?.map({
            aluno in
            aluno.toDTO()
        })
        return result ?? []
        
    }
    
    @Sendable
    func create(req: Request) async throws -> Bool{
        guard let nome: String = req.query["nome"],
              let matriculaStr: Int = req.query["matricula"],
              let nascimentoStr: String = req.query["nascimento"] else { return false}
        var aluno = Aluno()
        aluno.nome = nome
        aluno.id = Int(matriculaStr)
        aluno.dataNascimento = Date()
        try await aluno.create(on: req.db)
        return true
    }
    
    @Sendable
    func delete(req: Request) async throws -> Bool{
        guard let id: String = req.query["id"],
              let id = Int(id) else { return false }
        guard let aluno = try? await Aluno.find(id, on: req.db) else { return false }
        try await aluno.delete(on: req.db)
        return true
    }
    
}
