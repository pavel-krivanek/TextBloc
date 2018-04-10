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

{ #category : #accessing }
TextBlocCanvas >> at: aPoint write: aString [

	| pos | 
	pos := aPoint.
	
	aString do: [ :e | 
		surface at: pos put: e.
		pos := pos + (1@0) ].
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
