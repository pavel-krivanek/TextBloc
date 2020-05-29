"
SpecBindings value: TextBlocAdapterBindings during: [ 
		| aPresenter labels index first layout |
		aPresenter := SpecTextBlocSimpleDemo new.
	
		aPresenter openWithSpec.
		aPresenter .
 ].

"
Class {
	#name : #SpecTextBlocSimpleDemo,
	#superclass : #SpPresenter,
	#instVars : [
		'button1',
		'button2',
		'button3'
	],
	#category : #'Spec-TextBloc-Examples'
}

{ #category : #specs }
SpecTextBlocSimpleDemo class >> defaultSpec [

	^ SpBoxLayout newVertical
		spacing: 2;
		add: #button1;
		add: #button2;
		add: #button3.
]

{ #category : #accessing }
SpecTextBlocSimpleDemo >> button1 [
	^ button1
]

{ #category : #accessing }
SpecTextBlocSimpleDemo >> button1: anObject [
	button1 := anObject
]

{ #category : #accessing }
SpecTextBlocSimpleDemo >> button2 [
	^ button2
]

{ #category : #accessing }
SpecTextBlocSimpleDemo >> button2: anObject [
	button2 := anObject
]

{ #category : #accessing }
SpecTextBlocSimpleDemo >> button3 [
	^ button3
]

{ #category : #accessing }
SpecTextBlocSimpleDemo >> button3: anObject [
	button3 := anObject
]

{ #category : #accessing }
SpecTextBlocSimpleDemo >> initializePresenter [

	button1 action: [ self inform: 'button 1 pressed'. button1 label: 'clicked'. ].
	button2 action: [ self inform: 'button 2 pressed' ].

	button3 action: [ self inform: 'button 3 pressed' ].

]

{ #category : #accessing }
SpecTextBlocSimpleDemo >> initializeWidgets [ 

	button1 := self newButton label: 'Button 1'.
	button2 := self newButton label: 'Button 2'.	
	button3 := self newButton label: 'Button 3'.
]
