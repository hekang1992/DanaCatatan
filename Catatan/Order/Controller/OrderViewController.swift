//
//  OrderViewController.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit
import MJRefresh
import HandyJSON

class OrderViewController: BaseViewController {
    
    var nameStr: String?
    
    var typeStr: String?
    
    lazy var orderView: OrderView = {
        let orderView = OrderView()
        orderView.backgroundColor = .random()
        return orderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.s
        addNavView()
        navView.nameLabel.text = nameStr
        navView.block = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        view.addSubview(orderView)
        view.insertSubview(orderView, belowSubview: navView)
        orderView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        self.orderView.tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(loadNewData))
        self.orderView.tableView.mj_header?.isAutomaticallyChangeAlpha = true
        if let type = typeStr {
            getOrderListInfo(type)
        }
    }
    
    func getOrderListInfo(_ type: String) {
        let dict = ["alley":type]
        addHudView()
        NetApiWork.shared.requestAPI(params: dict, pageUrl: scoopCould, method: .post) { [weak self] baseModel in
            let awareness = baseModel.awareness
            if awareness == 0 || awareness == 00 {
                let model = JSONDeserializer<HoveredModel>.deserializeFrom(dict: baseModel.hovered)
            }
            self?.removeHudView()
            self?.orderView.tableView.mj_header?.endRefreshing()
        } errorBlock: { [weak self] error in
            self?.removeHudView()
            self?.orderView.tableView.mj_header?.endRefreshing()
        }
        
    }
    
    @objc func loadNewData() {
        if let type = typeStr {
            getOrderListInfo(type)
        }
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
