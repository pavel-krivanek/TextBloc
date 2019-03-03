Class {
	#name : #TextBlocGeneralView,
	#superclass : #TextBlocSpecView,
	#instVars : [
		'name'
	],
	#category : #'Spec-TextBlocAdapters-Widgets'
}

{ #category : #'instance creation' }
TextBlocGeneralView class >> named: aString [

	^ self new name: aString;
		yourself
]

{ #category : #accessing }
TextBlocGeneralView >> name [
	^ name
]

{ #category : #accessing }
TextBlocGeneralView >> name: anObject [
	name := anObject
]
