//
//  CustomThread.swift
//  MultithreadingFirst
//
//  Created by Mad Brains on 18.06.2020.
//  Copyright © 2020 GeekTest. All rights reserved.
//

import Foundation

class CustomThread: Thread {
    
    override func main() {
        for _ in (0..<10) {
            print("🔴")
        }
    }
    
}
