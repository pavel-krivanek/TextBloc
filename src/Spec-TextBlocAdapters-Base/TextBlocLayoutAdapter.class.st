Class {
	#name : #TextBlocLayoutAdapter,
	#superclass : #TextBlocAbstractAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #adding }
TextBlocLayoutAdapter >> add: aPresenter constraints: constraints [
 
	self widgetDo: [ :gtkWidget | 
		self 
			basicAdd: aPresenter 
			constraints: constraints 
			to: gtkWidget ]
]

{ #category : #adding }
TextBlocLayoutAdapter >> basicAdd: aPresenter constraints: constraints to: aPanel [ 

	| childWidget | 

	childWidget := aPresenter buildWithSpec: constraints spec.
	aPanel layout: BlFlowLayout new horizontal.
	aPanel addChild: childWidget.

	^ aPanel
]

{ #category : #adding }
TextBlocLayoutAdapter >> buildWithSpec [
	"This provides some polymorphism with regular presenters to allow composition of layouts."
	
	^ self widget
]

{ #category : #adding }
TextBlocLayoutAdapter >> buildWithSpec: aSpec [
	"This provides some polymorphism with regular presenters to allow composition of layouts."
	
	^ self widget
]
