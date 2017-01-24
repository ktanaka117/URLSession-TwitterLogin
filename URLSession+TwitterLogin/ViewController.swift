//
//  ViewController.swift
//  URLSession+TwitterLogin
//
//  Created by 田中賢治 on 2017/01/23.
//  Copyright © 2017年 田中賢治. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginRepo = LoginRepositoryImpl()
        loginRepo.login { loginError in
                
            let request = SLRequest(
                forServiceType: SLServiceTypeTwitter,
                requestMethod: .GET,
                url: URL(string: "https://api.twitter.com/1.1/statuses/home_timeline.json"),
                parameters: nil
            )
            
            request?.account = Account.twitterAccount
            
            request?.perform { data, response, error in
                if error != nil {
                    print("Error!")
                } else {
                    let json = try! JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                    print(json)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

