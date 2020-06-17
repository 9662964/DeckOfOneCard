//
//  CardController.swift
//  DeckOfCard_01
//
//  Created by iljoo Chae on 6/16/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class CardController {
   
    static let finalURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/?count=1")
    
    static func fetchCard(completion: @escaping (Result <Card, CardError>) -> Void) {
     // 1 - Prepare URL
        guard let finalURL = finalURL else {return completion(.failure(.invalidURL))}
    // 2 - Contact server
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
       // 3 - Handle errors from the server
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
           // 4 - Check for json data
            guard let data = data else {return completion(.failure(.noData))}
           // 5 - Decode json into a Card
            do{
                let topLevel = try JSONDecoder().decode(TopLevelObject.self, from: data)
                //let card = try JSONDecoder().decode(Card.self, from:data)
                let card = topLevel.cards[0]
                return completion(.success(card))
            }catch{
                print(error, error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
    
    
    static func fetchImage(card: Card, completion: @escaping (Result <UIImage, CardError>) -> Void) {
      // 1 - Prepare URL
        let finalURL = card.image
      // 2 - Contact server
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            // 3 - Handle errors from the server
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.thrownError(error)))
            }
            // 4 - Check for image data
            guard let data = data else {return completion(.failure(.noData))}
            // 5 - Initialize an image from the data
            guard let image = UIImage(data: data) else {return completion(.failure(.unableToDecode))}
            return completion(.success(image))
        }.resume()
    }
}
