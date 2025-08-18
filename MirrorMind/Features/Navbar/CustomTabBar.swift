//
//  CustomTabBar.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 21/07/25.
//


import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<tabItems.count, id: \.self) { index in
                TabBarButton(
                    item: tabItems[index],
                    isSelected: selectedTab == index
                ) {
                    selectedTab = index // ← Sin withAnimation
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.primaryGreen) // Fondo verde como en tu diseño
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        )
        .padding(.horizontal, 20)
        .padding(.bottom, 0) // Espacio desde el bottom para que "flote"
    }
}
