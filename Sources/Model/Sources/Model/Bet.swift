//
//  Bet.swift
//  
//
//  Created by Emre on 28/12/2023.
//

import Foundation

public protocol Bet {
	//public private(set) var id: String
	var theme: String { get set }
	var phrase:  String {  get set }
	var endRegisterDate: Date { get set }
	var endBetDate: Date { get set }
	var totalStakes: Int { get set }
	var isPublic: Bool { get set }
	var invited: [User] { get set }
	var author: User { get set }
	var registered: [User] { get set }
	
}
