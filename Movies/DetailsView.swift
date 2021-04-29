//
//  DetailsView.swift
//  Movies
//
//  Created by Janvier Rugomoka Zagabe on 2020-05-18.
//  Copyright © 2020 Janvier Zagabe. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct DetailsView: View {
    @ObservedObject var networkManager = NetworkManagerDet()
    
    var imdbID : String
    var body: some View {
        
        NavigationView
            {
                VStack {
                    Text(networkManager.fdetails?.Title ?? "Title")
                    Text("Year : \( networkManager.fdetails?.Year ?? "Year")")
                    KFImage(URL(string: networkManager.fdetails?.Poster ?? "")
                    )
                    Text(networkManager.fdetails?.Writer ?? "Writer")
                 Spacer()
                }
                .padding(.top,50)
            
                
        }.navigationBarTitle("\(networkManager.fdetails?.Title ?? "Title")",displayMode: .inline)
            
        .onAppear{self.networkManager.fetchDetails(imdbID: self.imdbID)}
    }
}
