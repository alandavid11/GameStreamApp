//
//  gamesView.swift
//  GameStream
//
//  Created by Alan Gloria on 06/11/22.
//

import SwiftUI

struct gamesView: View {
    
    @ObservedObject var todosLosVideoJuegos = ViewModel()
    
    @State var gameViewIsActive: Bool = false
    @State var url:String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion:String = ""
    @State var anoPublicacion:String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl: [String] = [""]
    
    @ViewBuilder
        func placeholderImage() -> some View {
            Image(systemName: "photo")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
        
                .frame(width: 80, height: 80)
                .foregroundColor(.gray)
                
        }
    
    let formaGrid = [
        GridItem(.flexible(),alignment: .top),
        GridItem(.flexible(), alignment: .top)
    ]
    
    var body: some View {
        
        ZStack{
            
            Color("marine").ignoresSafeArea()
            
            VStack{
                Text("Juegos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 11, leading: 0, bottom: 5, trailing: 0))
                
                ScrollView{
                    
                    LazyVGrid(columns: formaGrid, spacing: 4){
                        
                        ForEach(todosLosVideoJuegos.gamesInfo,id: \.self){
                            juego in
                            NavigationLink(destination: gameView(url: juego.videosUrls.mobile, titulo: juego.title, studio: juego.studio, calificacion: juego.contentRaiting, anoPublicacion: juego.publicationYear, descripcion: juego.description, tags: juego.tags, imgsUrl: juego.galleryImages), label: {
                                VStack
                                {
                                    AsyncImage( url: URL( string: juego.galleryImages[0] )!  )
                                    { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(RoundedRectangle(cornerRadius: 11))
                                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))

                                    } placeholder: {
                                        placeholderImage()
                                    }


                                    Text("\(juego.title)").foregroundColor(.white)
                                        .font(.body)
                                        .padding(EdgeInsets(top: 1, leading: 0, bottom: 15, trailing: 0))


                                }

                            })
                            
                        }
                        
                    }
                    
                  
                }
                
                
            }.padding(.horizontal, 6)
            
        }.toolbar(.hidden)
                .navigationBarBackButtonHidden(true)
               
            
            
        
        
        
    }
}

struct gamesView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            gamesView()
        }
    }
}
