//
//  NetworkManager.swift
//  Movies
//
//  Created by Janvier Rugomoka Zagabe on 2020-05-13.
//  Copyright © 2020 Janvier Zagabe. All rights reserved.
//

import Foundation
class NetworkManager : ObservableObject{
    
    @Published var films = [Film]()
   
       func fetchData() {
           if let url = URL(string: "https://www.omdbapi.com/?s=Batman&apikey=caaa9695") {
               let session = URLSession(configuration: .default)
               let task = session.dataTask(with: url) { (data, response, error) in
                   if error == nil {
                       let decoder = JSONDecoder()
                       if let safeData = data {
                           do {
                               let results = try decoder.decode(Results.self, from: safeData)
                               DispatchQueue.main.async {
                                   self.films = results.Search
                                  
                               }
                           } catch {
                               print(error)
                           }
                       }
                   }
               }
               task.resume()
           }
       }
   
   
}
