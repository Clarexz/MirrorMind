//
//  MomentosScreen.swift
//  MirrorMind
//
//  Created by Caleb Martinez Cavazos on 20/08/25.
//


//
//  MomentosScreen.swift
//  MirrorMind
//
//  Created by Moments Structure Lead on 20/08/25.
//

import SwiftUI

struct MomentosScreen: View {
    var body: some View {
        NavigationView {
            MomentosView()
                //.navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    MomentosScreen()
}
