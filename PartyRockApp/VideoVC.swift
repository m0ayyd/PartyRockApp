//
//  VideoVC.swift
//  PartyRockApp
//
//  Created by the Luckiest on 6/18/17.
//  Copyright © 2017 the Luckiest. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {
    @IBOutlet weak var webView : UIWebView!
    @IBOutlet weak var titleLbl : UILabel!
    
    private var _partyRock : PartyRock!
    
    var partyRock: PartyRock {
        get {
            return _partyRock
        }
        set {
            _partyRock = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLbl.text = partyRock.videoTitle
        webView.loadHTMLString(partyRock.videoURL, baseURL: nil)
    }
}
