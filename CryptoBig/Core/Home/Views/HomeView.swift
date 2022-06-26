//
//  HomeView.swift
//  CryptoBig
//
//  Created by Quang Bao on 22/05/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var vm: HomeViewModel
    @State private var isShowPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            // Background layer
            Color.theme.backgroundColor
                .ignoresSafeArea()
            
            // Content layer
            VStack {
                homeHeader
                columnTitle
                
                if !isShowPortfolio {
                    allCoinList
                        .transition(.move(edge: .leading))
                }
                
                if isShowPortfolio {
                    portfolioCoinList
                        .transition(.move(edge: .trailing))
                }
              
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
//        .environmentObject(HomeViewModel())
        /*Ta khai báo thêm
         let homeVM = HomeViewModel()
         ở PreviewProvider rồi triển khai theo kiểu
         dev.HomeViewModel() cho nó sync
        */
        .environmentObject(dev.homeVM)
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
    
    private var allCoinList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, isShowHoldingColume: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var portfolioCoinList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, isShowHoldingColume: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var columnTitle: some View {
        HStack {
            Text("Coin")
            Spacer()
            if isShowPortfolio {
                Text("Holding")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryTextColor)
        .padding(.horizontal)
    }
}
