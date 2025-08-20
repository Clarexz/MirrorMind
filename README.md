# MirrorMind iOS App

<div align="center">

![iOS Version](https://img.shields.io/badge/iOS-26.0+-blue.svg)
![Swift Version](https://img.shields.io/badge/Swift-5.0-orange.svg)
![SwiftUI](https://img.shields.io/badge/SwiftUI-Yes-green.svg)
![Status](https://img.shields.io/badge/Status-Vista%20Momentos%20Completada-success.svg)

**Aplicación iOS para la Identificación y Manejo de las Emociones con IA + IoT**

*Sistema de gestión emocional para estudiantes universitarios*

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

#### Fase 3: Sistema de Emociones
- **Duración**: 1 sesión
- **Responsable**: Emotions System Lead
- **Entregables completados**:
  - Selector interactivo de emociones completamente funcional
  - Selección única con feedback visual (checkmark)
  - Contenido dinámico según emoción seleccionada
  - HomeViewModel implementado con arquitectura MVVM
  - Mensajes personalizados por cada emoción
  - Ejercicios específicos que cambian según estado emocional
  - Estados de selección persistentes durante la sesión
  - Eliminación de bugs visuales (destello de botones)
  - Animaciones suaves y naturales
  - Sistema de deselección funcional

#### Fase 4: Ejercicios y Sugerencias
- **Duración**: 1 sesión
- **Responsable**: Exercise Content Lead
- **Entregables completados**:
  - Tarjetas de ejercicios reales con diseño visual completo
  - Modelo Exercise completo con 28 ejercicios mock organizados
  - Contenido dinámico funcional por emoción seleccionada
  - Scroll horizontal fluido sin errores de consola
  - ExerciseCard component con thumbnail y duración
  - Integración perfecta con sistema de emociones
  - 5 categorías de ejercicios con colores del design system
  - Sistema preparado para navegación a reproductor

#### Fase 5: SmartBand Integration
- **Duración**: 1 sesión
- **Responsable**: SmartBand Integration Lead
- **Entregables completados**:
  - Base de datos implementada: Core Data + CloudKit configurado y funcional
  - Estados dinámicos SmartBand: 3 estados según PDF (Desconectado → Conectando → Conectado)
  - Datos biométricos en tiempo real: Temperatura y BPM que cambian cada 3 segundos
  - Persistencia de datos: Todos los datos se guardan automáticamente en Core Data
  - Integración con sistema emocional: Compatible con selector de emociones
  - Arquitectura escalable: Preparado para CloudKit sync y futuras funcionalidades

#### Fase 6: Analytics Dashboard
- **Duración**: 1 sesión
- **Responsable**: Analytics Dashboard Lead
- **Entregables completados**:
  - Componente WeeklyChart funcional con datos dinámicos de emociones
  - Modelo EmotionalData completo para persistencia y análisis
  - WeeklyDataViewModel con lógica de análisis automático de patrones
  - Reemplazo completo de WeeklySummaryCardView en HomeView
  - Estados inteligentes para días pasados, actuales y futuros
  - Análisis emocional automático con cálculo de emoción predominante
  - Gráfico semanal (Lunes-Domingo) con círculos proporcionales
  - Texto dinámico contextual según análisis emocional
  - Manejo de días sin datos con visualización apropiada
  - Animaciones escalonadas y experiencia visual pulida

#### Fase 7: Tips de Olivia
- **Duración**: 1 sesión
- **Responsable**: Olivia Content Lead
- **Entregables completados**:
  - Sistema de consejos dinámicos personalizados según emoción seleccionada
  - Base de datos mock completa con 26 consejos organizados por emoción
  - Modelo OliviaTip completo con categorías y sistema de prioridades
  - OliviaTipsDatabase singleton con métodos de consulta inteligente
  - Componente completamente rediseñado con avatar y animaciones
  - Integración perfecta con sistema emocional existente de HomeViewModel
  - Sistema de refresh con loading states y experiencia de usuario pulida
  - Personalidad consistente de Olivia (empática, práctica, alentadora)
  - 6 categorías de tips: respiración, mindfulness, movimiento, social, autocuidado, crecimiento
  - Navegación preparada para Chat completo con botón funcional
  - Diseño exacto según PDF con gradientes, sombras y elementos visuales

#### Fase 8: Vista Momentos - Estructura
- **Duración**: 1 sesión
- **Responsable**: Moments Structure Lead
- **Entregables completados**:
  - Vista principal MomentosView implementada con estructura completa según PDF
  - Wrapper de navegación MomentosScreen creado siguiendo patrón del proyecto
  - Header personalizado con avatar y pregunta "¿Qué necesitas hoy?"
  - Modelo MomentCategory con 5 categorías completas (respirar, meditar, moverte, reflexionar, crecer)
  - Grid 2x2+1 según diseño PDF con quinta categoría en layout horizontal especial
  - Componente CategoryCardView reutilizable con dos modos de layout
  - Colores específicos por categoría del design system aplicados
  - Iconografía apropiada con SF Symbols incluyendo tree.fill para crecimiento
  - Botones de filtros (Favoritos, Filtros) preparados para Fase 9
  - Sección "Dato curioso" con tips dinámicos funcionando
  - Layout responsivo con scroll y safe area handling optimizado
  - Integración exitosa en sistema de navegación sin romper funcionalidad existente
  - Navegación preparada para vista individual de categorías en Fase 10

### Próximas Fases

#### Fase 9: Sistema de Filtros en Momentos
- **Responsable**: Moments Filters Lead
- **Objetivo**: Implementar filtros de favoritos y emociones en vista Momentos
- **Estado**: Pendiente

#### Fases 10-12: Desarrollo Progresivo
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
- **Base de datos**: Core Data + CloudKit
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
│   │   ├── Models/
│   │   │   ├── Emotion.swift           # Modelo de emociones
│   │   │   └── Exercise.swift          # Modelo completo de ejercicios
│   │   └── Views/
│   │       └── ExerciseCard.swift      # Componente de tarjeta de ejercicio
│   ├── Home/                           # Completado - Fases 2-4
│   │   ├── Views/
│   │   │   └── HomeView.swift          # Vista principal dashboard
│   │   ├── ViewModels/
│   │   │   └── HomeViewModel.swift     # Lógica de emociones y ejercicios dinámicos
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
- **HomeViewModel**: Lógica de estado emocional y ejercicios dinámicos con 28 ejercicios mock
- **SmartBandViewModel**: Gestión completa de estados y datos biométricos en tiempo real
- **WeeklyDataViewModel**: Análisis semanal automático con cálculo de patrones emocionales
- **EmotionSelectorCardView**: Grid 3x2 de emociones completamente interactivo
- **ExerciseSuggestionsCardView**: Scroll horizontal con ejercicios dinámicos por emoción
- **ExerciseCard**: Componente de tarjeta con thumbnail, duración y colores por categoría
- **SmartBandCardView**: Widget con 3 estados dinámicos y datos biométricos reales
- **WeeklyChart**: Gráfico semanal funcional con análisis emocional automático
- **OliviaTipsCardView**: Sistema completo de consejos de IA personalizados según emoción
- **Saludo personalizado**: Avatar circular y mensaje contextual
- **Layout responsivo**: Adaptación automática a diferentes pantallas
- **Sistema emocional interactivo**: Selección única con feedback visual y contenido dinámico
- **Sistema de ejercicios dinámico**: 28 ejercicios organizados por emociones y categorías
- **Sistema SmartBand completo**: Core Data + CloudKit con datos biométricos persistentes
- **Sistema de análisis semanal**: Datos emocionales procesados con insights automáticos
- **Sistema de IA Olivia**: 26 consejos organizados con personalidad empática y práctica

#### Vista Momentos Completa
- **MomentosView**: Vista principal con estructura completa según diseño PDF
- **MomentosScreen**: Wrapper de navegación siguiendo patrón del proyecto
- **MomentCategory**: Modelo con 5 categorías completas con colores e iconos específicos
- **CategoryCardView**: Componente reutilizable con dos modos de layout (normal y ancho completo)
- **Header personalizado**: Avatar circular y burbuja con pregunta "¿Qué necesitas hoy?"
- **Grid 2x2+1**: Layout especial con quinta categoría ocupando ancho completo
- **Layout horizontal especial**: Para "Momentos para crecer" con tree.fill y diseño único
- **Botones de filtros**: Favoritos y Filtros preparados para implementación funcional
- **Sección dato curioso**: Tarjeta inferior con tips dinámicos y icono de bombilla
- **5 categorías completas**: Respirar (verde), Meditar (lavanda), Moverte (durazno), Reflexionar (azul), Crecer (mostaza)
- **Iconografía SF Symbols**: lungs.fill, figure.mind.and.body, figure.walk, brain.head.profile, tree.fill
- **Navegación funcional**: Integración completa en tab bar sin romper funcionalidad existente
- **Layout responsivo**: Scroll con safe area handling optimizado para navbar flotante

#### Modelos de Datos
- **TabItem**: Enum con 4 tabs (home, momentos, chat, perfil)
- **Emotion**: Struct con 6 emociones predefinidas
- **Exercise**: Modelo completo con 28 ejercicios organizados por emociones y categorías
- **ExerciseCategory**: Enum con 5 categorías (respirar, meditar, moverte, reflexionar, crecer)
- **EmotionalData**: Estructura para análisis emocional con timestamps y contexto
- **WeeklyEmotionalSummary**: Resumen semanal con emoción predominante y análisis
- **DailyEmotionalData**: Datos procesados por día con estados (pasado/actual/futuro)
- **OliviaTip**: Modelo completo de consejos de IA con categorías y prioridades
- **OliviaTip.TipCategory**: 6 categorías extensibles (respiración, mindfulness, movimiento, social, autocuidado, crecimiento)
- **OliviaTipsDatabase**: Singleton con 26 consejos organizados y métodos de consulta inteligente
- **MomentCategory**: Modelo de categorías de Momentos con colores, iconos y tips dinámicos
- **CategoryType**: Enum con 5 tipos (respirar, meditar, moverte, reflexionar, crecer)
- **SmartBandState**: Estados de conexión y datos biométricos en tiempo real
- **LiveBiometricData**: Estructura para temperatura y BPM con timestamps
- **BiometricReading**: Entidad Core Data para persistencia de datos biométricos
- **EmotionRecord**: Entidad Core Data para historial emocional con contexto biométrico
- **AppConfig**: Configuraciones centralizadas
- **DesignConstants**: Constantes de espaciado, colores y animaciones

## Funcionalidades Implementadas

### Sistema de Navegación Completo
- Navegación entre 4 vistas principales: Inicio, Momentos, Chat, Perfil
- Estados visuales diferenciados (activo/inactivo)
- Transiciones fluidas con animaciones
- Tab bar personalizado con design system aplicado
- Vistas temporales preparadas para desarrollo futuro

### Vista Home Dashboard Completamente Funcional
- Dashboard principal con 5 tarjetas informativas completamente operativas
- Saludo personalizado con avatar del usuario
- Selector de emociones completamente interactivo (grid 3x2)
- Selección única de emociones con feedback visual (checkmark)
- Contenido dinámico que cambia según emoción seleccionada
- Mensajes personalizados específicos por cada estado emocional
- Sistema de ejercicios dinámico con 28 ejercicios organizados por emociones
- Tarjetas de ejercicios reales con thumbnails, duración y colores por categoría
- 5 categorías de ejercicios: respirar, meditar, moverte, reflexionar, crecer
- Filtrado automático de ejercicios según emoción seleccionada
- Scroll horizontal fluido sin errores de consola
- Widget SmartBand completamente funcional con 3 estados dinámicos
- Datos biométricos en tiempo real: Temperatura y BPM actualizados cada 3 segundos
- Base de datos Core Data + CloudKit para persistencia de datos biométricos
- Integración emocional con contexto biométrico asociado
- Gráfico semanal emocional completamente funcional con datos dinámicos
- Sistema de análisis automático de patrones emocionales semanales
- Visualización inteligente de días pasados, actuales y futuros
- Cálculo automático de emoción predominante con texto contextual
- Círculos proporcionales para representar cada día de la semana
- Manejo apropiado de días sin datos emocionales registrados
- Sistema completo de tips de Olivia con 26 consejos personalizados
- Avatar de Olivia con gradiente y diseño según PDF
- Tips dinámicos que cambian según emoción seleccionada del usuario
- Sistema de categorías de consejos (respiración, mindfulness, movimiento, social, autocuidado, crecimiento)
- Botón de refresh con animación y loading state "Olivia está pensando..."
- Indicador de personalización visual cuando tip es específico para emoción
- Navegación preparada para Chat completo con botón "Quiero saber más"
- Personalidad consistente de Olivia: empática, práctica y alentadora
- Layout completamente responsivo
- Integración perfecta con sistema de navegación
- Safe area handling optimizado para navbar flotante
- Arquitectura MVVM implementada con múltiples ViewModels especializados
- Estados de selección persistentes durante la sesión
- Animaciones suaves y experiencia de usuario pulida
- Sistema de debugging y testing de Core Data implementado

### Vista Momentos Completamente Funcional
- Vista principal Momentos completamente implementada según diseño PDF páginas 11-12
- Header personalizado con avatar circular y burbuja "¿Qué necesitas hoy?"
- Navegación funcional desde tab bar sin romper sistema existente
- 5 categorías organizadas en grid 2x2+1 con layout especial para quinta categoría
- Colores específicos por categoría del design system: verde (respirar), lavanda (meditar), durazno (moverte), azul (reflexionar), mostaza (crecer)
- Iconografía SF Symbols apropiada: lungs.fill, figure.mind.and.body, figure.walk, brain.head.profile, tree.fill
- CategoryCardView reutilizable con dos modos: layout normal (VStack) y ancho completo (HStack)
- Layout horizontal especial para "Momentos para crecer" ocupando ancho completo
- Botones de filtros preparados: Favoritos (corazón) y Filtros (sliders) con diseño según PDF
- Sección "Dato curioso" con tarjeta inferior y tips dinámicos que cambian aleatoriamente
- Sistema de navegación preparado para vista individual de categorías
- Layout responsivo con ScrollView y safe area handling optimizado
- Padding bottom 160pts para navbar flotante sin solapamientos
- Animaciones suaves en botones con CategoryButtonStyle personalizado
- Arquitectura MVVM mantenida con modelo MomentCategory bien estructurado
- Integración sin errores con sistema de navegación existente

### Base de Datos y Persistencia
- **Core Data + CloudKit**: Configuración completa para datos biométricos y emocionales
- **Entidades implementadas**: BiometricReading y EmotionRecord con sincronización CloudKit
- **PersistenceController**: Stack de Core Data optimizado para CloudKit
- **Datos biométricos**: Temperatura y BPM persistidos automáticamente cada 3 segundos
- **Historial emocional**: Emociones guardadas con contexto biométrico asociado
- **Sincronización automática**: Datos disponibles entre dispositivos del usuario
- **Privacidad garantizada**: Datos almacenados en iCloud del usuario, no en servidores terceros

### Design System Robusto
- **Core Data + CloudKit**: Configuración completa para datos biométricos y emocionales
- **Entidades implementadas**: BiometricReading y EmotionRecord con sincronización CloudKit
- **PersistenceController**: Stack de Core Data optimizado para CloudKit
- **Datos biométricos**: Temperatura y BPM persistidos automáticamente cada 3 segundos
- **Historial emocional**: Emociones guardadas con contexto biométrico asociado
- **Sincronización automática**: Datos disponibles entre dispositivos del usuario
- **Privacidad garantizada**: Datos almacenados en iCloud del usuario, no en servidores terceros
- Paleta de colores completa según especificaciones de diseño
- Sistema de acceso centralizado a colores mediante extensiones
- Constantes de diseño para espaciado, tipografía y animaciones
- Componentes reutilizables listos para expansión
- Aplicación consistente en todas las vistas implementadas

## Estado Actual

### Funcionalidades Operativas
- Navegación completa entre Home y Momentos (2 vistas principales funcionales)
- Vista Home completamente funcional con 5 tarjetas interactivas
- Vista Momentos completamente implementada con 5 categorías organizadas
- Selector de emociones completamente operativo con selección única
- Sistema de contenido dinámico según estado emocional
- Mensajes personalizados que cambian por emoción
- Sistema de ejercicios dinámico con 28 ejercicios organizados
- Tarjetas de ejercicios reales con thumbnails y duración
- Filtrado automático de ejercicios por emoción seleccionada
- 5 categorías de ejercicios con colores específicos del design system
- Scroll horizontal fluido sin errores de consola
- Widget SmartBand completamente funcional con 3 estados dinámicos
- Datos biométricos en tiempo real que cambian cada 3 segundos
- Base de datos Core Data + CloudKit funcionando correctamente
- Persistencia automática de todos los datos biométricos y emocionales
- Integración emocional con contexto biométrico asociado
- Gráfico semanal completamente funcional con análisis automático
- Sistema de análisis emocional que calcula patrones semanales
- Visualización inteligente de días pasados, actuales y futuros
- Manejo apropiado de días sin datos con estados diferenciados
- Cálculo automático de emoción predominante semanal
- Texto dinámico contextual según análisis de patrones
- Animaciones escalonadas en gráfico semanal
- Sistema completo de tips de Olivia con 26 consejos organizados
- Tips dinámicos que cambian automáticamente según emoción seleccionada
- Base de datos de consejos con sistema de prioridades y categorías
- Botón de refresh con animación y loading states
- Avatar de Olivia con gradiente y diseño según especificaciones PDF
- Indicador visual de personalización para tips específicos
- Sistema de categorías: respiración, mindfulness, movimiento, social, autocuidado, crecimiento
- Navegación preparada para Chat completo con Olivia
- Personalidad consistente: empática, práctica y alentadora
- Grid 2x2+1 de categorías Momentos con layout especial para quinta categoría
- Header personalizado en Momentos con avatar y pregunta contextual
- 5 categorías Momentos con colores específicos e iconografía SF Symbols
- Layout horizontal especial para "Momentos para crecer"
- Botones de filtros preparados para implementación funcional
- Sección dato curioso con tips dinámicos aleatorios
- CategoryCardView reutilizable con dos modos de layout
- Navegación preparada para vista individual de categorías
- Sistema de colores aplicado consistentemente
- Arquitectura MVVM completamente implementada
- Design system robusto implementado
- Safe area y layout responsive optimizados
- Múltiples ViewModels especializados funcionando en conjunto
- Experiencia de usuario pulida sin bugs visuales
- Sistema de debugging y testing implementado

### Próximos Pasos
- **Inmediato**: Implementación de sistema de filtros en Momentos (Fase 9)
- **Corto plazo**: Filtros de favoritos y emociones con funcionalidad completa
- **Mediano plazo**: Reproductor de ejercicios y navegación a vista individual de categorías categorías (Fase 8)
- **Corto plazo**: Grid de 5 categorías con filtros y navegación a ejercicios
- **Mediano plazo**: Sistema de favoritos y datos curiosos en vista Momentos

---

*MirrorMind - Sistema de gestión emocional estudiantil a través de la tecnología*
