//
//  NetworkDispatch.swift
//  PuraVida
//
//  Created by Jerry Ren on 7/26/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import os.log
import UIKit
import Foundation

// MARS: - Fundamental approach

extension UIViewController {
    func mostBasicApproach() {
        
        let sharedURLSession = URLSession.shared
        
        var urlRequ = URLRequest.init(url: URL(string: "https://jsonplaceholder.typicode.com/todos/")!)
        
        urlRequ.httpMethod = "GET"
        
        sharedURLSession.dataTask(with: urlRequ) { (data, urlResponse, error) in
            
            do {
             //   let info = try JSONDecoder().decode([Info].self, from: data!)
                DispatchQueue.main.async {
                    print("basic approach's reloadData called")
                }
            } catch {
                
                print("error caught before fall")
            }
        }.resume()
    }
}

