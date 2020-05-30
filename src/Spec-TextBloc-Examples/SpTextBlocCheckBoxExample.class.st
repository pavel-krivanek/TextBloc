Class {
	#name : #SpTextBlocCheckBoxExample,
	#superclass : #SpTextPresenterExample,
	#instVars : [
		'checkBox1',
		'checkBox2',
		'checkBox3'
	],
	#category : #'Spec-TextBloc-Examples'
}

{ #category : #specs }
SpTextBlocCheckBoxExample class >> defaultSpec [

	^ SpBoxLayout newVertical
		spacing: 2;
		add: #checkBox1;
		add: #checkBox2;
		add: #checkBox3.
]

{ #category : #specs }
SpTextBlocCheckBoxExample class >> open [ 

	<script>
	^ super open
]

{ #category : #accessing }
SpTextBlocCheckBoxExample >> initializePresenter [


]

{ #category : #accessing }
SpTextBlocCheckBoxExample >> initializeWidgets [ 

	checkBox1 := self newCheckBox.
	checkBox2 := self newCheckBox.
	checkBox3 := self newCheckBox.	

]
