//
//  MainTableViewController.swift
//  MusicPlayers
//
//  Created by Артем Орлов on 19.07.2022.
//

import UIKit

enum Section: Int {
    case Sheffield = 0
    case JackJohnson = 1
    case SystemOfDown = 2
}

class MainTableViewController: UITableViewController {

    let sectionTitles = ["Sheffield", "Jack Johnson", "System Of Down"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
    }
 
}

//MARK: - DataSource methods

extension MainTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitles.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return  UITableViewCell()}
        
        switch indexPath.section {
        case Section.Sheffield.rawValue:
            NetworkManager.shared.getAlbumsSheffield { result in
                switch result {
                case .success(let almubs):
                    cell.configure(with: almubs)
                case .failure(let error):
                    print(error)
                }
            }
        case Section.JackJohnson.rawValue:
            NetworkManager.shared.getAlbumsJackJohnson { results in
                switch results {
                    
                case .success(let almubs):
                    cell.configure(with: almubs)
                case .failure(let error):
                    print(error)
                }
            }
        case Section.SystemOfDown.rawValue:
            NetworkManager.shared.getAlbumsSystemOfDown { results in
                switch results {
                    
                case .success(let album):
                    cell.configure(with: album)
                case .failure(let error):
                    print(error)
                }
            }
        default:
            return UITableViewCell()
        }
        return cell
    }
}

//MARK: - Delegate methods

extension MainTableViewController {
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .red
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionTitles[section]
    }
}
