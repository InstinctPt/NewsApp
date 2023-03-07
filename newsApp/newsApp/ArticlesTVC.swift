//
//  ArticlesTVC.swift
//  newsApp
//
//  Created by Acesso Leandro MP on 06/03/2023.
//

import UIKit
import Kingfisher

class ArticlesTVC: UITableViewController {

    
    
    var articles : [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        getArticles()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleTVCell
        cell.descArticle.text = articles[indexPath.row].description ?? "This has no description"
        cell.titleArticle.text = articles[indexPath.row].title ?? "This has no title"
        
        if (articles[indexPath.row].urlToImage != nil) {
            cell.imageArticle.kf.setImage(with: URL(string: articles[indexPath.row].urlToImage ?? ""))
        } 
            
                

        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "AllToDetail", sender: articles[indexPath.row])
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let viewController = segue.destination as? ArticleDetailVC
        viewController?.article = sender as! Article
        
    }
    
    func getArticles(){
        //https://zappycode.com/api/courses
        if let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=42834204e8f44cd2a9ad854f85bcac19"){
          var request = URLRequest(url: url)
          request.httpMethod = "GET"
            
          URLSession.shared.dataTask(with: request){(data, response, error) in
            if error != nil{
              print("There was an error")
            }else if data != nil{
                if let everything = try?JSONDecoder().decode(Response.self, from: data!){
                let AllArticles = everything.articles
                DispatchQueue.main.async {
                  self.articles = AllArticles
                  self.tableView.reloadData()
                }
              }
            }
          }.resume()
        }
      }
    

 
}
