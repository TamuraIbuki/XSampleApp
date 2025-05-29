//
//  Profile.swift
//  XSampleApp
//
//  Created by 田村伊吹 on 2025/05/28.
//

import Foundation
import RealmSwift

final class Profile: Object {
    @Persisted var id: String = UUID().uuidString
    @Persisted var imageString: String? = nil
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
