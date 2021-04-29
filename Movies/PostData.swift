//
//  PostData.swift
//  Movies
//
//  Created by Janvier Rugomoka Zagabe on 2020-05-13.
//  Copyright © 2020 Janvier Zagabe. All rights reserved.
//

import Foundation
struct Results : Decodable {
    let Search : [Film]
}


struct Film : Decodable, Identifiable
{
    var id : String
    {
        return imdbID
    }
    let imdbID : String
    let Year : String
    let Title : String
    let Poster : String?
}

struct ResDet : Decodable
{
    
    let Genre : String
    let imdbID : String
    let Year : String
    let Title : String
    let Poster : String?
    let Writer : String
}

