//
//  HomeTableViewCell.swift
//  XSampleApp
//
//  Created by 田村伊吹 on 2025/05/18.
//

import UIKit

/// ホーム画面のセル
class HomeTableViewCell: UICollectionViewCell {
    
    /// ユーザーイメージビュー
    @IBOutlet private weak var userImageView: UIImageView!
    /// ユーザー名ラベル
    @IBOutlet private weak var userNameLabel: UILabel!
    /// 本文ラベル
    @IBOutlet private weak var bodyLabel: UILabel!
    
    func configure(imageString: String, name: String, body: String) {
        self.userImageView.image = UIImage(named: imageString)
        self.userNameLabel.text = name
        self.bodyLabel.text = body
    }
}
