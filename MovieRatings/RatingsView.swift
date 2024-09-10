//
//  RatingsView.swift
//  MovieRatings
//
//  Created by Rik Roy on 9/21/23.
//

import SwiftUI

struct RatingsView: View {
    @State var viewModel: ViewModel
    var body: some View {
        Text("My Ratings")
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .font(.system(size: 40))
        
        List(viewModel.ratings) { rating in
            RatingSummary(movie: rating)
        }
    }
}

#Preview {
    RatingsView(viewModel: ViewModel(startingIndex: 0))
}
