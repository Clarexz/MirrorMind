//
//  HomeViewModel.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 20/08/25.
//


//
//  HomeViewModel.swift
//  MirrorMind
//
//  Created by Emotions System Lead on 20/08/25.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var selectedEmotion: Emotion? = nil
    
    // MARK: - Computed Properties
    
    /// Mensaje dinámico que cambia según la emoción seleccionada
    var dynamicMessage: String {
        guard let emotion = selectedEmotion else {
            return "Qué podemos hacer el día de hoy..."
        }
        
        switch emotion.name {
        case "happy":
            return "¡Mantén tu energía positiva!"
        case "sad":
            return "Vamos a mejorar tu día"
        case "angry":
            return "Respiremos y calmemos"
        case "anxious":
            return "Tranquilicemos la mente"
        case "nervous":
            return "Relajemos los nervios"
        case "calm":
            return "Mantén esa tranquilidad"
        default:
            return "Qué podemos hacer el día de hoy..."
        }
    }
    
    /// Ejercicios sugeridos según la emoción seleccionada
    var suggestedExercises: [String] {
        guard let emotion = selectedEmotion else {
            return ["Ejercicio 1", "Ejercicio 2", "Ejercicio 3", "Ejercicio 4"]
        }
        
        switch emotion.name {
        case "happy":
            return ["Ejercicio 7", "Ejercicio 8", "Ejercicio 9", "Ejercicio 10"]
        case "sad":
            return ["Ejercicio 11", "Ejercicio 12", "Ejercicio 13", "Ejercicio 14"]
        case "angry":
            return ["Ejercicio 15", "Ejercicio 16", "Ejercicio 17", "Ejercicio 18"]
        case "anxious":
            return ["Ejercicio 19", "Ejercicio 20", "Ejercicio 21", "Ejercicio 22"]
        case "nervous":
            return ["Ejercicio 23", "Ejercicio 24", "Ejercicio 25", "Ejercicio 26"]
        case "calm":
            return ["Ejercicio 27", "Ejercicio 28", "Ejercicio 29", "Ejercicio 30"]
        default:
            return ["Ejercicio 1", "Ejercicio 2", "Ejercicio 3", "Ejercicio 4"]
        }
    }
    
    /// Verifica si una emoción específica está seleccionada
    func isEmotionSelected(_ emotion: Emotion) -> Bool {
        return selectedEmotion?.id == emotion.id
    }
    
    // MARK: - Actions
    
    /// Selecciona una emoción (o la deselecciona si ya estaba seleccionada)
    func selectEmotion(_ emotion: Emotion) {
        if selectedEmotion?.id == emotion.id {
            // Si ya está seleccionada, la deseleccionamos
            selectedEmotion = nil
        } else {
            // Seleccionamos la nueva emoción
            selectedEmotion = emotion
        }
    }
}
