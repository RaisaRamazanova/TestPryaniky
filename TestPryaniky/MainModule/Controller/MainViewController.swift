//
//  ViewController.swift
//  TestPryaniky
//
//  Created by Раисат Рамазанова on 12.08.2021.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - properties

    let screenSize = UIScreen.main.bounds
    let tableView = UITableView()
    lazy var viewModel = {
        JsonViewModel()
    }()

    // MARK: - override functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpNavigation()
        initView()
        initViewModel()
    }

    // MARK: - functions
    
    func initView() {
        tableView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))

        tableView.register(JsonCell.nib, forCellReuseIdentifier: JsonCell.identifier)
        tableView.register(SelectorTableViewCell.nib, forCellReuseIdentifier: SelectorTableViewCell.identifier)
        
        view.addSubview(tableView)
    }

    func setUpNavigation() {
     self.title = "Pryaniky"
     self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
     self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 1, green: 1, blue: 1, alpha: 1)]
    }
    
    func initViewModel() {
        viewModel.getJsons()
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let dataOfOneCell = viewModel.jsonCellViewModels[indexPath[1]]
        let alert = UIAlertController(title: String(dataOfOneCell.titleOfCell), message: " Вы нажали на \(indexPath[1]+1)  ячейку", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.jsonCellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataOfOneCell = viewModel.jsonCellViewModels[indexPath[1]]
        if dataOfOneCell.viewName == "selector" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectorTableViewCell.identifier, for: indexPath) as? SelectorTableViewCell else { fatalError("xib does not exists") }
            let cellVM = viewModel.getCellViewModel(at: indexPath)
            cell.cellViewModel = cellVM
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: JsonCell.identifier, for: indexPath) as? JsonCell else { fatalError("xib does not exists") }
            let cellVM = viewModel.getCellViewModel(at: indexPath)
            cell.cellViewModel = cellVM
            return cell
        }
    }
}
