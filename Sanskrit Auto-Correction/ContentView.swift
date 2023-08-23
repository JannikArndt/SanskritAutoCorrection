//
//  ContentView.swift
//  Sanskrit Auto-Correction
//
//  Created by Jannik Arndt on 23.08.23.
//

import SwiftUI

struct ContentView: View {
    let textChecker = UITextChecker()

    let asanas = [
        SanskritTerm("Adho Mukha Svanasana", "Adho Mukha Svanasana", "Downward Facing Dog"),
        SanskritTerm("Ardha Chandrasana", "Ardha Chandrasana", "Half Moon Pose"),
        SanskritTerm("Bakasana", "Bākāsana", "Crow Pose"),
        SanskritTerm("Bhujangasana", "Bhujangāsana", "Cobra Pose"),
        SanskritTerm("Chaturanga Dandasana", "Caturaṅga Daṇḍāsana", "Four-Limbed Staff Pose"),
        SanskritTerm("Dhanurasana", "Dhanurāsana", "Bow Pose"),
        SanskritTerm("Garudasana", "Garuḍāsana", "Eagle Pose"),
        SanskritTerm("Gomukhasana", "Gomukhāsana", "Cow Face Pose"),
        SanskritTerm("Halasana", "Halāsana", "Plow Pose"),
        SanskritTerm("Hanumanasana", "Hanumānāsana", "Monkey Pose"),
        SanskritTerm("Kapotasana", "Kapotāsana", "Pigeon Pose"),
        SanskritTerm("Matsyasana", "Matsyāsana", "Fish Pose"),
        SanskritTerm("Mayurasana", "Mayūrāsana", "Peacock Pose"),
        SanskritTerm("Natarajasana", "Naṭarājāsana", "Dancer's Pose"),
        SanskritTerm("Navasana", "Nāvāsana", "Boat Pose"),
        SanskritTerm("Padmasana", "Padmāsana", "Lotus Pose"),
        SanskritTerm("Parivrtta Parsvakonasana", "Parivṛtta Pārśvakonāsana", "Revolved Side Angle Pose"),
        SanskritTerm("Paschimottanasana", "Pāścimottānāsana", "Seated Forward Bend"),
        SanskritTerm("Salamba Sarvangasana", "Sālamba Śīrṣāsana", "Supported Shoulderstand"),
        SanskritTerm("Salamba Sirsasana", "Sālamba Śīrṣāsana", "Supported Headstand"),
        SanskritTerm("Savasana", "Śavāsana", "Corpse Pose"),
        SanskritTerm("Setu Bandhasana", "Setu Bandhāsana", "Bridge Pose"),
        SanskritTerm("Shalabhasana", "Śalabhāsana", "Locust Pose"),
        SanskritTerm("Shavasana", "Śavāsana", "Corpse Pose"),
        SanskritTerm("Sirsasana", "Śīrṣāsana", "Headstand"),
        SanskritTerm("Sukhasana", "Sukhāsana", "Easy Pose"),
        SanskritTerm("Tadasana", "Tāḍāsana", "Mountain Pose"),
        SanskritTerm("Trikonasana", "Trikonāsana", "Triangle Pose"),
        SanskritTerm("Ustrasana", "Uṣṭrāsana", "Camel Pose"),
        SanskritTerm("Uttanasana", "Utthānāsana", "Standing Forward Bend"),
        SanskritTerm("Uttitha Parsvakonasana", "Utthita Pārśvakonāsana", "Extended Side Angle Pose"),
        SanskritTerm("Uttanasana", "Utthānāsana", "Standing Forward Bend"),
        SanskritTerm("Vasisthasana", "Vāsiṣṭhāsana", "Side Plank Pose"),
        SanskritTerm("Vrksasana", "Vṛkṣāsana", "Tree Pose"),
    ]

    @State var update: UUID = .init()
    @AppStorage("UseDiacritics") var useDiacritics: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Toggle("Use diacritics", isOn: $useDiacritics)
                .padding()
                .onChange(of: useDiacritics) { _ in
                    update = .init()
                }

            ScrollView {
                HStack(alignment: .top) {
                    Text("Asana names").font(.title)
                    Spacer()
                    Button("Learn all") {
                        for word in asanas {
                            UITextChecker.learnWord(useDiacritics ? word.withDiacritics : word.simple)
                        }
                        update = .init()
                    }.buttonStyle(.borderedProminent)
                }

                LazyVStack(alignment: .leading, spacing: 10) {
                    ForEach(asanas, id: \.id) { word in

                        let term = useDiacritics ? word.withDiacritics : word.simple

                        HStack(alignment: .top, spacing: 10) {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(term).bold()
                                Text(word.english).font(.caption2)
                            }.frame(maxWidth: 250, alignment: .leading)

                            if UITextChecker.hasLearnedWord(term) {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.green)

                                Button("Forget") {
                                    UITextChecker.unlearnWord(term)
                                    update = .init()
                                }
                            } else {
                                Image(systemName: "circle.dotted")
                                    .foregroundColor(.gray)

                                Button("Learn") {
                                    UITextChecker.learnWord(term)
                                    update = .init()
                                }
                            }
                        }
                    }
                }
                .id(update)
            }
            .padding()
        }
    }
}

struct SanskritTerm: Identifiable {
    let simple: String
    let withDiacritics: String
    let english: String
    let id: UUID = .init()

    init(_ simple: String,
         _ withDiacritics: String,
         _ english: String)
    {
        self.simple = simple
        self.withDiacritics = withDiacritics
        self.english = english
    }
}
