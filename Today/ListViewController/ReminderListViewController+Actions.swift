//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by 이정훈 on 12/20/23.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        
        completeReminder(withId: id)
    }
}
