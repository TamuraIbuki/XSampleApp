//
//  PostEditViewController.swift
//  XSampleApp
//
//  Created by 田村伊吹 on 2025/05/21.
//

import UIKit

/// ポスト編集画面
final class PostEditViewController: UIViewController {
    
    // MARK: - Properties
    
    private let placeholderText = "いまどうしてる？"
 
    // MARK: - IBOutlet
    
    /// 自分のプロフィール画像
    @IBOutlet private weak var userImageView: UIImageView!
    /// 名前テキストフィールド
    @IBOutlet private weak var nameTaxtField: UITextField!
    /// テキストビュー
    @IBOutlet private weak var tableView: UITextView!
    
    // MARK: - View Life-Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - IBActions
    
    // MARK: - Other Methods

}
