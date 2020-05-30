Class {
	#name : #SpTextBlocLabelAdapter,
	#superclass : #SpTextBlocAbstractAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #protocol }
SpTextBlocLabelAdapter >> addModelTo: aLabel [

	super addModelTo: aLabel.
	
	self model label isEmptyOrNil ifFalse: [ self updateLabelFor: aLabel ].
	self model whenLabelChangedDo: [ self updateLabelFor: aLabel ].
	
]

{ #category : #protocol }
SpTextBlocLabelAdapter >> newWidget [ 

	^ SpTextBlocLabelWidget new.

]

{ #category : #protocol }
SpTextBlocLabelAdapter >> updateLabelFor: aWidget [

	aWidget label: (self model label).
	aWidget invalidate
]
