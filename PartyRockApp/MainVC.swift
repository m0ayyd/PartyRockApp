//
//  ViewController.swift
//  PartyRockApp
//
//  Created by the Luckiest on 6/18/17.
//  Copyright © 2017 the Luckiest. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var partyRocks: [PartyRock] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let p1 = PartyRock(imageURL: "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/iphone/iphone-iphone4-colors.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/YzdOiVrNdNk\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Hello iPhone")
        
        let p2 = PartyRock(imageURL: "https://boygeniusreport.files.wordpress.com/2017/03/samsung-galaxy-s8-7.jpg", videoURL:  "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/dBwaUuWcNgU\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Samsung S8")
        
        let p3 = PartyRock(imageURL: "https://us.blackberry.com/content/dam/blackberry-com/images/smartphones/2016-Landing-Page/device-passport.png", videoURL:  "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/zO9FDtXk1Ys\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "BlackBerry")
        
        let p4 = PartyRock(imageURL: "https://www.slickwraps.com/media/catalog/product/cache/1/image/580x580/9df78eab33525d08d6e5fb8d27136e95/l/g/lg-g6_combo_carbon_black.jpg", videoURL:  "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CxlwbfvVyNw\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "LG G6")
        
        let p5 = PartyRock(imageURL: "http://www.allaboutsymbian.com/images/sbelle/701.jpg", videoURL:   "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/gNvL4vQ5LYA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Nokia 701")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCellTableViewCell {
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }

}

