Class {
	#name : #TextBlocButtonAdapter,
	#superclass : #TextBlocAbstractAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #protocol }
TextBlocButtonAdapter >> addModelTo: aButton [

	super addModelTo: aButton.
	
	widget := aButton.
	
	self model label isEmptyOrNil ifFalse: [ self updateLabel ].
	self model whenLabelChangedDo: [ self updateLabel ].

	aButton clickBlock: [ self model action value ].
	
	
]

{ #category : #protocol }
TextBlocButtonAdapter >> newWidget [ 

	^ TextBlocSpecButton new.

]

{ #category : #protocol }
TextBlocButtonAdapter >> updateLabel [

	self widget label: self model label asString.
	self widget invalidate.
]
