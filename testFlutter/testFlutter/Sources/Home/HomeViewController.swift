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
    private var dataArray = ["使用当前 AppDelegate 中启动的 FlutterEngine 来展示默认页面",
                             "使用默认页面，并显示当前路由栈中的某个页面",
                             "启动一个新的 FlutterEngine 来展示 FlutterViewController"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "路由"
        
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = UIColor.white
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 60
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
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let flutterEngine = (UIApplication.shared.delegate as? AppDelegate)?.flutterEngine else { return }
        switch indexPath.row {
        case 0:
            let flutterVc = ZMFlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
            flutterVc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(flutterVc, animated: true)
        case 1:
            let flutterVc = ZMFlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
            flutterVc.pushRoute("/containerPage")
            flutterVc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(flutterVc, animated: true)
        case 2:
            let flutterVc = ZMFlutterViewController(project: FlutterDartProject(), initialRoute: "/containerPage", nibName: nil, bundle: nil)
            flutterVc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(flutterVc, animated: true)
        default:
            break
        }
    
        
        
        
    }

}
