//
//  CategoryView.swift
//  MirrorMind
//
//  Created by Exercise Player Lead on 20/08/25.
//

import SwiftUI
import Combine

struct CategoryView: View {
    let category: MomentCategory
    @StateObject private var viewModel = CategoryViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            // Fondo principal
            Color.Primary.background
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header personalizado
                headerView
                
                // Lista de ejercicios
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.exercisesForCategory(category.categoryType)) { exercise in
                            NavigationLink(
                                destination: ExercisePlayerView(
                                    exercise: exercise,
                                    categoryColor: category.color
                                )
                            ) {
                                ExerciseListCard(
                                    exercise: exercise,
                                    categoryColor: category.color,
                                    isFavorite: viewModel.isFavorite(exercise),
                                    onTap: {
                                        // Navegación manejada por NavigationLink
                                    },
                                    onFavoriteToggle: {
                                        viewModel.toggleFavorite(exercise)
                                    }
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 24)
                    .padding(.bottom, 100) // Espacio para navbar
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    // MARK: - Header View
    private var headerView: some View {
        VStack(spacing: 0) {
            // Top section con back button
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(Color.Text.primary)
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 12)
            
            // Category info section
            VStack(spacing: 16) {
                // Icono grande de categoría
                ZStack {
                    Circle()
                        .fill(category.color.opacity(0.2))
                        .frame(width: 80, height: 80)
                    
                    Image(systemName: category.icon)
                        .font(.system(size: 40, weight: .medium))
                        .foregroundColor(category.color)
                }
                
                // Títulos
                VStack(spacing: 4) {
                    Text(category.name)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color.Text.primary)
                    
                    Text(category.subtitle)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color.Text.secondary)
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 24)
        }
        .background(Color.Primary.background)
    }
}

// MARK: - Exercise List Card Component
struct ExerciseListCard: View {
    let exercise: Exercise
    let categoryColor: Color
    let isFavorite: Bool
    let onTap: () -> Void
    let onFavoriteToggle: () -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            // Thumbnail con formato 16:9
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(categoryColor.opacity(0.2))
                    .frame(width: 60, height: 80) // 16:9 ratio (80:45)
                
                Image(systemName: "play.fill")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(categoryColor)
            }
            
            // Información del ejercicio
            VStack(alignment: .leading, spacing: 6) {
                Text(exercise.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color.Text.primary)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(exercise.description)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color.Text.secondary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                // Duración
                HStack(spacing: 4) {
                    Image(systemName: "clock")
                        .font(.system(size: 12))
                        .foregroundColor(Color.Text.secondary)
                    
                    Text(exercise.formattedDuration)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color.Text.secondary)
                }
            }
            
            Spacer()
            
            // Botón de favorito
            Button(action: onFavoriteToggle) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(isFavorite ? .red : Color.Text.secondary)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(DesignConstants.Radius.card)
        .shadow(
            color: DesignConstants.Shadow.card,
            radius: DesignConstants.Shadow.cardRadius,
            x: DesignConstants.Shadow.cardOffset.width,
            y: DesignConstants.Shadow.cardOffset.height
        )
    }
}

// MARK: - Category ViewModel
class CategoryViewModel: ObservableObject {
    @Published private var favoriteExerciseIds: Set<UUID> = []
    
    // MARK: - Public Methods
    func exercisesForCategory(_ categoryType: MomentCategory.CategoryType) -> [Exercise] {
        // Convertir de MomentCategory.CategoryType a ExerciseCategory
        let exerciseCategory: ExerciseCategory
        
        switch categoryType {
        case .respirar:
            exerciseCategory = .breathing
        case .meditar:
            exerciseCategory = .meditation
        case .moverte:
            exerciseCategory = .movement
        case .reflexionar:
            exerciseCategory = .reflection
        case .crecer:
            exerciseCategory = .growth
        }
        
        // Obtener ejercicios de HomeViewModel (simulación)
        return sampleExercisesForCategory(exerciseCategory)
    }
    
    func isFavorite(_ exercise: Exercise) -> Bool {
        return favoriteExerciseIds.contains(exercise.id)
    }
    
    func toggleFavorite(_ exercise: Exercise) {
        if favoriteExerciseIds.contains(exercise.id) {
            favoriteExerciseIds.remove(exercise.id)
        } else {
            favoriteExerciseIds.insert(exercise.id)
        }
    }
    
    // MARK: - Private Methods
    private func sampleExercisesForCategory(_ category: ExerciseCategory) -> [Exercise] {
        // Datos de ejemplo específicos por categoría
        switch category {
        case .breathing:
            return [
                Exercise(name: "Respiración 4-7-8", description: "Técnica calmante para reducir ansiedad", duration: 180, category: .breathing, thumbnail: "breathing_1", emotions: ["ansioso"], isFavorite: false),
                Exercise(name: "Respiración Profunda", description: "Ejercicio básico de respiración consciente", duration: 300, category: .breathing, thumbnail: "breathing_2", emotions: ["calmado"], isFavorite: false),
                Exercise(name: "Respiración Cuadrada", description: "Técnica de respiración rítmica", duration: 240, category: .breathing, thumbnail: "breathing_3", emotions: ["nervioso"], isFavorite: false)
            ]
        case .meditation:
            return [
                Exercise(name: "Meditación Guiada", description: "Sesión de meditación para principiantes", duration: 600, category: .meditation, thumbnail: "meditation_1", emotions: ["calmado"], isFavorite: false),
                Exercise(name: "Mindfulness Básico", description: "Ejercicio de atención plena", duration: 480, category: .meditation, thumbnail: "meditation_2", emotions: ["ansioso"], isFavorite: false),
                Exercise(name: "Meditación Zen", description: "Práctica tradicional de meditación", duration: 720, category: .meditation, thumbnail: "meditation_3", emotions: ["calmado"], isFavorite: false)
            ]
        case .movement:
            return [
                Exercise(name: "Yoga Energizante", description: "Secuencia de yoga para activar el cuerpo", duration: 900, category: .movement, thumbnail: "movement_1", emotions: ["triste"], isFavorite: false),
                Exercise(name: "Estiramiento Suave", description: "Ejercicios de estiramiento para relajar", duration: 420, category: .movement, thumbnail: "movement_2", emotions: ["nervioso"], isFavorite: false),
                Exercise(name: "Tai Chi Básico", description: "Movimientos suaves y meditativos", duration: 540, category: .movement, thumbnail: "movement_3", emotions: ["calmado"], isFavorite: false)
            ]
        case .reflection:
            return [
                Exercise(name: "Diario Emocional", description: "Reflexión guiada sobre emociones", duration: 360, category: .reflection, thumbnail: "reflection_1", emotions: ["triste"], isFavorite: false),
                Exercise(name: "Gratitud Diaria", description: "Ejercicio de apreciación y gratitud", duration: 300, category: .reflection, thumbnail: "reflection_2", emotions: ["feliz"], isFavorite: false),
                Exercise(name: "Autocompasión", description: "Práctica de amor propio y aceptación", duration: 420, category: .reflection, thumbnail: "reflection_3", emotions: ["triste"], isFavorite: false)
            ]
        case .growth:
            return [
                Exercise(name: "Visualización de Metas", description: "Ejercicio para clarificar objetivos", duration: 540, category: .growth, thumbnail: "growth_1", emotions: ["feliz"], isFavorite: false),
                Exercise(name: "Autoafirmaciones", description: "Práctica de refuerzo positivo personal", duration: 240, category: .growth, thumbnail: "growth_2", emotions: ["nervioso"], isFavorite: false),
                Exercise(name: "Planificación del Futuro", description: "Ejercicio de visión y planeación", duration: 480, category: .growth, thumbnail: "growth_3", emotions: ["feliz"], isFavorite: false)
            ]
        }
    }
}

#Preview {
    CategoryView(category: MomentCategory.allCategories[0])
}
