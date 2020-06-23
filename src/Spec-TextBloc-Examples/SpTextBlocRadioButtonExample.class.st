Class {
	#name : #SpTextBlocRadioButtonExample,
	#superclass : #SpTextPresenterExample,
	#instVars : [
		'button1',
		'button2',
		'button3'
	],
	#category : #'Spec-TextBloc-Examples'
}

{ #category : #specs }
SpTextBlocRadioButtonExample class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #button1;
		add: #button2;
		add: #button3.
]

{ #category : #specs }
SpTextBlocRadioButtonExample class >> open [ 

	<script>
	^ super open
]

{ #category : #accessing }
SpTextBlocRadioButtonExample >> initializePresenters [

	button1 := self newRadioButton label: 'Button 1'.
	button2 := self newRadioButton label: 'Button 2'.
	button3 := self newRadioButton label: 'Button 3'.
	
	button1 associatedRadioButtons: { button2. button3 }.
]

{ #category : #accessing }
SpTextBlocRadioButtonExample >> initializeWidgets [ 

	checkBox1 := self newCheckBox label: 'checkbox 1'; state: true.
	checkBox2 := self newCheckBox label: 'checkbox 2'; state: false.
	checkBox3 := self newCheckBox label: 'checkbox 3'	

]
