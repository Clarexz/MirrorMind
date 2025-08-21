# MirrorMind iOS

<div align="center">

![Swift](https://img.shields.io/badge/Swift-5.0-FA7343?style=for-the-badge&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-iOS_26+-2196F3?style=for-the-badge&logo=swift&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completado-28a745?style=for-the-badge)
![Architecture](https://img.shields.io/badge/Architecture-MVVM-purple?style=for-the-badge)

**Aplicación iOS para la Identificación y Manejo de las Emociones con IA + IoT**

*Sistema de gestión emocional personalizado para estudiantes universitarios*

[Características](#características) • [Instalación](#instalación) • [Arquitectura](#arquitectura) • [Uso](#cómo-usar-la-app) • [Desarrollo](#desarrollo)

</div>

## Descripción

MirrorMind es una aplicación iOS innovadora que combina inteligencia artificial, análisis biométrico mediante smartband, y ejercicios personalizados para ayudar a estudiantes universitarios en la gestión de sus emociones. La app detecta estados emocionales y proporciona contenido adaptado para mejorar el bienestar emocional y el rendimiento académico.

### Problemática Abordada

El deterioro de la salud mental y la dificultad en el manejo de emociones ha aumentado significativamente en estudiantes universitarios, generando impacto directo en el rendimiento académico y calidad de vida. MirrorMind ofrece una solución tecnológica integral que combina detección emocional automática con contenido personalizado.

## Características

### Funcionalidades Principales

- **Selector de Emociones Inteligente**: Grid de 6 emociones con detección visual y contenido adaptativo
- **Sistema de Filtros Avanzado**: Organización de contenido por favoritos y estados emocionales
- **Reproductor de Ejercicios**: Experiencia completa con controles multimedia y progreso en tiempo real
- **Integración IoT**: Monitoreo biométrico mediante smartband con sincronización automática
- **Asistente IA "Olivia"**: Tips personalizados y consejos contextuales según el estado emocional
- **Analytics Emocional**: Gráficos semanales con análisis de patrones y tendencias
- **Persistencia Inteligente**: Sincronización automática con iCloud y almacenamiento local

### Vistas Principales

#### Home - Dashboard Personalizado
- **Saludo dinámico** con avatar personalizable
- **Selector de emociones** reactivo (6 estados: Triste, Enojado, Ansioso, Nervioso, Feliz, Calmado)
- **Ejercicios recomendados** con scroll horizontal de 28 ejercicios categorizados
- **Widget SmartBand** con datos biométricos en tiempo real
- **Gráfico semanal emocional** con análisis automático de tendencias
- **Tips de Olivia** contextuales con rotación inteligente

#### Momentos - Centro de Ejercicios
- **5 categorías organizadas**: Respirar, Meditar, Moverte, Reflexionar, Crecer
- **Sistema de filtros completo**:
  - Filtro por favoritos con persistencia local
  - Filtro por emociones con menú desplegable
  - Combinación inteligente de múltiples filtros
- **Grid responsivo** con layout 2x2+1 optimizado
- **Estados vacíos informativos** cuando no hay contenido
- **15 ejercicios especializados** (3 por categoría) con reproductor integrado

#### Reproductor de Ejercicios
- **Reproductor multimedia completo** con controles profesionales
- **Barra de progreso interactiva** con navegación por gestos
- **Controles de skip** (±15 segundos) y play/pause
- **Sistema de favoritos** integrado con persistencia
- **Colores dinámicos** según la categoría del ejercicio
- **Timer en tiempo real** con actualizaciones cada 0.1 segundos

## Arquitectura

### Stack Tecnológico

```
SwiftUI + MVVM + Core Data + CloudKit
```

- **Lenguaje**: Swift 5.0
- **Framework UI**: SwiftUI (declarativo)
- **Arquitectura**: MVVM (Model-View-ViewModel)
- **Persistencia**: Core Data + CloudKit para sincronización
- **Navegación**: NavigationStack nativo de SwiftUI
- **Estado**: @StateObject, @ObservableObject, @Published

### Estructura del Proyecto

```
MirrorMind/
├── Core/
│   ├── Models/                          # Modelos centrales
│   │   ├── TabItem.swift               # Navegación principal
│   │   └── PersistenceController.swift # Core Data + CloudKit
│   └── Extensions/
│       └── Color+Extensions.swift      # Sistema de colores
│
├── Config/
│   ├── AppConfig.swift                 # Configuraciones generales
│   └── DesignConstants.swift           # Constantes de diseño
│
├── Features/
│   ├── Common/
│   │   ├── Models/
│   │   │   ├── Emotion.swift           # 6 emociones del sistema
│   │   │   ├── Exercise.swift          # 28 ejercicios completos
│   │   │   ├── Tip.swift              # Sistema de tips de Olivia
│   │   │   └── EmotionalData.swift     # Analytics emocionales
│   │   └── Views/Components/
│   │       ├── EmotionSelector.swift   # Selector de emociones
│   │       ├── ExerciseCard.swift      # Tarjetas de ejercicios
│   │       └── OlivaTipsCard.swift     # Componente de tips
│   │
│   ├── Home/
│   │   ├── Views/
│   │   │   ├── HomeView.swift          # Dashboard principal
│   │   │   ├── WeeklyChart.swift       # Gráfico semanal
│   │   │   └── SmartBandWidget.swift   # Widget biométrico
│   │   └── ViewModels/
│   │       ├── EmotionSelectorViewModel.swift
│   │       ├── ExerciseViewModel.swift
│   │       └── WeeklyDataViewModel.swift
│   │
│   ├── Momentos/
│   │   ├── Views/
│   │   │   ├── MomentosView.swift      # Vista principal con filtros
│   │   │   ├── CategoryView.swift      # Lista por categoría
│   │   │   ├── ExercisePlayerView.swift # Reproductor completo
│   │   │   └── EmotionFilters.swift    # Sistema de filtros
│   │   ├── ViewModels/
│   │   │   ├── MomentosViewModel.swift # Filtros y favoritos
│   │   │   └── ExercisePlayerViewModel.swift
│   │   └── Models/
│   │       └── MomentCategory.swift    # 5 categorías
│   │
│   └── Navbar/
│       └── Views/
│           └── Navbar.swift            # Navegación principal
│
└── Resources/
    └── Assets.xcassets/
        └── Colors/                     # Sistema completo de colores
```

### Patrones de Diseño Implementados

#### MVVM (Model-View-ViewModel)
- **Models**: Datos y lógica de negocio (`Exercise`, `Emotion`, `Tip`)
- **Views**: UI declarativa con SwiftUI (`HomeView`, `MomentosView`)
- **ViewModels**: Estado y lógica de presentación (`@ObservableObject`)

#### Inyección de Dependencias
```swift
@StateObject private var emotionViewModel = EmotionSelectorViewModel()
@StateObject private var momentosViewModel = MomentosViewModel()
```

#### Singleton Pattern
```swift
// Base de datos de tips centralizada
OliviaTipsDatabase.shared

// Controlador de persistencia global
PersistenceController.shared
```

#### Observer Pattern
```swift
@Published var selectedEmotion: Emotion?
@Published var showFavoritesOnly: Bool = false
@Published var filteredExercises: [Exercise] = []
```

## Cómo Usar la App

### Flujo Principal de Usuario

#### 1. Inicio - Reconocimiento Emocional
```
Home → Selector de Emociones → Contenido Personalizado
```

1. **Abrir la app** en la pestaña "Inicio"
2. **Seleccionar tu emoción actual** del grid de 6 opciones
3. **Ver contenido adaptado**: ejercicios, tips y análisis personalizados
4. **Monitorear datos biométricos** en el widget SmartBand

#### 2. Exploración - Ejercicios por Categorías
```
Momentos → Filtros → Categoría → Ejercicio → Reproductor
```

1. **Navegar a "Momentos"** desde el tab bar
2. **Aplicar filtros** por favoritos o emociones específicas
3. **Seleccionar una categoría** (Respirar, Meditar, Moverte, etc.)
4. **Elegir un ejercicio** de la lista especializada
5. **Usar el reproductor** con controles completos

#### 3. Seguimiento - Analytics y Progreso
```
Home → Gráfico Semanal → Análisis de Tendencias
```

1. **Revisar el gráfico semanal** en la vista Home
2. **Analizar patrones emocionales** y emoción predominante
3. **Leer tips de Olivia** contextualizada a tu estado
4. **Marcar ejercicios como favoritos** para acceso rápido

### Características Avanzadas

#### Sistema de Filtros
- **Filtro por Favoritos**: Muestra solo ejercicios guardados
- **Filtro por Emoción**: 6 opciones con toggle intuitivo
- **Combinación**: Ambos filtros funcionan simultáneamente
- **Estados Vacíos**: Mensajes informativos cuando no hay contenido

#### Persistencia de Datos
- **Favoritos**: Guardados localmente con UserDefaults
- **Datos Biométricos**: Core Data + CloudKit para sincronización
- **Analytics**: Historial emocional con análisis automático
- **Preferencias**: Estado de filtros y selecciones

#### Integración SmartBand
- **Datos en Tiempo Real**: Temperatura y BPM cada 3 segundos
- **Estados Visuales**: Conectado, Desconectado, Sincronizando
- **Persistencia**: Historial completo en Core Data
- **Privacidad**: Datos almacenados en iCloud del usuario

## Desarrollo

### Design System

#### Paleta de Colores
```swift
// Emociones - Según especificaciones del proyecto
Color.Emotions.sad          // #7BA3D0 - Azul sereno
Color.Emotions.angry        // #E07A7A - Coral suave  
Color.Emotions.anxious      // #F4C542 - Mostaza suave
Color.Emotions.nervous      // #E89C65 - Durazno cálido
Color.Emotions.happy        // #7FC383 - Verde menta
Color.Emotions.calm         // #A8B8E8 - Lavanda suave

// Principales
Color.Primary.background    // #F0F8FF - Fondo principal
Color.Primary.brand         // #2D5A4A - Verde marca

// Texto
Color.Text.primary          // #2D3748 - Títulos
Color.Text.secondary        // #4A5568 - Subtítulos
```

#### Constantes de Diseño
```swift
// Espaciado consistente
DesignConstants.Spacing.containerPadding    // 20pt
DesignConstants.Spacing.cardPadding         // 16pt
DesignConstants.Spacing.sectionMargin       // 24pt

// Bordes redondeados
DesignConstants.Radius.card                 // 16pt
DesignConstants.Radius.button               // 12pt
DesignConstants.Radius.emotion              // 50pt

// Sombras profesionales
DesignConstants.Shadow.card                 // Configuración completa
```

### Modelos de Datos Principales

#### Exercise - Sistema de Ejercicios
```swift
struct Exercise: Identifiable, Codable {
    let id: UUID
    let name: String
    let description: String
    let duration: TimeInterval          // En segundos
    let category: ExerciseCategory      // 5 categorías
    let targetEmotions: [Emotion]       // Emociones objetivo
    let thumbnailName: String           // Asset de imagen
    let difficulty: Difficulty          // Nivel de dificultad
}

// 28 ejercicios pre-cargados organizados por categoría:
// Respirar (3), Meditar (3), Moverte (3), Reflexionar (3), Crecer (3)
```

#### Emotion - Estados Emocionales
```swift
struct Emotion: Identifiable, Codable, Hashable {
    let id: UUID
    let name: String                    // "Feliz", "Triste", etc.
    let color: String                   // Referencia a Color.Emotions.*
    let icon: String                    // SF Symbol
    
    static let emotions: [Emotion] = [
        // 6 emociones predefinidas del sistema
    ]
}
```

#### EmotionalData - Analytics
```swift
struct EmotionalData: Identifiable, Codable {
    let id: UUID
    let date: Date
    let emotion: Emotion
    let intensity: Double               // 0.0 - 1.0
    let biometricContext: BiometricContext?
}

struct WeeklyEmotionalSummary {
    let week: [DailyEmotionalData]      // Lunes a Domingo
    let predominantEmotion: Emotion?    // Análisis automático
    let insightText: String             // Generado dinámicamente
}
```

### ViewModels Principales

#### MomentosViewModel - Filtros y Estado
```swift
class MomentosViewModel: ObservableObject {
    @Published var showFavoritesOnly: Bool = false
    @Published var selectedEmotionFilter: Emotion? = nil
    @Published var isEmotionFilterMenuOpen: Bool = false
    
    // Computed property con lógica de filtrado
    var filteredExercises: [Exercise] {
        // Combina filtros de favoritos y emociones
    }
    
    // Persistencia local
    func toggleFavorite(_ exercise: Exercise)
    func selectEmotionFilter(_ emotion: Emotion)
    func clearAllFilters()
}
```

#### ExercisePlayerViewModel - Reproductor
```swift
class ExercisePlayerViewModel: ObservableObject {
    @Published var isPlaying: Bool = false
    @Published var progress: Double = 0.0
    @Published var currentTime: TimeInterval = 0.0
    @Published var isDragging: Bool = false
    
    func togglePlayback()               // Play/Pause
    func skipForward(_ seconds: Double) // +15 segundos
    func skipBackward(_ seconds: Double)// -15 segundos
    func seekToProgress(_ progress: Double)
}
```

### Extensiones y Utilidades

#### Core Data Stack
```swift
class PersistenceController {
    static let shared = PersistenceController()
    
    lazy var container: NSPersistentCloudKitContainer = {
        // Configuración CloudKit automática
        let container = NSPersistentCloudKitContainer(name: "DataModel")
        container.persistentStoreDescriptions.first!.setOption(true as NSNumber, 
                                                               forKey: NSPersistentHistoryTrackingKey)
        return container
    }()
}
```

#### Computed Properties Útiles
```swift
// En Exercise
var formattedDuration: String {
    let minutes = Int(duration) / 60
    let seconds = Int(duration) % 60
    return String(format: "%d:%02d", minutes, seconds)
}

// En EmotionalData
var isToday: Bool {
    Calendar.current.isDate(date, inSameDayAs: Date())
}

var dayAbbreviation: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "E"
    return String(formatter.string(from: date).prefix(1))
}
```

---

<div align="center">

**Desarrollado con ❤️ por el equipo de MirrorMind**

*MirrorMind - Tecnología al servicio del bienestar emocional*

</div>
