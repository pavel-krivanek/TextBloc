Class {
	#name : #TextBlocRendererVTESurface,
	#superclass : #BlHostRendererSurface,
	#instVars : [
		'presenter'
	],
	#category : #'TextBloc-VTE'
}

{ #category : #testing }
TextBlocRendererVTESurface class >> supportedBy: aClass [ 
	
	^ false
]

{ #category : #rendering }
TextBlocRendererVTESurface >> at: aPoint put: aCharacter textColor: textColor backgroundColor: backgroundColor attributes: attributes [

	presenter application defer: [ 
		presenter 
			saveCursor;
			cursorPosition: aPoint;
			feed: aCharacter asString;
			restoreCursor ]
]

{ #category : #rendering }
TextBlocRendererVTESurface >> form [

	^ form
]

{ #category : #initialization }
TextBlocRendererVTESurface >> initializeOn: anObject [

	| app | 
	app := SpApplication new.
	app useBackend: #Gtk. 
	presenter := VteTerminalPresenter newApplication: app.
	presenter openWithSpec.

	anObject initializeForForm: self


]

{ #category : #initialization }
TextBlocRendererVTESurface >> initializeResourcesOn: aHostRenderer [
	"externalForm := BlExternalForm extent: self canvasExtent depth: 32.
	externalForm autoRelease.
	externalForm allocateSpace.
	externalForm fillColor: Color transparent.
"

	self initializeOn: aHostRenderer
]

{ #category : #rendering }
TextBlocRendererVTESurface >> prepareToRender: aSpace [
	"Dispatch preparation to render through host space based on surface type"
	
	self hostSpace prepareToRender: aSpace onFormSurface: self
]

{ #category : #rendering }
TextBlocRendererVTESurface >> renderFor: aSpace [
	"Dispatch render process through host space based on surface type"
	
	self hostSpace render: aSpace onFormSurface: self
]
