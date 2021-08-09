//
//  HomeViewController.swift
//  testFlutter
//
//  Created by czm on 2021/8/5.
//

import UIKit
import Flutter

class HomeViewController: ZMBaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var tableView: UITableView!
    private var dataArray = ["默认调用lib/main.dart 文件里的 main() 函数",
                             "指定调用lib/onePage.dart 文件里的 oneEntrypoint() 函数",
                             "指定调用lib/twoPage.dart 文件里的 twoEntrypoint() 函数"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "路由"
        
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
        
        guard let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine else { return }
//        switch indexPath.row {
//        case 0:
//            flutterEngine.run(withEntrypoint: nil)
//        case 1:
//            flutterEngine.run(withEntrypoint: "oneEntrypoint", libraryURI: "onePage.dart")
//        case 2:
//            flutterEngine.run(withEntrypoint: "twoEntrypoint", libraryURI: "twoPage.dart")
//        default:
//            break
//        }
        
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        flutterViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(flutterViewController, animated: true)
        
    }

}
