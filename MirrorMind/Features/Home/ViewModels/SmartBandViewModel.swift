//
//  SmartBandViewModel.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 20/08/25.
//


import SwiftUI
import Combine
import CoreData

class SmartBandViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var connectionState: SmartBandConnectionState = .disconnected
    @Published var currentReading: LiveBiometricData?
    @Published var isConnecting: Bool = false
    
    // MARK: - Private Properties
    private var biometricTimer: Timer?
    private var connectionTimer: Timer?
    private let persistenceController = PersistenceController.shared
    
    // MARK: - Public Methods
    
    /// Iniciar proceso de conexión del SmartBand
    func connectDevice() {
        guard connectionState == .disconnected else { return }
        
        isConnecting = true
        connectionState = .connecting
        
        // Simular proceso de conexión (2-3 segundos)
        connectionTimer = Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { [weak self] _ in
            self?.completeConnection()
        }
    }
    
    /// Desconectar el SmartBand
    func disconnectDevice() {
        connectionState = .disconnected
        isConnecting = false
        currentReading = nil
        
        // Limpiar timers
        biometricTimer?.invalidate()
        connectionTimer?.invalidate()
    }
    
    // MARK: - Private Methods
    
    private func completeConnection() {
        connectionState = .connected
        isConnecting = false
        
        // Generar primera lectura
        generateNewReading()
        
        // Iniciar timer para datos biométricos cada 3 segundos
        startBiometricTimer()
    }
    
    private func startBiometricTimer() {
        biometricTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] _ in
            self?.generateNewReading()
        }
    }
    
    private func generateNewReading() {
        // Generar datos biométricos realistas con variación
        let baseTemp = 36.5
        let baseHR = 75
        
        let tempVariation = Double.random(in: -0.5...0.5)
        let hrVariation = Int.random(in: -10...15)
        
        let newReading = LiveBiometricData(
            temperature: baseTemp + tempVariation,
            heartRate: baseHR + hrVariation
        )
        
        currentReading = newReading
        
        // Guardar en Core Data
        saveToCoreData(reading: newReading)
    }
    
    private func saveToCoreData(reading: LiveBiometricData) {
        let context = persistenceController.container.viewContext
        
        let biometricReading = BiometricReading(context: context)
        biometricReading.id = UUID()
        biometricReading.timestamp = reading.timestamp
        biometricReading.temperature = reading.temperature
        biometricReading.heartRate = Int32(reading.heartRate)
        biometricReading.deviceConnected = (connectionState == .connected)
        
        persistenceController.save()
    }
    
    // MARK: - Data Access Methods
    /// Obtener las últimas lecturas biométricas desde Core Data
    func getRecentReadings(limit: Int = 10) -> [BiometricReading] {
        let context = persistenceController.container.viewContext
        let request: NSFetchRequest<BiometricReading> = BiometricReading.fetchRequest()
        
        // Ordenar por timestamp descendente
        request.sortDescriptors = [NSSortDescriptor(keyPath: \BiometricReading.timestamp, ascending: false)]
        request.fetchLimit = limit
        
        do {
            return try context.fetch(request)
        } catch {
            print("Error fetching biometric readings: \(error)")
            return []
        }
    }
    
    /// Obtener promedio de temperatura del día actual
    func getTodayAverageTemperature() -> Double? {
        let readings = getReadingsForToday()
        let validTemperatures = readings.compactMap { $0.temperature > 0 ? $0.temperature : nil }
        
        guard !validTemperatures.isEmpty else { return nil }
        return validTemperatures.reduce(0, +) / Double(validTemperatures.count)
    }
    
    /// Obtener promedio de heart rate del día actual
    func getTodayAverageHeartRate() -> Double? {
        let readings = getReadingsForToday()
        let validHeartRates = readings.compactMap { $0.heartRate > 0 ? Double($0.heartRate) : nil }
        
        guard !validHeartRates.isEmpty else { return nil }
        return validHeartRates.reduce(0, +) / Double(validHeartRates.count)
    }
    
    private func getReadingsForToday() -> [BiometricReading] {
        let context = persistenceController.container.viewContext
        let request: NSFetchRequest<BiometricReading> = BiometricReading.fetchRequest()
        
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: Date())
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        
        request.predicate = NSPredicate(format: "timestamp >= %@ AND timestamp < %@", startOfDay as NSDate, endOfDay as NSDate)
        
        do {
            return try context.fetch(request)
        } catch {
            print("Error fetching today's readings: \(error)")
            return []
        }
    }
    
    // MARK: - Deinitializer
    deinit {
        biometricTimer?.invalidate()
        connectionTimer?.invalidate()
    }
}
