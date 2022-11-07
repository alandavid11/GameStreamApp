//
//  gamesView.swift
//  GameStream
//
//  Created by Alan Gloria on 06/11/22.
//

import SwiftUI

struct gamesView: View {
    
    @ObservedObject var todosLosVideoJuegos = ViewModel()
    
    var body: some View {
        Text("Hola desde gamesView")
            .toolbar(.hidden)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                perform: {
                    print("Primer elemnto del json:\(todosLosVideoJuegos.gamesInfo[0])")
                    print("Titulo del primer videojuego del json \(todosLosVideoJuegos.gamesInfo[0].title)")
                }
        
            )
        
    }
}

struct gamesView_Previews: PreviewProvider {
    static var previews: some View {
        gamesView()
    }
}
