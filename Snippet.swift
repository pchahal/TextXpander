//
//  Snippets.swift
//  TextXpander
//
//  Created by Pardeep Chahal on 2016-12-15.
//  Copyright © 2016 Pardeep Chahal. All rights reserved.
//

import Foundation
import SwiftyJSON
import EVReflection


class Snippet: EVObject {
    var shortcut: String = ""
    var expansion: String = ""
    var label: String = ""
    var group:  String = ""
}


class  Snippets
{
    var snippets: [Snippet] = []
    
    init()
    {
        
        if let filepath = Bundle.main.path(forResource: "Snippets", ofType: "json") {
            do {
                let contents = try String(contentsOfFile: filepath)
                snippets = [Snippet](json: contents)
                print (snippets.description)
                               
                
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
    }
    
    
    
}





