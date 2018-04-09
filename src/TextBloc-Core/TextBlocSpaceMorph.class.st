Class {
	#name : #TextBlocSpaceMorph,
	#superclass : #Morph,
	#instVars : [
		'hostSpace'
	],
	#category : #'TextBloc-Core'
}

{ #category : #accessing }
TextBlocSpaceMorph >> drawOn: aCanvas [

	super drawOn: aCanvas.
	
	"spaceForm := form.
	spaceForm isNull
		ifTrue: [ ^ self ].
	hostSpace ifNotNil: [ 
		hostSpace lock critical: [
			aCanvas clipBy: self fullBounds during: [ :aClippedCanvas |
				aClippedCanvas drawImage: spaceForm at: self position ] ] ]"
]

{ #category : #accessing }
TextBlocSpaceMorph >> hostSpace [
	^ hostSpace
]

{ #category : #accessing }
TextBlocSpaceMorph >> hostSpace: anObject [
	hostSpace := anObject
]
