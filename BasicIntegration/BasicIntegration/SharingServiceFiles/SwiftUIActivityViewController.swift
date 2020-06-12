//
//  SwiftUIActivityViewController.swift
//  BasicIntegration
//
//  Created by Nicolas Lucchetta on 26/02/2020.
//  Copyright © 2020 Nicolas Lucchetta. All rights reserved.
//

import UIKit
import SwiftUI
import MessageUI
//still have to implement a message view controller, to display the creation on a message to send through the share button


struct SwiftUIActivityViewController : UIViewControllerRepresentable {
    let imageName: String
//    let activityViewController = ActivityViewController()
    func makeUIViewController(context: Context) -> UIActivityViewController  {
//        return activityViewController
        let controller = UIActivityViewController(activityItems: ["Look what i found on HappyFood", UIImage(named: imageName)?.jpegData(compressionQuality: 0.8)], applicationActivities: [])
        controller.excludedActivityTypes = nil
        controller.completionWithItemsHandler = nil
        return controller
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController , context: Context) {
        //
    }
    public func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String {
        if activityType == UIActivity.ActivityType.message {
         return "Subject for message"
        } else if activityType == UIActivity.ActivityType.mail {
         return "Subject for mail"
        }
       return ""
     }
//    func shareImage(uiImage: UIImage) {
//        activityViewController.uiImage = UIImage(named: imageName)
//        activityViewController.shareImage()
//    }
}
