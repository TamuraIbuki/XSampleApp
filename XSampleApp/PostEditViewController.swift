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
    @IBOutlet private weak var textView: UITextView!
    
    // MARK: - View Life-Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        configureBarButtonItem()
        configureTextView()
    }

    // MARK: - IBActions
        
    // MARK: - Other Methods
    
    private func configureBarButtonItem() {
        let cancelButton = UIBarButtonItem(title: "キャンセル", style: .plain, target: self, action: #selector(didTapCancelButtonButton))
        cancelButton.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = cancelButton
        
        let postButton = UIBarButtonItem(customView: configurePostButton())
        navigationItem.rightBarButtonItem = postButton
    }
    
    /// キャンセルバーボタンをタップ
    @objc func didTapCancelButtonButton() {
        // 前の画面に戻る
        dismiss(animated: true, completion: nil)
        
    }
    
    private func configurePostButton() -> UIButton {
        let postButton = UIButton(type: .custom)
        postButton.setTitle("ポスト", for: .normal) // ボタンタイトルを設定
        postButton.titleLabel?.font = UIFont.systemFont(ofSize: 14) // フォントサイズを設定
        postButton.backgroundColor = UIColor(hex: "#1D9BF0") // 背景色を設定
        postButton.layer.cornerRadius = 16 // 角丸を設定
        postButton.frame = CGRect(x: 0, y: 0, width: 70, height: 32) //サイズを設定
        
        // customButtonにアクションを追加
        postButton.addTarget(self, action: #selector(didTapPostButton), for: .touchUpInside)
        return postButton
    }
    
    // 「ポスト」バーボタンをタップ
    @objc private func didTapPostButton() {
        //ボタンがタップされた時の処理をここに記述
    }
    
    private func configureTextView() {
        // プレースホルダーテキストを設定
        textView.text = placeholderText
        textView.textColor = UIColor.lightGray
        
        // デリゲートを設定
        textView.delegate = self
    }
}

// MARK: - UITextViewDelegate

extension PostEditViewController: UITextViewDelegate {
    
    /// テキストが編集されたときに呼ばれる
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholderText && textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    /// テキストフィールドがフォーカスを失ったときに呼ばれる
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = UIColor.lightGray
        }
    }
}
