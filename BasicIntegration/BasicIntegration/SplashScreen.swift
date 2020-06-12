//
//  SplashScreen.swift
//  BasicIntegration
//
//  Created by Nicolas Lucchetta on 26/02/2020.
//  Copyright © 2020 Nicolas Lucchetta. All rights reserved.
//

import SwiftUI

struct SplashScreen: View {
    
    var body: some View {
        VStack {
            Image("iPhone X-XS – 6")
            .resizable()
            .scaledToFill()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 10)
//        .offset(x: -(UIScreen.main.bounds.width*0.13))
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
