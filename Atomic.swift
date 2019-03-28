
infix operator <~

struct Atomic<T> {
    
    private let mutex = DispatchSemaphore(value: 1)
    
    private var _value: T
    var value: T {
        set {
            mutex.wait()
            _value = newValue
            mutex.signal()
        }
        get {
            mutex.wait()
            return _value
            mutex.signal()
        }
    }
    
    init(_ v: T) {
        _value = v
    }
    
    static func <~(_ left: inout Atomic<T>,_ right: T) {
        left.value = right
    }
}

var atomicInt = Atomic(10)
atomicInt <~ 20
print(atomicInt.value)





