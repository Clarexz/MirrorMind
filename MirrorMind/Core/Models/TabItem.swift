//
//  TabItem.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 18/08/25.
//


//
//  TabItem.swift
//  MirrorMind
//
//  Created by iOS Foundation Lead on 18/08/25.
//

import Foundation

/// Representa cada tab del sistema de navegación principal
enum TabItem: String, CaseIterable {
    case home = "home"
    case momentos = "momentos"
    case chat = "chat"
    case perfil = "perfil"
    
    /// Título mostrado en la interfaz
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .momentos:
            return "Momentos"
        case .chat:
            return "Chat"
        case .perfil:
            return "Perfil"
        }
    }
    
    /// Nombre del ícono del sistema SF Symbols
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .momentos:
            return "leaf"
        case .chat:
            return "message"
        case .perfil:
            return "person"
        }
    }
}