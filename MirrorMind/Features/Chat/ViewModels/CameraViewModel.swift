//
//  CameraViewModel.swift
//  MirrorMind
//
//  Created by Camera Integration Lead on 21/08/25.
//

import Foundation
import AVFoundation
import Combine

@MainActor
class CameraViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var cameraState: CameraState = .notConfigured
    @Published var permissionStatus: CameraPermissionStatus = .notDetermined
    @Published var sessionStatus: CameraSessionStatus = .notRunning
    @Published var isSessionRunning: Bool = false
    @Published var detectionState: EmotionDetectionState = .idle
    
    // MARK: - Public Properties
    let captureSession = AVCaptureSession()
    
    // MARK: - Private Properties
    private var captureDevice: AVCaptureDevice?
    private var videoOutput: AVCaptureVideoDataOutput?
    private var cancellables = Set<AnyCancellable>()
    private var detectionConfig = DetectionConfiguration.default
    private var lastProcessingTime: Date = Date.distantPast
    
    // MARK: - Initialization
    init() {
        checkPermissionStatus()
    }

// MARK: - AVCaptureVideoDataOutputSampleBufferDelegate
extension CameraViewModel: AVCaptureVideoDataOutputSampleBufferDelegate {
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        // Check if enough time has passed since last processing
        let now = Date()
        guard now.timeIntervalSince(lastProcessingTime) >= detectionConfig.processingInterval else {
            return
        }
        
        lastProcessingTime = now
        
        // Convert sample buffer to frame data
        guard let frame = convertSampleBufferToFrame(sampleBuffer) else {
            return
        }
        
        // Process frame for emotion detection (mock for now)
        Task { @MainActor in
            await processFrameForEmotion(frame)
        }
    }
    
    private func convertSampleBufferToFrame(_ sampleBuffer: CMSampleBuffer) -> CameraFrame? {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return nil
        }
        
        // Get image dimensions
        let width = CVPixelBufferGetWidth(imageBuffer)
        let height = CVPixelBufferGetHeight(imageBuffer)
        
        // For now, create placeholder data
        // En Fase 13-14 esto se reemplazará con procesamiento real
        let metadata = FrameMetadata(
            width: width,
            height: height,
            orientation: .portrait
        )
        
        // Placeholder data - en producción extraeríamos los datos reales del buffer
        let placeholderData = Data([0x00, 0x01, 0x02, 0x03]) // Mock data
        
        return CameraFrame(image: placeholderData, metadata: metadata)
    }
    
    private func processFrameForEmotion(_ frame: CameraFrame) async {
        // Update state to processing
        detectionState = .processing
        
        // Simulate processing delay
        try? await Task.sleep(nanoseconds: 100_000_000) // 0.1 seconds
        
        // Mock emotion detection result
        // En Fase 13-14 esto se conectará con la API real
        let mockEmotions = ["happy", "calm", "sad", "anxious"]
        let randomEmotion = mockEmotions.randomElement() ?? "calm"
        let randomConfidence = Double.random(in: 0.7...0.95)
        
        let detectedEmotion = DetectedEmotion(
            emotionName: randomEmotion,
            confidence: randomConfidence,
            faceLandmarks: generateMockLandmarks()
        )
        
        detectionState = .detected(detectedEmotion)
        
        // Reset to idle after showing result
        try? await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds
        detectionState = .idle
    }
    
    private func generateMockLandmarks() -> [FaceLandmark] {
        // Mock landmarks para testing
        return [
            FaceLandmark(x: 0.3, y: 0.4, z: 0.0, type: .leftEye),
            FaceLandmark(x: 0.7, y: 0.4, z: 0.0, type: .rightEye),
            FaceLandmark(x: 0.5, y: 0.6, z: 0.1, type: .nose),
            FaceLandmark(x: 0.5, y: 0.8, z: 0.0, type: .mouth)
        ]
    }
}
    
    // MARK: - Permission Management
    func checkPermissionStatus() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch status {
        case .notDetermined:
            permissionStatus = .notDetermined
        case .denied:
            permissionStatus = .denied
            cameraState = .denied
        case .authorized:
            permissionStatus = .authorized
            configureSession()
        case .restricted:
            permissionStatus = .restricted
            cameraState = .denied
        @unknown default:
            permissionStatus = .denied
            cameraState = .denied
        }
    }
    
    func requestCameraPermission() async {
        let granted = await AVCaptureDevice.requestAccess(for: .video)
        
        if granted {
            permissionStatus = .authorized
            configureSession()
        } else {
            permissionStatus = .denied
            cameraState = .denied
        }
    }
    
    // MARK: - Session Configuration
    private func configureSession() {
        guard permissionStatus == .authorized else {
            cameraState = .denied
            return
        }
        
        do {
            // Get front camera
            guard let frontCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front) else {
                cameraState = .failed(CameraError.deviceNotAvailable)
                return
            }
            
            captureDevice = frontCamera
            
            // Create input
            let input = try AVCaptureDeviceInput(device: frontCamera)
            
            // Configure session
            captureSession.beginConfiguration()
            
            // Add input
            if captureSession.canAddInput(input) {
                captureSession.addInput(input)
            } else {
                captureSession.commitConfiguration()
                cameraState = .failed(CameraError.cannotAddInput)
                return
            }
            
            // Configure video output for frame processing
            setupVideoOutput()
            
            captureSession.commitConfiguration()
            cameraState = .configured
            
        } catch {
            cameraState = .failed(error)
        }
    }
    
    private func setupVideoOutput() {
        videoOutput = AVCaptureVideoDataOutput()
        
        guard let videoOutput = videoOutput else { return }
        
        // Configure output
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "VideoFrameQueue"))
        videoOutput.alwaysDiscardsLateVideoFrames = true
        
        // Set pixel format for easier processing
        videoOutput.videoSettings = [
            kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA
        ]
        
        if captureSession.canAddOutput(videoOutput) {
            captureSession.addOutput(videoOutput)
        }
    }
    
    // MARK: - Session Control
    func startSession() {
        guard cameraState == .configured else { return }
        
        captureSession.startRunning()
        sessionStatus = .running
        isSessionRunning = true
    }
    
    func stopSession() {
        guard isSessionRunning else { return }
        
        captureSession.stopRunning()
        sessionStatus = .notRunning
        isSessionRunning = false
    }
}

// MARK: - Camera Errors
enum CameraError: LocalizedError {
    case deviceNotAvailable
    case cannotAddInput
    
    var errorDescription: String? {
        switch self {
        case .deviceNotAvailable:
            return "Cámara frontal no disponible"
        case .cannotAddInput:
            return "No se puede configurar la entrada de cámara"
        }
    }
}
