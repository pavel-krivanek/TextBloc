Class {
	#name : #TextBlocLabelAdapter,
	#superclass : #TextBlocAbstractAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #protocol }
TextBlocLabelAdapter >> addModelTo: aLabel [

	super addModelTo: aLabel.
	
	self model label isEmptyOrNil ifFalse: [ self updateLabelFor: aLabel ].
	self model whenLabelChangedDo: [ self updateLabelFor: aLabel ].
	
]

{ #category : #protocol }
TextBlocLabelAdapter >> newWidget [ 

	^ TextBlocSpecLabel new.

]

{ #category : #protocol }
TextBlocLabelAdapter >> updateLabelFor: aWidget [

	aWidget label: (self model label).
	aWidget invalidate
]
