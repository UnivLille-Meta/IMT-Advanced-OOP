"
high
"
Class {
	#name : 'HighSignal',
	#superclass : 'LogicalSignal',
	#category : 'LogicalCircuit',
	#package : 'LogicalCircuit'
}

{ #category : 'controlling' }
HighSignal >> and: aSignal [
	^ aSignal 
	
]

{ #category : 'logical operations' }
HighSignal >> not [
    ^ LowSignal new.
]

{ #category : 'controlling' }
HighSignal >> or: aSignal [
	^ self
]

{ #category : 'evaluating' }
HighSignal >> value [
   ^ 0.
]
