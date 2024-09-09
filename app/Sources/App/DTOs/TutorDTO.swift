//
//  File.swift
//  
//
//  Created by Marcos Bezerra on 05/09/24.
//

import Foundation
import Vapor


struct TutorDTO{
    let id: Int
    let nome: String
    let dataNascimento: String
}

extension TutorDTO: InterOperableDTO, Content{
    func toModel() -> Tutor{
        return Tutor(id: self.id, nome: self.nome, dataNascimento: Date())
    }
    
}
