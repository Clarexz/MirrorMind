//
//  CustomTabBar.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 18/08/25.
//


// Features/Navbar/Views/CustomTabBar.swift
import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: TabItem
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TabItem.allCases) { tab in
                TabBarButton(
                    item: tab,
                    isSelected: selectedTab == tab,
                    action: {
                        selectedTab = tab
                    }
                )
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 12)
        .padding(.bottom, 8)
        .background(Color.Primary.brand)
        .cornerRadius(25)
        .shadow(
            color: DesignConstants.Shadow.card,
            radius: DesignConstants.Shadow.cardRadius,
            x: DesignConstants.Shadow.cardOffset.width,
            y: DesignConstants.Shadow.cardOffset.height
        )
    }
}

#Preview {
    @State var selectedTab: TabItem = .home
    
    return VStack {
        Spacer()
        CustomTabBar(selectedTab: $selectedTab)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
    }
    .background(Color.Primary.background)
}