//
//  Snippets.swift
//  TextXpander
//
//  Created by Pardeep Chahal on 2016-12-15.
//  Copyright © 2016 Pardeep Chahal. All rights reserved.
//

import Foundation
import SwiftyJSON

class  Snippet
{
    
    var shortcut: String
    var expansion: String
    var label: String
    var group:  String
    
    init() {
        shortcut = ""
        expansion = ""
        label = ""
        group = ""
        
     
        
        if let filepath = Bundle.main.path(forResource: "Snippets", ofType: "json") {
            do {
                let contents = try String(contentsOfFile: filepath)
                if let data = contents.data(using: String.Encoding.utf8)
                {
                    let json = JSON(data: data)
                    for item in json["people"].arrayValue {
                        print(item["firstName"].stringValue)
                    }
                }
                
             
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
        
    
    }
}
