//
//  Tutor.swift
//
//
//  Created by Marcos Bezerra on 03/09/24.
//

import Foundation
import Fluent
import Vapor

final class Tutor: Model, @unchecked Sendable{
    static let schema: String = "tutor"
    
    @ID(custom: "cd_tutor")
    var id: Int?
    
    @Field(key: "nome")
    var nome: String
    
    @Field(key: "dt_nasc")
    var dataNascimento: Date
    
    init(id: Int? = nil, nome: String, dataNascimento: Date) {
        self.id = id
        self.nome = nome
        self.dataNascimento = dataNascimento
    }
    
    init() {
    }
}


extension Tutor: InterOperableClass{
    func toDTO() -> TutorDTO {
        return TutorDTO(id: self.id!, nome: self.nome, dataNascimento: self.dataNascimento.description)
    }
    
}
