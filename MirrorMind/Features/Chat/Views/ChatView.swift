//
//  ChatView.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 21/08/25.
//  Updated by Camera Integration Lead on 21/08/25.
//

import SwiftUI

struct ChatView: View {
    @StateObject private var cameraViewModel = CameraViewModel()
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
                        
                        // Preview de cámara con ViewModel
                        CameraPreview(cameraViewModel: cameraViewModel, isCameraOn: isCameraOn)
                    }
                    .padding(.horizontal, DesignConstants.Spacing.containerPadding)
                    
                    // Botón toggle cámara con lógica de permisos
                    HStack {
                        Spacer()
                        CameraToggleButton(isCameraOn: $isCameraOn)
                            .onTapGesture {
                                handleCameraToggle()
                            }
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
                                Image(systemName: isSmartbandConnected ? "checkmark.circle.fill" : "circle")
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text(isSmartbandConnected ? "Smartband conectada" : "Conectar smartband")
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .background(Color.Primary.brand)
                            .foregroundColor(.white)
                            .cornerRadius(DesignConstants.Radius.button)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Spacer()
                    }
                    .padding(.horizontal, DesignConstants.Spacing.containerPadding)
                    
                    // Display biométrico
                    VStack(spacing: 16) {
                        Text("Datos biométricos")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color.Text.primary)
                        
                        BiometricDisplay(isConnected: isSmartbandConnected)
                    }
                    .padding(.horizontal, DesignConstants.Spacing.containerPadding)
                    
                    // Espaciado para navbar flotante
                    Spacer()
                        .frame(height: 100)
                }
            }
        }
        .onAppear {
            cameraViewModel.checkPermissionStatus()
        }
        .onChange(of: isCameraOn) {
            if isCameraOn {
                if cameraViewModel.permissionStatus == .notDetermined {
                    Task {
                        await cameraViewModel.requestCameraPermission()
                    }
                }
                cameraViewModel.startSession()
            } else {
                cameraViewModel.stopSession()
            }
        }
    }
    
    // MARK: - Private Methods
    private func handleCameraToggle() {
        if cameraViewModel.permissionStatus == .denied {
            // TODO: Mostrar alerta para ir a configuración
            print("Permisos denegados - dirigir a configuración")
            return
        }
        
        isCameraOn.toggle()
    }
}

#Preview {
    ChatView()
        .background(Color.Primary.background)
}
