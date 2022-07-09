//
//  CoinDataService.swift
//  CryptoBig
//
//  Created by Quang Bao on 03/07/2022.
//

import SwiftUI
import Combine

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    
    //1. Nếu triển khai tập cancel như này thì sẽ rất khó khi ta muốn hủy một đối tượng cụ thể nào đó
//    var cancellables = Set<AnyCancellable>()
    //2. nên ta chuyển sang cách này
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getCoins() {
        
        //MARK: Step1: Download data from this url
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
        else { return }
        
        coinSubscription = URLSession.shared.dataTaskPublisher(for: url)
        //Step2: Using subscribe of combine to get data
            .subscribe(on: DispatchQueue.global(qos: .default))
        //Step3: Use map the url response
            .tryMap { output -> Data in
                //Strp3-1: Check it valid or not
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
        //Step4: we received on the main thread
            .receive(on: DispatchQueue.main)
        //Step5: we decoded it into coin models
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
        //Step6: we handle the complition
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
                //Step7: we got the return coins and we did something with it
            } receiveValue: { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
                //3. Nếu ta ko có lệnh hủy ở đây thì cx ko vấn đề j bởi nó ko chiếm quá nhiều bộ nhớ
                //nhưng ta cx nên cancel nó đi bởi nó thật sự ko lm thêm bất cứ cái gì sau khi nó trả về data
                self?.coinSubscription?.cancel()
            }
//            .store(in: &cancellables)
    }
}
