import Foundation
import Fluent


final class ParticipaTurma: Model, @unchecked Sendable{
    static let schema: String = "turma"
    
    @ID(custom: "cd_participa_turma")
    var id: Int?
    
    @Parent(key: "turma_cd_turma")
    var turma: Turma
    
    @Parent(key: "aluno_nr_aluno")
    var aluno: Aluno
}
