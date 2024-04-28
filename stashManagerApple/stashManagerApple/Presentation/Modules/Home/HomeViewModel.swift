//
//  HomeViewModel.swift
//  StashManagerApple
//
//  Created by Adrian Prieto Villena on 24/4/24.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol {
    var typesRoomMockUp: [String]
    var roomsMockUp: [Room]

    init() {
        self.typesRoomMockUp = ["Armario",
                                "Cómoda",
                                "Gabinete",
                                "Estantería",
                                "Baúl",
                                "Mueble de cestas",
                                "Mueble con cajones",
                                "Armario con espejo",
                                "Zapatero",
                                "Mesa de centro",
                                "Vitrina",
                                "Mueble TV",
                                "Torre",
                                "Armario empotrado",
                                "Librero",
                                "Mesa consola",
                                "Caja",
                                "Carro cocina",
                                "Escritorio",
                                "Botiquín"]
        self.roomsMockUp = [ Room(name: "Comedor familia", imageBase64: nil), Room(name: "Habitación Adrian", imageBase64: nil ),Room(name: "Habitación Ruben", imageBase64: nil),Room(name: "Baño hijos", imageBase64: nil),Room(name: "Baño padres", imageBase64: nil),Room(name: "Cocina", imageBase64: nil), Room(name: "Entradita", imageBase64: nil)]
    }
}

struct Room {
    let name: String
    let imageBase64: String?
}
