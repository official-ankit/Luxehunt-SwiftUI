//
//  UserDefaults.swift
//  Luxehunt SwiftUI
//
//  Created by Codemaya on 07/01/26.
//

import Foundation

public class UserDefaultsManager {

    // MARK: - Singleton

    public static let shared: UserDefaultsManager = UserDefaultsManager()

    private init() {}

    // MARK: - Attributes

    let userDefaults: UserDefaults = .standard
    
    fileprivate struct Keys {

        private static let keysPrefix: String = "gs.userDefaultsKeys."
        fileprivate static let userData: String = keysPrefix + "userData"
        fileprivate static let accessToken: String = keysPrefix + "accessToken"
        fileprivate static let userDataActivation: String = keysPrefix + "userDataActivation"
        fileprivate static let userDataTimer: String = keysPrefix + "userDataTimer"
        fileprivate static let programsId: String = keysPrefix + "programsId"

    }

    public var userData: Data {
        get {
            return userDefaults.object(forKey: Keys.userData) as! Data
        }
        set {
            userDefaults.set(newValue, forKey: Keys.userData)
        }
    }
    public var programsId: Data {
        get {
            return userDefaults.object(forKey: Keys.programsId) as! Data
        }
        set {
            userDefaults.set(newValue, forKey: Keys.programsId)
        }
    }

    public var accessToken: String {
        get {
            return userDefaults.string(forKey: Keys.accessToken) ?? ""
        }
        set {
            userDefaults.set(newValue, forKey: Keys.accessToken)
        }
    }
    public var userDataActivation: Data {
        get {
            return userDefaults.object(forKey: Keys.userDataActivation) as! Data
        }
        set {
            userDefaults.set(newValue, forKey: Keys.userDataActivation)
        }
    }
    
    


    func logout() {
        userDefaults.removeObject(forKey: Keys.userData)
        userDefaults.removeObject(forKey: Keys.accessToken)
        UserDefaults.standard.removeObject(forKey: "selectedProgramId")
        UserDefaults.standard.removeObject(forKey: "selectedProgramName")
        userDefaults.synchronize()
    }
}

