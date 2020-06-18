//
//  InfintyThread.swift
//  MultithreadingFirst
//
//  Created by Mad Brains on 18.06.2020.
//  Copyright © 2020 GeekTest. All rights reserved.
//

import Foundation

class InfintyThread: Thread {
    
    override func main() {
        while true {
            print("🔴")
        }
    }
    
}

class InfintyStoppableThread: Thread {
    
    override func main() {
        while !isCancelled {
            print("🔴")
        }
    }
    
}
