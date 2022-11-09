//
//  gameView.swift
//  GameStream
//
//  Created by Alan Gloria on 07/11/22.
//

import SwiftUI
import AVKit

struct gameView: View {
    
     var url:String
     var titulo:String
     var studio:String
     var calificacion:String
     var anoPublicacion:String
     var descripcion:String
     var tags:[String]
     var imgsUrl: [String]
    
    var body: some View {
        
        
        ZStack {
            
            Color("marine").ignoresSafeArea()
            
            
            VStack {
                
                video(url: url).frame(height: 300)
                ScrollView {
                    // Informacion video
                    videoinfo(titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags)
                        .padding(.bottom)
                    
                    Gallery(imgURL: imgsUrl)
                    
                    Comentarios()
                    
                }.frame(maxWidth: .infinity)
            }
            
            
        }
        
        
    }
}

struct video:View{
    
    let url: String
        
        init(url: String) {
            self.url = url
        }
        
        var body: some View {
            let player = AVPlayer(url: URL(string: url)!)
            VideoPlayer(player: player)
                .ignoresSafeArea()
                .onDisappear(perform: {
                    player.pause()
                })
        }
}

struct videoinfo:View{
    
    var titulo:String
    var studio:String
    var calificacion:String
    var anoPublicacion:String
    var descripcion:String
    var tags:[String]
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text("\(titulo)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            HStack{
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                
                Text("\(calificacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                
                Text("\(anoPublicacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
            }
            
            Text("\(descripcion)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
            
            HStack{
                ForEach(tags, id: \.self){
                    tag in
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 4)
                        .padding(.leading)
                }
            }
            
        }.frame(maxWidth: .infinity,alignment: .leading)
        
    }
}

struct Gallery:View{
    
    var imgURL:[String]
    let formaGrid = [GridItem(.flexible())]
    
    @ViewBuilder
    func placeholderImage() -> some View {
        EmptyView()
    }
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text("GALERÍA")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading)
            
            ScrollView(.horizontal){
                
                LazyHGrid(rows: formaGrid, spacing: 8){
                    ForEach(imgURL, id:\.self){
                        
                        imgURL in
                        
                        // Desplegar imagenes del servidor por medio de URL
                        AsyncImage(url: URL(string: imgURL)) {
                            image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            placeholderImage()
                        }
                    }
                    
                }
                
            }.frame(height: 180)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct Comentarios: View {
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text("COMENTARIOS")
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.top)
            
            VStack {
                
                HStack{
                    
                    Image("picture")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64, alignment: .leading)
                        .padding(.leading)
                        .padding(.top)
                    
                    VStack{
                        
                        Text("Enrique Ramos")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .frame(alignment:.leading)
                            .padding(.top)
                        
                        Text("Hace 7 días").foregroundColor(.white).font(.footnote).frame(alignment: .leading).padding(.bottom)
                        
                        
                    }
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.").foregroundColor(.white).font(.subheadline).frame(alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
                
            }.frame(maxWidth: .infinity, alignment: .leading).background(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0)).clipShape(RoundedRectangle(cornerRadius: 8)).padding(.all, 10)
            
            VStack {
                
                HStack{
                    
                    Image("picture")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64, alignment: .leading)
                        .padding(.leading)
                        .padding(.top)
                    
                    VStack{
                        
                        Text("Damon Barlow")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .frame(alignment:.leading)
                            .padding(.top)
                        
                        Text("Hace 12 días").foregroundColor(.white).font(.footnote).frame(alignment: .leading).padding(.bottom)
                        
                        
                    }
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.").foregroundColor(.white).font(.subheadline).frame(alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
                
            }.frame(maxWidth: .infinity, alignment: .leading).background(Color(red: 34/255, green: 53/255, blue: 94/255, opacity: 1.0)).clipShape(RoundedRectangle(cornerRadius: 8)).padding(.all, 10)
            
          
            
        }
    }
}

struct gameView_Previews: PreviewProvider {
    static var previews: some View {
        gameView(
            url: "ejemplo",titulo:"Sonic The Hedgehog",
            studio: "Sega",
            calificacion: "E+",
            anoPublicacion: "1991",
            descripcion: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente",
            tags:["plataformas","mascota"],
            imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"
        ])
    }
}
