//
//  TabBarViewController.swift
//  TripOrTreat
//
//  Created by 綸綸 on 2021/11/13.
//

import UIKit

class TabBarViewController: UITabBarController,UITabBarControllerDelegate
{
    @IBOutlet var myTabBar: UITabBar!
    var preItem = UITabBarItem()
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews()
    {
        super.viewWillLayoutSubviews()
        
        myTabBar.frame.size.height = 100
        myTabBar.frame.origin.y = self.view.frame.height - 100
    
        for item in myTabBar.items!
        {
            
            if (item.title == "首頁") // 預設第一頁為首頁
            {
                preItem = myTabBar.items![0]
                TabBarItemBase().itemImage(item: preItem, resize: decideItemImgSize(isSelect: true, title: item.title!))
            }
            else
            {
                TabBarItemBase().itemImage(item: item, resize: decideItemImgSize(isSelect: false, title: item.title!))
            }
            
            TabBarItemBase().itemOffSet(item: item, hori: 0, vert: -20)
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem)
    {
        if (preItem != item)
        {
            TabBarItemBase().itemImage(item: item, resize:decideItemImgSize(isSelect: true, title: item.title!))
            TabBarItemBase().itemImage(item: preItem, resize: decideItemImgSize(isSelect: false, title: preItem.title!))
            preItem = item
        }
    }
    
    private func decideItemImgSize(isSelect:Bool,title:String)->CGSize
    {
        var size = CGSize()
        if (isSelect)
        {
            size = CGSize(width: 40, height: 40)
        }
        else
        {
            if (title == "") // 首頁
            {
                size = CGSize(width: 35, height: 35)
            }
            else
            {
                size = CGSize(width: 30, height: 30)
            }
        }
        return size
    }
}
