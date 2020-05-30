Class {
	#name : #SpTextBlocAbstractAdapter,
	#superclass : #SpAbstractAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #accessing }
SpTextBlocAbstractAdapter class >> adaptingName [
	"Override me if adapter will not follow the common pattern"

	"remove 'SpTextBloc' part and *in general*, I will have the adapting name"

	^ (self name allButFirst: 10) asSymbol
]

{ #category : #accessing }
SpTextBlocAbstractAdapter class >> allAdapters [

	^ self allSubclasses
]

{ #category : #'instance creation' }
SpTextBlocAbstractAdapter >> add: anAdapter [ 
	
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
SpTextBlocAbstractAdapter >> addModelIn: widgetToBuild withSpecLayout: aSpec [
	
	
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> addModelTo: aWidget [
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> bindKeyCombination: aShortcut toAction: aBlock [


]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> borderColor: color [
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> borderWidth: width [
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> buildWidget [

	| aWidget |
	
	aWidget := self newWidget.
	self addModelTo: aWidget.
	^ aWidget
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> color: color [
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> convert: aNumberOrUnit [

	| val |

	val := (aNumberOrUnit isNumber 
		ifTrue: [ (aNumberOrUnit pixels convertTo: Unit character) rounded ]
		ifFalse: [ (aNumberOrUnit convertTo: Unit character) rounded ]) value.
	^ val.
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> dragEnabled: aBoolean [
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> dropEnabled: aBoolean [
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> enabled [

	^ widget enabled
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> enabled: aBoolean [

	widget enabled: aBoolean
]

{ #category : #'gt-inspector-extension' }
SpTextBlocAbstractAdapter >> gtInspectorPreviewIn: aGLMCompositePresentation [
	"Do nothing at the moment"
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> hRigid [
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> hShrinkWrap [

]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> hSpaceFill [
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> layout: aLayout [
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> newWidget [

	^ SpTextBlocGeneralWidget named: ((self class name withoutPrefix: #TextBloc) withoutSuffix: #Adapter)
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> removeSubWidgets [
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> setBalloonText: aString [
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> takeKeyboardFocus [
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> useProportionalLayout [
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> vRigid [
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> vShrinkWrap [
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> vSpaceFill [
]

{ #category : #protocol }
SpTextBlocAbstractAdapter >> when: anAnnouncement do: aBlock [
]
