//
//  ProductView2.swift
//  BasicIntegration
//
//  Created by Nicolas Lucchetta on 07/03/2020.
//  Copyright © 2020 Nicolas Lucchetta. All rights reserved.
//

import SwiftUI

struct ProductView: View {
    var kitchen : Kitchen
    var product: Product
    @State var productImage = UIImage(systemName: "wand.and.rays.inverse")
    @State var chefImage = UIImage(systemName: "wand.and.rays.inverse")
    
    var body: some View {
        VStack {
            //Image part------------------------
            ZStack(alignment: .top){
                Image(uiImage: self.productImage!)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.60)
                        .clipShape(Rectangle())
                        .aspectRatio(1.2, contentMode: .fill)
                Rectangle()
                    .foregroundColor(Color.clear)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 220/255, green: 220/255, blue: 220/255).opacity(0.05),Color(red: 220/255, green: 220/255, blue: 220/255).opacity(1)]), startPoint: .bottom, endPoint: .top))
                    .frame(height: UIScreen.main.bounds.height/3)
                HStack{
                    VStack(alignment: .leading, spacing: 10){
                        Text(product.name)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                            .lineLimit(2)
                            .shadow(radius: 5)
                        Text(product.price)
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .shadow(radius: 5)
                    }
                    .offset(x: 20, y: UIScreen.main.bounds.height/8)
                    Spacer()
                }
            }
            //End Image Part---------------------
            VStack(spacing: 15){
                HStack (alignment: .bottom){  //left part-----------------------
                    VStack(alignment: .leading, spacing: 3){
                        Text(kitchen.type)
                            .foregroundColor(.gray)
                        Text(kitchen.name)
                            .font(.title)
                        HStack{
                            Image(systemName: "location")
                            Text(kitchen.adress)
                        }
                    }
                    //end Left Part------------------------------------
                    Spacer()
                   
                    VStack(alignment: .center, spacing: 20){  //right part-------
                        Image(uiImage: self.chefImage!)
                            .resizable()
                            .frame(height: UIScreen.main.bounds.width/2.5)
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white,lineWidth:5))
                            .offset(y: (UIScreen.main.bounds.height/20))
                        Text(kitchen.chefName)
                            .offset(y: UIScreen.main.bounds.height/50)
                        //Navlink to transform in sheet if necessary
                        NavigationLink(destination: KitchenView(kitchen: kitchen)){
                            ZStack{
                                Text("See more")
                                    .foregroundColor(.white)
                                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                    .background(Color.orange)
                                    .cornerRadius(15)
                            }
                        }
                        //end Navlink------------------------------------------
                    }
                        .padding(.top, -(UIScreen.main.bounds.width/3))
                    //End Right Part------------------------------------
                }
                    .padding(15)
                    .frame(height: UIScreen.main.bounds.height/12)
                    .padding(.bottom, 20)
                Text(kitchen.story)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .padding(.horizontal, 20)
                VStack(alignment: .leading){ // Ingredients bar
                    HStack {
                        Text("Ingredients")
                            .foregroundColor(Color.gray)
                        Spacer()
                    }
                    Text(product.ingredients.joined(separator: ", "))
                }
                    .frame(width: UIScreen.main.bounds.width*0.9)
                VStack(alignment: .leading){ // Ingredients bar
                    HStack {
                        Text("Adress")
                            .foregroundColor(Color.gray)
                        Spacer()
                    }
                    Text(kitchen.adress)
                }
                    .frame(width: UIScreen.main.bounds.width*0.9)
                if kitchen.gift != "" {
                    HStack(alignment: .top){
                        Image(systemName: "gift")
                        Text(kitchen.gift)
                            .fontWeight(.heavy)
                        Spacer()
                    }
                        .frame(width: UIScreen.main.bounds.width*0.9, height: 15)
                }
            }
        }
            .frame(height: UIScreen.main.bounds.height)
            .padding(.top, -(UIScreen.main.bounds.width/7))
            .edgesIgnoringSafeArea(.top)
            // 5*
            .onAppear {
                print(".....Loading ProductView Images.....")
                FireBaseMethods().loadImage(url: self.product.pictureURL) { (result) in
                    switch result {
                        case .success(let datas):
                            self.productImage = UIImage(data: datas)!
                            print(self.productImage!)
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
            }
            //*5
    }
}








//struct ProductView2_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//         ProductView()
//              .previewDevice(PreviewDevice(rawValue: "iPhone Xr"))
//              .previewDisplayName("iPhone Xr")
//         ProductView()
//              .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//              .previewDisplayName("iPhone 11")
//            ProductView()
//               .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch)"))
//               .previewDisplayName("iPad Pro (11-inch)")
//         ProductView()
//               .previewDevice(PreviewDevice(rawValue: "iPhone X"))
//               .previewDisplayName("iPhone X")
//         ProductView()
//               .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
//               .previewDisplayName("iPhone 11 Pro Max")
//        }
//    }
//}

