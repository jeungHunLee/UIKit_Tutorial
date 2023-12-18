//
//  ViewController.swift
//  Today
//
//  Created by 이정훈 on 12/18/23.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>
    
    var dataSource: DataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //list layout
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        //cell configuration
        //Cell registration specifies how to configure the content and appearance of a cell
        let cellRegistration = UICollectionView.CellRegistration {
            (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            let reminder = Reminder.sampleData[indexPath.item]
            var contentConfiguration = cell.defaultContentConfiguration()    //creates a content configuration with the predefined system style
            contentConfiguration.text = reminder.title
            cell.contentConfiguration = contentConfiguration
        }
        
        //DataSource
        //Diffable Data Source can animate when the data changes
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        //snapshot
        //A snapshot represents the state of your data at a specific point in time
        //populate snapshot with the state data that want to display
        //and represent snapshot in the user interface
        var snapshot = Snapshot()
        snapshot.appendSections([0])    //section count: 1
        snapshot.appendItems(Reminder.sampleData.map { $0.title })
        dataSource.apply(snapshot)
        
        collectionView.dataSource = dataSource
    }

    //return list compotision layout
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}

