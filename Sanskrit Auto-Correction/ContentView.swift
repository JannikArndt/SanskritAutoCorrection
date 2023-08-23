//
//  ContentView.swift
//  Sanskrit Auto-Correction
//
//  Created by Jannik Arndt on 23.08.23.
//

import SwiftUI

struct ContentView: View {
    let textChecker = UITextChecker()

    @State var text: String = ""

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Installed Keyboards:")

            ForEach(supportedKeyboards()) { supportedKeyboard in
                Text("- \(supportedKeyboard.keyboard) \(supportedKeyboard.supported ? "" : "(not supported)")")
            }

            TextField("Input", text: $text)
        }
        .padding()
    }

    func supportedKeyboards() -> [SupportedKeyboard] {
        let installedKeyboards = UserDefaults.standard.object(forKey: "AppleKeyboards") as? [String] ?? []
        let keyboards = installedKeyboards.map(\.localizedLowercase).compactMap { $0.components(separatedBy: "@").first }
        let checkerLanguages = Set(UITextChecker.availableLanguages.map(\.localizedLowercase))

        return keyboards.map { keyboard in
            let supported = checkerLanguages.contains(keyboard)
            return SupportedKeyboard(keyboard: keyboard, supported: supported)
        }
    }
}

struct SupportedKeyboard: Identifiable {
    let keyboard: String
    let supported: Bool
    let id: UUID = .init()
}
