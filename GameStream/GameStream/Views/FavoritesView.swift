//
//  FavoritesView.swift
//  GameStream
//
//  Created by Alan Gloria on 13/11/22.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    
    @ObservedObject var todosLosVideoJuegos = ViewModel()
    
    var body: some View {
        
        
        ZStack {
            Color("marine").ignoresSafeArea()
            
            VStack {
                
                
                Text("Favoritos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(.bottom, 9)
                
                ScrollView{
                    
                    ForEach(todosLosVideoJuegos.gamesInfo, id: \.self){
                        juego in
                        
                        VStack(spacing: 0) {
                            VideoPlayer(player: AVPlayer(url: URL(string: juego.videosUrls.mobile)!))
                                .frame(height: 230)
                            Text("\(juego.title)")
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color("lightblue"))
                                .clipShape(RoundedRectangle(cornerRadius: 3.0))
                        }
                        
                    }
                    
                }.padding(.bottom, 8)
                
                
            }.padding(.horizontal, 6)
        }.toolbar(.hidden)
            .navigationBarBackButtonHidden(true)
        
        
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
