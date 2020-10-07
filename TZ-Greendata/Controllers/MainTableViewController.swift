//
//  MainTableViewController.swift
//  TZ-Greendata
//
//  Created by MAC on 07.10.2020.
//  Copyright © 2020 Gera Volobuev. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var isLoading = false
    var personsArray: [Person] = []
    var currentPage : Int = 0
    
    var rawURL : String {
        return "https://randomuser.me/api/?page=\(currentPage)&results=10&inc=gender,name,nat,picture,dob,email,location"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Register Loading Cell
        let tableViewLoadingCellNib = UINib(nibName: "LoadingCell", bundle: nil)
        self.tableView.register(tableViewLoadingCellNib, forCellReuseIdentifier: "loadingcellid")
        
    }
    
    func loadMoreData() {
        print("start")
        let escapedString = rawURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: escapedString!)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            print(url)
            if let data = data,
                let persons = try? jsonDecoder.decode(Welcome.self, from: data) {
                for person in persons.results {
                    self.personsArray.append(person)
                }
            } else {
                guard let error = error?.localizedDescription else { return }
                print(error)
            }
            
            self.currentPage += 1
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        task.resume()
        
    }
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personsArray.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == self.personsArray.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "loadingcellid", for: indexPath) as! LoadingCell
            cell.activityIndicator.startAnimating()
            loadMoreData()
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewitemcellid", for: indexPath) as! CustomTableViewCell
        cell.configureCell(with: personsArray[indexPath.row])

        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "personSegue" {
            let VC = segue.destination as! ViewController
            let selectedCell = tableView.indexPathForSelectedRow!.row
            VC.person = personsArray[selectedCell]
        }
    }
    
}


