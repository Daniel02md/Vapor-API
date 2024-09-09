//
//  File.swift
//  
//
//  Created by Marcos Bezerra on 05/09/24.
//

import Foundation
import Fluent
import Vapor

protocol InterOperableDTO{
    associatedtype ModelType where ModelType:  Model, ModelType: InterOperableClass
    func toModel() -> ModelType
}

protocol InterOperableClass {
    associatedtype DTOType where DTOType: Content, DTOType: InterOperableDTO
    func toDTO() -> DTOType
}
