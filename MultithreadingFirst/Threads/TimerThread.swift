//
//  TimerThread.swift
//  MultithreadingFirst
//
//  Created by Mad Brains on 18.06.2020.
//  Copyright © 2020 GeekTest. All rights reserved.
//

import Foundation

class TimeThread: Thread {
    
    override func main() {
        // Настраиваем таймер
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            print("Tick")
        }
        
        // Запускаем петлю
        RunLoop.current.run()
    }
    
}
