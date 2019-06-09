/*
 * CalenderView.swift
 * SBCalendar
 *
 * Created by Sreejith Bhatt on 06/06/19.
 * Copyright © 2019 SB Studios. All rights reserved.
 * http://www.sreejithbhatt.com/
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

import UIKit

class CalenderView: UIView {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet weak var monthView: MonthView!
    
    @IBOutlet weak var weekdaysView: WeekdaysView!
    
    lazy var calenderManager:CalenderManager = {
        let tempCalenderManager = CalenderManager(delegate: self)
        return tempCalenderManager
    }()
    
    //MARK: - CONSTRUCTORS
    
    // init with frame constructor.
    override init(frame: CGRect) {
        super.init(frame: frame)
        calenderManager.initializeView()
    }
    
    // init with coder constructor
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        calenderManager.initializeView()
    }
    
    // convenience init constructor.
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        monthView.delegate = self
        self.myCollectionView.showsHorizontalScrollIndicator = false
        self.myCollectionView.allowsMultipleSelection = false
        self.myCollectionView.register(CalenderDateCell.self, forCellWithReuseIdentifier: "Cell")
    }
}

extension CalenderView : CalenderManagerDelegate {
    
    func didCalenderManagerRefreshData(_ calenderManager: CalenderManager, _ isButtonEnabled: Bool) {
        myCollectionView.reloadData()
        monthView.btnLeft.isEnabled = isButtonEnabled
    }
}

extension CalenderView : MonthViewDelegate {
    
    func didChangeMonth(monthIndex: Int, year: Int) {
        calenderManager.didChangeMonth(monthIndex: monthIndex, year: year)
    }
}












