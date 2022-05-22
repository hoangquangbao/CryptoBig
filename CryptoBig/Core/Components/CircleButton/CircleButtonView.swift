//
//  CircleButtonView.swift
//  CryptoBig
//
//  Created by Quang Bao on 22/05/2022.
//

import SwiftUI

// MARK: Created a Bar Button View to reuse
struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.backgroundColor)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10, x: 0, y: 0)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            // It's not going to be a full screen. This is going to be a little icon button so I using preview layout
            CircleButtonView(iconName: "info")
                .previewLayout(.sizeThatFits)
            
            // It's not going to be a full screen. This is going to be a little icon button so I using preview layout
            CircleButtonView(iconName: "plus")
                .previewLayout(.sizeThatFits)
            // It in hereeeeeee
                .preferredColorScheme(.dark)
        }
    }
}
