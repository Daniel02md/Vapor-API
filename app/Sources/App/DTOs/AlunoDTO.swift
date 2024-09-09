//
//  File.swift
//  
//
//  Created by Marcos Bezerra on 04/09/24.
//
import Vapor


struct AlunoDTO{
    let nome: String
    let matricula: Int
    let nascimento: String
}


extension AlunoDTO: InterOperableDTO, Content{
    func toModel() -> Aluno {
        return .init(id: self.matricula, nome: self.nome, dataNascimento: Date())
    }
}
