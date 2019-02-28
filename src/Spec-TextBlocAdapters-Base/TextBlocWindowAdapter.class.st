Class {
	#name : #TextBlocWindowAdapter,
	#superclass : #TextBlocAbstractAdapter,
	#instVars : [
		'space',
		'universe',
		'host'
	],
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #accessing }
TextBlocWindowAdapter >> addContent: aView toWindow: aSpecWindow [

	space root addChild: aView.
]

{ #category : #accessing }
TextBlocWindowAdapter >> addModelIn: widgetToBuild withSpecLayout: aSpec [
	self
		addContent: (self model presenter buildWithSpecLayout: aSpec)
		toWindow: widgetToBuild
]

{ #category : #accessing }
TextBlocWindowAdapter >> buildWidget [

	^ SpecStubWindowView new
]

{ #category : #accessing }
TextBlocWindowAdapter >> close [
]

{ #category : #accessing }
TextBlocWindowAdapter >> delete [
]

{ #category : #accessing }
TextBlocWindowAdapter >> initialize [

	super initialize.
	
	self initializeSpace.
]

{ #category : #accessing }
TextBlocWindowAdapter >> initializeSpace [

	space := BlSpace new.
	space extent: 50@20.
	space root layout: BlFlowLayout new horizontal.

	universe := BlUniverse new.
	universe pulseLoop: (TextBlocPulseLoop new 
		universe: universe;
		yourself).

	host := TextBlocMorphicHost new.
	space host: host.
	universe spaceManager addSpace: space.

	space host createHostSpaceFor: space.
	space hostSpace show.
		
	universe start.
	space dispatchEvent: (BlSpaceShownEvent new space: universe).


]

{ #category : #accessing }
TextBlocWindowAdapter >> open [


]

{ #category : #accessing }
TextBlocWindowAdapter >> title: aString [
]
