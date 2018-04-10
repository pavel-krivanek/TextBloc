Class {
	#name : #TextBlocTestingHost,
	#superclass : #BlHost,
	#instVars : [
		'isRunning'
	],
	#category : #'TextBloc-Core-Testing'
}

{ #category : #initialization }
TextBlocTestingHost >> createHostSpaceFor: aSpace [

	| aHostSpace|

	aHostSpace := TextBlocTestingHostSpace new. 
	aHostSpace host: self.
	aHostSpace space: aSpace.
	aHostSpace withTextBlocRenderer.

	aSpace hostSpace: aHostSpace.
	
	"Create and assign a new morphic host space for given bloc space"
	
]

{ #category : #initialization }
TextBlocTestingHost >> destroyHostSpaceFor: aSpace [
	"Destroys host space window of a given space.
	Note: in most cases under 'destroy host space' we mean 'close host window' and unregister it"
	
	aSpace detachHostSpace
]

{ #category : #initialization }
TextBlocTestingHost >> initialize [
	super initialize.
	
	isRunning := false
]

{ #category : #initialization }
TextBlocTestingHost >> isRunning [
	"Return true if host is initialized and running"
	<return: #Boolean>

	^ isRunning
]

{ #category : #initialization }
TextBlocTestingHost >> start [
	isRunning := true
]

{ #category : #initialization }
TextBlocTestingHost >> stop [
	isRunning := false
]
