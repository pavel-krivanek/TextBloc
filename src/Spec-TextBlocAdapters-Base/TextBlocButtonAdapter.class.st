Class {
	#name : #TextBlocButtonAdapter,
	#superclass : #TextBlocAbstractAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #protocol }
TextBlocButtonAdapter >> addModelTo: aButton [

	super addModelTo: aButton.
		
	self model label isEmptyOrNil ifFalse: [ self updateLabel ].
	self model whenLabelChangedDo: [ self updateLabel ].

	aButton state: self model state.
	self model whenStateChangedDo: [ :new | self model state: new ].
	aButton enabled: self model isEnabled.
	self model whenEnabledChanged: [ :new | self model enabled: new ].

	aButton color: self model color.

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
