//
//  PostEditViewController.swift
//  XSampleApp
//
//  Created by 田村伊吹 on 2025/05/21.
//

import UIKit

/// デリゲートのプロトコル
protocol PostEditViewControllerDelegate: AnyObject {
    func update()
}
/// ポスト編集画面
final class PostEditViewController: UIViewController {
    
    // MARK: - Properties
    
    private let placeholderText = "いまどうしてる？"
    /// RealmManagerのインスタンス
    private let realmManager = RealmManager.shared
    /// 画像
    private var imageString: String = ""
    /// デリゲートのプロパティ
    weak var delegate: PostEditViewControllerDelegate?
 
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
        configureProfileImage()
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
        if let name = nameTaxtField.text, !name.isEmpty,
           let body = textView.text, !body.isEmpty {
            realmManager.savePost(imageString: imageString, name: name, body: body)
            delegate?.update()
            dismiss(animated: true, completion: nil)
        } else {
            showAlert(title: "ポスト内容がありません")
        }
    }
    
    /// プロフィール画像の設定
    private func configureProfileImage() {
        if let profile = realmManager.getProfile(),
           let imageString = profile.imageString,
           let imageData = Data(base64Encoded: imageString),
           let image = UIImage(data: imageData) {
            self.imageString = imageString
            self.userImageView.image = image
        } else {
            userImageView.image = UIImage(systemName: "person")
        }
    }
    
    private func configureTextView() {
        // プレースホルダーテキストを設定
        textView.text = placeholderText
        textView.textColor = UIColor.lightGray
        
        // デリゲートを設定
        textView.delegate = self
    }
    
    /// アラートを表示
    private func showAlert(title: String) {
        let alert = UIAlertController(title: title,
                                      message: "",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
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
