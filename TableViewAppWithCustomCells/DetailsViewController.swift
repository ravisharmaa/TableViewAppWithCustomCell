import UIKit

class DetailsViewController: UIViewController {

    var data: Results?
    
    var imageUrl: String?
    
    //MARK: IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var descriptionView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        guard let data = data, let imageUrl = imageUrl else { return }
        
        guard let url = URL(string: imageUrl+data.poster_path) else { return  }
        
        setImageFrom(url)
        
        descriptionView.text = data.overview
        
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
