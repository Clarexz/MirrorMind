import SwiftUI

// MARK: - WeeklyChart Component
struct WeeklyChart: View {
    @StateObject private var viewModel = WeeklyDataViewModel()
    @State private var animationProgress: Double = 0.0
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignConstants.Spacing.cardPadding) {
            // Título
            Text("Tu semana emocional")
                .font(.system(size: DesignConstants.Typography.heading2Size, weight: DesignConstants.Typography.boldWeight))
                .foregroundColor(Color.Text.primary)
            
            // Gráfico de barras
            chartView
            
            // Resumen textual
            summaryView
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
        .onAppear {
            withAnimation(.easeOut(duration: 1.0)) {
                animationProgress = 1.0
            }
        }
        .refreshable {
            viewModel.refreshWeeklyData()
        }
    }
    
    // MARK: - Chart View
    private var chartView: some View {
        HStack(spacing: 0) {
            ForEach(Array(viewModel.currentWeeklySummary.dailyData.enumerated()), id: \.element.id) { index, dayData in
                VStack(spacing: 8) {
                    // Círculo emocional con tamaño especial para día actual
                    Circle()
                        .fill(viewModel.getColorForEmotion(dayData.color))
                        .frame(
                            width: calculateCircleSize(for: dayData),
                            height: calculateCircleSize(for: dayData)
                        )
                        .scaleEffect(animationProgress)
                        .animation(.easeOut(duration: 0.8).delay(Double(index) * 0.1), value: animationProgress)
                    
                    // Día de la semana
                    Text(dayData.dayAbbreviation)
                        .font(.system(size: DesignConstants.Typography.heading4Size, weight: DesignConstants.Typography.regularWeight))
                        .foregroundColor(dayData.isToday ? Color.Text.primary : Color.Text.secondary)
                        .frame(width: 20) // Ancho fijo para alineación
                }
                .frame(maxWidth: .infinity) // Distribuir espacio uniformemente
            }
        }
        .frame(height: 80) // Altura fija para el área del gráfico
    }
    
    // MARK: - Summary View
    private var summaryView: some View {
        HStack {
            // Indicador de emoción predominante
            Circle()
                .fill(viewModel.getColorForEmotion(getColorNameForEmotion(viewModel.currentWeeklySummary.predominantEmotion)))
                .frame(width: 12, height: 12)
                .scaleEffect(animationProgress)
                .animation(.easeOut(duration: 0.6).delay(0.5), value: animationProgress)
            
            // Texto descriptivo
            Text(viewModel.currentWeeklySummary.weekDescription)
                .font(.system(size: DesignConstants.Typography.heading3Size, weight: DesignConstants.Typography.mediumWeight))
                .foregroundColor(Color.Text.secondary)
                .opacity(animationProgress)
                .animation(.easeOut(duration: 0.6).delay(0.3), value: animationProgress)
            
            Spacer()
        }
    }
    
    // MARK: - Helper Methods
    private func calculateCircleSize(for dayData: DailyEmotionalData) -> CGFloat {
        if dayData.isToday {
            return 28 // Tamaño especial para día actual
        } else {
            return 20 // Tamaño estándar para otros días
        }
    }
    
    private func getColorNameForEmotion(_ emotion: String) -> String {
        switch emotion.lowercased() {
        case "feliz":
            return "happy"
        case "calmado":
            return "calm"
        case "ansioso":
            return "anxious"
        case "triste":
            return "sad"
        case "enojado":
            return "angry"
        case "nervioso":
            return "nervous"
        default:
            return "calm"
        }
    }
}

// MARK: - Preview
#Preview {
    WeeklyChart()
        .padding()
        .background(Color.Primary.background)
}
