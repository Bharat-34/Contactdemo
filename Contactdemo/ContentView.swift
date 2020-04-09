//
//  ContentView.swift
//  Contactdemo
//
//  Created by Bharat on 08/04/20.
//  Copyright © 2020 Bharat. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var mm:EmbeddedContactPickerViewController = EmbeddedContactPickerViewController()
    @ObservedObject var contactObj: ContactObject

    var body: some View {
        ZStack{
        VStack{
            Spacer(minLength: 500)
            List(){
                contactListRow()
            }.padding()
            Button(action: {
                self.contactObj.showContactPicker.toggle()
                    print("bharat \(self.mm.phNumber)")
            }){
                Text("Add contacts")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                .cornerRadius(20)
                
            }.padding()
        }.background(Color.gray)
        .edgesIgnoringSafeArea(.all)

            if self.contactObj.showContactPicker{
                EmbeddedContactPicker(contactObj: contactObj)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(contactObj: ContactObject())
    }
}


struct contactListRow: View {
    
    @ObservedObject var mm:EmbeddedContactPickerViewController = EmbeddedContactPickerViewController()
    
    var body : some View {
        
        VStack {
            
            HStack(alignment:.center) {
                Image("Dummy")
                        .resizable()
                        .frame(width:50, height: 50)
                
                VStack(alignment: .leading, spacing: 3){
                        Spacer()
                    Text("mm.name")
                            .font(.custom("Lato-Regular", size: 16))
                            .foregroundColor(.white)
                    Text(mm.phNumber)
                            .font(.custom("Lato-Regular", size: 12))
                            .foregroundColor(.white)
                        Spacer()
                }.frame(width: 150, height: 50, alignment: .leading)
                
                Spacer()
                Button(action:{
                    
                }){
                    Image("combinedShape")
                }
                
                
                
            }.frame(minWidth:0, maxWidth: .infinity)
                .background(Color.clear)
        }
    }
    
    init() {
                   UITableView.appearance().backgroundColor = .clear
                   UITableViewCell.appearance().backgroundColor = .clear
                   UITableView.appearance().tableFooterView = UIView()
        }
}
