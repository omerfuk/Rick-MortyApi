//
//  HomeVC.swift
//  Rick&MortyApi
//
//  Created by Ömer Faruk Kılıçaslan on 11.07.2022.
//

import UIKit

class HomeVC: UIViewController {
    
    
    
    var dataArray = [Characters]()
    
    let tableView =  UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureTableView()
        
        let anonymusFunction = { (fetchedCharacterList: [Characters]) in
            
            self.dataArray = fetchedCharacterList
            self.tableView.reloadData()
        }
        
        RickyAPI.shared.getAPIData(onCompletion: anonymusFunction)
        
        
        

        
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        
        
    }
    
    

    

}


extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = dataArray[indexPath.row].name
        cell.detailTextLabel?.text = dataArray[indexPath.row].status
        
        return cell
    }
    
}
