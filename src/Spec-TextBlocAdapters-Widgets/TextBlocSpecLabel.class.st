Class {
	#name : #TextBlocSpecLabel,
	#superclass : #TextBlocSpecView,
	#instVars : [
		'label'
	],
	#category : #'Spec-TextBlocAdapters-Widgets'
}

{ #category : #'as yet unclassified' }
TextBlocSpecLabel >> drawOnTextBlocCanvas: aCanvas [

	aCanvas at: 1@1 write: self label
]

{ #category : #accessing }
TextBlocSpecLabel >> label [
	^ label
]

{ #category : #accessing }
TextBlocSpecLabel >> label: anObject [
	label := anObject
]
