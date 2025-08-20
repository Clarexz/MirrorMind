//
//  CoreDataTest.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 20/08/25.
//


import CoreData
import Foundation

// Test para verificar que Core Data funciona
class CoreDataTest {
    
    static func createSampleBiometricReading() -> BiometricReading? {
        let context = PersistenceController.shared.container.viewContext
        
        let reading = BiometricReading(context: context)
        reading.id = UUID()
        reading.timestamp = Date()
        reading.temperature = 36.5
        reading.heartRate = 75
        reading.deviceConnected = true
        
        do {
            try context.save()
            print("✅ BiometricReading created successfully")
            return reading
        } catch {
            print("❌ Error creating BiometricReading: \(error)")
            return nil
        }
    }
    
    static func createSampleEmotionRecord(emotion: String) -> EmotionRecord? {
        let context = PersistenceController.shared.container.viewContext
        
        let record = EmotionRecord(context: context)
        record.id = UUID()
        record.timestamp = Date()
        record.emotionName = emotion
        record.selectedManually = true
        
        do {
            try context.save()
            print("✅ EmotionRecord created successfully: \(emotion)")
            return record
        } catch {
            print("❌ Error creating EmotionRecord: \(error)")
            return nil
        }
    }
}