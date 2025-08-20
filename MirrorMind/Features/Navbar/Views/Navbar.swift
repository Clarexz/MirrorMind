//
//  Navbar.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 18/08/25.
//

import SwiftUI

struct Navbar: View {
    @State private var selectedTab: TabItem = .home
    
    var body: some View {
        ZStack {
            // Fondo principal que ocupa toda la pantalla
            Color.Primary.background
                .ignoresSafeArea(.all)
            
            // Contenido principal SIN TabView limitante
            Group {
                switch selectedTab {
                case .home:
                    HomeScreen()
                case .momentos:
                    TemporaryMomentosView()
                case .chat:
                    TemporaryChatView()
                case .perfil:
                    TemporaryPerfilView()
                }
            }
            
            // Navbar flotante en la parte inferior
            VStack {
                Spacer()
                
                CustomTabBar(selectedTab: $selectedTab)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 8)
            }
        }
    }
}

#Preview {
    Navbar()
}

// MARK: - Vistas Temporales (sin cambios)
struct TemporaryHomeView: View {
    var body: some View {
        ZStack {
            Color.Primary.background
                .ignoresSafeArea(.all)
            
            VStack(spacing: 20) {
                Image(systemName: "house.fill")
                    .font(.system(size: 60))
                    .foregroundColor(Color.Primary.brand)
                
                Text("Vista Home")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.Text.primary)
                
                Text("Aquí irá el dashboard principal\ncon selector de emociones")
                    .font(.system(size: 16))
                    .foregroundColor(Color.Text.secondary)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct TemporaryMomentosView: View {
    var body: some View {
        ZStack {
            Color.Primary.background
                .ignoresSafeArea(.all)
            
            VStack(spacing: 20) {
                Image(systemName: "leaf.fill")
                    .font(.system(size: 60))
                    .foregroundColor(Color.Emotions.happy)
                
                Text("Vista Momentos")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.Text.primary)
                
                Text("Aquí irán las categorías\nde ejercicios y videos")
                    .font(.system(size: 16))
                    .foregroundColor(Color.Text.secondary)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct TemporaryChatView: View {
    var body: some View {
        ZStack {
            Color.Primary.background
                .ignoresSafeArea(.all)
            
            VStack(spacing: 20) {
                Image(systemName: "message.fill")
                    .font(.system(size: 60))
                    .foregroundColor(Color.Primary.brand)
                
                Text("Vista Chat")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.Text.primary)
                
                Text("Aquí irá el chat\ncon Olivia IA")
                    .font(.system(size: 16))
                    .foregroundColor(Color.Text.secondary)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct TemporaryPerfilView: View {
    var body: some View {
        ZStack {
            Color.Primary.background
                .ignoresSafeArea(.all)
            
            VStack(spacing: 20) {
                Image(systemName: "person.fill")
                    .font(.system(size: 60))
                    .foregroundColor(Color.Text.secondary)
                
                Text("Vista Perfil")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.Text.primary)
                
                Text("Aquí irá la configuración\ny datos del usuario")
                    .font(.system(size: 16))
                    .foregroundColor(Color.Text.secondary)
                    .multilineTextAlignment(.center)
            }
        }
    }
}
