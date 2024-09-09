import Foundation
import Fluent
import Vapor

final class Turma: Model, @unchecked Sendable{
    static let schema: String = "turma"
    
    init(){
    }
    init(id: Int? = nil, tutorID: Int, nome: String) {
        self.id = id
        self.$tutor.$id.value = tutorID
        self.nome = nome
    }
    
    @ID(custom: "cd_turma")
    var id: Int?
    
    @Parent(key: "cd_tutor")
    var tutor: Tutor
    
    @Field(key: "nome")
    var nome: String
    
}


extension Turma: InterOperableClass{
    func toDTO() -> TurmaDTO {
        return .init(id: self.id!, nome: self.nome, tutor: self.tutor.toDTO())
    }
}
