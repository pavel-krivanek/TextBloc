Class {
	#name : #TextBlocRendererSurface,
	#superclass : #BlHostRendererSurface,
	#instVars : [
		'form'
	],
	#category : #'TextBloc-Core'
}

{ #category : #testing }
TextBlocRendererSurface class >> supportedBy: aClass [ 
	
	^ false
]

{ #category : #rendering }
TextBlocRendererSurface >> at: aPoint put: aCharacter [

	aCharacter asString displayOn: form at: aPoint*8
	
]

{ #category : #rendering }
TextBlocRendererSurface >> form [

	^ form
]

{ #category : #initialization }
TextBlocRendererSurface >> initializeOn: anObject [

	anObject initializeForForm: self


]

{ #category : #initialization }
TextBlocRendererSurface >> initializeResourcesOn: aHostRenderer [
	"externalForm := BlExternalForm extent: self canvasExtent depth: 32.
	externalForm autoRelease.
	externalForm allocateSpace.
	externalForm fillColor: Color transparent.
"

	form := Form extent: (200@200) depth: 32.
	form fillColor: Color white.
	
	self initializeOn: aHostRenderer
]

{ #category : #rendering }
TextBlocRendererSurface >> prepareToRender: aSpace [
	"Dispatch preparation to render through host space based on surface type"
	
	self hostSpace prepareToRender: aSpace onFormSurface: self
]

{ #category : #rendering }
TextBlocRendererSurface >> renderFor: aSpace [
	"Dispatch render process through host space based on surface type"
	
	self hostSpace render: aSpace onFormSurface: self
]
