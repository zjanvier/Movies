//
//  ContentView.swift
//  Movies
//  Created by Janvier Rugomoka Zagabe on 2020-05-13.
//  Copyright © 2020 Janvier Zagabe. All rights reserved.
//
import SwiftUI
import KingfisherSwiftUI
struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
     NavigationView
        {
            List(networkManager.films){ film in
                NavigationLink(destination : DetailsView(imdbID: film.imdbID))
                {
                HStack
                    {
                        KFImage(URL(string: film.Poster!))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .frame(width: 150.0, height: 150.0)
                        VStack (alignment: .leading){
                            Text("Title : \(film.Title)")
                                .bold()
                            Text("Year : \(film.Year)")
                            Text("imdbID : \(film.imdbID)")
                            
                        }
    
                }
            }.navigationBarTitle("Catalogue")
                    
       
            }
             }
     .onAppear{self.networkManager.fetchData()}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
