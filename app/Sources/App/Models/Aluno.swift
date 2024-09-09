//
//  Aluno.swift
//
//
//  Created by Marcos Bezerra on 03/09/24.
//

import Foundation
import Fluent
import Vapor

final class Aluno: Model, @unchecked Sendable{
    static let schema: String = "aluno"
    
    init() {}
    
    init(id: Int? = nil, nome: String, dataNascimento: Date) {
        self.id = id
        self.nome = nome
        self.dataNascimento = dataNascimento
    }
    
    @ID(custom: "nr_matricula")
    var id: Int?
    
    @Field(key: "nome")
    var nome: String
    
    @Field(key: "dt_nasc")
    var dataNascimento: Date
    
}



extension Aluno: InterOperableClass{
    func toDTO() -> AlunoDTO {
        return .init(nome: self.nome, matricula: self.id!, nascimento: self.dataNascimento.description)
    }
}
