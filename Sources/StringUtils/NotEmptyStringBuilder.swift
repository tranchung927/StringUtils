//
//  NotEmptyStringBuilder.swift
//  
//
//  Created by ChungTV on 20/12/2022.
//

import Foundation

public final class NotEmptyStringBuilder {
    
    public let split: String?
    private var result: String?
    
    public init(split: String? = nil) {
        self.split = split
    }
    
    @discardableResult
    public func append(_ str: String?) -> NotEmptyStringBuilder {
        guard let strNeedBuild = str, strNeedBuild.count > 0 else {
            return self
        }
        
        if result == nil {
            result = strNeedBuild
        } else {
            result! += (split ?? "") + strNeedBuild
        }
        
        return self
    }
    
    public func build() -> String? {
        return result
    }
}
