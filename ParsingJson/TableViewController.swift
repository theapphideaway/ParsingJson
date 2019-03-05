//
//  TableViewController.swift
//  ParsingJson
//
//  Created by ian schoenrock on 3/2/19.
//  Copyright © 2019 ian schoenrock. All rights reserved.
//

import UIKit
import Alamofire


class TableViewController: UITableViewController {

    var repositories = Array<Repositories>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let reposURL = "https://api.github.com/search/repositories?q=learn+swift+language:swift&sort=stars&order=desc"

        Alamofire.request(reposURL, method: .get).responseJSON { [weak self]
            response in
            if response.result.isSuccess {
                
                guard let data = response.data else {return}
                
                do{
                    let myResponse = try JSONDecoder().decode(Container.self, from: data)
                    
                    print(myResponse.items[0] as Any)
                    
                    self?.repositories = (myResponse.items)
                    
                    
                    self?.tableView.reloadData()
                    
                }
                catch{}
                
            }
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return repositories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        print(repositories[indexPath.row].name)

        cell.textLabel?.text = repositories[indexPath.row].name
        cell.detailTextLabel?.text = repositories[indexPath.row].description

        return cell
    }
}
