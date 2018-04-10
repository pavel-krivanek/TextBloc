Class {
	#name : #TextBlocHelloElement,
	#superclass : #BlElement,
	#category : #'TextBloc-Tests'
}

{ #category : #'as yet unclassified' }
TextBlocHelloElement >> drawOnTextBlocCanvas: aCanvas [

	aCanvas at: 1@1 write: 'Hello TextBloc'.

]
