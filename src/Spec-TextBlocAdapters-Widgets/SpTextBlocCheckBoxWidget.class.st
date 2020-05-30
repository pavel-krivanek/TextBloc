Class {
	#name : #SpTextBlocCheckBoxWidget,
	#superclass : #SpTextBlocWidget,
	#instVars : [
		'label',
		'state',
		'acceptBlock'
	],
	#category : #'Spec-TextBlocAdapters-Widgets'
}

{ #category : #initialization }
SpTextBlocCheckBoxWidget >> acceptBlock [

	^ acceptBlock
]

{ #category : #initialization }
SpTextBlocCheckBoxWidget >> acceptBlock: aBlock [

	acceptBlock := aBlock

]

{ #category : #initialization }
SpTextBlocCheckBoxWidget >> checkBoxText [

	^ state 
		ifTrue: ['✓']  
		ifFalse: [ ' ' ]
]

{ #category : #initialization }
SpTextBlocCheckBoxWidget >> drawOnTextBlocCanvas: aCanvas [

	aCanvas pushAttributes.
		
	aCanvas at: 1@1 write: '[', self checkBoxText, '] ', self label.
	
	aCanvas popAttributes.
]

{ #category : #initialization }
SpTextBlocCheckBoxWidget >> initialize [ 
	
	super initialize.
	
	self addEventHandlerOn: BlMouseDownEvent do: [ :evt | 
			self onMouseDown: evt ].
	self addEventHandlerOn: BlMouseUpEvent do: [ :evt |
		 self onMouseUp: evt ].
	self addEventHandlerOn: BlKeystrokeEvent do: [ :evt |
		self onKeystroke: evt ].
			



]

{ #category : #accessing }
SpTextBlocCheckBoxWidget >> label [
	^ label ifNil: ''
]

{ #category : #accessing }
SpTextBlocCheckBoxWidget >> label: anObject [
	label := anObject
]

{ #category : #initialization }
SpTextBlocCheckBoxWidget >> onKeystroke: anEvent [

	self enabled ifFalse: [ ^ self ].

	"text := (text ifNil: ['']), anEvent char asString.
	self acceptBlock cull: text."
	
	self invalidate

]

{ #category : #initialization }
SpTextBlocCheckBoxWidget >> onMouseDown: anEvent [

	self enabled ifFalse: [ ^ self ].
	
	self hasFocus ifFalse: [self transferFocus].
	self invalidate

]

{ #category : #initialization }
SpTextBlocCheckBoxWidget >> onMouseUp: anEvent [

	self invalidate

]

{ #category : #accessing }
SpTextBlocCheckBoxWidget >> state [
	^ state
]

{ #category : #accessing }
SpTextBlocCheckBoxWidget >> state: anObject [
	state := anObject
]
