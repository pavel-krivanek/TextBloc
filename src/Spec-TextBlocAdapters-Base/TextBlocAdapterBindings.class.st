Class {
	#name : #TextBlocAdapterBindings,
	#superclass : #SpecAdapterBindings,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #queries }
TextBlocAdapterBindings >> abstractAdapterClass [
	^ TextBlocAbstractAdapter
]

{ #category : #queries }
TextBlocAdapterBindings >> defaultFont [

	^ StubFixedFont new
]
