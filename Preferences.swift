import Foundation
import SwiftyUserDefaults

extension UserDefaults {
    subscript(key: DefaultsKey<Preferences?>) -> Preferences? {
        get { return unarchive(key) }
        set { archive(key, newValue) }
    }
}

extension DefaultsKeys {
    static let prefs = DefaultsKey<Preferences?>("prefs")
}


class Preferences : NSObject, NSCoding {
     static let sharedInstance = Preferences()
    var blogName: String?
    var expandAbbrev: Bool?

    
    override init() {}
    
    required init(coder aDecoder: NSCoder) {
        if let blogName = aDecoder.decodeObject(forKey: "blogName") as? String {
            self.blogName = blogName
        }
        if let expandAbbrev = aDecoder.decodeObject(forKey: "expandAbbrev") as? Bool {
            self.expandAbbrev = expandAbbrev
        }
    }
    
    func encode(with aCoder: NSCoder) {
        if let blogName = self.blogName {
            aCoder.encode(blogName, forKey: "blogName")
        }
        if let expandAbbrev = self.expandAbbrev {
            aCoder.encode(expandAbbrev, forKey: "expandAbbrev")
        }
    }
    
    func Load()
    {
        if let c = Defaults[.prefs] {
            if let blogName = c.blogName{
                print(c.blogName!)
            }
            if let expandAbbrev = c.expandAbbrev{
                print(c.expandAbbrev!)
            }
        }
        else
        {
            var p = Preferences()
            p.blogName = "par"
            p.expandAbbrev = true
            Defaults[.prefs] = p
            print("noname")
        }

}

}





enum expand {
    case Immediately
    case AfterDelimeterRetain
    case AfterDelimeterDestroy
}
