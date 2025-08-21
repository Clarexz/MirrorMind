//
//  CameraPreview.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 21/08/25.
//  Updated by Camera Integration Lead on 21/08/25.
//

import SwiftUI
import AVFoundation

struct CameraPreview: View {
    @ObservedObject var cameraViewModel: CameraViewModel
    let isCameraOn: Bool
    
    var body: some View {
        ZStack {
            if isCameraOn && cameraViewModel.isSessionRunning {
                // Preview real de la cámara
                CameraPreviewLayer(session: cameraViewModel.captureSession)
                    .frame(height: 240)
                    .cornerRadius(DesignConstants.Radius.card)
            } else {
                // Placeholder cuando la cámara está apagada
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
            
            // Overlay de estado de permisos
            if cameraViewModel.permissionStatus == .denied {
                Rectangle()
                    .fill(Color.black.opacity(0.8))
                    .frame(height: 240)
                    .cornerRadius(DesignConstants.Radius.card)
                    .overlay(
                        VStack(spacing: 12) {
                            Image(systemName: "exclamationmark.triangle")
                                .font(.system(size: 40))
                                .foregroundColor(.orange)
                            
                            Text("Permisos de cámara denegados")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                            Text("Ve a Configuración para activar")
                                .font(.system(size: 14))
                                .foregroundColor(.white.opacity(0.8))
                                .multilineTextAlignment(.center)
                        }
                    )
            }
        }
    }
    
    private var cameraIcon: String {
        if cameraViewModel.permissionStatus == .denied {
            return "exclamationmark.triangle"
        }
        return isCameraOn ? "video.fill" : "video.slash"
    }
    
    private var statusText: String {
        switch cameraViewModel.permissionStatus {
        case .denied:
            return "Permisos denegados"
        case .notDetermined:
            return "Permisos pendientes"
        case .authorized:
            return isCameraOn ? "Cámara activa\nDetectando emociones..." : "Cámara desactivada\nActiva para comenzar"
        case .restricted:
            return "Cámara restringida"
        }
    }
}

// MARK: - UIViewRepresentable para AVCaptureVideoPreviewLayer
struct CameraPreviewLayer: UIViewRepresentable {
    let session: AVCaptureSession
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        if let previewLayer = uiView.layer.sublayers?.first as? AVCaptureVideoPreviewLayer {
            DispatchQueue.main.async {
                previewLayer.frame = uiView.bounds
            }
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        Text("Vista previa con ViewModel:")
        CameraPreview(cameraViewModel: CameraViewModel(), isCameraOn: true)
    }
    .padding()
    .background(Color.Primary.background)
}
