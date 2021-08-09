//
//  OtherViewController.swift
//  testFlutter
//
//  Created by czm on 2021/8/5.
//

import UIKit
import SnapKit

class OtherViewController: ZMBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var tableView: UITableView!
    private var dataArray = ["Container", "Text", "Image", "ListView", "GridView", "Center", "Row", "Column", "Expanded", "Stack", "ListTile", "ElevatedButton", "Scaffold", "Navigator"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "基础组件"
        
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 50
        tableView.separatorStyle = .singleLine
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.dataArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        cell.textLabel?.text = self.dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }

}
