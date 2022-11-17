//
//  ContentView.swift
//  GameStream
//
//  Created by Alan Gloria on 31/10/22.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    var body: some View {
        
       
        NavigationStack {
            ZStack {
                    
                    Spacer()
                    Color(red: 19/255, green: 30/255, blue: 53/255).ignoresSafeArea()
                    VStack{
                        Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 25)
                        
                        inicioYRegistroView()
                        
                        
                        
                    }
                    
                    
                }
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct inicioYRegistroView: View{
    @State var tipoInicioSesion = true
    
    var body: some View{
        
        NavigationStack {
            ZStack {
                Color("marine").ignoresSafeArea()
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
                    
                    Spacer(minLength: 20)
                    
                    if tipoInicioSesion == true{
                        
                        InicioSesionView()
                        
                    }else{
                        
                        RegistroView()
                        
                    }
                }
            }
        }
    }
}


struct InicioSesionView: View{
    
    @State var correo = ""
    @State var contrasena = ""
    @State var isPantallaHomeActive = false
    @State var ifNotUserFound = false
    
    
    var body: some View{
        
        
        ScrollView {
            
            NavigationStack {
                VStack(alignment: .leading) {
                    Text("Correo electrónico")
                        .foregroundColor(Color("DarkCian"))
                    
                    ZStack(alignment: .leading){
                        if correo.isEmpty{
                            Text(verbatim:"ejemplo@ejemplo.com")
                                .font(.caption).foregroundColor(Color("lightgray"))
                        }
                        
                        TextField("", text: $correo)
                            .foregroundColor(.white)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        
                        
                    }
                    
                    Divider().frame( height: 1)
                        .background(Color("DarkCian"))
                        .padding(.bottom)
                    
                    Text("Contraseña").foregroundColor(.white)
                    
                    ZStack(alignment: .leading){
                        if contrasena.isEmpty{
                            Text(verbatim:"Escribe tu contraseña").font(.caption).foregroundColor(Color("lightgray"))
                        }
                        
                        SecureField("", text: $contrasena).foregroundColor(.white)
                            .autocapitalization(.none)
                        
                    }
                    
                    Divider().frame( height: 1)
                        .background(Color("DarkCian"))
                        .padding(.bottom)
                    
                    Text("¿Olvidaste tu constraseña?")
                        .font(.footnote)
                        .frame(width: 300, alignment: .trailing)
                        .foregroundColor(Color("DarkCian"))
                        .padding(.bottom)
                    
                    
                    Button(action: iniciarSesion, label: {
                         Text("INICIAR SESION")
                             .fontWeight(.bold)
                             .foregroundColor(.white)
                             .frame(maxWidth: .infinity, alignment: .center)
                             .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                             .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("DarkCian"), lineWidth: 1.5).shadow(color: .white, radius: 4))
                         
                    }).navigationDestination(isPresented: $isPantallaHomeActive, destination: {Home()})
                        .alert(isPresented: $ifNotUserFound, content: {
                            Alert(title: Text("Error"), message: Text("No se encontró ningún usuario o la contraseña es incorrecta"), dismissButton: .default(Text("Entendido")))
                        })
                   
                    
                    Text("Inicia sesión con redes sociales").foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 40, leading: 18, bottom: 11, trailing: 18))
                    
                    HStack{
                        Button (action:{}, label:{
                            Text("Facebook").foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .fontWeight(.bold)
                            .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                            .foregroundColor(Color("lightblue"))
                            .background(RoundedRectangle(cornerRadius: 6).foregroundColor(Color("lightblue")))
                        })
                            
                        Spacer()
                        
                        Button (action:{}, label:{
                            Text("Twitter").foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .fontWeight(.bold)
                            .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                            .foregroundColor(Color("lightblue"))
                            .background(RoundedRectangle(cornerRadius: 6).foregroundColor(Color("lightblue")))
                        })
                    }
                    
                }.padding(.horizontal, 77.0)
            }
            
            
        }
        

    
    }
    
    func iniciarSesion() {
        print("Estoy iniciando sesion")
        let objetoActualizadorDatos = SaveData()
        let resultado = objetoActualizadorDatos.validar(correo: self.correo, contrasena: self.contrasena)
        
        if resultado == true{
            ifNotUserFound = false
            isPantallaHomeActive = true
        }else{
            ifNotUserFound = true
        }
        
    }
    
   
}



struct RegistroView: View{
    @State var correo = ""
    @State var contrasena = ""
    @State var confirmarContrasena = ""
    @State var isPantallaHomeActive = false
    @State var contrasenaIsNotConfirmed = false
    @State var nombre = ""
    @State var selectedItem: PhotosPickerItem? = nil
    @State var selectedImageData: Data? = nil
    @State var imagenPerfil:UIImage = UIImage(named: "picture")!
    
    
    var body: some View{
        ScrollView {
            NavigationStack{
                VStack(alignment: .center){
                    Text("Elije una foto de perfil")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("Puedes cambiarla o elegirla más adelante")
                        .font(.footnote)
                        .fontWeight(.light)
                        .foregroundColor(Color("lightgray"))
                        .padding(.bottom)
                    ZStack{
                    Image(uiImage: imagenPerfil)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 108, height: 108)
                        .clipShape(Circle())
                    if let selectedImageData, let uiImage = UIImage(data: selectedImageData){
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 118, height: 118)
                            .clipShape(Circle())
                    }
                    
                    
                    PhotosPicker(selection: $selectedItem,
                                 matching: .images,
                                 photoLibrary: .shared()){
                        Image(systemName: "camera")
                            .frame(width: 118, height: 118)
                            .foregroundColor(.white)
                    }.onChange(of: selectedItem){
                        newItem in Task{
                            if let data = try? await newItem?.loadTransferable(type: Data.self){
                                selectedImageData = data
                                let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                                let url = documents.appendingPathComponent("fotoperfil.png")
                                do{
                                    try selectedImageData?.write(to: url)
                                }catch{
                                    print("No se pudo cambiar la fotografia, se produjo el error \(error)")
                                }
                                
                            }
                        }
                    }
                }
                }
                
                VStack{
                    VStack(alignment: .leading){
                        Text("Nombre*")
                            .foregroundColor(Color("DarkCian"))
                        
                        ZStack(alignment: .leading){
                            if nombre.isEmpty{
                                Text(verbatim:"Escribe tu nombre")
                                    .font(.caption).foregroundColor(Color("lightgray"))
                            }
                            
                            TextField("", text: $nombre)
                                .foregroundColor(.white)

                            
                        }
                        
                        Divider().frame( height: 1)
                            .background(Color("DarkCian"))
                            .padding(.bottom)
                    }
                    VStack(alignment: .leading) {
                        
                        Text("Correo electrónico*")
                            .foregroundColor(Color("DarkCian"))
                        
                        ZStack(alignment: .leading){
                            if correo.isEmpty{
                                Text(verbatim:"ejemplo@ejemplo.com")
                                    .font(.caption).foregroundColor(Color("lightgray"))
                            }
                            
                            TextField("", text: $correo)
                                .foregroundColor(.white)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                            
                        }
                        
                        Divider().frame( height: 1)
                            .background(Color("DarkCian"))
                            .padding(.bottom)
                        
                        Text("Contraseña*").foregroundColor(.white)
                        
                        ZStack(alignment: .leading){
                            if contrasena.isEmpty{
                                Text(verbatim:"Escribe tu contraseña").font(.caption).foregroundColor(Color("lightgray"))
                            }
                            
                            SecureField("", text: $contrasena).foregroundColor(.white)
                                .autocapitalization(.none)
                            
                        }
                        
                        Divider().frame( height: 1)
                            .background(Color("DarkCian"))
                            .padding(.bottom)
                        
                        Text("Confirmar contraseña*").foregroundColor(.white)
                        
                        ZStack(alignment: .leading){
                            if confirmarContrasena.isEmpty{
                                Text(verbatim:"Confirma contraseña").font(.caption).foregroundColor(Color("lightgray"))
                            }
                            
                            SecureField("", text: $confirmarContrasena).foregroundColor(.white)
                                .autocapitalization(.none)
                            
                        }
                        
                        
                        Divider().frame( height: 1)
                            .background(Color("DarkCian"))
                            .padding(.bottom)
                        
                        
                        Button(action: registrate, label: {
                            Text("REGÍSTRATE")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                                .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("DarkCian"), lineWidth: 1.5).shadow(color: .white, radius: 4))
                            
                        }).navigationDestination(isPresented: $isPantallaHomeActive, destination: {Home()})
                        .alert(isPresented: $contrasenaIsNotConfirmed, content:
                                    {
                                        Alert(title: Text("Error"), message: Text("La contraseña no coincide. Confirma tu contraseña"), dismissButton: .default(Text("Entendido")))
                                    })
                        
                    }
                    
                    Text("Regístrate con redes sociales").foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 40, leading: 18, bottom: 11, trailing: 18))
                    HStack{
                        Button (action:{}, label:{
                            Text("Facebook").foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .fontWeight(.bold)
                                .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                                .foregroundColor(Color("lightblue"))
                                .background(RoundedRectangle(cornerRadius: 6).foregroundColor(Color("lightblue")))
                        })
                        
                        Spacer()
                        
                        Button (action:{}, label:{
                            Text("Twitter").foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .fontWeight(.bold)
                                .padding(EdgeInsets(top: 10, leading: 25, bottom: 10, trailing: 25))
                                .foregroundColor(Color("lightblue"))
                                .background(RoundedRectangle(cornerRadius: 6).foregroundColor(Color("lightblue")))
                        })
                    }
                    
                }.padding(.horizontal, 77.0)
                
                
            }
        }.onAppear(perform: {
            if returnUIImage(named: "fotoperfil") != nil {
                imagenPerfil = returnUIImage(named: "fotoperfil")!
            }
        })    }
    func registrate() {
        if contrasena != confirmarContrasena{
            contrasenaIsNotConfirmed = true
        }else{
            contrasenaIsNotConfirmed = false
            let objetoActualizadorDatos = SaveData()
            let resultado = objetoActualizadorDatos.guardarDatos(correo: correo, contrasena: contrasena, nombre: nombre)
            isPantallaHomeActive = true
            print("Se guardaron con exito los datos : \(resultado)")
        }
    }
    
    func returnUIImage(named:String) -> UIImage? {
        
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
            
            return UIImage(contentsOfFile: URL(filePath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
        
    }
    
}

func tomarFoto() {
    print("Voy a tomar una foto de perfil")
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() 
        
    }
}
