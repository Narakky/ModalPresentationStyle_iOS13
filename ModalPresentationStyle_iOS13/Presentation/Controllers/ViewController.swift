//
//  ViewController.swift
//  ModalPresentationStyle_iOS13
//
//  Created by Naraki on 8/8/19.
//  Copyright © 2019 i-enter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Definitions

    private enum TableData: CaseIterable {
        case common
        case hasNavigation
        case hasGesture

        var title: String {
            switch self {
            case .common: return "普通"
            case .hasNavigation: return "ナビゲーション有り"
            case .hasGesture: return "ジェスチャ有り"
            }
        }

        var detail: String {
            switch self {
            case .common: return "何の変哲もない普通の画面に遷移します"
            case .hasNavigation: return "ナビゲーションバーが存在する画面に遷移します"
            case .hasGesture: return "ジェスチャが存在する画面に遷移します"
            }
        }
    }

    // MARK: - Outlets

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
            tableView.separatorInset = .zero
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: false)
        }
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableData.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        let data = TableData.allCases[indexPath.row]
        cell.textLabel?.text = data.title
        cell.detailTextLabel?.text = data.detail
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = TableData.allCases[indexPath.row]

        switch data {
        case .common:
            if let secondViewController = UIStoryboard(name: "CommonSecondViewController", bundle: nil).instantiateInitialViewController() {
                present(secondViewController, animated: true, completion: nil)
            }
        case .hasNavigation:
            if let secondViewController = UIStoryboard(name: "HasNavigationSecondViewController", bundle: nil).instantiateInitialViewController() {
                present(secondViewController, animated: true, completion: nil)
            }
        default:
            break
        }
    }
}
