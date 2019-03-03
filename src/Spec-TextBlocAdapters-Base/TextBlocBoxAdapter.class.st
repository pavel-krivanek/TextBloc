Class {
	#name : #TextBlocBoxAdapter,
	#superclass : #TextBlocLayoutAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #adding }
TextBlocBoxAdapter >> addConstraits: constraints toChild: childWidget [
	"adds constraits by child."
	
	constraints isExpand ifFalse: [
		| min |
		min := childWidget preferredSizeMinimum.
		constraints width ifNotNil: [ :w | 
			childWidget sizeRequest: w@min y ].
		constraints height ifNotNil: [ :h | 
			childWidget sizeRequest: min x@h ] ].

	^ childWidget
]

{ #category : #adding }
TextBlocBoxAdapter >> basicAdd: aPresenter constraints: constraints to: aWidget [
	| childWidget |

	childWidget := aPresenter buildWithSpec: constraints spec.
		
	childWidget constraintsDo: [ :c |
		c horizontal matchParent .
		c vertical matchParent ].
	
	self widget addChild: childWidget.

	^ aWidget
]

{ #category : #adding }
TextBlocBoxAdapter >> buildWidget [
	"We defer this until layout: (because then I will know what I have to create)"
	
	^ nil
]

{ #category : #adding }
TextBlocBoxAdapter >> layout: aLayout [

	"build of widget was differed up to here (to know what is the direction)"
"	widget := aLayout direction newWidgetOn: self.
	widget 
		homogeneous: aLayout isHomogeneous;
		spacing: aLayout spacing;
		borderWidth: aLayout borderWidth."

	widget := aLayout direction newWidgetOn: self.	
	widget constraintsDo: [ :c |
			c horizontal matchParent .
			c vertical matchParent ].
	widget layout: (BlGridLayout new columnCount: 1) vertical.
	widget layout cellSpacing: (self convert: aLayout spacing).

]

{ #category : #adding }
TextBlocBoxAdapter >> newHorizontal [

	^ TextBlocBoxView newHorizontal
]

{ #category : #adding }
TextBlocBoxAdapter >> newVertical [

	^ TextBlocBoxView newVertical
]
