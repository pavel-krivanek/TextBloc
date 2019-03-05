Class {
	#name : #TextBlocSpecTextInputField,
	#superclass : #TextBlocSpecView,
	#instVars : [
		'text',
		'acceptBlock'
	],
	#category : #'Spec-TextBlocAdapters-Widgets'
}

{ #category : #initialization }
TextBlocSpecTextInputField >> acceptBlock [

	^ acceptBlock
]

{ #category : #initialization }
TextBlocSpecTextInputField >> acceptBlock: aBlock [

	acceptBlock := aBlock

]

{ #category : #initialization }
TextBlocSpecTextInputField >> drawOnTextBlocCanvas: aCanvas [

	aCanvas pushAttributes.
		
	aCanvas blueBackground.
	aCanvas fillRectangle: (Rectangle origin: 1@1 corner: self extent) with: ' '.

	aCanvas whiteText.
	aCanvas bold.
	aCanvas at: 1@1 write: self text.

	
	aCanvas popAttributes.
]

{ #category : #initialization }
TextBlocSpecTextInputField >> initialize [ 
	
	super initialize.
	
	self addEventHandlerOn: BlMouseDownEvent do: [ :evt | 
			self onMouseDown: evt ].
	self addEventHandlerOn: BlMouseUpEvent do: [ :evt |
		 self onMouseUp: evt ].
	self addEventHandlerOn: BlKeystrokeEvent do: [ :evt |
		self onKeystroke: evt ].
			



]

{ #category : #initialization }
TextBlocSpecTextInputField >> onKeystroke: anEvent [

	self enabled ifFalse: [ ^ self ].

	text := text, anEvent char asString.
	self acceptBlock cull: text.
	
	self invalidate

]

{ #category : #initialization }
TextBlocSpecTextInputField >> onMouseDown: anEvent [

	self enabled ifFalse: [ ^ self ].
	
	self hasFocus ifFalse: [self transferFocus].
	self invalidate

]

{ #category : #initialization }
TextBlocSpecTextInputField >> onMouseUp: anEvent [

	self invalidate

]

{ #category : #initialization }
TextBlocSpecTextInputField >> text [ 

	^ text ifNil: '' asText
]

{ #category : #initialization }
TextBlocSpecTextInputField >> text: aText [

	text := aText
]
