//
//  PostTableView.swift
//  Paper
//
//  Created by 선민재 on 2022/12/13.
//

import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        
        postCell.titleLabel.text = post[indexPath.row].title
        postCell.subTitleLabel.text = post[indexPath.row].subTitle
        
        return postCell
    }
    
}
