//
//  ArticleDetailViewController.swift
//  newsApp
//
//  Created by Acesso Leandro MP on 06/03/2023.
//

import UIKit

class ArticleDetailVC: UIViewController {

    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var descDetail: UITextView!
    @IBOutlet weak var imageDetail: UIImageView!
    var article = Article(title: "", description: "",url: "", urlToImage: "", content: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleDetail.text = article.title ?? "This article doesnt have any title"
        descDetail.text = article.content ?? "This article doesnt have any content"
        self.title = article.title ?? "This article doesnt have any title"

        if (article.urlToImage != nil) {
            imageDetail.kf.setImage(with: URL(string: article.urlToImage ?? ""))
        } else{
            imageDetail.image = UIImage(named: "mindprober")
        }
            
        
        // Do any additional setup after loading the view.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as? WebVC
        viewController?.url = sender as! String
    }


    @IBAction func buttonTouch(_ sender: UIButton) {
        performSegue(withIdentifier: "DetailToWeb", sender: article.url)
    }
}
