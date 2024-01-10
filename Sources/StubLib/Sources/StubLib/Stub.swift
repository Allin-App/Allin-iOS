//
//  Stub.swift
//  
//
//  Created by Emre on 01/01/2024.
//

import Foundation
import Model

struct Stub {
    
    static var shared = Stub()
    public var bets: [Bet] = []
    public var users: [User] = []
    
    public init() {
        loadBets()
    }
    
    public mutating func loadBets() {
        
        var user1 = User(username: "Lucas", email: "lucas.delanier@etu.uca.fr", nbCoins: 100, friends: [])
        users.append(user1)
        
        var user2 = User(username: "Imri", email: "emre.kartal@etu.uca.fr", nbCoins: 75, friends: [user1])
        users.append(user2)
        user1.addFriend(user: user2)
        
        let user3 = User(username: "Arthur", email: "arthur.valin@etu.uca.fr", nbCoins: 30, friends: [user2])
        users.append(user3)
        user2.addFriend(user: user3)

        let bet1 = BinaryBet(
            theme: "Football - Finale de la Ligue des Champions",
            phrase: "Le gagnant de la finale sera l'équipe avec le plus de tirs au but.",
            endRegisterDate: Date().addingTimeInterval(86400),
            endBetDate: Date().addingTimeInterval(172800),
            totalStakes: 100,
            isPublic: true,
            invited: [],
            author: user1,
            registered: [user2]
        )
        self.bets.append(bet1)
        
        let bet2 = BinaryBet(
            theme: "Cuisine - Concours de cuisine en direct",
            phrase: "Le plat préféré du jury sera une recette végétarienne.",
            endRegisterDate: Date().addingTimeInterval(172800),
            endBetDate: Date().addingTimeInterval(259200),
            totalStakes: 150,
            isPublic: false,
            invited: [user3],
            author: user1,
            registered: [user2]
        )
        self.bets.append(bet2)
        
        let bet3 = BinaryBet(
            theme: "Technologie - Lancement d'un nouveau smartphone",
            phrase: "Le nombre total de précommandes dépassera-t-il 1 million dans la première semaine ?",
            endRegisterDate: Date().addingTimeInterval(259200),
            endBetDate: Date().addingTimeInterval(345600),
            totalStakes: 75,
            isPublic: true,
            invited: [],
            author: user1,
            registered: [user2, user1, user3]
        )
        self.bets.append(bet3)
        
        let bet4 = BinaryBet(
            theme: "Cinéma - Oscars 2024",
            phrase: "Le film favori des critiques remportera-t-il le prix du meilleur film ?",
            endRegisterDate: Date().addingTimeInterval(345600),
            endBetDate: Date().addingTimeInterval(432000),
            totalStakes: 120,
            isPublic: false,
            invited: [user1],
            author: user2,
            registered: [user3]
        )
        self.bets.append(bet4)
        
    }
    
    public mutating func add(bet: Bet) {
        self.bets.append(bet)
    }
}