//
//  Utility.swift
//  TripOrTreat
//
//  Created by 綸綸 on 2021/11/13.
//

import UIKit

class Utility: NSObject
{
    // 調整圖片大小
    public func resizeImg(img:UIImage, resize:CGSize)->UIImage
    {
        UIGraphicsBeginImageContextWithOptions(resize, false, UIScreen.main.scale)
        img.draw(in: CGRect(x: 0, y: 0, width: resize.width, height: resize.height))
        let newImg:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImg
    }
}
