import Foundation
import CoreData

// Extensión para integrar datos del SmartBand con el sistema emocional
extension HomeViewModel {
    
    /// Guardar emoción seleccionada con datos biométricos contextuales
    func saveEmotionWithBiometricContext(emotion: Emotion, smartBandViewModel: SmartBandViewModel) {
        let context = PersistenceController.shared.container.viewContext
        
        let emotionRecord = EmotionRecord(context: context)
        emotionRecord.id = UUID()
        emotionRecord.timestamp = Date()
        emotionRecord.emotionName = emotion.displayName
        emotionRecord.selectedManually = true
        
        // Si hay datos biométricos disponibles, crear un registro asociado
        if let currentReading = smartBandViewModel.currentReading,
           smartBandViewModel.connectionState == .connected {
            
            let biometricReading = BiometricReading(context: context)
            biometricReading.id = UUID()
            biometricReading.timestamp = Date()
            biometricReading.temperature = currentReading.temperature
            biometricReading.heartRate = Int32(currentReading.heartRate)
            biometricReading.deviceConnected = true
        }
        
        PersistenceController.shared.save()
        
        print("Emotion '\(emotion.displayName)' saved with biometric context")
    }
    
    /// Obtener historial de emociones con contexto biométrico
    func getEmotionalHistory(days: Int = 7) -> [(emotion: String, timestamp: Date, avgHeartRate: Double?)] {
        let context = PersistenceController.shared.container.viewContext
        let request: NSFetchRequest<EmotionRecord> = EmotionRecord.fetchRequest()
        
        let calendar = Calendar.current
        let startDate = calendar.date(byAdding: .day, value: -days, to: Date()) ?? Date()
        
        request.predicate = NSPredicate(format: "timestamp >= %@", startDate as NSDate)
        request.sortDescriptors = [NSSortDescriptor(keyPath: \EmotionRecord.timestamp, ascending: false)]
        
        do {
            let emotions = try context.fetch(request)
            
            return emotions.compactMap { emotion -> (emotion: String, timestamp: Date, avgHeartRate: Double?)? in
                guard let emotionName = emotion.emotionName,
                      let timestamp = emotion.timestamp else { return nil }
                
                // Buscar datos biométricos cercanos en tiempo (±5 minutos)
                let avgHeartRate = getBiometricDataNear(timestamp: timestamp)?.averageHeartRate
                
                return (emotion: emotionName, timestamp: timestamp, avgHeartRate: avgHeartRate)
            }
        } catch {
            print("Error fetching emotional history: \(error)")
            return []
        }
    }
    
    private func getBiometricDataNear(timestamp: Date) -> (averageHeartRate: Double, averageTemperature: Double)? {
        let context = PersistenceController.shared.container.viewContext
        let request: NSFetchRequest<BiometricReading> = BiometricReading.fetchRequest()
        
        let fiveMinutesBeforeAndAfter = TimeInterval(5 * 60) // 5 minutos
        let startTime = timestamp.addingTimeInterval(-fiveMinutesBeforeAndAfter)
        let endTime = timestamp.addingTimeInterval(fiveMinutesBeforeAndAfter)
        
        request.predicate = NSPredicate(format: "timestamp >= %@ AND timestamp <= %@", 
                                      startTime as NSDate, endTime as NSDate)
        
        do {
            let readings = try context.fetch(request)
            guard !readings.isEmpty else { return nil }
            
            let validHeartRates = readings.compactMap { $0.heartRate > 0 ? Double($0.heartRate) : nil }
            let validTemperatures = readings.compactMap { $0.temperature > 0 ? $0.temperature : nil }
            
            guard !validHeartRates.isEmpty, !validTemperatures.isEmpty else { return nil }
            
            let avgHeartRate = validHeartRates.reduce(0, +) / Double(validHeartRates.count)
            let avgTemperature = validTemperatures.reduce(0, +) / Double(validTemperatures.count)
            
            return (averageHeartRate: avgHeartRate, averageTemperature: avgTemperature)
        } catch {
            print("Error fetching biometric data near timestamp: \(error)")
            return nil
        }
    }
}
