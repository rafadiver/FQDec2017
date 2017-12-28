//
//  ViewController.swift
//  FQNov3
//
//  Created by Maria Susana Moline Venanzi on 11/20/17.
//  Copyright © 2017 HRApps. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var name = ""
    var city = ""
    var gender = ""
    var phone = ""
    var email = ""
    
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        

        
       
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func Ubicandote(_ sender: Any) {
    
    let myURL = "https://api.foursquare.com/v2/venues/search?ll=19.37,-99.26&client_id=GNKCCW0LNIPQTHLOXSH5Z0FAOGS4NE32JFUCAL2ZKPSMFCNN&client_secret=GO5RRJF5J2SFMQCCH5HQWW3D5YPLCW4GKVHR3EPVZKK3BVSC&v=20171108&intent=checkin&limit=1&radius=2000"
        
        Alamofire.request(myURL).responseJSON { (response) in
            let result = response.result
            print(result)
    
            if let dict = result.value as? Dictionary<String,AnyObject> {
                //print(dict)
                if let innerDictR = dict["response"] as? Dictionary<String, AnyObject> {
                    //print(innerDictR)
                    if let venueDictR = (innerDictR["venues"] as! NSArray)[0] as? Dictionary<String, AnyObject>{
                       // print(venueDictR)
                        if let lugar = venueDictR["name"] as? String {
                            self.name = lugar
                            print(self.name)
                            self.nameLabel.text = self.name
                        }
                    }
                }
            }
        }
    }
    

}

