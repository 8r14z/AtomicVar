# AtomicVar
Declare an atomic variable and do not need to worry about thread-safe issues. Similar to AtomicBoolean/AtomicDouble/.... in Java 

```swift
var atomicInt = Atomic(10)
atomicInt <~ 20

print("\(atomicInt)")
```
