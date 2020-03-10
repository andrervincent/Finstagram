//
//  FeedViewController.swift
//  Finstagram
//
//  Created by Andre Vincent on 3/2/20.
//  Copyright © 2020 Andre Vincent. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage
class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var posts = [PFObject]()
    @IBOutlet weak var TableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostViewCell
        let post = posts[indexPath.row]
        
        let user = post["author"] as! PFUser
        cell.usernameLabel.text = user.username
        cell.commentLabel.text = post["caption"] as! String
        
        
        let imageFile = post["image"] as! PFFileObject
        let URLString = imageFile.url!
        let url = URL(string: URLString)!
        
        cell.imageView?.af_setImage(withURL: url)
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "Posts")
        query.includeKey("author")
            query.limit = 20
        query.findObjectsInBackground{(posts, error) in
            if posts != nil {
                self.posts = posts!
                self.TableView.reloadData()
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.delegate = self
        TableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
