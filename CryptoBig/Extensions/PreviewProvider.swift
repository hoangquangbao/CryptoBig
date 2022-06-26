//
//  PreviewProvider.swift
//  CryptoBig
//
//  Created by Quang Bao on 04/06/2022.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static var instance = DeveloperPreview()
    private init() {}
    
    let homeVM = HomeViewModel()
    
    let coin = CoinModel(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
        currentPrice: 31784,
        marketCap: 604534089420,
        marketCapRank: 1,
        fullyDilutedValuation: 666270630897,
        totalVolume: 33362907061,
        high24H: 31879,
        low24H: 30297,
        priceChange24H: 1418.78,
        priceChangePercentage24H: 4.67233,
        marketCapChange24H: 26453682737,
        marketCapChangePercentage24H: 4.57613,
        circulatingSupply: 19054143,
        totalSupply: 21000000,
        maxSupply: 21000000,
        ath: 69045,
        athChangePercentage: -54.0484,
        athDate: "2021-11-10T14:24:11.849Z",
        atl: 67.81,
        atlChangePercentage: 46689.02933,
        atlDate: "2013-07-06T00:00:00.000Z",
        lastUpdated: "2022-05-31T04:05:17.220Z",
        sparklineIn7D: SparklineIn7D(
            price: [
              29135.362563102553,
              29179.22613289936
            ]),
        priceChangePercentage24HInCurrency: 4.67232646655896, currentHolding: 1.5)
}
