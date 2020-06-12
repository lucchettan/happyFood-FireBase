//
//  KitchenPageCoded.swift
//  BasicIntegration
//
//  Created by Nicolas Lucchetta on 07/03/2020.
//  Copyright © 2020 Nicolas Lucchetta. All rights reserved.
//


import SwiftUI
import Firebase
import SDWebImage

struct KitchenView: View {
    
    var kitchen : Kitchen
    @State var chefImage = UIImage(named: "pasta-3")
    @State var kitchenPictureURL = UIImage(named: "pasta-3")
    @State var chefPictureURL = UIImage(named: "pasta-3")
    @State var picturesURL : [UIImage] = []

    var body: some View {
        VStack{
            Image(uiImage: self.chefPictureURL!)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.height*0.2, height: UIScreen.main.bounds.height*0.2, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(.orange)))
                .shadow(radius: 5)
            Spacer()
            Text("You are welcome")
                .bold()
                .foregroundColor(.orange)
            HStack {
                Text("Chef")
                Text(kitchen.chefName)
                    .bold()
                    .italic() 
            }
            HStack {
                Text("My story")
                    .foregroundColor(.orange)
                    .font(.title)
                    .padding()
                Spacer()
            }
            Text(kitchen.story)
                .padding()
            HStack {
                Text("My specialities")
                    .font(.title)
                    .foregroundColor(.orange)
                    .padding()
                Spacer()
            }
            HStack {
                Text(kitchen.specialities.joined(separator: ", "))
                    .padding()
                Spacer()
            }
            if picturesURL.count >= 1 {
                HStack{
                    Image(uiImage: self.picturesURL.first!)
                        .resizable()
                        .cornerRadius(15)
                    VStack{
                        Image(uiImage: self.picturesURL.first!)
                            .resizable()
                            .cornerRadius(10)
                        HStack{
                            Image(uiImage: self.picturesURL.first!)
                                .resizable()
                                .cornerRadius(10)
                            Image(uiImage: self.picturesURL.first!)
                                .resizable()
                                .cornerRadius(10)
                        }
                    }
                }
                    .padding()
            }
        }
            .padding(.bottom, 40)
            .onAppear {
                print(".....Loading KitchenView Images.....")
                FireBaseMethods().loadImage(url: self.kitchen.kitchenPictureURL) { (result) in
                    switch result {
                        case .success(let datas):
                            self.kitchenPictureURL = UIImage(data: datas)!
                        case .failure(let err):
                            print(err.localizedDescription)
                    }
                }
                FireBaseMethods().loadImage(url: self.kitchen.chefPictureURL) { (result) in
                    switch result {
                        case .success(let datas):
                            self.chefImage = UIImage(data: datas)!
                        case .failure(let err):
                            print(err.localizedDescription)
                    }
                }
                for url in self.kitchen.picturesURL {
                    FireBaseMethods().loadImage(url: url) { (result) in
                        switch result {
                            case .success(let datas):
                                self.picturesURL.append(UIImage(data: datas)!)
                            case .failure(let err):
                                print(err.localizedDescription)
                        }
                    }
                }
            }
    }
}
