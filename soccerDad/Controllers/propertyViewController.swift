//
//  propertyViewController.swift
//  soccerDad
//
//  Created by Ayse Kula on 2/25/19.
//  Copyright © 2019 gokhan Kula. All rights reserved.
//

import UIKit

class propertyViewController: UIViewController {

    @IBOutlet weak var playersText: UITextField!
    @IBOutlet weak var minutesText: UITextField!
    var labels = ["Players In Game", "Minutes Per Quarter"]
    var values = [0,0]
    var mDict = ["Players In Game" : 0, "Minutes Per Quarter":0]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let path = Bundle.main.path(forResource: "Settings", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) as? Dictionary<String, AnyObject> {
                print(path)
                // use swift dictionary as normal
                values[1] = dict["players"] as! Int
                values[0] = dict["minutes"] as! Int
                mDict = dict as! [String : Int]
            }
        }
        playersText.text = "\(values[1])"
        minutesText.text = "\(values[0])"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func minutesChanged(_ sender: UITextField) {

        mDict["minutes"] = Int(minutesText.text!)
        print("minutes changed to " + "\(mDict["minutes"]!)")
        let path = Bundle.main.path(forResource: "Settings", ofType: "plist")
        print(path as Any)
        //let url : URL = URL(fileURLWithPath: path!)
        NSDictionary(dictionary: mDict).write(toFile: path!, atomically: true)
    }
    
    @IBAction func playersChanged(_ sender: UITextField) {

        mDict["players"] = Int(playersText.text!)
        print("players changed to " + "\(mDict["players"]!)")
        let path = Bundle.main.path(forResource: "Settings", ofType: "plist")
        print(path!)
        //let url : URL = URL(fileURLWithPath: path!)
        NSDictionary(dictionary: mDict).write(toFile: path!, atomically: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
