//
//  ViewController.swift
//  CustomFont
//
//  Created by zhai on 16/4/7.
//  Copyright © 2016年 zhai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet var tableView: UITableView!
	@IBOutlet var changeBn: UIButton!

	var items: [String] = ["学习Swift", "自定义字体", "这么玩？"]

	var fontNames = ["MFJinHei_Noncommercial-Regular", "MFTongXin_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]

	var fontRowIndex = 0

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.dataSource = self
		tableView.delegate = self
		changeBn.layer.cornerRadius = 55
		changeBn.addTarget(self, action: "buttonClicked:", forControlEvents: .TouchUpInside)
	}

	/*
	 * UiTableView
	 * - table header view
	 * - table footer view
	 * - cell 单元格
	 * - section 节
	 *  + section header 节头
	 *  + section footer 节脚
	 */

	// UITableViewDataSource数据源
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}

	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		return 50
	}

	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
		cell.textLabel?.text = self.items[indexPath.row]
		print(fontNames[fontRowIndex])
		/*
		 * 使用自定义字体要在info.plist文件中配置Fonts provided by application
		 * 在Build Phases中Copy Bundle Rescources中添加字体文件
		 */

		cell.textLabel?.font = UIFont(name: fontNames[fontRowIndex], size: 16)
		return cell
	}

	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		// 点击
	}

	func buttonClicked(_sender: AnyObject?) {
		fontRowIndex = (fontRowIndex + 1) % 3
		tableView.reloadData()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
