//
//  CoinModel.swift
//  CryptoBig
//
//  Created by Quang Bao on 31/05/2022.
//

import SwiftUI

// CoinGecko API info
/*
 https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 */

/*
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 31784,
     "market_cap": 604534089420,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 666270630897,
     "total_volume": 33362907061,
     "high_24h": 31879,
     "low_24h": 30297,
     "price_change_24h": 1418.78,
     "price_change_percentage_24h": 4.67233,
     "market_cap_change_24h": 26453682737,
     "market_cap_change_percentage_24h": 4.57613,
     "circulating_supply": 19054143,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 69045,
     "ath_change_percentage": -54.0484,
     "ath_date": "2021-11-10T14:24:11.849Z",
     "atl": 67.81,
     "atl_change_percentage": 46689.02933,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2022-05-31T04:05:17.220Z",
     "sparkline_in_7d": {
       "price": [
         29135.362563102553,
         29179.22613289936
       ]
     },
     "price_change_percentage_24h_in_currency": 4.67232646655896
   }
 */

// MARK: - Welcome
struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHolding: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHolding
    }
    
    func updateHoding(amount: Double) -> CoinModel {
        return CoinModel(
            id: id,
            symbol: symbol,
            name: name,
            image: image,
            currentPrice: currentPrice,
            marketCap: marketCap,
            marketCapRank: marketCapRank,
            fullyDilutedValuation: fullyDilutedValuation,
            totalVolume: totalVolume,
            high24H: high24H,
            low24H: low24H,
            priceChange24H: priceChange24H,
            priceChangePercentage24H: priceChangePercentage24H,
            marketCapChange24H: marketCapChange24H,
            marketCapChangePercentage24H: marketCapChangePercentage24H,
            circulatingSupply: circulatingSupply,
            totalSupply: totalSupply,
            maxSupply: maxSupply,
            ath: ath,
            athChangePercentage: athChangePercentage,
            athDate: athDate,
            atl: ath,
            atlChangePercentage: atlChangePercentage,
            atlDate: atlDate,
            lastUpdated: lastUpdated,
            sparklineIn7D: sparklineIn7D,
            priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency,
            currentHolding: amount)
    }
    
    // MARK: Số lượng tiền hiện có = số coin đang nắm giữ * giá trị hiện tại của coin
    // MARK: Total Current Holding Coin Value = Current holding coin * Current value
    var currentHoldingValue: Double {
        return (currentHolding ?? 0) * currentPrice
    }
    
    // MARK: Thứ hạng của đồng coin này trên thị trường
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
    let price: [Double]?
}

