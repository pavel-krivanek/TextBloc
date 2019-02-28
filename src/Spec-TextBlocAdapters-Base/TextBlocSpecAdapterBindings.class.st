Class {
	#name : #TextBlocSpecAdapterBindings,
	#superclass : #SpecAdapterBindings,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #queries }
TextBlocSpecAdapterBindings >> abstractAdapterClass [
	^ TextBlocAbstractAdapter
]

{ #category : #queries }
TextBlocSpecAdapterBindings >> defaultFont [

	^ StubFixedFont new
]
