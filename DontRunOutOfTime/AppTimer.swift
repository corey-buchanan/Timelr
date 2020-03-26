//
//  AppTimer.swift
//  DontRunOutOfTime
//
//  Created by Corey Buchanan on 3/26/20.
//  Copyright © 2020 Corey Buchanan. All rights reserved.
//

import Foundation

class AppTimer : ObservableObject {
    var timer : Timer?
    @Published var date = Date()
    
    init() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
        self.date = Date()
        }
    }
    
    func stop() {
        self.timer?.invalidate()
    }
}
