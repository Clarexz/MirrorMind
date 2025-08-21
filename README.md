# MirrorMind iOS App

<div align="center">

![iOS Version](https://img.shields.io/badge/iOS-26.0+-blue.svg)
![Swift Version](https://img.shields.io/badge/Swift-5.0-orange.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-Yes-green.svg)
![Status](https://img.shields.io/badge/Status-Sistema%20de%20Filtros%20Completado-success.svg)

**Aplicación iOS para la Identificación y Manejo de las Emociones con IA + IoT**

*Sistema de gestión emocional para estudiantes universitarios*

</div>

## Descripción del Proyecto

MirrorMind es una aplicación iOS innovadora diseñada para ayudar a estudiantes universitarios en la gestión y comprensión de sus emociones. Combina inteligencia artificial, análisis biométrico mediante smartband, y ejercicios personalizados para mejorar el bienestar emocional y el rendimiento académico.

### Características Principales

- **Selector de emociones**: Interfaz intuitiva para identificar el estado emocional actual
- **Sistema de filtros**: Organización inteligente de contenido por favoritos y emociones
- **Smartband IoT**: Integración con dispositivo biométrico para monitoreo en tiempo real
- **Ejercicios personalizados**: Contenido adaptado según el estado emocional detectado
- **Olivia IA**: Asistente virtual que proporciona consejos y recomendaciones personalizadas
- **Análisis emocional**: Seguimiento de patrones emocionales a lo largo del tiempo

## Estado del Desarrollo

### Fases Completadas

#### Fase 0: Fundación del Proyecto
- **Duración**: 1 sesión
- **Responsable**: iOS Foundation Lead
- **Entregables completados**:
  - Estructura MVVM del proyecto establecida
  - Sistema de colores completo implementado según diseño PDF
  - Configuración de constantes de diseño
  - Modelos base creados (TabItem, Emotion)
  - Extensiones de Color para fácil acceso
  - Documentación de setup inicial

#### Fase 1: Sistema de Navegación
- **Duración**: 1 sesión  
- **Responsable**: Navigation System Lead
- **Entregables completados**:
  - Tab bar personalizado funcional con 4 secciones
  - Navegación fluida entre vistas principales
  - Estados visuales correctos (activo/inactivo)
  - Transiciones suaves implementadas
  - Vistas temporales para desarrollo futuro
  - Integración completa con design system

#### Fase 2: Vista Home - Estructura Base
- **Duración**: 1 sesión
- **Responsable**: Home Structure Lead
- **Entregables completados**:
  - Layout principal de HomeView con ScrollView implementado
  - 5 tarjetas principales según diseño PDF
  - Saludo personalizado con avatar circular
  - Selector de emociones (grid 3x2) con colores reales
  - Sistema de ejercicios con scroll horizontal
  - Widget SmartBand con estados visuales
  - Gráfico semanal emocional (7 días)
  - Tarjeta de tips de Olivia con estilo especial
  - Layout responsivo que se adapta a diferentes pantallas
  - Integración completa con sistema de navegación

#### Fase 3: Selector de Emociones
- **Duración**: 1 sesión
- **Responsable**: Emotion Selector Lead
- **Entregables completados**:
  - Componente EmotionSelector totalmente funcional
  - Selección única de emociones con estados visuales claros
  - Modelo Emotion con 6 emociones predefinidas
  - ViewModel especializado (EmotionSelectorViewModel)
  - Integración perfecta con HomeView
  - Estados activos/inactivos con colores del design system
  - Lógica de selección intuitiva (toggle automático)

#### Fase 4: Sistema de Ejercicios
- **Duración**: 1 sesión
- **Responsable**: Exercise System Lead
- **Entregables completados**:
  - Modelo Exercise completo con 28 ejercicios reales
  - ExerciseCard reutilizable con diseño consistente
  - ViewModel especializado para gestión de ejercicios
  - Scroll horizontal funcionando perfectamente
  - Integración con sistema de categorías y emociones
  - Metadatos completos (duración, categoría, emociones objetivo)
  - Estados visuales para favoritos preparados

#### Fase 5: Widget SmartBand
- **Duración**: 1 sesión
- **Responsable**: SmartBand Integration Lead
- **Entregables completados**:
  - Core Data + CloudKit configuración completa
  - Entidades BiometricReading y EmotionRecord con sincronización
  - PersistenceController optimizado para CloudKit
  - Datos biométricos persistidos automáticamente cada 3 segundos
  - Historial emocional guardado con contexto biométrico
  - Sincronización automática entre dispositivos del usuario
  - Privacidad garantizada (datos en iCloud del usuario)

#### Fase 6: Analytics Dashboard
- **Duración**: 1 sesión
- **Responsable**: Analytics Dashboard Lead
- **Entregables completados**:
  - Componente WeeklyChart funcional con datos dinámicos
  - Modelo EmotionalData para persistencia y análisis
  - WeeklyDataViewModel con lógica de análisis automático
  - Integración perfecta reemplazando WeeklySummaryCardView
  - Estados inteligentes para días pasados, actual y futuros
  - Análisis emocional con cálculo de emoción predominante

#### Fase 7: Tips de Olivi
- **Duración**: 1 sesión
- **Responsable**: Olivia Tips Lead
- **Entregables completados**:
  - Sistema de tips dinámicos con 20+ consejos únicos
  - Modelo Tip con categorización por emociones
  - TipManager para rotación inteligente de consejos
  - Componente OlivaTipsCard con diseño especial
  - Integración con avatar de Olivia y colores brand
  - Lógica de tips contextuales según emociones seleccionadas

#### Fase 8: Vista Momentos 
- **Duración**: 1 sesión
- **Responsable**: Moments Structure Lead
- **Entregables completados**:
  - Vista MomentosView completamente implementada según PDF
  - Modelo MomentCategory con 5 categorías completas
  - Grid 2x2+1 según diseño con quinta categoría horizontal
  - Componente CategoryCardView reutilizable con dos modos
  - Colores específicos por categoría aplicados
  - Iconografía apropiada con SF Symbols
  - Botones de filtros preparados para Fase 9
  - Sección "Dato curioso" con tips dinámicos
  - Layout responsivo con scroll y safe area optimizado

#### Fase 9: Sistema de Filtros en Momentos
- **Duración**: 1 sesión
- **Responsable**: Moments Filters Lead
- **Entregables completados**:
  - **MomentosViewModel**: ViewModel completo con persistencia local
  - **Sistema de favoritos**: Funcional con UserDefaults para guardar favoritos
  - **Estados visuales dinámicos**: Botones de filtro con colores activos/inactivos
  - **Vista filtrada inteligente**: Muestra ejercicios filtrados vs vista normal
  - **Estado vacío**: Mensaje descriptivo cuando no hay favoritos guardados
  - **EmotionFilters**: Componente de menú desplegable para 6 emociones
  - **Filtrado por emoción**: Toggle funcional (presionar misma emoción deselecciona)
  - **Combinación de filtros**: Favoritos + emoción funcionan juntos
  - **Menú manual**: Usuario controla cuándo cerrar filtros de emociones
  - **Colores dinámicos**: Estados activos con colores vibrantes del design system
  - **Performance optimizada**: Computed properties para filtrado eficiente

### Próximas Fases

#### Fase 10: Reproductor de Ejercicios
- **Responsable**: Exercise Player Lead
- **Objetivo**: Implementar reproductor completo de ejercicios con navegación
- **Estado**: Pendiente - Datos preparados y navegación lista

#### Fases 11-12: Finalización
- Chat y Perfil (Fase 11)
- Testing e integración final (Fase 12)

## Funcionalidades Operativas Actuales

### Navegación Completa
- Tab bar personalizado funcional entre Home y Momentos
- Transiciones suaves sin errores
- Estados visuales correctos en navegación
- Preparación para Chat y Perfil

### Vista Home Funcional
- **Saludo personalizado**: Avatar circular y nombre dinámico
- **Selector de emociones**: 6 emociones con selección única funcional
- **Ejercicios recomendados**: Scroll horizontal con 28 ejercicios reales
- **Widget SmartBand**: Datos biométricos en tiempo real con Core Data + CloudKit
- **Gráfico semanal**: Análisis emocional con datos dinámicos y emoción predominante
- **Tips de Olivia**: Consejos contextuales con rotación inteligente

### Vista Momentos Funcional
- **5 categorías organizadas**: Respirar, Meditar, Moverte, Reflexionar, Crecer
- **Grid responsivo**: Layout 2x2+1 con quinta categoría horizontal especial
- **Sistema de filtros completo**:
  - Filtro de favoritos con persistencia local
  - Filtros por emoción con menú desplegable
  - Combinación inteligente de ambos filtros
  - Estados visuales dinámicos y colores activos
- **Estados vacíos**: Mensajes descriptivos cuando no hay contenido filtrado
- **Dato curioso**: Tips dinámicos en parte superior

### Sistemas de Datos
- **Core Data + CloudKit**: Configuración completa para datos biométricos
- **Persistencia local**: Favoritos y preferencias guardados automáticamente
- **Sincronización**: Datos disponibles entre dispositivos del usuario
- **Privacidad**: Almacenamiento en iCloud del usuario, no servidores terceros

## Arquitectura Técnica

### Stack Tecnológico
- **Lenguaje**: Swift 5.0
- **Framework**: SwiftUI
- **Arquitectura**: MVVM (Model-View-ViewModel)
- **Base de datos**: Core Data + CloudKit
- **Persistencia local**: UserDefaults para configuraciones
- **Plataforma**: iOS 26.0+
- **IDE**: Xcode 15+

### Estructura del Proyecto

```
MirrorMind/
├── Core/
│   ├── Models/
│   │   ├── TabItem.swift                    # Navegación principal
│   │   └── PersistenceController.swift      # Core Data + CloudKit
│   └── Extensions/
│       └── Color+Extensions.swift           # Sistema de colores
├── Config/
│   ├── AppConfig.swift                      # Configuraciones generales
│   └── DesignConstants.swift                # Constantes de diseño
├── Features/
│   ├── Common/
│   │   ├── Models/
│   │   │   ├── Emotion.swift                # 6 emociones del sistema
│   │   │   ├── Exercise.swift               # 28 ejercicios completos
│   │   │   ├── Tip.swift                    # Tips de Olivia
│   │   │   └── EmotionalData.swift          # Datos de análisis
│   │   └── Views/Components/
│   │       ├── EmotionSelector.swift        # Selector funcional
│   │       ├── ExerciseCard.swift           # Tarjetas de ejercicios
│   │       └── OlivaTipsCard.swift          # Tips de Olivia
│   ├── Home/
│   │   ├── Views/
│   │   │   ├── HomeView.swift               # Vista principal completa
│   │   │   ├── WeeklyChart.swift            # Gráfico semanal
│   │   │   └── SmartBandWidget.swift        # Widget biométrico
│   │   └── ViewModels/
│   │       ├── EmotionSelectorViewModel.swift
│   │       ├── ExerciseViewModel.swift
│   │       └── WeeklyDataViewModel.swift
│   ├── Momentos/
│   │   ├── Views/
│   │   │   ├── MomentosView.swift           # Vista completa con filtros
│   │   │   ├── CategoryCardView.swift       # Tarjetas de categorías
│   │   │   └── EmotionFilters.swift         # Menú de filtros
│   │   ├── ViewModels/
│   │   │   └── MomentosViewModel.swift      # Filtros y favoritos
│   │   └── Models/
│   │       └── MomentCategory.swift         # 5 categorías
│   ├── Navbar/
│   │   └── Views/
│   │       └── Navbar.swift                 # Navegación principal
│   ├── Chat/                               # Preparado para Fase 11
│   └── Perfil/                             # Preparado para Fase 11
└── Resources/
    └── Assets.xcassets/
        └── Colors/                          # Sistema completo
```

### Design System Completo

#### Paleta de Colores
```swift
// Emociones - Según especificaciones PDF
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
// Espaciado
DesignConstants.Spacing.containerPadding    // 20pt
DesignConstants.Spacing.cardPadding         // 16pt
DesignConstants.Spacing.sectionMargin       // 24pt

// Radius
DesignConstants.Radius.card                 // 16pt
DesignConstants.Radius.button               // 12pt
DesignConstants.Radius.emotion              // 50pt

// Sombras
DesignConstants.Shadow.card                 // Color y configuración
```

## Criterios de Aceptación Cumplidos

### Sistema General
- [x] Navegación fluida sin crashes entre Home y Momentos
- [x] Tiempo de respuesta < 1 segundo en todas las interacciones
- [x] Diseño pixel-perfect según especificaciones PDF
- [x] Funcionalidades core al 100% operativas
- [x] Core Data + CloudKit funcionando sin errores
- [x] Persistencia de datos local y en la nube
- [x] Estados visuales consistentes en toda la app
