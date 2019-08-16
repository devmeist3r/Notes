//
//  FoldersController.swift
//  Notes
//
//  Created by Lucas Inocencio on 14/08/19.
//  Copyright © 2019 Lucas Inocencio. All rights reserved.
//

import UIKit

class FoldersController: UITableViewController {
    
    fileprivate let CELL_ID: String = "CELL_ID"
    
    fileprivate let headerView: UIView = {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
        let label = UILabel(frame: CGRect(x: 20, y: 15, width: 100, height: 20))
        label.text = "ICLOUD"
        label.font = UIFont.systemFont(ofSize: 13, weight: .light)
        label.textColor = .darkGray
        headerView.addBorder(toSide: .bottom, withColor: UIColor.lightGray.withAlphaComponent(0.5).cgColor, andThickness: 0.3)
        headerView.addSubview(label)
        return headerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Folders"
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setToolbarHidden(false, animated: true)
        
        let items:[UIBarButtonItem] = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "New folder", style: .done, target: self, action: nil)
        ]
        
        self.toolbarItems = items
        
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: nil, action: nil)
        self.navigationItem.setRightBarButton(editButton, animated: false)
        self.navigationController?.toolbar.tintColor = .cyan
        self.navigationController?.navigationBar.tintColor = .cyan
        
        setupTranslucentViewa()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.setToolbarHidden(true, animated: false)
    }
    
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CELL_ID)
        tableView.tableHeaderView = headerView
    }
    
    fileprivate func getImage(withColor color:UIColor, andSize size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        return image
    }
    
    fileprivate func setupTranslucentViewa() {
        let toolBar = self.navigationController?.toolbar
        let navigationBar = self.navigationController?.navigationBar
        
        let slighWhite = getImage(withColor: UIColor.white.withAlphaComponent(0.9), andSize: CGSize(width: 30, height: 30))
        
        toolBar?.setBackgroundImage(slighWhite, forToolbarPosition: .any, barMetrics: .default)
        toolBar?.setShadowImage(UIImage(), forToolbarPosition: .any)
        
        navigationBar?.setBackgroundImage(slighWhite, for: .default)
        navigationBar?.shadowImage = slighWhite
    }
}

extension FoldersController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tablewView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablewView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)
        cell.textLabel?.text = "here's a note folder"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let foldersNotesController = FolderNotesController()
        navigationController?.pushViewController(FolderNotesController(), animated: true)
    }
}
