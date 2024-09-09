//
//  File.swift
//  
//
//  Created by Marcos Bezerra on 05/09/24.
//

import Foundation
import Fluent
import Vapor

struct TurmaDTO{
    let id: Int
    let nome: String
    let tutor: TutorDTO
}


extension TurmaDTO: InterOperableDTO, Content{
    func toModel() -> Turma {
        return Turma(id: self.id, tutorID: self.tutor.id, nome: self.nome)
    }
}
