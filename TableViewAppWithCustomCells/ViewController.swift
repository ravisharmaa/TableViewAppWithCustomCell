import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var movieTable: UITableView!
    
    var results = [Results]()

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        getDataFromUrl()
        
        movieTable.dataSource = self
        movieTable.delegate = self
        movieTable.estimatedRowHeight = 100
        movieTable.rowHeight = UITableView.automaticDimension
        
    }
    
    //MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let indexPath = self.movieTable.indexPathForSelectedRow else {
            return
        }
        
        let detailVc = segue.destination as? DetailsViewController
        
        detailVc?.imageUrl = Constants.imageUrl
        
        detailVc?.data = results[indexPath.row]
    }
    
    fileprivate func getDataFromUrl() {
        
        guard let url = URL(string: Constants.apiUrl) else { return  }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let jsonData = data else { return }
            
            do {
                let movies = try JSONDecoder().decode(Movie.self, from: jsonData)
                self.results = movies.results
                
                DispatchQueue.main.async { [weak self] in
                    self?.movieTable.reloadData()
                }
            } catch let jsonError {
                print("Could not parse json \(jsonError)")
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
        
        cell.imageUrl = Constants.imageUrl
        
        cell.setFields(result: result)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
