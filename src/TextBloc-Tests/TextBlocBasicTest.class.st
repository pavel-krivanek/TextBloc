Class {
	#name : #TextBlocBasicTest,
	#superclass : #TestCase,
	#instVars : [
		'element',
		'space',
		'host',
		'universe'
	],
	#category : #'TextBloc-Tests'
}

{ #category : #running }
TextBlocBasicTest >> content [

	^ space hostSpace content
]

{ #category : #running }
TextBlocBasicTest >> firePulse [

	universe pulseLoop firePulse.

]

{ #category : #running }
TextBlocBasicTest >> setUp [

	element := TextBlocHelloElement new.
	space := BlSpace new.
	space extent: 40@10.
	space root addChild: element.

	universe := BlUniverse new.
	universe pulseLoop: (TextBlocPulseLoop new 
		universe: universe;
		yourself).

	host := TextBlocTestingHost new.
	space host: host.
	universe spaceManager addSpace: space.

	space host createHostSpaceFor: space.
	space hostSpace show.

	space dispatchEvent: (BlSpaceShownEvent new space: universe).

]

{ #category : #running }
TextBlocBasicTest >> testContent [

	self firePulse.
	self assert: (self content beginsWith: 'Hello TextBloc')
]
