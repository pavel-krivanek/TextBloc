Class {
	#name : #TextBlocGridAdapter,
	#superclass : #TextBlocLayoutAdapter,
	#instVars : [
		'rows',
		'columns'
	],
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #adding }
TextBlocGridAdapter >> basicAdd: aPresenter constraints: constraints to: aWidget [
	| childWidget  |

	columns := columns max: constraints position x.
	rows := rows max: constraints position y.
	
	self widget layout columnCount: columns; rowCount: rows.


	childWidget := aPresenter buildWithSpec: constraints spec.
		
	childWidget constraintsDo: [ :c |
		c horizontal matchParent .
		c vertical matchParent ].
	
	self widget addChild: childWidget.

	^ aWidget
]

{ #category : #adding }
TextBlocGridAdapter >> buildWidget [
	"We defer this until layout: (because then I will know what I have to create)"
	
	^ nil
]

{ #category : #adding }
TextBlocGridAdapter >> initialize [ 
		
	super initialize.
	
	columns := 1.
	rows := 1.
]

{ #category : #adding }
TextBlocGridAdapter >> layout: aLayout [

	widget := TextBlocGridView new.	
	widget constraintsDo: [ :c |
			c horizontal matchParent .
			c vertical matchParent ].
	widget layout: (BlGridLayout new) vertical.
	widget layout cellSpacing: (self convert: aLayout rowSpacing)
]

{ #category : #adding }
TextBlocGridAdapter >> newHorizontal [

	^ TextBlocBoxView newHorizontal
]

{ #category : #adding }
TextBlocGridAdapter >> newVertical [

	^ TextBlocBoxView newVertical
]
