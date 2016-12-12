//
//  Logger.swift
//  expander
//
//  Created by Pardeep Chahal on 2016-12-11.
//  Copyright © 2016 Pardeep Chahal. All rights reserved.
//

import Foundation
import SwiftyBeaver

class Logger
{
    static let sharedInstance = Logger()

    let log = SwiftyBeaver.self
    let file = FileDestination()
    
    init() {
        let console = ConsoleDestination()  // log to Xcode Console
        let file = FileDestination()  // log to default swiftybeaver.log file
        file.logFileURL = URL(fileURLWithPath: "/tmp/swiftybeaver.log")
        
        log.addDestination(console)
        log.addDestination(file)
    
        // log with different importance
      /*  log.verbose("not so important")  // prio 1, VERBOSE in silver
        log.debug("something to debug")  // prio 2, DEBUG in blue
        log.info("a nice information")   // prio 3, INFO in green
        log.warning("oh no, that won’t be good")  // prio 4, WARNING in yellow
        log.error("ouch, an error did occur!")  // prio 5, ERROR in red
        
        // log strings, ints, dates, etc.
        log.verbose(123)
        log.info(-123.45678)
        log.warning(NSDate())
        log.error(["I", "like", "logs!"])
*/
    
    }
}
