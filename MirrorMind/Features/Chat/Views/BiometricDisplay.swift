//
//  BiometricDisplay.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 21/08/25.
//

import SwiftUI

struct BiometricDisplay: View {
    let isConnected: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Datos en tiempo real")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color.Text.primary)
                
                Spacer()
                
                // Indicador de conexión
                HStack(spacing: 6) {
                    Circle()
                        .fill(connectionColor)
                        .frame(width: 8, height: 8)
                        .animation(.easeInOut(duration: 0.3), value: isConnected)
                    
                    Text(connectionStatus)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color.Text.secondary)
                }
            }
            
            VStack(spacing: 12) {
                // Frecuencia cardíaca
                BiometricCard(
                    icon: "heart.fill",
                    iconColor: .red,
                    title: "Frecuencia cardíaca",
                    value: heartRateValue,
                    unit: "bpm"
                )
                
                // Temperatura corporal
                BiometricCard(
                    icon: "thermometer",
                    iconColor: .orange,
                    title: "Temperatura corporal",
                    value: temperatureValue,
                    unit: "°C"
                )
            }
        }
    }
    
    private var connectionColor: Color {
        isConnected ? .green : .gray
    }
    
    private var connectionStatus: String {
        isConnected ? "Smartband conectada" : "Conectando..."
    }
    
    private var heartRateValue: String {
        isConnected ? "72" : "--"
    }
    
    private var temperatureValue: String {
        isConnected ? "36.5" : "--"
    }
}

struct BiometricCard: View {
    let icon: String
    let iconColor: Color
    let title: String
    let value: String
    let unit: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(iconColor)
                .font(.system(size: 20))
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color.Text.primary)
                
                HStack(alignment: .bottom, spacing: 2) {
                    Text(value)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color.Text.primary)
                    
                    Text(unit)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color.Text.secondary)
                        .padding(.bottom, 1)
                }
            }
            
            Spacer()
        }
        .padding()
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

#Preview {
    VStack(spacing: 20) {
        Text("Conectado:")
        BiometricDisplay(isConnected: true)
        
        Text("Desconectado:")
        BiometricDisplay(isConnected: false)
    }
    .padding()
    .background(Color.Primary.background)
}
