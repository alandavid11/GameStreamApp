//
//  prueba.swift
//  GameStream
//
//  Created by Alan Gloria on 12/11/22.
//

import SwiftUI

struct prueba: View {
    @State var textoBusqueda = ""

    @State var isGameInfoEmpty = false
    @ObservedObject var juegoEncontrado = SearchGame()
    @State var isGameViewActive = false
    @State var path = NavigationPath()
    
    @State var url:String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion:String = ""
    @State var anoPublicacion:String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl: [String] = [""]
    var body: some View {
        
        
        NavigationStack{
            ZStack {
                Color("marine").ignoresSafeArea()
                Button(action: {watchGame(name: "Cuphead")} , label: {
                        
                            Image("abzu")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                        
                }).navigationDestination(isPresented: $isGameViewActive)  {gameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl)}
            }
        }
        
       
    }
    
    func watchGame(name:String) {
        juegoEncontrado.search(gameName: name)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            
            print("Cantidad E: \(juegoEncontrado.gameInfo.count)")
            print("juego \(juegoEncontrado.gameInfo[0].title)")
            print(isGameViewActive)
            if juegoEncontrado.gameInfo.count == 0 {
                isGameInfoEmpty = true
            }else{
                isGameViewActive = true
                url = juegoEncontrado.gameInfo[0].videosUrls.mobile
            titulo = juegoEncontrado.gameInfo[0].title
            studio = juegoEncontrado.gameInfo[0].studio
            calificacion = juegoEncontrado.gameInfo[0].contentRaiting
            anoPublicacion = juegoEncontrado.gameInfo[0].publicationYear
            descripcion = juegoEncontrado.gameInfo[0].description
            tags = juegoEncontrado.gameInfo[0].tags
            imgsUrl = juegoEncontrado.gameInfo[0].galleryImages
            
                print(isGameViewActive)
              
            }
            
        }
        
    }
}

struct prueba_Previews: PreviewProvider {
    static var previews: some View {
        prueba()
    }
}
