Class {
	#name : #TextBlocCanvas,
	#superclass : #Object,
	#instVars : [
		'surface',
		'transformationStack',
		'layerStack',
		'currentTransformation'
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

	| pos| 
	
	pos := aPoint.
	
	transformationStack do: [ :each |
		pos := each transform: pos ].
	
	aString do: [ :e | 
		surface at: pos put: e.
		pos := pos + (1@0) ].
]

{ #category : #'drawing-general' }
TextBlocCanvas >> clip [
	"Perform a clipping.
	User gets a clipper object responsible for clipping.
	See !SpartaClipper 'clipping' protocol for available api.

	canvas clip
		by: (0@0 extent: 300@350)
		during: [ 'perform drawing operations here' ].
	
	or:

	canvas clip
		push: (0@0 extent: 300@350).

	'perform drawing operations here'

	canvas clip
		pop.
	"
	<return: #TextBlocClipper>

	^ self clipBuilder
		reset;
		canvas: self;
		yourself
]

{ #category : #'drawing-general' }
TextBlocCanvas >> clipBuilder [
	^ TextBlocClipper new
]

{ #category : #accessing }
TextBlocCanvas >> currentTransformation [
	^ currentTransformation
]

{ #category : #accessing }
TextBlocCanvas >> currentTransformation: anObject [
	currentTransformation := anObject
]

{ #category : #'drawing-general' }
TextBlocCanvas >> fullDraw: anObject [
	^ anObject fullDrawOnTextBlocCanvas: self
]

{ #category : #initialization }
TextBlocCanvas >> initialize [
	super initialize.
	
	transformationStack := Stack new.
	layerStack := Stack new.
	currentTransformation := SpartaMatrix new.
]

{ #category : #initialization }
TextBlocCanvas >> popTransform [

	^ transformationStack pop
]

{ #category : #initialization }
TextBlocCanvas >> pushTransform: aSpartaMatrix [

	transformationStack push: aSpartaMatrix
]

{ #category : #accessing }
TextBlocCanvas >> surface [
	^ surface
]

{ #category : #accessing }
TextBlocCanvas >> surface: anObject [
	surface := anObject
]

{ #category : #accessing }
TextBlocCanvas >> transform [

	^ self transformationBuilder
		reset;
		canvas: self;
		yourself
]

{ #category : #accessing }
TextBlocCanvas >> transformationBuilder [
	^ TextBlocTransformationBuilder new
]
