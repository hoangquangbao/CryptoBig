//
//  File.swift
//  CryptoBig
//
//  Created by Quang Bao on 09/07/2022.
//
/*
 https://www.youtube.com/watch?v=pp5-ASYnY0o&list=PLwvDm4Vfkdphbc3bgy_LpLRQ9DDfFGcFu&index=9&ab_channel=SwiftfulThinking
 */
import Foundation
import Combine
import SwiftUI

class NetworkingManager {
    
//    static func download(url: URL) -> Publishers.ReceiveOn<Publishers.TryMap<Publishers.SubscribeOn<URLSession.DataTaskPublisher, DispatchQueue>, Data>, DispatchQueue> {
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
        //Step2: Using subscribe of combine to get data
            .subscribe(on: DispatchQueue.global(qos: .default))
        //Step3: Use map the url response
            .tryMap({ try handleURLResponse(output: $0)})
        //Step4: we received on the main thread
            .receive(on: DispatchQueue.main)
        
        //MARK: As you can see return type above so crazy. Combine have a func convert return publisher type to return AnyPublisher type by use code line below
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        //Strp3-1: Check it valid or not
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
