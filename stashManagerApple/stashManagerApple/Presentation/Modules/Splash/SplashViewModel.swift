//
//  SplashViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 28/4/24.
//

import Foundation

class SplashViewModel: SplashViewModelProtocol {
    var router: SplashRouterProtocol
    var uuidUser: UUID
    var userUseCase: UsersUseCaseProtocol
    var roomsUseCase: RoomsUseCaseProtocol
    var stashesUseCase: StashesUseCaseProtocol
    var articlesUseCase: ArticlesUseCaseProtocol
    var linksUseCase: LinkUseCaseProtocol
    var finishLoad : (() -> Void)?

    init(router: SplashRouterProtocol, uuid: UUID, userUseCase: UsersUseCaseProtocol, roomsUseCase: RoomsUseCaseProtocol, stashesUseCase: StashesUseCaseProtocol, articlesUseCase: ArticlesUseCaseProtocol, linksUseCase: LinkUseCaseProtocol) {
        self.router = router
        self.uuidUser = uuid
        self.userUseCase = userUseCase
        self.roomsUseCase = roomsUseCase
        self.stashesUseCase = stashesUseCase
        self.articlesUseCase = articlesUseCase
        self.linksUseCase = linksUseCase
    }

    // MARK: - Functions
    func chargeData() {
        Task {
            do {
                guard let user = try await userUseCase.getUser(at: uuidUser).first else { return }
                let roomsUser = try await roomsUseCase.getRooms(at: user.id)
                let stashes = try await stashesUseCase.getStashes()
                let articlesUser = try await articlesUseCase.getArticles(at: user.id)
                let roomsIDs = roomsUser.map { $0.id }
                let rooms = try await linksUseCase.getContentRooms(with: roomsIDs, of: roomsUser, of: stashes, at: articlesUser)
                try userUseCase.setCurrentUser(user)
                try linksUseCase.setContentRooms(rooms)
                finishLoad?()
                router.goToTabBar(with: rooms)
            } catch {
                print(error)
            }
        }
    }
}
