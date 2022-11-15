//
//  editProfileView.swift
//  GameStream
//
//  Created by Alan Gloria on 13/11/22.
//

import SwiftUI
import PhotosUI

struct editProfileView: View {
    
    @State var selectedItem: PhotosPickerItem? = nil
    @State var selectedImageData: Data? = nil
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            
            
            ScrollView {
                VStack {
                    
                    
                    ZStack {
                        Image("defaultusr")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 118, height: 118)
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
                    
                    
                }.padding(.bottom, 18)
                moduloEditar()
            }
            
            
            
        }
    }
}

struct moduloEditar: View{
    
    @State var correo:String = ""
    @State var contrasena:String = ""
    @State var nombre:String = ""
    
    var body: some View{
        VStack(alignment: .leading) {
            
                VStack(alignment: .leading) {
                    Text("Nombre").foregroundColor(Color("DarkCian"))
                        .fontWeight(.bold)
                    
                    ZStack(alignment: .leading){
                        if nombre.isEmpty{
                            Text(verbatim:"Introduce tu nombre de usuario").font(.caption).foregroundColor(Color("lightgray"))
                        }
                        
                        TextField("", text: $nombre).foregroundColor(.white)
                            
                        
                    }
                    
                    
                    Divider().frame( height: 1)
                        .background(Color("DarkCian"))
                        .padding(.bottom)
                    
                    Text("Correo electrónico")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
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
                    
                    Text("Contraseña")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    ZStack(alignment: .leading){
                        if contrasena.isEmpty{
                            Text(verbatim:"Escribe tu nueva contraseña").font(.caption).foregroundColor(Color("lightgray"))
                        }
                        
                        SecureField("", text: $contrasena).foregroundColor(.white)
                            .autocapitalization(.none)
                        
                    }
                    
                    Divider().frame( height: 1)
                        .background(Color("DarkCian"))
                        .padding(.bottom)
                    

                    
                    
                    Button(action: {actualizarDatos()}, label: {
                        Text("ACTUALIZAR DATOS")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("DarkCian"), lineWidth: 1.5).shadow(color: .white, radius: 4))
                        
                    })
                }
            
            
            
        }.padding(.horizontal, 42.0)
    }
    
    func actualizarDatos(){
        
        let objetoActulizadorDatos = SaveData()
        let resultado = objetoActulizadorDatos.guardarDatos(correo: correo, contrasena: contrasena, nombre: nombre)
        print("se guardaron los datos con exito? \(resultado)")
        
    }
    
}

struct editProfileView_Previews: PreviewProvider {
    static var previews: some View {
        editProfileView()
    }
}
