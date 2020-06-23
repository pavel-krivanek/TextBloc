Class {
	#name : #SpTextBlocAbstractFormButtonAdapter,
	#superclass : #SpTextBlocAbstractAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #protocol }
SpTextBlocAbstractFormButtonAdapter >> addModelTo: aFormButton [

	super addModelTo: aFormButton.
		
	aFormButton label: self getLabelText.
	aFormButton state: self presenter state.

	aFormButton clickBlock: [
		self backendUpdatingDo: [ self updatePresenterState ] ].
	self presenter whenChangedDo: [
		self backendDetectCyclesDo: [ self updateWidgetState ] ].
	
	aFormButton clickBlock: [
		self presenter state: self model state not ].
	
]

{ #category : #protocol }
SpTextBlocAbstractFormButtonAdapter >> getLabelText [

	^ self presenter label ifNotNil: [ :aString | aString localizedForPresenter: self presenter ]
]

{ #category : #protocol }
SpTextBlocAbstractFormButtonAdapter >> state [
	
	^ widget state
]

{ #category : #protocol }
SpTextBlocAbstractFormButtonAdapter >> updateLabelFor: aWidget [

	self widgetDo: [ :w |
		w label: self getLabelText ]
]

{ #category : #protocol }
SpTextBlocAbstractFormButtonAdapter >> updatePresenterState [
	
	self presenter state: self state
]

{ #category : #protocol }
SpTextBlocAbstractFormButtonAdapter >> updateWidgetState [

	self widgetDo: [ :w | 
		self presenter state = w state
			ifFalse: [ w state: self presenter state ] ]
]
