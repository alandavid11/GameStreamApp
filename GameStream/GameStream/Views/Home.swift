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
            
            PantallaHome().tabItem{
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
            
            Text("Favoritos").font(.system(size: 30, weight: .bold,design: .rounded))
                .tabItem{
                    Image(systemName: "heart")
                    Text("Favorites")
                }.tag(2)
                .toolbarBackground(.hidden, for: .tabBar)
            
            Text("Perfil").font(.system(size: 30, weight: .bold,design: .rounded))
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
    @State var textoBusqueda = ""
    
    var body: some View{
        
        ZStack {
            Color("marine").ignoresSafeArea()
            VStack {
                Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal, 11)
                ScrollView {
                    VStack {
                        HStack{
                            Button(action: busqueda, label:{ Image(systemName: "magnifyingglass")
                                    .foregroundColor(textoBusqueda.isEmpty ? Color.yellow : Color("DarkCian"))
                                
                            }).padding(.bottom)
                            
                            ZStack(alignment: .leading){
                                if textoBusqueda.isEmpty{
                                    Text("Buscar un video")
                                        .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                                }
                                TextField("", text: $textoBusqueda).foregroundColor(.white)
                            }.padding(.bottom)
                            
                        }.padding([.top, .leading], 11).background(Color("lightblue")).clipShape(Capsule())
                        
                        ScrollView(showsIndicators: false){
                            subModuloHome()
                        }
                        
                    }.padding(.horizontal,18)
                }
            }
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
    }
    
    func busqueda() {
        print("El usuario esta buscando \(textoBusqueda)")
    }
    
}

struct subModuloHome: View {
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View{
        
        
        
        VStack {
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                
                NavigationLink(destination: VideoPlayer(player: AVPlayer(url: URL(string: urlVideos[0])!)), label: { ZStack {
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
                }).frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding(.vertical)
               
                
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
                   
                    NavigationLink(destination: VideoPlayer(player: AVPlayer(url: URL(string: urlVideos[1])!)), label: {
                        
                            Image("abzu")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                        
                    })
                    
                    NavigationLink(destination: VideoPlayer(player: AVPlayer(url: URL(string: urlVideos[2])!)), label: {
                        
                        Image("crashb")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    
                        
                    })
                    NavigationLink(destination: VideoPlayer(player: AVPlayer(url: URL(string: urlVideos[3])!)), label: {
                        
                        Image("titanfall")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 240, height: 135)
                    
                        
                    })
                    
                }
                
            }
            
        }
        
        
        
    }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
