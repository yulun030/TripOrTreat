//
//  HomeViewController.swift
//  TripOrTreat
//
//  Created by 綸綸 on 2021/10/17.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{

    @IBOutlet var cardTable: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        cardTable.register(UINib(nibName: "CardCell", bundle: nil), forCellReuseIdentifier: "cell")
        cardTable.delegate = self
        cardTable.dataSource = self
        cardTable.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CardCell
        cell.selectionStyle = .none
        return cell
    }
}

