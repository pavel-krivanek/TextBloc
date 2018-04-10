Class {
	#name : #TextBlocSpaceMorph,
	#superclass : #Morph,
	#instVars : [
		'hostSpace',
		'form'
	],
	#category : #'TextBloc-Core'
}

{ #category : #accessing }
TextBlocSpaceMorph >> drawOn: aCanvas [

	super drawOn: aCanvas.
	
	aCanvas clipBy: self fullBounds during: [ :aClippedCanvas |
		aClippedCanvas drawImage: form at: self position ] 
	
	"spaceForm := form.
	spaceForm isNull
		ifTrue: [ ^ self ].
	hostSpace ifNotNil: [ 
		hostSpace lock critical: [
			aCanvas clipBy: self fullBounds during: [ :aClippedCanvas |
				aClippedCanvas drawImage: spaceForm at: self position ] ] ]"
]

{ #category : #accessing }
TextBlocSpaceMorph >> form [

	^ form
]

{ #category : #accessing }
TextBlocSpaceMorph >> hostSpace [
	^ hostSpace
]

{ #category : #accessing }
TextBlocSpaceMorph >> hostSpace: anObject [
	hostSpace := anObject
]

{ #category : #accessing }
TextBlocSpaceMorph >> initialize [

	super initialize.
	
	form := Form extent: 500@500 depth: 32. 
]
