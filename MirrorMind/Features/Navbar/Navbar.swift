import SwiftUI

struct Navbar: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Solo mostrar la vista según selectedTab
            Group {
                if selectedTab == 0 { HomeView() }
                else if selectedTab == 1 { MomentosView() }
                else if selectedTab == 2 { ChatView() }
                else if selectedTab == 3 { PerfilView() }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}
#Preview {
    Navbar()
}
