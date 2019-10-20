import UIKit

class DetailsViewController: UIViewController {

    var data: Results?
    
    var imageUrl: String?
    
    //MARK: IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        guard let data = data else { return }
       
        guard let imageUrl = imageUrl else { return }
        
        guard let url = URL(string: imageUrl+data.poster_path) else { return  }
        
        setImageFrom(url)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
     fileprivate func setImageFrom(_ url: URL) {
         DispatchQueue.global().async {
             let data = try? Data(contentsOf: url)
             
             DispatchQueue.main.async {
                 self.imageView.image = UIImage(data: data!)
             }
         }
     }

}