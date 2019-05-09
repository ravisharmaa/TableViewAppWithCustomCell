//
//  ViewController.swift
//  TableViewAppWithCustomCells
//
//  Created by Ravi Bastola on 5/6/19.
//  Copyright © 2019 Ravi Bastola. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var movieTable: UITableView!
    
    var results = [Results]()
    
    let apiUrl = "https://api.themoviedb.org/3/movie/popular?api_key=7ec3cb25106cd4edee5e12ae47b59094&language=en-US&page=2"
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        getDataFromUrl()
        
        movieTable.dataSource = self
        movieTable.delegate = self
        
    }
    
    fileprivate func getDataFromUrl() {
        
        guard let url = URL(string: self.apiUrl) else { return  }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let jsonData = data else { return }
            
            do {
                let movies = try JSONDecoder().decode(Movie.self, from: jsonData)
                self.results = movies.results
                
                DispatchQueue.main.async { [weak self] in
                    self?.movieTable.reloadData()
                }
            } catch let jsonError {
                print("some error with\(jsonError)")
            }
            }.resume()
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let result = self.results[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        
        cell.setFields(result: result)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
