Class {
	#name : #TextBlocTextInputFieldAdapter,
	#superclass : #TextBlocTextAdapter,
	#category : #'Spec-TextBlocAdapters-Base'
}

{ #category : #protocol }
TextBlocTextInputFieldAdapter >> addModelTo: inputField [

	super addModelTo: inputField.
		
	self model text isEmptyOrNil ifFalse: [ self updateTextFor: inputField ].
	self model whenTextChangedDo: [ self updateTextFor: inputField ].
	inputField acceptBlock: [ self model text: inputField text ].

	inputField enabled: self model isEnabled.
	self model whenEnabledChanged: [ :new | self model enabled: new ].
	
	
	
]

{ #category : #protocol }
TextBlocTextInputFieldAdapter >> newWidget [ 

	^ TextBlocSpecTextInputField new.

]

{ #category : #protocol }
TextBlocTextInputFieldAdapter >> updateLabelFor: aWidget [

	aWidget label: (self model label).
	aWidget invalidate
]

{ #category : #protocol }
TextBlocTextInputFieldAdapter >> updateTextFor: aWidget [

	aWidget text: (self model text).
	aWidget invalidate
]
