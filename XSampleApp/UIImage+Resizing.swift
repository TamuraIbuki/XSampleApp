//
//  UIImage+Resizing.swift
//  XSampleApp
//
//  Created by 田村伊吹 on 2025/05/11.
//

import UIKit

extension UIImage {
    /// UIImageの拡張機能
    func makeCircularImage(image: UIImage, size: CGSize) -> UIImage? {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let path = UIBezierPath(ovalIn: rect)
        path.addClip()
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
