//
//  CardViewController.swift
//  DeckOfCard_01
//
//  Created by iljoo Chae on 6/16/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func fetchImageAndUpdateViews(card: Card) {
        CardController.fetchImage(card: card) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self.cardImageView.image = image
                    self.cardLabel.text = "\(card.value) of \(card.suit)"
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
@IBAction func drawButtonTapped(_ sender: Any) {
        CardController.fetchCard{[weak self] (result) in
            
            switch result{
            case .success(let card):
                self?.fetchImageAndUpdateViews(card: card)
            case .failure(let error):
                DispatchQueue.main.async {
                self?.presentErrorToUser(localizedError: error)
            }
            }
            
        }
    }
    
}
