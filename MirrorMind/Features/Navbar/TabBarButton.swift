import SwiftUI

struct TabBarButton: View {
    let item: TabItem
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: item.icon)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                // Fondo de selección MÁS CLARO que el verde principal
                RoundedRectangle(cornerRadius: 20)
                    .fill(isSelected ? .white.opacity(0.2) : Color.clear)
            )
        }
        .frame(height: 50) // Altura fija
    }
}
