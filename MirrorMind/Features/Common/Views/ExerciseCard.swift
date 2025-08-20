//
//  ExerciseCard.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 20/08/25.
//


//
//  ExerciseCard.swift
//  MirrorMind
//
//  Created by Exercise Content Lead on 20/08/25.
//

import SwiftUI

struct ExerciseCard: View {
    let exercise: Exercise
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                // Thumbnail/Preview del ejercicio
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(exercise.category.color.opacity(0.3))
                        .frame(width: 100, height: 60)
                    
                    // Icono de play
                    Image(systemName: "play.fill")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(exercise.category.color)
                }
                
                // Nombre del ejercicio
                Text(exercise.name)
                    .font(.system(size: DesignConstants.Typography.heading4Size, weight: DesignConstants.Typography.mediumWeight))
                    .foregroundColor(Color.Text.primary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(width: 100)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    HStack(spacing: 16) {
        ExerciseCard(
            exercise: Exercise(
                name: "Respiración 4-7-8",
                description: "Técnica calmante para reducir ansiedad",
                duration: 180, // 3 minutos
                category: .breathing,
                thumbnail: "breathing_preview",
                emotions: ["ansioso", "nervioso"],
                isFavorite: false
            ),
            action: {}
        )
        
        ExerciseCard(
            exercise: Exercise(
                name: "Meditación Mindfulness",
                description: "Ejercicio de atención plena",
                duration: 600, // 10 minutos
                category: .meditation,
                thumbnail: "meditation_preview",
                emotions: ["calmado", "feliz"],
                isFavorite: true
            ),
            action: {}
        )
    }
    .padding()
    .background(Color.Primary.background)
}