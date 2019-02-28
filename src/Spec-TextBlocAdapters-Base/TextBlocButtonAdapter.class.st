Class {
	#name : #TextBlocButtonAdapter,
	#superclass : #TextBlocAbstractAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #protocol }
TextBlocButtonAdapter >> buildWidget [

	| button |
	
	button := TextBlocSpecButton new.
	
	^ button
]
