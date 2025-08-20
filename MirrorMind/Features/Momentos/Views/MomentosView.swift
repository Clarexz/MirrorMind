//
//  MomentosView.swift
//  MirrorMind
//
//  Created by Moments Structure Lead on 20/08/25.
//

import SwiftUI

struct MomentosView: View {
    @State private var currentTip = MomentCategory.randomTip()
    
    var body: some View {
        ZStack {
            // Fondo principal
            Color.Primary.background
                .ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
                // Barra superior fija
                headerView
                
                // Contenido scrolleable
                ScrollView {
                    LazyVStack(spacing: 20) {
                        // Botones de filtro
                        filterButtonsView
                        
                        // Grid de categorías
                        categoriesGridView
                        
                        // Dato curioso
                        tipCardView
                        
                        // Espaciado bottom para navbar
                        Spacer()
                            .frame(height: 160)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                }
            }
        }
    }
}

// MARK: - Header View
private extension MomentosView {
    var headerView: some View {
        HStack {
            // Avatar circular
            Circle()
                .fill(Color.Primary.brand)
                .frame(width: 40, height: 40)
                .overlay(
                    Image(systemName: "person.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                )
            
            Spacer()
            
            // Burbuja de pregunta
            HStack {
                Text("¿Qué necesitas hoy?")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            }
            .background(Color.Primary.brand)
            .cornerRadius(20)
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
        .padding(.bottom, 15)
        .background(Color.Primary.background)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color.Text.secondary.opacity(0.1)),
            alignment: .bottom
        )
    }
}

// MARK: - Filter Buttons View
private extension MomentosView {
    var filterButtonsView: some View {
        HStack(spacing: 12) {
            // Botón Favoritos
            Button(action: {
                // TODO: Implementar filtro favoritos en Fase 9
            }) {
                HStack(spacing: 6) {
                    Image(systemName: "heart")
                        .font(.system(size: 12, weight: .medium))
                    Text("Favoritos")
                        .font(.system(size: 12, weight: .medium))
                }
                .foregroundColor(Color.Text.secondary)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(
                    color: DesignConstants.Shadow.card,
                    radius: 2,
                    x: 0,
                    y: 1
                )
            }
            
            // Botón Filtros
            Button(action: {
                // TODO: Implementar filtros emocionales en Fase 9
            }) {
                HStack(spacing: 6) {
                    Image(systemName: "slider.horizontal.3")
                        .font(.system(size: 12, weight: .medium))
                    Text("Filtros")
                        .font(.system(size: 12, weight: .medium))
                }
                .foregroundColor(Color.Text.secondary)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.white)
                .cornerRadius(16)
                .shadow(
                    color: DesignConstants.Shadow.card,
                    radius: 2,
                    x: 0,
                    y: 1
                )
            }
            
            Spacer()
        }
    }
}

// MARK: - Categories Grid View
private extension MomentosView {
    var categoriesGridView: some View {
        VStack(spacing: 12) {
            // Grid 2x2 para las primeras 4 categorías
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 12),
                GridItem(.flexible(), spacing: 12)
            ], spacing: 12) {
                ForEach(Array(MomentCategory.allCategories.prefix(4))) { category in
                    CategoryCardView(category: category)
                }
            }
            
            // Quinta categoría ocupa todo el ancho
            if let lastCategory = MomentCategory.allCategories.last {
                CategoryCardView(category: lastCategory, isFullWidth: true)
            }
        }
    }
}

// MARK: - Tip Card View
private extension MomentosView {
    var tipCardView: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .font(.system(size: 16))
                    .foregroundColor(Color.Emotions.anxious)
                
                Text("Dato curioso")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color.Text.primary)
                
                Spacer()
            }
            
            Text(currentTip)
                .font(.system(size: 12))
                .foregroundColor(Color.Text.secondary)
                .multilineTextAlignment(.leading)
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(DesignConstants.Radius.card)
        .shadow(
            color: DesignConstants.Shadow.card,
            radius: DesignConstants.Shadow.cardRadius,
            x: DesignConstants.Shadow.cardOffset.width,
            y: DesignConstants.Shadow.cardOffset.height
        )
        .onAppear {
            // Cambiar tip cada vez que aparece la vista
            currentTip = MomentCategory.randomTip()
        }
    }
}

#Preview {
    MomentosView()
}
