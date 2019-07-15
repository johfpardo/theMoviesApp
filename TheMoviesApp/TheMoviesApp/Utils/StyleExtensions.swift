//
//  StyleExtensions.swift
//  TheMoviesApp
//
//  Created by Jhon Fredy Pardo Patiño on 7/14/19.
//  Copyright © 2019 Jhon Fredy Pardo Patiño. All rights reserved.
//

import UIKit

extension UIViewController {
    
    
    func showAlert(_ title: String?, message: String?, titleAction: String, completion: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let firstAction = UIAlertAction(title: titleAction, style: .default, handler: { action in
            if let completion = completion {
                completion()
            }
        })
        alertController.addAction(firstAction)
        
        present(alertController, animated: true)
        
    }
}
