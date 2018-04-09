Class {
	#name : #TextBlocCanvas,
	#superclass : #Object,
	#instVars : [
		'surface'
	],
	#category : #'TextBloc-Core'
}

{ #category : #'instance creation' }
TextBlocCanvas class >> on: aSurface [

	^ self new 
		surface: aSurface;
		yourself
]

{ #category : #'drawing-general' }
TextBlocCanvas >> fullDraw: anObject [
	^ anObject fullDrawOnTextBlocCanvas: self
]

{ #category : #accessing }
TextBlocCanvas >> surface [
	^ surface
]

{ #category : #accessing }
TextBlocCanvas >> surface: anObject [
	surface := anObject
]
