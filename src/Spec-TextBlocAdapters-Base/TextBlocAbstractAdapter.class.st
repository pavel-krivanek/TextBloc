Class {
	#name : #TextBlocAbstractAdapter,
	#superclass : #AbstractAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #protocol }
TextBlocAbstractAdapter >> add: aWidget [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> addModelIn: widgetToBuild withSpecLayout: aSpec [
	
	
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

	^ self class new
]

{ #category : #protocol }
TextBlocAbstractAdapter >> color: color [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> dragEnabled: aBoolean [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> dropEnabled: aBoolean [
]

{ #category : #protocol }
TextBlocAbstractAdapter >> enabled: aBoolean [
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