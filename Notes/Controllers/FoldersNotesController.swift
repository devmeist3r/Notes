//
//  FoldersNotesController.swift
//  Notes
//
//  Created by Lucas Inocencio on 15/08/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import UIKit


class FolderNotesController: UITableViewController {
    
    fileprivate let CELL_ID: String = "CELL_ID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Folde Notes"
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CELL_ID)
    }
}

extension FolderNotesController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tablewView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablewView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)
        cell.textLabel?.text = "here's a note folder"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let foldersNotesController = FolderNotesController()
//        navigationController?.pushViewController(FolderNotesController(), animated: true)
    }
}

