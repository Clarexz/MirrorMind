//
//  ChatScreen.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 21/08/25.
//

import SwiftUI

struct ChatScreen: View {
    var body: some View {
        ZStack {
            // Fondo que ocupa toda la pantalla
            Color.Primary.background
                .ignoresSafeArea(.all)
            
            // Contenido principal
            ChatView()
        }
    }
}

#Preview {
    ChatScreen()
}
