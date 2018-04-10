Class {
	#name : #TextBlocMorphicSpaceMorph,
	#superclass : #Morph,
	#instVars : [
		'hostSpace',
		'form'
	],
	#category : #'TextBloc-Core-Morphic'
}

{ #category : #accessing }
TextBlocMorphicSpaceMorph >> drawOn: aCanvas [

"	super drawOn: aCanvas."
	
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
TextBlocMorphicSpaceMorph >> form [

	^ form
]

{ #category : #accessing }
TextBlocMorphicSpaceMorph >> hostSpace [
	^ hostSpace
]

{ #category : #accessing }
TextBlocMorphicSpaceMorph >> hostSpace: anObject [
	hostSpace := anObject
]

{ #category : #accessing }
TextBlocMorphicSpaceMorph >> initialize [

	super initialize.
	form := Form extent: self extent * 8 depth: 32. 
]
