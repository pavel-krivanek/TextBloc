Class {
	#name : #SpTextBlocCheckBoxAdapter,
	#superclass : #SpTextBlocAbstractAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #protocol }
SpTextBlocCheckBoxAdapter >> addModelTo: aCheckBox [

	super addModelTo: aCheckBox.
		
	self model label isEmptyOrNil ifFalse: [ self updateLabelFor: aCheckBox ].
	self model whenLabelChangedDo: [ self updateLabelFor: aCheckBox ].

	aCheckBox state: self model state.
	self model whenChangedDo: [ :new | self model state: new ].
	aCheckBox enabled: self model isEnabled.
	self model whenEnabledChangedDo: [ :new | self model enabled: new ].
	
	
]

{ #category : #protocol }
SpTextBlocCheckBoxAdapter >> newWidget [ 

	^ SpTextBlocCheckBoxWidget new.

]

{ #category : #protocol }
SpTextBlocCheckBoxAdapter >> updateLabelFor: aWidget [

	aWidget label: (self model label).
	aWidget invalidate
]
