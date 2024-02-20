//
//  ViewController.swift
//  Today
//
//  Created by 이정훈 on 12/18/23.
//

import UIKit

class ReminderListViewController: UICollectionViewController {    
    var dataSource: DataSource!
    var reminders: [Reminder] = Reminder.sampleData

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //list layout
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        //cell configuration
        //Cell registration specifies how to configure the content and appearance of a cell
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        //DataSource
        //Diffable Data Source can animate when the data changes
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Reminder.ID) in
            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        updateSnapshot()
        
        collectionView.dataSource = dataSource
    }
    
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let id = reminders[indexPath.item].id
        pushDetailViewForReminder(withId: id)
        return false
    }
    
    func pushDetailViewForReminder(withId id: Reminder.ID) {
        let reminder = reminder(withId: id)
        let viewController = ReminderViewController(reminder: reminder)
        navigationController?.pushViewController(viewController, animated: true)
    }

    //return list compotision layout
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}

