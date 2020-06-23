"
SpecBindings value: TextBlocAdapterBindings during: [ 
		| aPresenter labels index first layout |
		aPresenter := SpecTextBlocSimpleDemo new.
	
		aPresenter openWithSpec.
		aPresenter .
 ].

"
Class {
	#name : #SpTextBlocButtonDemo,
	#superclass : #SpTextPresenterExample,
	#instVars : [
		'button1',
		'button2',
		'button3'
	],
	#category : #'Spec-TextBloc-Examples'
}

{ #category : #specs }
SpTextBlocButtonDemo class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #button1;
		add: #button2;
		add: #button3.
]

{ #category : #specs }
SpTextBlocButtonDemo class >> open [ 

	<script>
	^ super open
]

{ #category : #accessing }
SpTextBlocButtonDemo >> initializePresenters [

	button1 := self newButton label: 'Button 1'.
	button2 := self newButton label: 'Button 2'.	
	button3 := self newButton label: 'Button 3'.
]
