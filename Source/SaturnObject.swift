//
//  SaturnObject.swift
//  Saturn
//
//  Created by Quinn McHenry on 11/14/15.
//  Copyright © 2015 Small Planet. All rights reserved.
//

import Foundation

protocol SaturnObject {
    func loadIntoParent(parent: SaturnObject)
    func setAttribute(attribute: String, forProperty property: String)
}

extension SaturnObject {
    static func readFromString(string: String, prepare: Bool = true) -> SaturnObject? {
        if let xmlData = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
            do {
                let xmlDoc = try AEXMLDocument(xmlData: xmlData, processNamespaces: false)
                if let parsedElement = parseElement(xmlDoc.root) {
                    return parsedElement
                }
            } catch {
                return nil
            }
        }
        return nil
    }
    
    static func parseElement(element: AEXMLElement) -> SaturnObject? {
        if let entityClass = NSClassFromString(element.name) as? NSObject.Type,
            entity = entityClass.init() as? SaturnObject {
            for (attribute, value) in element.attributes {
                if let valueString = value as? String, attributeString = attribute as? String {
                    entity.setAttribute(valueString, forProperty: attributeString)
                }
            }
            element.children.forEach { child in
                if let subEntity = parseElement(child) {
                    subEntity.loadIntoParent(entity)
                }
            }
            return entity
        }
        return nil
    }
}