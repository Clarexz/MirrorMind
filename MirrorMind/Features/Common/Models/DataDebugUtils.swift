//
//  DataDebugUtils.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 20/08/25.
//


import Foundation
import CoreData

// Utilidades para debugging y validación de datos
class DataDebugUtils {
    
    /// Imprimir estadísticas de Core Data
    static func printCoreDataStats() {
        let context = PersistenceController.shared.container.viewContext
        
        // Contar BiometricReadings
        let biometricRequest: NSFetchRequest<BiometricReading> = BiometricReading.fetchRequest()
        let biometricCount = (try? context.count(for: biometricRequest)) ?? 0
        
        // Contar EmotionRecords
        let emotionRequest: NSFetchRequest<EmotionRecord> = EmotionRecord.fetchRequest()
        let emotionCount = (try? context.count(for: emotionRequest)) ?? 0
        
        print("Core Data Stats:")
        print("   BiometricReadings: \(biometricCount)")
        print("   EmotionRecords: \(emotionCount)")
        
        // Última lectura biométrica
        if let lastReading = getLastBiometricReading() {
            print("   Last reading: \(lastReading.formattedTemperature), \(lastReading.formattedHeartRate)")
        }
    }
    
    /// Obtener última lectura biométrica
    static func getLastBiometricReading() -> LiveBiometricData? {
        let context = PersistenceController.shared.container.viewContext
        let request: NSFetchRequest<BiometricReading> = BiometricReading.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \BiometricReading.timestamp, ascending: false)]
        request.fetchLimit = 1
        
        do {
            let readings = try context.fetch(request)
            if let reading = readings.first,
               let timestamp = reading.timestamp {
                return LiveBiometricData(
                    temperature: reading.temperature,
                    heartRate: Int(reading.heartRate)
                )
            }
        } catch {
            print("Error fetching last reading: \(error)")
        }
        
        return nil
    }
    
    /// Limpiar todos los datos (útil para testing)
    static func clearAllData() {
        let context = PersistenceController.shared.container.viewContext
        
        // Limpiar BiometricReadings
        let biometricRequest: NSFetchRequest<NSFetchRequestResult> = BiometricReading.fetchRequest()
        let biometricDeleteRequest = NSBatchDeleteRequest(fetchRequest: biometricRequest)
        
        // Limpiar EmotionRecords
        let emotionRequest: NSFetchRequest<NSFetchRequestResult> = EmotionRecord.fetchRequest()
        let emotionDeleteRequest = NSBatchDeleteRequest(fetchRequest: emotionRequest)
        
        do {
            try context.execute(biometricDeleteRequest)
            try context.execute(emotionDeleteRequest)
            try context.save()
            print("All Core Data cleared")
        } catch {
            print("Error clearing data: \(error)")
        }
    }
    
    /// Validar integridad de los datos
    static func validateDataIntegrity() -> Bool {
        let context = PersistenceController.shared.container.viewContext
        
        // Verificar BiometricReadings
        let biometricRequest: NSFetchRequest<BiometricReading> = BiometricReading.fetchRequest()
        
        do {
            let readings = try context.fetch(biometricRequest)
            
            for reading in readings {
                // Validar que tiene timestamp
                guard reading.timestamp != nil else {
                    print("BiometricReading without timestamp found")
                    return false
                }
                
                // Validar que tiene ID
                guard reading.id != nil else {
                    print("BiometricReading without ID found")
                    return false
                }
            }
            
            print("Data integrity validation passed")
            return true
            
        } catch {
            print("Error validating data: \(error)")
            return false
        }
    }
}
