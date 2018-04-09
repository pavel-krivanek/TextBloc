Class {
	#name : #TextBlocRendererSurface,
	#superclass : #BlHostRendererSurface,
	#category : #'TextBloc-Core'
}

{ #category : #testing }
TextBlocRendererSurface class >> supportedBy: aClass [ 
	
	^ false
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
