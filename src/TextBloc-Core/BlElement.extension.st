Extension { #name : #BlElement }

{ #category : #'*TextBloc-Core' }
BlElement >> drawChildrenOnTextBlocCanvas: aCanvas [


]

{ #category : #'*TextBloc-Core' }
BlElement >> drawOnTextBlocCanvas: aCanvas [

	aCanvas at: 1@1 write: 'Hello TextBloc'.


]

{ #category : #'*TextBloc-Core' }
BlElement >> fullDrawOnTextBlocCanvas: aCanvas [
	| anEffectBounds |

	"We do not draw transparent elements at all"
	self isTransparent
		ifTrue: [ ^ self ].

	"invisible elements are not rendered too"
	self isVisible
		ifFalse: [ ^ self ].

	self drawOnTextBlocCanvas: aCanvas.
	self drawChildrenOnTextBlocCanvas: aCanvas.

	
"	aCanvas layer
		alpha: self opacity;
		when: [ self isTranslucent ]
		during: [

			aCanvas transform
				by: self transformation
				translated: self position
				during: [ :aTransformedCanvas |

					aTransformedCanvas clip
						when: [ self clipChildren ]
						by: [ (self visualBounds: BlBounds new on: aTransformedCanvas) merge: anEffectBounds ]
						during: [
							self effect
								applyEffectOnSpartaCanvas: aTransformedCanvas
								for: self
								around: [
									self drawOnSpartaCanvas: aTransformedCanvas.
									self drawChildrenOnSpartaCanvas: aTransformedCanvas ] ].
						misc debug ifTrue: [
							self drawDebugInfoOnSpartaCanvas: aTransformedCanvas ] ] ]
		"
]
