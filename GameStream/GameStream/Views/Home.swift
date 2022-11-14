//
//  Home.swift
//  GameStream
//
//  Created by Alan Gloria on 03/11/22.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State var tabSeleccionado: Int = 0
    
    var body: some View {
        
        
            TabView(selection: $tabSeleccionado){
                
                PantallaHome()
                    .tabItem{
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(0)
                    .toolbarBackground(.hidden, for: .tabBar)
                
                gamesView()
                    .tabItem{
                        Image(systemName: "gamecontroller")
                        Text("Games")
                    }.tag(1)
                    .toolbarBackground(.hidden, for: .tabBar)
                
                FavoritesView()
                    .tabItem{
                        Image(systemName: "heart")
                        Text("Favorites")
                    }.tag(2)
                    .toolbarBackground(.hidden, for: .tabBar)
                
                ProfileView()
                    .tabItem{
                        Image(systemName: "person")
                        Text("Profile")
                    }.tag(3)
                    .toolbarBackground(.hidden, for: .tabBar)
                    
            }
        
            
        
    }
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("tabBarColor"))
        
    }
}

struct PantallaHome: View{
    
    
    var body: some View{
        
        NavigationStack {
            ZStack {
                Color("marine").ignoresSafeArea()
                VStack {
                    Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal, 11)
                    ScrollView {
                        VStack {

                            
                            ScrollView(showsIndicators: false){
                                subModuloHome()
                            }
                            
                        }.padding(.horizontal,18)
                    }
                }
                
            }
                
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
    }
    
}

struct subModuloHome: View {
    
    @State var textoBusqueda = ""

    @State var isGameInfoEmpty = false
    @ObservedObject var juegoEncontrado = SearchGame()
    @State var isGameViewActive = false
    @State private var path = Home()
    @State var urlhome:String = "https://dl.dropboxusercontent.com/s/7167kppqrp1l72s/Cuphead480.mp4"
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion:String = ""
    @State var anoPublicacion:String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl: [String] = [""]

    
    var body: some View{
        
        
        
        
        NavigationStack {
            VStack {
                    
                    HStack{
                        Button(action: {
                            
                            watchGame(name: textoBusqueda)
                            
                            
                        }, label:{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(textoBusqueda.isEmpty ? Color.yellow : Color("DarkCian"))
                            
                        }).padding(.bottom,10)
                            .alert(isPresented: $isGameInfoEmpty){
                                Alert(title: Text("Error"), message: Text("No se encontró el juego"), dismissButton: .default(Text("Entendido")))
                            }
                        
                        ZStack(alignment: .leading){
                            if textoBusqueda.isEmpty{
                                Text("Buscar un video")
                                    .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                            }
                            TextField("", text: $textoBusqueda).foregroundColor(.white)
                        }.padding(.bottom,10)
                            .onSubmit( {watchGame(name: textoBusqueda)})
                            .submitLabel(.done)
                            .navigationDestination(isPresented: $isGameViewActive)  {gameView(url: urlhome, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl)}
                        
                    }.padding([.top, .leading], 11).background(Color("lightblue")).clipShape(Capsule())
                    
                    Text("LOS MÁS POPULARES")
                        .font(.title3)
                        .foregroundColor(.white)
                        .bold()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.top)
                        
                    
                Button(action: {watchGame(name: "The Witcher 3")} , label: {
                        
                    ZStack {
                        VStack(spacing: 0) {

                            Image("The Witcher 3").resizable().scaledToFill()
                            Text("The Witcher 3")
                                .foregroundColor(.white)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .background(Color("lightblue"))
                        }

                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 42, height: 42)
                    }
                    
                        
                })
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding(.vertical)
                    .navigationDestination(isPresented: $isGameViewActive)  {gameView(url: urlhome, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl)}
                       
                        
                        Text("CATEGORÍAS SUGERIDAS PARA TI")
                        .font(.title3)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                    ScrollView(.horizontal, showsIndicators: false){
                        
                        HStack{
                            Button(action: {}, label: {
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color("lightblue"))
                                        .frame(width: 160, height: 90)
                                    Image("FPS")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 42, height: 42)
                                }
                                
                            })
                            
                            Button(action: {}, label: {
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color("lightblue"))
                                        .frame(width: 160, height: 90)
                                    Image("RPG")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 42, height: 42)
                                }
                                
                            })
                            
                            Button(action: {}, label: {
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color("lightblue"))
                                        .frame(width: 160, height: 90)
                                    Image("Open world")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 42, height: 42)
                                }
                                
                            })
                        }
                        
                    }
                    
                    Text("RECOMENDADOS PARA TI")
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        
                        HStack{
                           
                            
                            
                                Button(action: {watchGame(name: "Abzu")} , label: {
                                        
                                            Image("abzu")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 240, height: 135)
                                        
                                }).navigationDestination(isPresented: $isGameViewActive)  {gameView(url: urlhome, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl)}
                            
                            Button(action: {watchGame(name: "Crash Bandicoot")} , label: {
                                    
                                        Image("crashb")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 240, height: 135)
                                    
                            }).navigationDestination(isPresented: $isGameViewActive)  {gameView(url: urlhome, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl)}

                            Button(action: {watchGame(name: "Grand Theft Auto V")} , label: {
                                    
                                        Image("gtav")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 240, height: 135)
                                    
                            }).navigationDestination(isPresented: $isGameViewActive)  {gameView(url: urlhome, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl)}
                            
                        }
                        
                    }
                
                Text("VIDEOS QUE PODRIAN GUSTARTE")
                .font(.title3)
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack{
                       
                        
                        
                            Button(action: {watchGame(name: "Cuphead")} , label: {
                                    
                                        Image("cuphead")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 240, height: 135)
                                    
                            }).navigationDestination(isPresented: $isGameViewActive)  {gameView(url: urlhome, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl)}
                        
                        Button(action: {watchGame(name: "Hades")} , label: {
                                
                                    Image("hades")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 240, height: 135)
                                
                        }).navigationDestination(isPresented: $isGameViewActive)  {gameView(url: urlhome, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl)}
                        
                    }
                    
                }
                    
                    
                    
            }
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
        
        
        
    }
    
    func watchGame(name:String) {
        juegoEncontrado.search(gameName: name)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
            
            print("Cantidad E: \(juegoEncontrado.gameInfo.count)")
            print("juego \(juegoEncontrado.gameInfo[0].title)")
            print(isGameViewActive)
            if juegoEncontrado.gameInfo.count == 0 {
                isGameInfoEmpty = true
            }else{
                isGameViewActive = true
                urlhome = juegoEncontrado.gameInfo[0].videosUrls.mobile
            titulo = juegoEncontrado.gameInfo[0].title
            studio = juegoEncontrado.gameInfo[0].studio
            calificacion = juegoEncontrado.gameInfo[0].contentRaiting
            anoPublicacion = juegoEncontrado.gameInfo[0].publicationYear
            descripcion = juegoEncontrado.gameInfo[0].description
            tags = juegoEncontrado.gameInfo[0].tags
            imgsUrl = juegoEncontrado.gameInfo[0].galleryImages
        
                print(isGameViewActive)
                print(urlhome)
              
            }
            
        }
        
    }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
