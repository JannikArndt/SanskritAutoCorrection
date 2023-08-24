//
//  SanskritTerm.swift
//  Sanskrit Auto-Correction
//
//  Created by Jannik Arndt on 24.08.23.
//

import Foundation

protocol SanskritTerm: Identifiable {
    var simpleName: String { get }
    var simpleNamePlural: String? { get }
    var nameWithDiacritics: String { get }
    var nameWithDiacriticsPlural: String? { get }
    var english: String { get }
    var id: UUID { get }
}

struct SimpleTerm: SanskritTerm {
    let simpleName: String // sanskrit
    let simpleNamePlural: String?

    let nameWithDiacritics: String // sanskrit
    let nameWithDiacriticsPlural: String?

    let english: String // translation
    let id: UUID = .init()

    init(simpleName: String, nameWithDiacritics: String, english: String) {
        self.simpleName = simpleName
        self.simpleNamePlural = .none
        self.nameWithDiacritics = nameWithDiacritics
        self.nameWithDiacriticsPlural = .none
        self.english = english
    }

    init(simpleName: String, simpleNamePlural: String, nameWithDiacritics: String, nameWithDiacriticsPlural: String, english: String) {
        self.simpleName = simpleName
        self.simpleNamePlural = simpleNamePlural
        self.nameWithDiacritics = nameWithDiacritics
        self.nameWithDiacriticsPlural = nameWithDiacriticsPlural
        self.english = english
    }
}

struct Asana: SanskritTerm {
    let simpleName: String
    let simpleNamePlural: String? = .none
    let nameWithDiacritics: String
    let nameWithDiacriticsPlural: String? = .none
    let english: String
    let type: String // Standing, Prone, Supine, etc.
    let description: String // One-sentence description
    let id: UUID = .init()

    init(simpleName: String,
         nameWithDiacritics: String,
         english: String,
         type: String,
         description: String)
    {
        self.simpleName = simpleName
        self.nameWithDiacritics = nameWithDiacritics
        self.english = english
        self.type = type
        self.description = description
    }
}

struct Pranayama: SanskritTerm {
    let simpleName: String // sanskrit
    let simpleNamePlural: String? = .none
    let nameWithDiacritics: String // sanskrit
    let nameWithDiacriticsPlural: String? = .none
    let english: String // translation
    let englishLiteral: String // translation

    let how: String?
    let effects: String?

    let id: UUID = .init()
}
