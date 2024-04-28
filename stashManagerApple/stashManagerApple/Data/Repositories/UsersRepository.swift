//
//  UserRepository.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class UsersRepository {
    let datasource: UsersDatasourceProtocol

    init(datasource: UsersDatasourceProtocol) {
        self.datasource = datasource
    }
}

extension UsersRepository: UsersRepositoryProtocol {
    func getUser(at authIDUser: UUID) async throws -> User {
        let userDTO = try await datasource.getUser(at: authIDUser)
        return userDTO.toDomain()
    }
}

fileprivate extension UserDTO {
    func toDomain() -> User {
        User(id: self.id, name: self.name, lastname: self.lastname, image: self.image, email: self.email, articles: self.articles.map { $0.toDomain()})
    }
}

fileprivate extension ArticleDTO {
    func toDomain() -> Article {
        Article(id: self.id, name: self.name, image: self.image, description: self.description, color: self.color, expirationDate: self.expirationDate, isAlcoholic: self.isAlcoholic, mililitres: self.mililitres, weight: self.weight, brand: self.brand, isSpice: self.isSpice, isSpicy: self.isSpicy, material: self.material, idTypeArticle: self.idTypeArticle, idUser: self.idUser, typeArticle: self.typeArticle.toDomain())
    }
}

fileprivate extension TypeArticleDTO {
    func toDomain() -> TypeArticle {
        TypeArticle(name: self.name)
    }
}
