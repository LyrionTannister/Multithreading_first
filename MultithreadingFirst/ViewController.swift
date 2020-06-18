//
//  ViewController.swift
//  MultithreadingFirst
//
//  Created by Mad Brains on 17.06.2020.
//  Copyright © 2020 GeekTest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        runSimpleOutput()
    }

    // Тест RunLoop БЕЗ использования Autoreleasepool
    func makeRunLoopWithoutAutoreleasepoolTest() {
        print("start test")
        
        for index in 0...UInt.max {
            let string = NSString(format: "test + %d", index)
            print(string)
        }
        
        print("end test")
    }
    
    // Тест RunLoop С использованием Autoreleasepool
    func makeRunLoopAutoreleasepoolTest() {
        print("start test")
        
        for index in 0...UInt.max {
            autoreleasepool {
                let string = NSString(format: "test + %d", index)
                print(string)
            }
        }
        
        print("end test")
    }
    
    // Тест простого тик-таймера
    func runSimpleTickTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            print("tick")
        }
    }
    
    // Тест простого таймера с выводом даты
    func runSimpleCurrentDateTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            print(Date())
        }
    }

    // Запуск нескольких таймеров
    func runMultipleTimers() {
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            print(Date())
        }
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            sleep(1)
        }
    }

    // Поочередное выполнение задач
    func runSimpleOutput() {
        for _ in (0..<10) {
          print("🔴")
        }
                
        for _ in (0..<10) {
            print("🟠")
        }
    }
    
    // Если нам нужно выполнить эти задачи одновременно, надо отправить одну из них в другой поток
    // ПЕРВЫЙ МЕТОД СОЗДАНИЯ THREAD
    func runMultithreadOutput() {
        Thread.detachNewThread {
            for _ in (0..<10) {
                print("🔴")
            }
        }
                
        for _ in (0..<10) {
            print("🟠")
        }
    }
    
    // Создаем контролируемый
    // ВТОРОЙ МЕТОД СОЗДАНИЯ THREAD
    func runControlledThread() {
        let thread = Thread {
            for _ in (0..<10) {
                print("🔴")
            }
        }
                
        thread.start()
                
        for _ in (0..<10) {
            print("🟠")
        }
    }
    
    // Создание кастомного потока
    // ТРЕТИЙ МЕТОД СОЗДАНИЯ THREAD
    func runCustomThread() {
        let thread1 = CustomThread()
                
        thread1.start()
                
        for _ in (0..<10) {
            print("🟠")
        }
    }
    
    
    /* УПРАВЛЕНИЕ ПОТОКАМИ */
    
    func runCustomControllerThread() {
        let thread = CustomThread()
        thread.start()
        
        // НЕ ОСТАНАВЛИВАЕТ ПОТОК! Дает команду на остановку, которую разработчик должен сам обработать в процессе выполнения потока
        thread.cancel()
    }

    func runInfintyThread() {
        let thread = InfintyThread()
        thread.start()
        
        // При вызове cancel сразу после start поток даже НЕ НАЧНЕТ выполняться.
        thread.cancel()
    }

    func runInfintyThreadWithSleepTime() {
        let thread = InfintyThread()
        thread.start()
        
        sleep(2)
        
        thread.cancel()
    }
    
    func runInfintyStoppableThread() {
        let thread = InfintyStoppableThread()
        thread.start()
        
        sleep(2)
        
        thread.cancel()
    }
    
    /* Приоритет выполнения потоков */
    func runRedAndOrangeThreads() {
        let orangeThread = CustomOrangeThread()
        let redThread = CustomRedThread()
        
        orangeThread.start()
        redThread.start()
    }
    
    func runRedAndOrangeThreadsWithDifferentQuality() {
        let orangeThread = CustomOrangeThread()
        let redThread = CustomRedThread()
        
        orangeThread.qualityOfService = .background
        redThread.qualityOfService = .userInitiated
        
        orangeThread.start()
        redThread.start()
    }
    
    /* RunLoop в потоках */
    
    func runCustomTimerThread() {
        let timerThread = TimeThread()
        
        timerThread.start()
    }
    
}

