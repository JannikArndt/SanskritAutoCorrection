//
//  ContentView.swift
//  Sanskrit Auto-Correction
//
//  Created by Jannik Arndt on 23.08.23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("UseDiacritics") var useDiacritics: Bool = false
    @State private var updateAll: UUID = .init()

    let allTerms: [(String, [any SanskritTerm])] = [
        ("General", yogaTerms),
        ("Asanas", asanas),
        ("Yoga Paths", yogaPathsTerms),
        ("Yoga Styles", yogaStylesTerms),
        ("Pranayamas", pranayamaList),
        ("Ashtanga", ashtangaTerms),
        ("Chakras", chakrasTerms),
        ("Dhyanas", dhyanaTerms),
        ("Mantras", mantrasTerms),
        ("Bandhas", bandhasTerms),
        ("Mudras", mudrasTerms),
        ("Nadis", nadisTerms),
        ("Prana Vayus", pranaVayusTerms),
        ("Pranas", pranasTerms),
        ("Pratyaharas", pratyaharasTerms),
        ("Kriyas", kriyasTerms),
        ("Kumbhakas", kumbhakasTerms),
        ("Koshas", koshasTerms),
        ("Kleshas", kleshasTerms),
        ("Gunas", gunasTerms),
        ("Ayurveda", ayurvedaTerms),
        ("Kirtan", kirtanTerms),
    ]

    var compileDate: Date {
        let bundleName = Bundle.main.infoDictionary!["CFBundleName"] as? String ?? "Info.plist"
        if let infoPath = Bundle.main.path(forResource: bundleName, ofType: nil),
           let infoAttr = try? FileManager.default.attributesOfItem(atPath: infoPath),
           let infoDate = infoAttr[FileAttributeKey.creationDate] as? Date
        { return infoDate }
        return Date()
    }

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Add Sanskrit terms to the iOS dictionary!")
                Hint {
                    Text("Terms with multiple words are split, i.e. for 'Adho Mukha Svanasana' three words are added.").bulleted()
                    Text("You can add both diacritic and standard versions.").bulleted()
                    Text("Plurals are added as well, if applicable.").bulleted()
                    Text("The changes take a moment (or more) to take effect. At first, the words aren't marked as wrong anymore. After you typed them yourself, they will appear as suggestions as well. This behavior is defined by iOS and cannot be changed.").bulleted()
                }
            }
            .padding()
            .background(Color("NoteBackground"), in: RoundedRectangle(cornerRadius: 10))
            .padding()

            Toggle("Use diacritics (ā, ḍ, ḻ, ṅ, ṣ, ś, ...)", isOn: self.$useDiacritics)
                .padding([.horizontal, .bottom], 10)
                .onChange(of: self.useDiacritics) { _ in self.updateAll = .init() }

            Divider()

            ScrollView {
                ForEach(self.allTerms, id: \.0) { groupName, terms in
                    TermListView(groupName: groupName, terms: terms, useDiacritics: self.$useDiacritics)
                }

                VStack(alignment: .center, spacing: 5) {
                    Text("About this app").font(.headline)
                    Text("Number of terms: \(self.allTerms.reduce(0) { $0 + $1.1.count })").font(.subheadline)
                    Text("Last updated on \(self.compileDate.formatted(.dateTime.year().month(.wide).day()))").font(.subheadline)
                    Text("Written by Jannik Arndt").font(.subheadline)
                    Link("Source code available on GitHub", destination: URL(string: "http://github.com/JannikArndt/SanskritAutoCorrection")!).font(.subheadline)
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 10)
            }
            .padding()
        }
        .id(self.updateAll)
        .ignoresSafeArea(edges: .bottom)
    }
}

struct TermListView: View {
    let groupName: String
    let terms: [any SanskritTerm]

    @Binding var useDiacritics: Bool

    @State private var isExpanded: Bool = false
    @State private var update: UUID = .init()
    @State private var updateCount: UUID = .init()

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            // need to be inside the `.id(self.update)` to be re-calculated on chage
            let learnedWords = self.countLearnedWords(terms: self.terms)
            let totalWords = self.terms.count

            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 5) {
                    Text(self.groupName).font(.title2)
                    Text("Added \(learnedWords) of \(totalWords)").font(.subheadline).id(self.updateCount)
                }
                Spacer()

                if learnedWords == totalWords {
                    Button("Remove all") { self.removeAllWords(termsToRemove: self.terms) }.buttonStyle(.bordered)
                } else {
                    Button("Add all") { self.addAllWords(termsToAdd: self.terms) }.buttonStyle(.bordered)
                }
            }

            DisclosureGroup(isExpanded: self.$isExpanded) {
                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(self.terms, id: \.id) { word in
                        TermView(word: word, useDiacritics: self.$useDiacritics, addWords: self.addAllWords, removeWords: self.removeAllWords)
                    }
                }
            } label: {
                Text(self.isExpanded ? "Hide all" : "Show all").padding(.bottom)
            }
            .onChange(of: self.isExpanded) { newValue in
                UserDefaults.standard.set(newValue, forKey: "noteIsExpanded\(self.groupName)")
                UserDefaults.standard.synchronize()
            }
            .onAppear {
                self.isExpanded = UserDefaults.standard.bool(forKey: "noteIsExpanded\(self.groupName)")
            }

            Divider()
        }
        .padding(.bottom, 5)
        .id(self.update)
    }

    func getWords(term: any SanskritTerm) -> [String] {
        let termWithCorrectWriting = self.useDiacritics ? term.nameWithDiacritics : term.simpleName
        let termInPlural = self.useDiacritics ? term.nameWithDiacriticsPlural : term.simpleNamePlural
        let fullWords = [termWithCorrectWriting, termInPlural].compactMap { $0 }

        let splitWords = (termWithCorrectWriting.split(separator: " ") + (termInPlural?.split(separator: " ") ?? [])).map { String($0) }

        let allWords = fullWords + splitWords + (fullWords + splitWords).map { $0.lowercased() }
        let uniqued = Array(Set(allWords))

        return uniqued
    }

    func addAllWords(termsToAdd: [any SanskritTerm]) {
        for term in termsToAdd {
            for word in self.getWords(term: term) {
                UITextChecker.learnWord(String(word))
            }
        }

        self.update = .init()
    }

    func removeAllWords(termsToRemove: [any SanskritTerm]) {
        for term in termsToRemove {
            for word in self.getWords(term: term) {
                UITextChecker.unlearnWord(String(word))
            }
        }

        self.update = .init()
    }

    func countLearnedWords(terms: [any SanskritTerm]) -> Int {
        var count = 0
        for term in terms {
            if UITextChecker.hasLearnedWord(self.useDiacritics ? term.nameWithDiacritics : term.simpleName) {
                count += 1
            }
        }
        return count
    }
}

struct TermView: View {
    let word: any SanskritTerm
    @Binding var useDiacritics: Bool
    let addWords: ([any SanskritTerm]) -> Void
    let removeWords: ([any SanskritTerm]) -> Void

    @State private var update: UUID = .init()

    var body: some View {
        let term = self.useDiacritics ? self.word.nameWithDiacritics : self.word.simpleName

        HStack(alignment: .top, spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text(term).bold()
                Text(self.word.english).font(.caption2)
            }
            .frame(maxWidth: 250, alignment: .leading)

            if UITextChecker.hasLearnedWord(term) {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)

                Button("Remove") {
                    self.removeWords([self.word])
                    self.update = .init()
                }
            } else {
                Image(systemName: "circle.dotted")
                    .foregroundColor(.gray)

                Button("Add") {
                    self.addWords([self.word])
                    self.update = .init()
                }
            }
        }
        .id(self.update)
    }
}
