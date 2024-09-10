//
//  ContentView.swift
//  MovieRatings
//
//  Created by Rik Roy on 9/21/23.
//

import SwiftUI

struct ContentView: View {
    let viewModel: ViewModel = ViewModel(startingIndex: 0)
    @State private var rating: Int = 0
    @State private var didTap: Bool = false
    @State private var showSheet = false
    var body: some View {
    
        VStack {
            HStack {
                Spacer().frame(width: 300)
                Button {
                    self.showSheet.toggle()
                } label: {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black)
                        .frame(width: 40)

                }

            }
            Text("Movie Ratings")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 40))
            
            Image(viewModel.currentMovie.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250)
            
            HStack {
                Text(viewModel.currentMovie.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Text(viewModel.currentMovie.year)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
            }
            
            Text(viewModel.currentMovie.description)
                .lineLimit(3)
                .padding()
            
            
            HStack {
                ForEach(1...5, id: \.self) { star in
                    Button() {
                        self.didTap.toggle()
                        rating = star
                        
                    } label: {
                        Image(systemName: "star.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(rating >= star ? .yellow : .white)
                            .frame(width: 50)
                    }
                }
            }.padding()
            
            Text(String(rating))
            
            Button() {
                viewModel.currentMovie.rating = rating
                viewModel.ratings.append(viewModel.currentMovie)
                viewModel.getNextMovie()
                rating = 0
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.red)
                    Text("Next Movie")
                        .foregroundColor(.white)
                    
                }
                .frame(width: 110, height: 40)
            }
            
            

            
            
        }.sheet(isPresented: $showSheet, content: {
            RatingsView(viewModel: viewModel)
        })
        .background(LinearGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
        
    
    }
}

#Preview {
    ContentView()
}
