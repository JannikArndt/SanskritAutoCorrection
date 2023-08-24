//
//  Hint.swift
//  Sanskrit Auto-Correction
//
//  Created by Jannik Arndt on 24.08.23.
//

import SwiftUI

struct Hint<Content: View>: View {
    let content: () -> Content

    @State private var noteIsExpanded: Bool = true

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        DisclosureGroup(
            isExpanded: self.$noteIsExpanded,
            content: {
                VStack(alignment: .leading, spacing: 5) {
                    Group {
                        self.content()
                    }.font(.caption)

                    Button {
                        withAnimation {
                            self.noteIsExpanded = false
                        }
                    } label: { Text("Hide").padding(5).font(.subheadline) }.buttonStyle(.automatic)
                }
            },
            label: {
                Text("How it works")
            }
        )
        .onChange(of: self.noteIsExpanded) { newValue in
            UserDefaults.standard.set(newValue, forKey: "noteIsExpanded")
            UserDefaults.standard.synchronize()
        }
        .onAppear {
            self.noteIsExpanded = UserDefaults.standard.bool(forKey: "noteIsExpanded")
        }
    }
}

struct BulletPointModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 10) {
            Text("\u{2022}") // Unicode bullet character
                .foregroundColor(.accentColor)
            content
        }
    }
}

extension View {
    func bulleted() -> some View {
        self.modifier(BulletPointModifier())
    }
}
