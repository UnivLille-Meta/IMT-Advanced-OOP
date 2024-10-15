"
test

"
Class {
	#name : 'LogicalSignalTest',
	#superclass : 'TestCase',
	#category : 'LogicalCircuit',
	#package : 'LogicalCircuit'
}

{ #category : 'tests' }
LogicalSignalTest >> testAndWithHighSignal [
    self assert: ((HighSignal new and: HighSignal new) value = 1).
    self assert: ((HighSignal new and: LowSignal new) value = 0).
]

{ #category : 'tests' }
LogicalSignalTest >> testAndWithLowSignal [
    self assert: ((LowSignal new and: HighSignal new) value = 0).
    self assert: ((LowSignal new and: LowSignal new) value = 0).
]

{ #category : 'tests' }
LogicalSignalTest >> testLowSignalValue [
    self assert: (LowSignal new value = 0).
]

{ #category : 'tests' }
LogicalSignalTest >> testNotHighSignal [
    self assert: (HighSignal new not isKindOf: LowSignal).
]

{ #category : 'tests' }
LogicalSignalTest >> testNotLowSignal [
    self assert: (LowSignal new not isKindOf: HighSignal).
]
