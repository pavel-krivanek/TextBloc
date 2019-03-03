Class {
	#name : #TextBlocSpecButton,
	#superclass : #TextBlocSpecView,
	#instVars : [
		'label',
		'clickBlock',
		'pressed'
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

	| pos offset |
	
	aCanvas pushAttributes.
	
"	(self globalBoundsToLocal: (BlBounds fromRectangle: self bounds)) logCr.
"
	offset := pressed 
		ifTrue: [ 1@0 ]
		ifFalse: [ 0@0 ].
	
	pos := (self extent / 2) - ((self label size//2)@0).
	
	aCanvas greenBackground.
	aCanvas fillRectangle: (Rectangle origin: 1@1+offset corner: self extent-(1@1)+offset) with: ' '.

	self hasFocus 
		ifTrue: [ aCanvas yellowText. aCanvas bold  ]
		ifFalse: [ aCanvas blackText ].			
	aCanvas at: pos+offset write: self label. 

	pressed ifFalse: [ 
	aCanvas blackBackground.
	aCanvas fillRectangle: (Rectangle origin: (2@self extent y) corner: (self extent x@self extent y)) with: ' '.
	aCanvas fillRectangle: (Rectangle origin: (self extent x@2) corner: (self extent x@self extent y)) with: ' '.

].

	aCanvas popAttributes.
		

]

{ #category : #accessing }
TextBlocSpecButton >> initialize [ 
	
	super initialize.
			
	self addEventHandlerOn: BlClickEvent do: [ :evt | self clickBlock value ].
	self addEventHandlerOn: BlMouseDownEvent do: [ :evt | 
		self hasFocus ifFalse: [self transferFocus].
		pressed := true. self invalidate ].
	self addEventHandlerOn: BlMouseUpEvent do: [ :evt | pressed := false. self invalidate ].

	pressed := false.
	

]

{ #category : #accessing }
TextBlocSpecButton >> label [
	^ label ifNil: [ '(no label)' ]
]

{ #category : #accessing }
TextBlocSpecButton >> label: anObject [
	label := anObject.
	
]
