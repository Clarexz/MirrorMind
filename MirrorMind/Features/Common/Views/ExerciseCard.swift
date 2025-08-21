//
//  ExerciseCard.swift
//  MirrorMind
//
//  Created by Exercise Content Lead on 20/08/25.
//
import SwiftUI

/// Tarjeta de ejercicio para vista Home (diseño original)
struct ExerciseCard: View {
    let exercise: Exercise
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                // Fondo con color de categoría
                RoundedRectangle(cornerRadius: DesignConstants.Radius.card)
                    .fill(exercise.category.color)
                    .frame(width: 160, height: DesignConstants.Dimensions.exerciseCardHeight)
                
                // Overlay semitransparente
                RoundedRectangle(cornerRadius: DesignConstants.Radius.card)
                    .fill(Color.black.opacity(0.2))
                    .frame(width: 160, height: DesignConstants.Dimensions.exerciseCardHeight)
                
                // Contenido centrado
                VStack(spacing: 8) {
                    // Icono de play
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                    
                    // Información del ejercicio
                    VStack(spacing: 4) {
                        Text(exercise.name)
                            .font(.system(size: DesignConstants.Typography.heading4Size, weight: DesignConstants.Typography.boldWeight))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                        
                        // Duración
                        HStack(spacing: 4) {
                            Image(systemName: "clock.fill")
                                .font(.system(size: 10))
                                .foregroundColor(.white.opacity(0.8))
                            
                            Text("\(Int(exercise.duration / 60)) min")
                                .font(.system(size: DesignConstants.Typography.heading4Size, weight: DesignConstants.Typography.mediumWeight))
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
        .shadow(
            color: DesignConstants.Shadow.card,
            radius: DesignConstants.Shadow.cardRadius,
            x: DesignConstants.Shadow.cardOffset.width,
            y: DesignConstants.Shadow.cardOffset.height
        )
    }
}
