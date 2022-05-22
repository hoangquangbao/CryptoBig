//
//  CircleButtonAnimationView.swift
//  CryptoBig
//
//  Created by Quang Bao on 22/05/2022.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var isAnimation: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(isAnimation ? 1 : 0)
            .opacity(isAnimation ? 0 : 1)
            .animation(isAnimation ? Animation.easeOut(duration: 1) : .none)
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(isAnimation: .constant(false))
    }
}
