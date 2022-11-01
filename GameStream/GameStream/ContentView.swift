//
//  ContentView.swift
//  GameStream
//
//  Created by Alan Gloria on 31/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
            ZStack {
                
                Spacer()
                Color(red: 19/255, green: 30/255, blue: 53/255).ignoresSafeArea()
                VStack{
                    Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                    
                    inicioYRegistroView()
                    
                    
                    
                }
                
                
            }
    }
}

struct inicioYRegistroView: View{
    @State var tipoInicioSesion = true
    var body: some View{
        VStack{
            HStack {
                
                Spacer()
                Button("INICIA SESIÓN") {
                    tipoInicioSesion = true
                }
                .foregroundColor(tipoInicioSesion ? .white:.gray)
                Spacer()
                Button("REGÍSTRATE") {
                    tipoInicioSesion = false
                }
                .foregroundColor(tipoInicioSesion ? .gray:.white)
                Spacer()
                
            }
            
            Spacer(minLength: 42)
            
            if tipoInicioSesion == true{
                
                InicioSesionView()
                
            }else{
                
                RegistroView()
                
            }
        }
    }
}


struct InicioSesionView: View{
    var body: some View{
        Text("Soy la vista de inicio de sesion")
    }
}

struct RegistroView: View{
    var body: some View{
        Text("Soy la vista de registro")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        Image("pantalla1").resizable().ignoresSafeArea()
        Image("pantalla2").resizable().ignoresSafeArea()
        
    }
}
