# MirrorMind iOS App

<div align="center">

![iOS Version](https://img.shields.io/badge/iOS-26.0+-blue.svg)
![Swift Version](https://img.shields.io/badge/Swift-5.0-orange.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-Yes-green.svg)
![Status](https://img.shields.io/badge/Status-Vista%20Home%20Completada-success.svg)

**Aplicación iOS para la Identificación y Manejo de las Emociones con IA + IoT**

*Proyecto desarrollado por estudiantes del TecNM Campus Reynosa para InnovaTecNM 2025*

</div>

## Descripción del Proyecto

MirrorMind es una aplicación iOS innovadora diseñada para ayudar a estudiantes universitarios en la gestión y comprensión de sus emociones. Combina inteligencia artificial, análisis biométrico mediante smartband, y ejercicios personalizados para mejorar el bienestar emocional y el rendimiento académico.

### Características Principales

- **Selector de emociones**: Interfaz intuitiva para identificar el estado emocional actual
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
  - Solución arquitectural para navbar flotante y safe area

### Próximas Fases

#### Fase 3: Selector de Emociones
- **Responsable**: Emotions System Lead
- **Objetivo**: Implementar interactividad completa del selector emocional
- **Estado**: Pendiente

#### Fases 4-12: Desarrollo Progresivo
- Selector de emociones (Fase 3)
- Sistema de ejercicios (Fase 4)
- Widget smartband (Fase 5)
- Resumen semanal (Fase 6)
- Tips de Olivia (Fase 7)
- Vista Momentos (Fases 8-10)
- Diseño de vistas faltantes (Fase 11)
- Testing e integración final (Fase 12)

## Arquitectura Técnica

### Stack Tecnológico
- **Lenguaje**: Swift 5.0
- **Framework**: SwiftUI
- **Arquitectura**: MVVM (Model-View-ViewModel)
- **Plataforma**: iOS 26.0+
- **IDE**: Xcode 15+

### Estructura del Proyecto

```
MirrorMind/
├── Core/
│   ├── Models/
│   │   └── TabItem.swift                # Modelo de navegación
│   └── Extensions/
│       └── Color+Extensions.swift       # Sistema de colores
├── Config/
│   ├── AppConfig.swift                  # Configuraciones generales
│   └── DesignConstants.swift           # Constantes de diseño
├── Features/
│   ├── Common/
│   │   └── Models/
│   │       └── Emotion.swift           # Modelo de emociones
│   ├── Home/                           # Completado - Fase 2
│   │   ├── Views/
│   │   │   └── HomeView.swift          # Vista principal dashboard
│   │   └── Screens/
│   │       └── HomeScreen.swift        # Wrapper de navegación
│   ├── Momentos/                       # Pendiente - Fase 8+
│   ├── Chat/                           # Pendiente - Fase 11
│   ├── Perfil/                         # Pendiente - Fase 11
│   └── Navbar/                         # Completado
│       └── Views/
│           ├── Navbar.swift            # Vista principal navegación
│           ├── CustomTabBar.swift      # Tab bar personalizado
│           └── TabBarButton.swift      # Botones individuales
├── Resources/Assets.xcassets/
│   └── Colors/                         # Sistema completo
│       ├── Emociones/                  # 6 colores emocionales
│       ├── Principales/                # Colores brand
│       └── Texto/                      # Jerarquía de textos
└── MirrorMindApp.swift                 # Punto de entrada
```

## Design System

### Paleta de Colores

#### Colores de Emociones
```swift
Color.Emotions.sad      // #7BA3D0 - Azul sereno
Color.Emotions.angry    // #E07A7A - Coral suave
Color.Emotions.anxious  // #F4C542 - Mostaza suave
Color.Emotions.nervous  // #E89C65 - Durazno cálido
Color.Emotions.happy    // #7FC383 - Verde menta
Color.Emotions.calm     // #A8B8E8 - Lavanda suave
```

#### Colores Principales
```swift
Color.Primary.background // #F0F8FF - Fondo principal
Color.Primary.brand      // #2D5A4A - Verde marca
```

#### Colores de Texto
```swift
Color.Text.primary       // #2D3748 - Títulos principales
Color.Text.secondary     // #4A5568 - Subtítulos
```

### Tipografía
- **Fuente**: Roboto
- **Jerarquía**: 4 niveles (18px, 16px, 14px, 12px)
- **Pesos**: Semibold, Medium, Regular

### Componentes Implementados

#### Sistema de Navegación
- **CustomTabBar**: Tab bar principal con 4 secciones
- **TabBarButton**: Botones individuales con estados activo/inactivo
- **Navbar**: Contenedor principal con TabView

#### Vista Home Completa
- **HomeView**: Dashboard principal con 5 tarjetas funcionales
- **EmotionSelectorCardView**: Grid 3x2 de emociones con colores reales
- **ExerciseSuggestionsCardView**: Scroll horizontal de ejercicios sugeridos
- **SmartBandCardView**: Widget con estados de conexión visual
- **WeeklySummaryCardView**: Gráfico de 7 días con resumen emocional
- **OliviaTipsCardView**: Consejos de IA con estilo personalizado
- **Saludo personalizado**: Avatar circular y mensaje contextual
- **Layout responsivo**: Adaptación automática a diferentes pantallas

#### Modelos de Datos
- **TabItem**: Enum con 4 tabs (home, momentos, chat, perfil)
- **Emotion**: Struct con 6 emociones predefinidas
- **AppConfig**: Configuraciones centralizadas
- **DesignConstants**: Constantes de espaciado, colores y animaciones

## Funcionalidades Implementadas

### Sistema de Navegación Completo
- Navegación entre 4 vistas principales: Inicio, Momentos, Chat, Perfil
- Estados visuales diferenciados (activo/inactivo)
- Transiciones fluidas con animaciones
- Tab bar personalizado con design system aplicado
- Vistas temporales preparadas para desarrollo futuro

### Vista Home Dashboard Funcional
- Dashboard principal con 5 tarjetas informativas
- Saludo personalizado con avatar del usuario
- Selector de emociones visual (grid 3x2) con colores específicos
- Sistema de ejercicios con scroll horizontal
- Widget SmartBand con estados visuales (Desconectado/Conectando/Conectado)
- Gráfico semanal emocional con 7 días de datos
- Tarjeta de consejos de Olivia IA con estilo diferenciado
- Layout completamente responsivo
- Integración perfecta con sistema de navegación
- Safe area handling optimizado para navbar flotante

### Design System Robusto
- Paleta de colores completa según especificaciones de diseño
- Sistema de acceso centralizado a colores mediante extensiones
- Constantes de diseño para espaciado, tipografía y animaciones
- Componentes reutilizables listos para expansión
- Aplicación consistente en todas las vistas implementadas

## Instalación y Configuración

### Requisitos
- macOS 26+ 
- Xcode 15+
- iOS 26.0+ (simulador o dispositivo)

### Pasos de Instalación

1. **Clonar el repositorio**
```bash
git clone [URL_DEL_REPOSITORIO]
cd MirrorMind
```

2. **Abrir en Xcode**
```bash
open MirrorMind.xcodeproj
```

3. **Compilar y ejecutar**
- Seleccionar simulador iOS 26.0+
- Presionar ⌘R para compilar y ejecutar

### Configuración del Proyecto
- Target de deployment: iOS 26.0
- Orientaciones soportadas: Portrait, Landscape
- Configuraciones disponibles: Debug, Release

## Equipo de Desarrollo

### Información del Proyecto
- **Institución**: Instituto Tecnológico de Reynosa, TecNM
- **Objetivo**: Etapa Regional InnovaTecNM (Septiembre 2025)
- **Categoría**: Industria Eléctrica y Electrónica
- **Área**: Telecomunicaciones y Tecnologías de la Información

### Integrantes del Equipo
- **Bryan Caleb Martínez Cavazos** - Ing. en TIC (6° semestre)
- **Jair Azael Solís Cervantes** - Ing. en TIC (6° semestre)
- **Lisandro Guerrero Huesca** - Ing. en TIC (6° semestre)
- **Ángeles Estefani Bautista García** - Ing. en Gestión Empresarial (4° semestre)

### Asesores
- **Dora Luz Quevedo Valenzuela** - dora.qv@reynosa.tecnm.mx
- **José Guadalupe Cervantes León** - jose.cl@reynosa.tecnm.mx

## Roadmap de Desarrollo

### Etapa Regional (Septiembre 2025)
**Objetivo**: Demo funcional con Home y Momentos completos

#### Milestones Principales
1. **Milestone 1** (Semana 4): Vista Home funcional con selector de emociones
2. **Milestone 2** (Semana 8): Sistema completo Home + Momentos + SmartBand mock
3. **Milestone 3** (Semana 12): App completa lista para demo regional

#### Funcionalidades Target
- Vista Home completa con selector de emociones
- Vista Momentos con categorías y filtros
- Sistema de favoritos funcional
- Integración mock con smartband
- Widget de resumen semanal
- Tips de Olivia integrados

### Etapa Nacional (Post-Regional)
- Vista Chat con Olivia IA completa
- Vista Perfil con configuraciones
- Integración real con hardware smartband
- Sistema de reconocimiento facial
- Análisis avanzado de patrones emocionales

## Documentación Técnica

### Recursos Principales
- **PDF de Diseño**: "MirrorMind - Diseño de app versión 0.1" (Referencia visual)
- **Documentación UI/UX**: Sistema de colores y componentes establecido
- **Plan de Implementación**: Estrategia de desarrollo en 12 fases
- **Especificaciones Hardware**: Integración con smartband ESP32

### Convenciones de Código
```swift
// Clases: PascalCase
class HomeViewModel {}

// Funciones: camelCase
func updateEmotionState() {}

// Constantes: UPPER_SNAKE_CASE
static let MAX_EMOTIONS = 6

// Variables privadas: _underscore
private var _selectedEmotion: Emotion?
```

### Estándares de Calidad
- Arquitectura MVVM consistente
- Separación clara de responsabilidades
- Componentes reutilizables y modulares
- Documentación en código para métodos públicos
- Testing unitario para ViewModels críticos

## Contribución

### Desarrollo Colaborativo
- **Estrategia**: Desarrollo por fases especializadas
- **Control de versiones**: Git con feature branches
- **Comunicación**: Documentación de cambios entre fases
- **Testing**: Validación funcional después de cada fase

### Para Nuevos Colaboradores
1. Revisar documentación completa del proyecto
2. Familiarizarse con el design system implementado
3. Seguir convenciones de naming establecidas
4. Desarrollar por bloques pequeños y funcionales
5. Validar funcionalidad antes de continuar

## Estado Actual

### Funcionalidades Operativas
- Navegación completa entre 4 vistas
- Vista Home completamente funcional con 5 tarjetas
- Selector de emociones visual implementado
- Sistema de ejercicios con placeholders
- Widget SmartBand con estados visuales
- Gráfico semanal con datos mock
- Sistema de colores aplicado consistentemente
- Arquitectura MVVM establecida
- Design system robusto implementado
- Safe area y layout responsive optimizados

### Próximos Pasos
- **Inmediato**: Implementación interactiva del selector de emociones (Fase 3)
- **Corto plazo**: Contenido dinámico de ejercicios y funcionalidad SmartBand
- **Mediano plazo**: Vista Momentos completa y analytics emocionales
- **Objetivo**: Demo completo para etapa regional en septiembre 2025

---

## Información de Contacto

**Proyecto MirrorMind**  
Instituto Tecnológico de Reynosa, TecNM  
InnovaTecNM 2025 - Región 2  

*"Transformando la gestión emocional estudiantil a través de la tecnología"*
