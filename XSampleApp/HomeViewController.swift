//
//  HomeViewcontroller.swift
//  XSampleApp
//
//  Created by 田村伊吹 on 2025/05/09.
//

import UIKit

/// Home画面
final class HomeViewController: UIViewController {

    // MARK: - Properties

    // MARK: - IBOutlets

    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Life-Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurenavigationBar()
        
    }
    // MARK: - IBActions
    
    //ポストボタンをタップ
    @IBAction func didTapPostButton(_ sender: Any) {
    }
    
    // MARK: - Other Methods
    
    private func configurenavigationBar() {
        // 画像ビューを作成
        let imageView = UIImageView(image: UIImage(named: "ic_x_logo"))
        imageView.contentMode = .scaleAspectFit
        
        // 画像のサイズを適切に設定
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 26, height: 24))
        imageView.frame = titleView.bounds
        titleView.addSubview(imageView)
        
        // ナビゲーションアイテムのタイトルビューに設定
        self.navigationItem.titleView = titleView
        
        
    // 左のバーボタンアイテムに画像を設定する
        if let image = UIImage(named: "ic_cat") {
            //画像のサイズを32×32にリサイズ
            let circularImage = image.makeCicularImage(image: image, size: CGSize(width: 32, height: 32))
            //画像を使ってUIBarButtonItemを作成する
            let leftBarButtonItem = UIBarButtonItem(image: circularImage?.withRenderingMode(.alwaysOriginal),
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(didTapLeftBarButton))
            //leftBarButtonItemに設定する
            self.navigationItem.leftBarButtonItem = leftBarButtonItem
        }
    }
    //左のバーボタンアイテムがタップされた
    @objc func didTapLeftBarButton() {
        //ボタンがタップされた時のアクションをここに記述
        print("Left bar button tapped")
    }
    

}
