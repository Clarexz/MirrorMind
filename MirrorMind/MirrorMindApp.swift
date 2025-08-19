//
//  MirrorMindApp.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 15/07/25.
//  Optimized by iOS Foundation Lead on 18/08/25.
//

import SwiftUI

@main
struct MirrorMindApp: App {
    
    init() {
        setupAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            // Vista temporal hasta que se implemente la navegación en Fase 1
            VStack {
                Text("MirrorMind")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.Primary.brand)
                
                Text("Fundación del proyecto completada")
                    .font(.subheadline)
                    .foregroundColor(Color.Text.secondary)
                    .padding()
                
                Text("Listo para Fase 1: Sistema de Navegación")
                    .font(.caption)
                    .foregroundColor(Color.Text.primary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.Primary.background)
            .preferredColorScheme(ColorScheme.light)
        }
    }
    
    /// Configura la apariencia global de la aplicación
    private func setupAppearance() {
        // Configurar fuente predeterminada si está disponible
        if UIFont(name: DesignConstants.Typography.fontFamily, size: 16) != nil {
            // Roboto está disponible, configuraciones adicionales si es necesario
        }
    }
}
