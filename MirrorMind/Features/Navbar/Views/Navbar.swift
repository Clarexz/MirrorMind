//
//  Navbar.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 18/08/25.
//


// Features/Navbar/Views/Navbar.swift
import SwiftUI

struct Navbar: View {
    @State private var selectedTab: TabItem = .home
    
    var body: some View {
        ZStack {
            Color.Primary.background
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Contenido principal
                TabView(selection: $selectedTab) {
                    // Vista Home (temporal)
                    TemporaryHomeView()
                        .tag(TabItem.home)
                    
                    // Vista Momentos (temporal) 
                    TemporaryMomentosView()
                        .tag(TabItem.momentos)
                    
                    // Vista Chat (temporal)
                    TemporaryChatView()
                        .tag(TabItem.chat)
                    
                    // Vista Perfil (temporal)
                    TemporaryPerfilView()
                        .tag(TabItem.perfil)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                Spacer()
                
                // Tab Bar personalizado
                CustomTabBar(selectedTab: $selectedTab)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
            }
        }
    }
}

#Preview {
    Navbar()
}

// MARK: - Vistas Temporales
struct TemporaryHomeView: View {
    var body: some View {
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Primary.background)
    }
}

struct TemporaryMomentosView: View {
    var body: some View {
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Primary.background)
    }
}

struct TemporaryChatView: View {
    var body: some View {
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Primary.background)
    }
}

struct TemporaryPerfilView: View {
    var body: some View {
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Primary.background)
    }
}
