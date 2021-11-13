//
//  CardCell.swift
//  TripOrTreat
//
//  Created by 綸綸 on 2021/11/13.
//

import UIKit

class CardCell: UITableViewCell
{

    @IBOutlet var cardBaseView: UIView!
    @IBOutlet var favBtn: UIButton!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        adjustUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func favClick(_ sender: Any)
    {
        print("fav btn click")
        favBtn.isSelected = !favBtn.isSelected
    }
    
    private func adjustUI()
    {
        cardBaseView.layer.cornerRadius = 15
    }
}
