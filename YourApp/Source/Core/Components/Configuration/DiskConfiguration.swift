//
//  DiskConfiguration.swift
//

import Foundation


/**
 A basic wrapper to retrieve the configs for different environments. By default, this class will find the value for
 CONFIGURATION_PLIST key in "info.plist". This value is determined by a build setting which is different for each
 environment (determined by the .xcconfig files in Config/) and contains the name of a plist file that contains
 different key/value pairs for the different environments.
 */
class DiskConfiguration : Configuration {

    
    /// The shared instance for Disk Configuration
    static private let sharedInstance = DiskConfiguration.generateDefault()
    
    /// The default key to look for in "info.plist"
    static private let DefaultConfigKey = "ConfigurationPlist"
    
    /// The store where the config plist key/value pairs are saved
    var store: NSMutableDictionary = [:]
    
    
    // MARK: Initialization
    
    /**
    - Parameters:
    - plistName: The name of the plist file to load configuration from
    
    - Returns: A Configuration object that is initialized from the bundle with a given plist name
    */
    convenience init (plistName:String) {
        self.init()
        
        let bundle = NSBundle(forClass: DiskConfiguration.self)
        
        guard let plistPath = bundle.pathForResource(plistName, ofType: "plist"),
            let plistDict = NSMutableDictionary(contentsOfFile: plistPath)
            else {
                let exceptionDesc = "Could not find config \(plistName).plist"
                NSException(name: "No Configuration Plist", reason: exceptionDesc, userInfo: nil).raise()
                return
        }
        
        store = plistDict
    }
    
    /**
     - Returns: A DiskConfiguration object instantiated from defaults
     */
    private static func generateDefault() -> Configuration {
        let bundle = NSBundle(forClass: self)
        
        guard let plistName = bundle.objectForInfoDictionaryKey(DiskConfiguration.DefaultConfigKey) as? String else {
            let reason = "Could not get object for key \(DefaultConfigKey) in info.plist"
            fatalError(reason)
        }
        
        return DiskConfiguration(plistName: plistName)
    }
    
    
    // MARK: Configuration Protocol
    
    /**
    - Returns: A Configuration object on the disk that is initialized with a key from info.plist which extracts the path of the configuration plist file
    */
    static func defaultConfig() -> Configuration {
        return sharedInstance
    }
    
    func settingForKey(key:DiskConfigurationKey) -> AnyObject {
        guard let setting = store[key.rawValue] else { fatalError("No value for key '\(key)' in config.") }
        return setting
    }
    
}