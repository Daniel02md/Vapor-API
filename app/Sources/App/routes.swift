import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    try app.register(collection: AlunoController())
    try app.register(collection: TutorController())
    try app.register(collection: TurmaController())
}
