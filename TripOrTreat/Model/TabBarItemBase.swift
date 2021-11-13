//
//  TabBarItemBase.swift
//  TripOrTreat
//
//  Created by 綸綸 on 2021/11/13.
//

import UIKit

class TabBarItemBase: NSObject
{
    // 調整tabbar title高度
    func itemOffSet(item:UITabBarItem, hori:CGFloat, vert:CGFloat)
    {
        item.titlePositionAdjustment = UIOffset(horizontal: hori, vertical: vert)
    }
    
    // 調整tabbar image大小
    func itemImage(item:UITabBarItem, resize:CGSize)
    {
        item.image = Utility().resizeImg(img: item.image!, resize: resize)
    }
}
