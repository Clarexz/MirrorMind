//
//  HomeView.swift
//  MirrorMind
//
//  Created by Home Structure Lead on 18/08/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            // Fondo que llega hasta los bordes
            Color.Primary.background
                .ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
                // Barra superior fija
                VStack(spacing: 0) {
                    // Espacio para status bar
                    Color.Primary.background
                        .frame(height: 0)
                    
                    // Contenido de la barra
                    HStack {
                        // Avatar
                        Circle()
                            .fill(Color.Primary.brand)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            )
                        
                        Text("¡Buenas tardes, Caleb!")
                            .font(.system(size: DesignConstants.Typography.heading1Size, weight: DesignConstants.Typography.boldWeight))
                            .foregroundColor(Color.Text.primary)
                        
                        Spacer()
                    }
                    .padding(.horizontal, DesignConstants.Spacing.containerPadding)
                    .padding(.vertical, 12)
                    .background(Color.Primary.background)
                }
                
                // Contenido scrolleable
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: DesignConstants.Spacing.sectionMargin) {
                        // Contenido principal
                        LazyVStack(spacing: DesignConstants.Spacing.sectionMargin) {
                            EmotionSelectorCardView(viewModel: viewModel)
                            ExerciseSuggestionsCardView(viewModel: viewModel)
                            SmartBandCardView()
                            WeeklySummaryCardView()
                            OliviaTipsCardView()
                        }
                        .padding(.horizontal, DesignConstants.Spacing.containerPadding)
                        .padding(.top, 20)
                    }
                    .padding(.bottom, 160) // Espacio para navbar
                }
            }
        }
    }
}

// MARK: - Emotion Selector Card View Interactiva
struct EmotionSelectorCardView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: DesignConstants.Spacing.cardPadding) {
            Text("¿Cómo te sientes en este momento?")
                .font(.system(size: DesignConstants.Typography.heading2Size, weight: DesignConstants.Typography.mediumWeight))
                .foregroundColor(Color.Text.primary)
                .multilineTextAlignment(.center)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: DesignConstants.Spacing.gridGap), count: 3), spacing: DesignConstants.Spacing.gridGap) {
                ForEach(Emotion.emotions) { emotion in
                    Button(action: {
                        viewModel.selectEmotion(emotion)
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: DesignConstants.Radius.emotion)
                                .fill(emotion.color)
                                .frame(height: 90)
                            
                            VStack(spacing: 4) {
                                if viewModel.isEmotionSelected(emotion) {
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.white)
                                }
                                
                                Text(emotion.displayName)
                                    .font(.system(size: DesignConstants.Typography.heading3Size, weight: DesignConstants.Typography.mediumWeight))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .buttonStyle(NoHighlightButtonStyle())
                }
            }
            .frame(height: 200)
        }
        .padding(DesignConstants.Spacing.cardPadding)
        .background(Color.Primary.background)
        .cornerRadius(DesignConstants.Radius.card)
        .shadow(
            color: DesignConstants.Shadow.card,
            radius: DesignConstants.Shadow.cardRadius,
            x: DesignConstants.Shadow.cardOffset.width,
            y: DesignConstants.Shadow.cardOffset.height
        )
    }
}

// MARK: - Custom Button Style
struct NoHighlightButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct ExerciseSuggestionsCardView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: DesignConstants.Spacing.cardPadding) {
            Text(viewModel.dynamicMessage)
                .font(.system(size: DesignConstants.Typography.heading2Size, weight: DesignConstants.Typography.boldWeight))
                .foregroundColor(Color.Text.primary)
            
            // Scroll horizontal de ejercicios placeholder
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: DesignConstants.Spacing.gridGap) {
                    ForEach(Array(viewModel.suggestedExercises.enumerated()), id: \.offset) { index, exerciseName in
                        VStack(spacing: 8) {
                            // Placeholder para thumbnail de video
                            RoundedRectangle(cornerRadius: DesignConstants.Radius.button)
                                .fill(Color.red.opacity(0.8))
                                .frame(width: 100, height: 100)
                                .overlay(
                                    Image(systemName: "play.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                )
                            
                            Text(exerciseName)
                                .font(.system(size: DesignConstants.Typography.heading4Size, weight: DesignConstants.Typography.mediumWeight))
                                .foregroundColor(Color.Text.secondary)
                                .lineLimit(1)
                        }
                        .frame(width: 100)
                    }
                }
                .padding(.horizontal, 4)
            }
        }
        .padding(DesignConstants.Spacing.cardPadding)
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

struct SmartBandCardView: View {
    var body: some View {
        VStack(spacing: DesignConstants.Spacing.cardPadding) {
            HStack {
                Text("Smartband")
                    .font(.system(size: DesignConstants.Typography.heading2Size, weight: DesignConstants.Typography.boldWeight))
                    .foregroundColor(Color.Text.primary)
                
                Spacer()
                
                HStack(spacing: 4) {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 8, height: 8)
                    
                    Text("Desconectado")
                        .font(.system(size: DesignConstants.Typography.heading4Size, weight: DesignConstants.Typography.mediumWeight))
                        .foregroundColor(Color.red)
                }
            }
            
            // Botón conectar
            Button("Conectar") {
                // Acción conectar
            }
            .font(.system(size: DesignConstants.Typography.heading3Size, weight: DesignConstants.Typography.boldWeight))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(Color.blue)
            .cornerRadius(DesignConstants.Radius.button)
        }
        .padding(DesignConstants.Spacing.cardPadding)
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

struct WeeklySummaryCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignConstants.Spacing.cardPadding) {
            Text("Tu semana emocional")
                .font(.system(size: DesignConstants.Typography.heading2Size, weight: DesignConstants.Typography.boldWeight))
                .foregroundColor(Color.Text.primary)
            
            // Gráfico placeholder con días de la semana
            HStack(spacing: 28) {
                ForEach(["L", "M", "M", "J", "V", "S", "D"], id: \.self) { day in
                    VStack(spacing: 4) {
                        Circle()
                            .fill([Color.Emotions.happy, Color.Emotions.calm, Color.Emotions.happy, Color.Emotions.anxious, Color.Emotions.happy, Color.Emotions.calm, Color.Emotions.happy].randomElement() ?? Color.gray)
                            .frame(width: 20, height: 20)
                        
                        Text(day)
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(Color.Text.secondary)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            
            Text("Has estado mayormente feliz esta semana")
                .font(.system(size: DesignConstants.Typography.heading4Size, weight: DesignConstants.Typography.mediumWeight))
                .foregroundColor(Color.Text.secondary)
        }
        .padding(DesignConstants.Spacing.cardPadding)
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

struct OliviaTipsCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignConstants.Spacing.cardPadding) {
            Text("Olivia sugiere...")
                .font(.system(size: DesignConstants.Typography.heading2Size, weight: DesignConstants.Typography.boldWeight))
                .foregroundColor(Color.Text.primary)
            
            Text("¿Has probado salir a caminar? El aire fresco puede ayudar a mantener tu bienestar emocional.")
                .font(.system(size: DesignConstants.Typography.heading3Size, weight: DesignConstants.Typography.regularWeight))
                .foregroundColor(Color.Text.secondary)
                .multilineTextAlignment(.leading)
            
            Button("Quiero saber más") {
                // Acción del botón
            }
            .font(.system(size: DesignConstants.Typography.heading4Size, weight: DesignConstants.Typography.boldWeight))
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.Primary.brand)
            .cornerRadius(DesignConstants.Radius.button)
        }
        .padding(DesignConstants.Spacing.cardPadding)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.05)]),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(DesignConstants.Radius.card)
        .overlay(
            RoundedRectangle(cornerRadius: DesignConstants.Radius.card)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .shadow(
            color: DesignConstants.Shadow.card,
            radius: DesignConstants.Shadow.cardRadius,
            x: DesignConstants.Shadow.cardOffset.width,
            y: DesignConstants.Shadow.cardOffset.height
        )
    }
}

#Preview {
    HomeView()
}
