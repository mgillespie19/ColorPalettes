//
//  GADBannerViewController.swift
//  ColorPicker_General
//
//  Created by Max Gillespie on 1/18/21.
//  Copyright © 2021 Max Gillespie. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import GoogleMobileAds

struct GADBannerViewController: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: kGADAdSizeBanner)
        let viewController = UIViewController()
        
        view.adUnitID = "ca-app-pub-9754668352022980/5795456854"
        view.rootViewController = viewController
        
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeBanner.size)
        
        let request = GADRequest()
        view.load(request)
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    func reload() {
        print("reload!")
    }
}

// real id: ca-app-pub-9754668352022980/5795456854
// TEST id: ca-app-pub-3940256099942544/2934735716
