import UIKit

//MARK: -- Synchronization & Mutex
//MARK: -- C
class SaveThreadC {
    private var mutex = pthread_mutex_t() // create
    
    init() {
        pthread_mutex_init(&mutex, nil) // init
    }
    
    func someThod(completion: () -> ()) {
        pthread_mutex_lock(&mutex) //reference
        completion()
        defer {
            pthread_mutex_unlock(&mutex)
        }
    }
}

//MARK: -- Objective-C
class SaveThreadObjective {
    private var lockMutex = NSLock() // create
    
    func someThod(completion: () -> ()) {
        lockMutex.lock()
        completion()
        defer {
            lockMutex.unlock()
        }
    }
}

var array = [String]()
let saveThread = SaveThreadObjective()
saveThread.someThod {
    print("test")
    array.append("1 thread")
}

array.append("2 thread")

