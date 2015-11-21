//
//  SaturnObject.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/14/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

public protocol SaturnObject {
    func loadIntoParent(parent: AnyObject)
    mutating func setAttribute(attribute: String, forProperty property: String)
    mutating func setAttributes(attributes:[String:String]?)
    func objectsWithId(id: String) -> [AnyObject]
}

extension SaturnObject {
    
    public static func readFromFile(path: String?, intoParent parent: AnyObject? = nil) -> SaturnObject? {
        guard let path = path else { return nil }
        do {
            let string = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            return readFromString(string, intoParent: parent)
        } catch let error as NSError {
            print("error writing to url \(path)")
            print(error.localizedDescription)
        }
        return nil
    }
    
    public static func readFromString(string: String?, intoParent parent: AnyObject? = nil) -> SaturnObject? {
        guard let string = string, xmlData = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) else { return nil }
        let xmlDoc = try? AEXMLDocument(xmlData: xmlData, processNamespaces: false)
        return parseElement(xmlDoc?.root, intoParent: parent)
    }
    
    public static func parseElement(element: AEXMLElement?, intoParent parent: AnyObject? = nil) -> SaturnObject? {
        guard let element = element, entityClass = classFromElement(element) else { return nil }
        
        let entity = entityClass.init()
        entity.setAttributes(element.attributes as? [String:String])
        if let parent = parent {
            entity.loadIntoParent(parent)
        }
        element.children.forEach { child in
            parseElement(child, intoParent: entity)
        }
        return entity
    }

    private static func classFromElement(element: AEXMLElement) -> NSObject.Type? {
        return (NSClassFromString(element.name) as? NSObject.Type) ??
            (NSClassFromString("Saturn.\(element.name)") as? NSObject.Type)
    }
    
}

// styles handled by reading an xml file with style definitions and storing the attribute dictionaries in a ditionary keyed by the styleId
// config dictionary read from plist, handled in parseElement, replacing keys with values before setAttributes

struct Saturn {
    static private var styles: [String : [String:String]]?
    static private var config: [String : AnyObject]?
}
