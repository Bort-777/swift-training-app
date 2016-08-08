//
//  EditDepartmentCellDelegate.swift
//  testApp
//
//  Created by Zbranevich, Andrey on 8/8/16.
//  Copyright © 2016 Zbranevich, Andrey. All rights reserved.
//

protocol EditDepartmentCellDelegate: class {
    func didChangeSwitchState(sender: EditDepartmentCell, isOn: Bool)
}
