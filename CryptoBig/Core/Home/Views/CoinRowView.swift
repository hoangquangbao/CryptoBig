//
//  CoinRowView.swift
//  CryptoBig
//
//  Created by Quang Bao on 04/06/2022.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let isShowHoldingColume: Bool
    
    var body: some View {
        
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryTextColor)
                .frame(width: 30)
            
            Circle()
                .frame(width: 30, height: 30)
            
            Text("\(coin.symbol.uppercased())")
                .font(.headline)
                .foregroundColor(Color.theme.accent)
                .padding(.leading, 6)
            
            Spacer()
            
            if isShowHoldingColume {
                VStack(alignment: .trailing) {
                    Text(coin.currentHoldingValue.asCurrencyWith6Decimals())
                        .bold()
                        .foregroundColor(Color.theme.accent)
                    
                    Text(coin.currentHolding?.asNumberString() ?? "0")
                }
            }
            
            VStack(alignment: .trailing) {
//                Text("\(coin.currentPrice)")
                Text(coin.currentPrice.asCurrencyWith6Decimals())
                    .bold()
                    .foregroundColor(Color.theme.accent)
                
//                Text("\(coin.priceChangePercentage24H ?? 0)%")
                Text(coin.priceChangePercentage24H?.asPercentString() ?? "0.00%")
                    .foregroundColor(
                        (coin.priceChangePercentage24H ?? 0) >= 0 ?
                        Color.theme.greenColor :
                        Color.theme.redColor
                    )
            }
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, isShowHoldingColume: true)
    }
}
