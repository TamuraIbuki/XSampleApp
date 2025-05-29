//
//  RealmManager.swift
//  XSampleApp
//
//  Created by 田村伊吹 on 2025/05/28.
//

import RealmSwift

/// Realmの管理クラス
final class RealmManager {
    
    // MARK: - Type Properties
    
    static let shared = RealmManager()
    
    // MARK: - Properties
    
    private let realm = try! Realm()
    
    // MARK: - Other Methods
    
    /// プロフィールを取得
    func getProfile() -> Profile? {
        return realm.objects(Profile.self).first
    }
    
    /// プロフィールを保存
    func saveProfile(imageString: String) {
        let profile = Profile()
        profile.imageString = imageString
        
        try! realm.write {
            realm.add(profile, update: .modified)
        }
    }
}
