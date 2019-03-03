Class {
	#name : #TextBlocGridAdapter,
	#superclass : #TextBlocLayoutAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #adding }
TextBlocGridAdapter >> basicAdd: aPresenter constraints: constraints to: gtkWidget [
	| childWidget |

	childWidget := aPresenter buildWithSpec: constraints spec.
	self addConstraits: constraints toChild: childWidget.
	gtkWidget 
		attach: childWidget 
		at: constraints position 
		span: constraints span.
		
	^ gtkWidget
]
