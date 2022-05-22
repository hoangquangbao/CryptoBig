//
//  HomeView.swift
//  CryptoBig
//
//  Created by Quang Bao on 22/05/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isShowPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            // Background layer
            Color.theme.backgroundColor
                .ignoresSafeArea()
            
            // Content layer
            VStack {
                homeHeader
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
    }
}

extension HomeView {
    
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: isShowPortfolio ? "plus" : "info")
            // Doesn't apply animation for this Button when isShowPortfolio value changed
                .animation(.none, value: isShowPortfolio)
                .background(
                    CircleButtonAnimationView(isAnimation: $isShowPortfolio)
                )
            
            Spacer()
            
            Text(isShowPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none, value: isShowPortfolio)
            
            Spacer()
            
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: isShowPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        isShowPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}
