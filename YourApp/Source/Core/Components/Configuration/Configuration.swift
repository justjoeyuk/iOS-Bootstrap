//
//  Configuration.swift
//

import Foundation

/**
 Enumeration containing all the possible keys in the local 
 configuration file
*/
enum DiskConfigurationKey : String {
    case DebugMode = "debug_mode"
}


/**
 Protocol that ensures that any Configuration classes
 */
protocol Configuration {
    
    /// The configurations store
    var store: NSMutableDictionary {get}
    
    
    /**
        - Returns: A default configuration instance
     */
    static func defaultConfig() -> Configuration
    
    /**
        - Parameters:
            - key: The key for the setting you want to extract
     
        - Returns: The value of the key provided in the store (or nil, if key not found)
     */
    func settingForKey(key:DiskConfigurationKey) -> AnyObject
    
}