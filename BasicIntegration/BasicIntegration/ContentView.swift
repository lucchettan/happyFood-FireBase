//
//  ContentView.swift
//  BasicIntegration
//
//  Created by Nicolas Lucchetta on 26/02/2020.
//  Copyright © 2020 Nicolas Lucchetta. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showSplashScreen : Bool
    @State var kitchens : [Kitchen] = []
    @State var products : [Product] = []
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    HStack {
                        Text("today's suggestions")
                            .bold()
                            .frame(width: UIScreen.main.bounds.width)
                    }
                        .frame(height: UIScreen.main.bounds.height/20)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                    if products.count >= 1 && kitchens.count >= 1 {
                        ScrollView {
                            ForEach(products) { product in
                                ProductCell(product: product, kitchen: self.kitchens.filter({$0.kitchenID == product.kitchenID}).first!)
                                    .shadow(radius: 15)
                                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                            }
                        }
                    }
                }
            }
            SplashScreen()
                    .opacity(showSplashScreen ? 1 : 0)
        }
            .onAppear {
                print(".....Loading DB.....")
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    withAnimation(){
                        self.showSplashScreen = false
                    }
                }
                FireBaseMethods().getKitchens { (result) in
                    switch result {
                        case .success(let newItems):
                            self.kitchens = newItems
                            print("Successfully fetched kitchens")
                        case .failure(let err):
                            print(err.localizedDescription)
                    }
                }
                //We start our research for products in our database
                FireBaseMethods().getProducts { (result) in
                    switch result {
                        case .success(let newItems):
                            self.products = newItems
                            print("Successfully fetched products")
                        case .failure(let err):
                            print(err.localizedDescription)
                    }
                }
                //Database fullfilled---------
            }
    }
}
