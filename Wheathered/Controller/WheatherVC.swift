//
//  WheatherVC.swift
//  Wheathered
//
//  Created by Alex Azarov on 07/12/2017.
//  Copyright © 2017 Alex Azarov. All rights reserved.
//

import Cocoa

class WheatherVC: NSViewController {
    
    @IBOutlet weak var dateLbl: NSTextField!
    @IBOutlet weak var tempLbl: NSTextField!
    @IBOutlet weak var locationLbl: NSTextField!
    @IBOutlet weak var wheatherImage: NSImageView!
    @IBOutlet weak var wheatherConditionLbl: NSTextField!
    @IBOutlet weak var collectionView: NSCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLbl.stringValue = "This is a date"
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func viewDidAppear() {
        // self.view.layer?.backgroundColor = CGColor(red: 0.29, green: 0.72, blue: 0.98, alpha: 1.00)
    }
    
    func UpdateUI () {
        let wheather = WheatherService.instance.currentWheather
    }

}

extension WheatherVC: NSCollectionViewDelegate, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let forecastItem = collectionView.makeItem(withIdentifier: "WheatherCell", for: indexPath)
        return forecastItem
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 125, height: 125)
    }
}











