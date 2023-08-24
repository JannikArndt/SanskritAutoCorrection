//
//  Asanas.swift
//  Sanskrit Auto-Correction
//
//  Created by Jannik Arndt on 24.08.23.
//

import Foundation

let asanas = [
    Asana(simpleName: "Adho Mukha Svanasana", nameWithDiacritics: "Adho Mukha Svanasana", english: "Downward Facing Dog", type: "Prone", description: "Inverted V-shaped pose."),
    Asana(simpleName: "Ardha Chandrasana", nameWithDiacritics: "Ardha Chandrasana", english: "Half Moon Pose", type: "Standing", description: "Balancing on one leg with one hand on the floor and the other reaching towards the sky."),
    Asana(simpleName: "Bakasana", nameWithDiacritics: "Bākāsana", english: "Crow Pose", type: "Arm Balance", description: "Balancing on hands with knees resting on the back of the arms."),
    Asana(simpleName: "Bhujangasana", nameWithDiacritics: "Bhujangāsana", english: "Cobra Pose", type: "Prone", description: "Lifting the upper body while keeping the legs and lower body on the ground."),
    Asana(simpleName: "Chaturanga Dandasana", nameWithDiacritics: "Caturaṅga Daṇḍāsana", english: "Four-Limbed Staff Pose", type: "Arm Balance", description: "Holding a plank-like position with the body parallel to the ground."),
    Asana(simpleName: "Dhanurasana", nameWithDiacritics: "Dhanurāsana", english: "Bow Pose", type: "Prone", description: "Lying on the stomach and lifting the chest and legs by gripping the ankles."),
    Asana(simpleName: "Garudasana", nameWithDiacritics: "Garuḍāsana", english: "Eagle Pose", type: "Balancing", description: "Wrapping one leg around the other while crossing the arms."),
    Asana(simpleName: "Gomukhasana", nameWithDiacritics: "Gomukhāsana", english: "Cow Face Pose", type: "Seated", description: "Bringing one arm behind the back and the other over the shoulder, hands clasped."),
    Asana(simpleName: "Halasana", nameWithDiacritics: "Halāsana", english: "Plow Pose", type: "Inversion", description: "Lifting the legs over the head while lying on the back."),
    Asana(simpleName: "Hanumanasana", nameWithDiacritics: "Hanumānāsana", english: "Monkey Pose", type: "Seated", description: "A deep forward split pose resembling the leaping posture of Hanuman."),
    Asana(simpleName: "Kapotasana", nameWithDiacritics: "Kapotāsana", english: "Pigeon Pose", type: "Prone", description: "Front leg bent at the hip and knee with the back leg extended."),
    Asana(simpleName: "Matsyasana", nameWithDiacritics: "Matsyāsana", english: "Fish Pose", type: "Supine", description: "Lying on the back, arching the upper body and lifting the chest."),
    Asana(simpleName: "Mayurasana", nameWithDiacritics: "Mayūrāsana", english: "Peacock Pose", type: "Arm Balance", description: "Balancing the body on bent arms with legs extended."),
    Asana(simpleName: "Natarajasana", nameWithDiacritics: "Naṭarājāsana", english: "Dancer's Pose", type: "Balancing", description: "Standing on one leg while holding the opposite foot behind with the corresponding hand."),
    Asana(simpleName: "Navasana", nameWithDiacritics: "Nāvāsana", english: "Boat Pose", type: "Balancing", description: "Balancing on the sit bones with legs extended and upper body leaning back."),
    Asana(simpleName: "Padmasana", nameWithDiacritics: "Padmāsana", english: "Lotus Pose", type: "Seated", description: "Sitting cross-legged with each foot placed on the opposite thigh."),
    Asana(simpleName: "Parivrtta Parsvakonasana", nameWithDiacritics: "Parivṛtta Pārśvakonāsana", english: "Revolved Side Angle Pose", type: "Standing", description: "Deep lunge with a twist, one hand on the floor and the other reaching upwards."),
    Asana(simpleName: "Paschimottanasana", nameWithDiacritics: "Pāścimottānāsana", english: "Seated Forward Bend", type: "Seated", description: "Sitting and folding forward at the hips, reaching for the feet."),
    Asana(simpleName: "Salamba Sarvangasana", nameWithDiacritics: "Sālamba Śīrṣāsana", english: "Supported Shoulderstand", type: "Inversion", description: "Balancing on the shoulders with legs extended vertically."),
    Asana(simpleName: "Salamba Sirsasana", nameWithDiacritics: "Sālamba Śīrṣāsana", english: "Supported Headstand", type: "Inversion", description: "Balancing on the head with forearms as support and legs extended vertically."),
    Asana(simpleName: "Savasana", nameWithDiacritics: "Śavāsana", english: "Corpse Pose", type: "Restorative", description: "Lying flat on the back in a relaxed position."),
    Asana(simpleName: "Setu Bandhasana", nameWithDiacritics: "Setu Bandhāsana", english: "Bridge Pose", type: "Backbend", description: "Lying on the back, lifting the hips and chest while keeping the feet and shoulders grounded."),
    Asana(simpleName: "Shalabhasana", nameWithDiacritics: "Śalabhāsana", english: "Locust Pose", type: "Prone", description: "Lifting the chest, legs, and arms off the ground while lying on the stomach."),
    Asana(simpleName: "Shavasana", nameWithDiacritics: "Śavāsana", english: "Corpse Pose", type: "Restorative", description: "Lying flat on the back in a relaxed position."),
    Asana(simpleName: "Sirsasana", nameWithDiacritics: "Śīrṣāsana", english: "Headstand", type: "Inversion", description: "Balancing on the head with forearms as support and legs extended vertically."),
    Asana(simpleName: "Sukhasana", nameWithDiacritics: "Sukhāsana", english: "Easy Pose", type: "Seated", description: "Simple cross-legged sitting pose."),
    Asana(simpleName: "Tadasana", nameWithDiacritics: "Tāḍāsana", english: "Mountain Pose", type: "Standing", description: "Standing tall with feet together and arms at the sides."),
    Asana(simpleName: "Trikonasana", nameWithDiacritics: "Trikonāsana", english: "Triangle Pose", type: "Standing", description: "Standing with legs apart, reaching one hand towards the floor and the other towards the sky."),
    Asana(simpleName: "Ustrasana", nameWithDiacritics: "Uṣṭrāsana", english: "Camel Pose", type: "Backbend", description: "Kneeling and arching the back to reach for the feet while keeping the hips aligned."),
    Asana(simpleName: "Uttanasana", nameWithDiacritics: "Utthānāsana", english: "Standing Forward Bend", type: "Forward Bend", description: "Bending forward from the hips while standing with legs straight."),
    Asana(simpleName: "Uttitha Parsvakonasana", nameWithDiacritics: "Utthita Pārśvakonāsana", english: "Extended Side Angle Pose", type: "Standing", description: "Deep lunge with one hand on the floor and the other extending over the head in a straight line."),
    Asana(simpleName: "Uttanasana", nameWithDiacritics: "Utthānāsana", english: "Standing Forward Bend", type: "Forward Bend", description: "Bending forward from the hips while standing with legs straight."),
    Asana(simpleName: "Vasisthasana", nameWithDiacritics: "Vāsiṣṭhāsana", english: "Side Plank Pose", type: "Side Balance", description: "Balancing on one hand with the body extended sideways."),
    Asana(simpleName: "Vrksasana", nameWithDiacritics: "Vṛkṣāsana", english: "Tree Pose", type: "Standing", description: "Balancing on one leg with the other foot resting on the inner thigh."),
]
