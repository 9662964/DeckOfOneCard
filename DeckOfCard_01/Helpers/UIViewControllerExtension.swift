//
//  UIViewControllerExtension.swift
//  DeckOfCard_01
//
//  Created by iljoo Chae on 6/16/20.
//  Copyright © 2020 Admin. All rights reserved.
//


import UIKit

extension UIViewController{
    func presentErrorToUser(localizedError: LocalizedError) {
        let alertController = UIAlertController(title: "Error", message: localizedError.errorDescription, preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
    
}
