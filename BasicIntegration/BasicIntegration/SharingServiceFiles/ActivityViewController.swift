//
//  ActivityViewController.swift
//  BasicIntegration
//
//  Created by Nicolas Lucchetta on 26/02/2020.
//  Copyright © 2020 Nicolas Lucchetta. All rights reserved.
//
import UIKit

class ActivityViewController : UIViewController {
    var uiImage:UIImage!
    let text = "Look what i found on Happy Food!"
    
    @objc func shareImage() {
        let vc = UIActivityViewController(activityItems: [uiImage!, text], applicationActivities: [])
        vc.excludedActivityTypes =  [
            UIActivity.ActivityType.postToWeibo,
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.postToTencentWeibo,
            UIActivity.ActivityType.message
        ]
        present(vc, animated: true, completion: nil)
        vc.popoverPresentationController?.sourceView = self.view
    }
}
