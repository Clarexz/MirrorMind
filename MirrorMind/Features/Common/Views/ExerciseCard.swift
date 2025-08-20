//
//  ExerciseCard.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 20/08/25.
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
                
                // Duración del ejercicio
                Text(exercise.formattedDuration)
                    .font(.system(size: 10, weight: DesignConstants.Typography.regularWeight))
                    .foregroundColor(Color.Text.secondary)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
