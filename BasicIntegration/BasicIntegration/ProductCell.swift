//
//  ItemCell.swift
//  BasicIntegration
//
//  Created by Nicolas Lucchetta on 05/03/2020.
//  Copyright © 2020 Nicolas Lucchetta. All rights reserved.
//

import SwiftUI

struct ProductCell: View {
    var color = Color.orange
    var product : Product
    var kitchen : Kitchen
    @State var productImage = UIImage(systemName: "wand.and.rays.inverse")
    @State var chefImage = UIImage(systemName: "wand.and.rays.inverse")

    
    var body: some View {
        NavigationLink(destination: ProductView(kitchen: kitchen, product: product)) {

        ZStack {
            //1*
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.orange, lineWidth: 3)
                    .frame(height: UIScreen.main.bounds.width)
                    .offset(y: UIScreen.main.bounds.width/30)
                    .padding(.horizontal, 17.8)
            //*1
            
            //2*
            VStack {
                ZStack(alignment: .top){
                    Image(uiImage: self.productImage!)
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(1.2, contentMode: .fit)
                            .padding(EdgeInsets(top: -10, leading: -10, bottom: 0, trailing: -10))
                    Rectangle()
                        .foregroundColor(Color.clear)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 220/255, green: 220/255, blue: 220/255).opacity(0.05),Color(red: 220/255, green: 220/255, blue: 220/255).opacity(1)]), startPoint: .bottom, endPoint: .top))
                        .frame(height: UIScreen.main.bounds.height/5)
                    HStack{
                        VStack(alignment: .leading, spacing: 10){
                            Text(product.name)
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                                .bold()
                                .lineLimit(2)
                            Text(product.price)
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                                .bold()
                        }
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 0))
                        Spacer()
                    }
                }
                //*2
                ZStack {
                    HStack (alignment: .center){
                        //3*
                        VStack(alignment: .leading, spacing: 3){
                            Text(kitchen.type)
                                .foregroundColor(.gray)
                            Text(kitchen.name)
                                .bold()
                                .foregroundColor(.black)
                            HStack{
                                Image(systemName: "location")
                                    .foregroundColor(.black)
                                Text(kitchen.adress)
                                    .foregroundColor(.black)
                                    .font(.footnote)
                            }
                            if kitchen.gift != "" {
                                HStack{
                                    Image(systemName: "gift")
                                        .foregroundColor(.black)
                                    Text(kitchen.gift)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        //*3
                        
                        Spacer()
                        //4*
                        VStack {
                            Image(uiImage: self.chefImage!)
                                .resizable()
                                .renderingMode(.original)
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width*0.2, height: UIScreen.main.bounds.width*0.2, alignment: .center)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color(.orange)))
                            Text(kitchen.chefName)
                                .bold()
                                .foregroundColor(.black)
                            NavigationLink(destination: KitchenView(kitchen: kitchen)){
                                Text("See more")
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .background(Color.orange)
                                    .cornerRadius(10)
                            }
                        }
                        .offset(y: -(UIScreen.main.bounds.height*0.04))
                        //4*
                    }
                    .padding(15)
                    .frame(height: UIScreen.main.bounds.height/12)
                }
                .padding(EdgeInsets(top: 10, leading: 5, bottom: 20, trailing: 5))
            }
                .cornerRadius(10)
                .padding()
                // 5*
                .onAppear {
                    print(".....Loading Cell Images.....")
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
    }
}




//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//           CardView()
//              .previewDevice(PreviewDevice(rawValue: "iPhone Xr"))
//              .previewDisplayName("iPhone Xr")
//           CardView()
//              .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//              .previewDisplayName("iPhone 11")
//            CardView()
//               .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch)"))
//               .previewDisplayName("iPad Pro (11-inch)")
//            CardView()
//               .previewDevice(PreviewDevice(rawValue: "iPhone X"))
//               .previewDisplayName("iPhone X")
//            CardView()
//               .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
//               .previewDisplayName("iPhone 11 Pro Max")
//        }
//    }
//}
