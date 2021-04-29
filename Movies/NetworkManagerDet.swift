//
//  NetworkManagerDet.swift
//  Movies
//
//  Created by Janvier Rugomoka Zagabe on 2020-05-18.
//  Copyright © 2020 Janvier Zagabe. All rights reserved.
//

import Foundation
class NetworkManagerDet : ObservableObject{
    
    @Published var fdetails : ResDet?
    init(){}
    func fetchDetails(imdbID : String) {
    
         if let url = URL(string: "https://www.omdbapi.com/?i=\(imdbID)&apikey=caaa9695") {
             let session2 = URLSession(configuration: .default)
             let task = session2.dataTask(with: url) { (data, response, error) in
                 if error == nil {
                     let decoder = JSONDecoder()
                     if let safeData = data {
                         do {
                             let result = try decoder.decode(ResDet.self, from: safeData)
                             DispatchQueue.main.async {
                                let Genre = result.Genre
                                 let imdbID = result.imdbID
                                 let Year = result.Year
                                 let Title = result.Title
                                 let Poster = result.Poster
                                 let Writer = result.Writer
                                 self.fdetails = ResDet(Genre: Genre, imdbID: imdbID, Year: Year, Title: Title, Poster: Poster, Writer: Writer)
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

