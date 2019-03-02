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

    var repositories = [Repository]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let reposURL = "https://api.github.com/search/repositories?q=learn+swift+language:swift&sort=stars&order=desc"

        
        DispatchQueue.main.async {
        
            Alamofire.request(reposURL, method: .get).responseJSON {
                response in
                if response.result.isSuccess {
                    
                    do{
                        let myResponse = try JSONDecoder().decode(Repository.self, from: response.data!)
                        self.repositories = [myResponse]
                    }
                    catch{
                        
                    }
                }
            }
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return repositories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = repositories[indexPath.row].name
        cell.detailTextLabel?.text = repositories[indexPath.row].description

        return cell
    }
 


}
