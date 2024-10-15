"
low

"
Class {
	#name : 'LowSignal',
	#superclass : 'LogicalSignal',
	#category : 'LogicalCircuit',
	#package : 'LogicalCircuit'
}

{ #category : 'controlling' }
LowSignal >> and: aSignal [
	^ self
]

{ #category : 'logical operations' }
LowSignal >> not [
    ^ HighSignal new.
]

{ #category : 'controlling' }
LowSignal >> or: aSignal [
	^ aSignal 
]

{ #category : 'evaluating' }
LowSignal >> value [ 
	^ 0.
]
