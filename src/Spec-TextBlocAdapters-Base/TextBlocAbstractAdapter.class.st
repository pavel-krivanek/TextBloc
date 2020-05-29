Class {
	#name : #TextBlocAbstractAdapter,
	#superclass : #SpAbstractAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #accessing }
TextBlocAbstractAdapter class >> adaptingName [
	"Override me if adapter will not follow the common pattern"

	"remove 'TextBloc' part and *in general*, I will have the adapting name"

	^ (self name allButFirst: 8) asSymbol
]

{ #category : #accessing }
TextBlocAbstractAdapter class >> allAdapters [

	^ self allSubclasses
]

{ #category : #'instance creation' }
TextBlocAbstractAdapter >> add: anAdapter [ 
	
	self widgetDo: [ :aWidget |
		| child |
		child := anAdapter asWidget.
		child size: 10@3.
		child hasParent ifFalse: [
		aWidget layout: BlLinearLayout new.
		aWidget addChild: child.]
		 ]
]

{ #category : #protocol }
TextBlocAbstractAdapter >> addModelIn: widgetToBuild withSpecLayout: aSpec [
	
	
]

{ #category : #protocol }
TextBlocAbstractAdapter >> addModelTo: aWidget [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> bindKeyCombination: aShortcut toAction: aBlock [


]

{ #category : #protocol }
TextBlocAbstractAdapter >> borderColor: color [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> borderWidth: width [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> buildWidget [

	| aWidget |
	
	aWidget := self newWidget.
	self addModelTo: aWidget.
	^ aWidget
]

{ #category : #protocol }
TextBlocAbstractAdapter >> color: color [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> convert: aNumberOrUnit [

	| val |

	val := (aNumberOrUnit isNumber 
		ifTrue: [ (aNumberOrUnit pixels convertTo: Unit character) rounded ]
		ifFalse: [ (aNumberOrUnit convertTo: Unit character) rounded ]) value.
	^ val.
]

{ #category : #protocol }
TextBlocAbstractAdapter >> dragEnabled: aBoolean [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> dropEnabled: aBoolean [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> enabled [

	^ widget enabled
]

{ #category : #protocol }
TextBlocAbstractAdapter >> enabled: aBoolean [

	widget enabled: aBoolean
]

{ #category : #'gt-inspector-extension' }
TextBlocAbstractAdapter >> gtInspectorPreviewIn: aGLMCompositePresentation [
	"Do nothing at the moment"
]

{ #category : #protocol }
TextBlocAbstractAdapter >> hRigid [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> hShrinkWrap [

]

{ #category : #protocol }
TextBlocAbstractAdapter >> hSpaceFill [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> layout: aLayout [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> newWidget [

	^ TextBlocGeneralView named: ((self class name withoutPrefix: #TextBloc) withoutSuffix: #Adapter)
]

{ #category : #protocol }
TextBlocAbstractAdapter >> removeSubWidgets [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> setBalloonText: aString [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> takeKeyboardFocus [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> useProportionalLayout [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> vRigid [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> vShrinkWrap [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> vSpaceFill [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> when: anAnnouncement do: aBlock [
]
