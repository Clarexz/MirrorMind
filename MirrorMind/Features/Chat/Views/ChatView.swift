//
//  ChatView.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 21/08/25.
//

import SwiftUI

struct ChatView: View {
    @State private var isCameraOn = false
    @State private var isSmartbandConnected = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Header con título Olivia
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Olivia")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color.Text.primary)
                    
                    Text("Tu compañera de bienestar")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color.Text.secondary)
                }
                
                Spacer()
                
                // Avatar de Olivia
                Circle()
                    .fill(Color.Primary.brand)
                    .frame(width: 45, height: 45)
                    .overlay(
                        Text("O")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                    )
            }
            .padding(.horizontal, DesignConstants.Spacing.containerPadding)
            .padding(.top, 10)
            .padding(.bottom, 20)
            .background(Color.Primary.background)
            
            // Contenido principal
            ScrollView {
                VStack(spacing: DesignConstants.Spacing.sectionMargin) {
                    // Placeholder para el preview de cámara
                    VStack(spacing: 16) {
                        Text("Vista en vivo")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color.Text.primary)
                        
                        // Preview de cámara
                        CameraPreview(isCameraOn: isCameraOn)
                    }
                    .padding(.horizontal, DesignConstants.Spacing.containerPadding)
                    
                    // Botón toggle cámara
                    HStack {
                        Spacer()
                        CameraToggleButton(isCameraOn: $isCameraOn)
                        Spacer()
                    }
                    .padding(.horizontal, DesignConstants.Spacing.containerPadding)
                    
                    // Botón simular conexión smartband
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            isSmartbandConnected.toggle()
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: isSmartbandConnected ? "checkmark.circle.fill" : "plus.circle.fill")
                                    .font(.system(size: 16, weight: .medium))
                                    .frame(width: 16, height: 16)
                                
                                Text(isSmartbandConnected ? "Smartband conectada" : "Conectar smartband")
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .frame(height: 44)
                            .background(isSmartbandConnected ? Color.green : Color.Primary.brand)
                            .foregroundColor(.white)
                            .cornerRadius(DesignConstants.Radius.button)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                    }
                    .padding(.horizontal, DesignConstants.Spacing.containerPadding)

                    // Datos biométricos
                    BiometricDisplay(isConnected: isSmartbandConnected)
                        .padding(.horizontal, DesignConstants.Spacing.containerPadding)
                    
                    // Espaciado para el navbar
                    Color.clear
                        .frame(height: 100)
                }
            }
        }
        .background(Color.Primary.background)
    }
}

#Preview {
    ChatView()
}
