//
//  RatingSummary.swift
//  MovieRatings
//
//  Created by Rik Roy on 9/21/23.
//

import SwiftUI

struct RatingSummary: View {
    let movie: Movie
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.blue)
            HStack {
                Image(movie.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 90)
                
                Text(movie.title)
                    .frame(width: 100)
                
                Text(String(movie.rating ?? 0) + "/5")
                    
            }
        }.frame(width: 300, height: 200)
    }
}

#Preview {
    RatingSummary(movie: Movie.allMovies[0])
}
