Class {
	#name : #TextBlocHost,
	#superclass : #BlHost,
	#instVars : [
		'isRunning'
	],
	#category : #'TextBloc-Core'
}

{ #category : #initialization }
TextBlocHost >> createHostSpaceFor: aSpace [

| aWindow aHostSpace|

	aWindow := self createMorphicWindowFor: aSpace.
	aHostSpace := TextBlocHostSpace new. 
	aHostSpace morphicWindow: aWindow. 
	aHostSpace host: self.
	aHostSpace space: aSpace.
	aHostSpace withTextBlocRenderer.

	aSpace hostSpace: aHostSpace.
	
	"Create and assign a new morphic host space for given bloc space"
	
]

{ #category : #initialization }
TextBlocHost >> createMorphicWindowFor: aSpace [
	"Note, that I use given space only to find out what window properties to use for created window.
	I do not create any strong or weak references to provided space"
	| aWindow |

	aWindow := TextBlocMorphicWindow new.
	aWindow spaceExtent: aSpace extent*8.
	"aWindow borderless: aSpace borderless."

	^ aWindow
]

{ #category : #initialization }
TextBlocHost >> destroyHostSpaceFor: aSpace [
	"Destroys host space window of a given space.
	Note: in most cases under 'destroy host space' we mean 'close host window' and unregister it"
	
	aSpace detachHostSpace
]

{ #category : #initialization }
TextBlocHost >> initialize [
	super initialize.
	
	isRunning := false
]

{ #category : #initialization }
TextBlocHost >> isRunning [
	"Return true if host is initialized and running"
	<return: #Boolean>

	^ isRunning
]

{ #category : #initialization }
TextBlocHost >> start [
	isRunning := true
]

{ #category : #initialization }
TextBlocHost >> stop [
	isRunning := false
]
