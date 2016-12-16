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
    var id: String = UUID().uuidString
    var shortcut: String = ""
    var expansion: String = ""
    var label: String = ""
    var group:  String = ""
}


class  Snippets
{
    private var snippets: [Snippet] = []
    var snippetsDict : [String: Snippet] = [:]    
    
    init()
    {
        if let filepath = Bundle.main.path(forResource: "Snippets", ofType: "json") {
            do {
                let contents = try String(contentsOfFile: filepath)
                snippets = [Snippet](json: contents)
                snippetsDict = createDictionaryOfSnippets(snippetsArray: snippets)
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
    }
    
    
    func createDictionaryOfSnippets(snippetsArray: [Snippet]) -> [String:Snippet]
    {
        var dict : [String:Snippet] = [:]
        //snippetsDict.removeAll()
        for snippet in snippetsArray
        {
            dict[snippet.shortcut] = snippet
        }
        
        print(dict)
        return dict
    }
}





