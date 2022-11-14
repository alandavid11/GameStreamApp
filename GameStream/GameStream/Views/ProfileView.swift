//
//  ProfileView.swift
//  GameStream
//
//  Created by Alan Gloria on 13/11/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var nombreUsuariotest = "Lorem"
    
    var body: some View {
        
        ZStack {
            Color("marine").ignoresSafeArea()
            
            VStack {
                Text("Perfil")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100,maxWidth: .infinity,alignment: .center)
                    .padding()
                
                VStack{
                    
                    Image("picture")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118, height: 118)
                        .clipShape(Circle())
                    Text(nombreUsuariotest)
                        .foregroundColor(.white)
                    
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 32, trailing: 0))
                
                Text("Ajustes")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, idealWidth: 100,maxWidth: .infinity,alignment: .leading)
                    .padding(.leading, 18)
                moduloAjustes()
                
                Spacer()
            }
        }.toolbar(.hidden)
            .navigationBarBackButtonHidden(true)
        .onAppear(
            perform: {
                if UserDefaults.standard.object(forKey: "datosUsuario") != nil{
                    nombreUsuariotest = UserDefaults.standard.stringArray(forKey: "datosUsuario")![2]
                }
            print("Revisando si tengo datos de usuario en los defaluts")
            
        })
        
    }
    
//    func returnUIImage(named:String) -> UIImage? {
//        
//    }
}

struct moduloAjustes: View{
    
    @State var isToggleOn = true
    @State var isEditPorfileViewActive = false
    
    var body: some View{
        
      
            VStack {
             
                
                    NavigationLink(destination: Home(), label:
                                    {HStack {
                        Text("Cuenta")
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }.padding()
                    }).background(Color("lightblue"))
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                Button(action: {isToggleOn.toggle()}, label: {HStack {
                    Text("Notificaciones")
                        .foregroundColor(.white)
                    Spacer()
                    Toggle("", isOn: $isToggleOn)
                }.padding()
                }).background(Color("lightblue"))
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                 
                    NavigationLink(destination: editProfileView(), label:
                                    {HStack {
                        Text("Editar perfil")
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }.padding()
                    }).background(Color("lightblue"))
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                    NavigationLink(destination: Home(), label:
                                    {HStack {
                        Text("Califica esta aplicación")
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }.padding()
                    }).background(Color("lightblue"))
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                
            }
            
        }
        
    }



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
