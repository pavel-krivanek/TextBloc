Class {
	#name : #TextBlocSpecButton,
	#superclass : #TextBlocSpecView,
	#instVars : [
		'label',
		'clickBlock'
	],
	#category : #'Spec-TextBlocAdapters-Widgets'
}

{ #category : #accessing }
TextBlocSpecButton >> clickBlock [
	^ clickBlock
]

{ #category : #accessing }
TextBlocSpecButton >> clickBlock: anObject [
	clickBlock := anObject
]

{ #category : #'as yet unclassified' }
TextBlocSpecButton >> drawOnTextBlocCanvas: aCanvas [

	self drawFrameOn: aCanvas.
	aCanvas at: 2@2 write: self label. 
]

{ #category : #accessing }
TextBlocSpecButton >> initialize [ 

	| clickHandler |
	
	super initialize.
	
	clickHandler := BlEventHandler
		on: BlClickEvent
		do: [ :evt | self clickBlock value ].

	self addEventHandler: clickHandler.
]

{ #category : #accessing }
TextBlocSpecButton >> label [
	^ label ifNil: [ '(no label)' ]
]

{ #category : #accessing }
TextBlocSpecButton >> label: anObject [
	label := anObject
]
