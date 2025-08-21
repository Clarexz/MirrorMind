//
//  CameraPreview.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 21/08/25.
//

import SwiftUI

struct CameraPreview: View {
    let isCameraOn: Bool
    
    var body: some View {
        Rectangle()
            .fill(Color.black)
            .frame(height: 240)
            .cornerRadius(DesignConstants.Radius.card)
            .overlay(
                VStack(spacing: 12) {
                    Image(systemName: cameraIcon)
                        .font(.system(size: 40))
                        .foregroundColor(.white.opacity(0.6))
                    
                    Text(statusText)
                        .font(.system(size: 16))
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                }
            )
    }
    
    private var cameraIcon: String {
        isCameraOn ? "video.fill" : "video.slash"
    }
    
    private var statusText: String {
        isCameraOn ? "Cámara activa\nDetectando emociones..." : "Cámara desactivada\nActiva para comenzar"
    }
}

#Preview {
    VStack(spacing: 20) {
        Text("Cámara desactivada:")
        CameraPreview(isCameraOn: false)
        
        Text("Cámara activada:")
        CameraPreview(isCameraOn: true)
    }
    .padding()
    .background(Color.Primary.background)
}
