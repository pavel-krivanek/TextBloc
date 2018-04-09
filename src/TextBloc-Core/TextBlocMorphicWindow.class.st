"
element := BlElement new.

universe := BlUniverse new.
universe start.

universe spaceManager hasSpaces.

space := BlSpace new.
space extent: 50@50.

host := TextBlocHost new.
space host: host.
universe spaceManager addSpace: space.

host createHostSpaceFor: space.

space root addChild: element.

space hostSpace open.

space hasDirtyAreas .
"
Class {
	#name : #TextBlocMorphicWindow,
	#superclass : #StandardWindow,
	#instVars : [
		'eventHandler',
		'spaceForm',
		'hostSpace',
		'preventResize'
	],
	#category : #'TextBloc-Core'
}

{ #category : #testing }
TextBlocMorphicWindow >> handleKeystroke: anEvent [
	anEvent sentTo: eventHandler
]

{ #category : #testing }
TextBlocMorphicWindow >> handlesKeyboard: evt [
	^ true
]

{ #category : #testing }
TextBlocMorphicWindow >> hostSpace [
	^ hostSpace
]

{ #category : #testing }
TextBlocMorphicWindow >> hostSpace: aHostSpace [
	
	hostSpace := aHostSpace.
	spaceForm hostSpace: aHostSpace.
	
	self initializeAnnouncement
]

{ #category : #testing }
TextBlocMorphicWindow >> initialize [
	super initialize.

	spaceForm := TextBlocSpaceMorph new.
	self addMorph: spaceForm fullFrame: (0@0 extent: 1@1).
	eventHandler := TextBlocMorphicEventHandler window: self.
	preventResize := false
]

{ #category : #testing }
TextBlocMorphicWindow >> initializeAnnouncement [
	
	self
		onAnnouncement: WindowOpened
		do: [ :evt | spaceForm startStepping ].

	self
		onAnnouncement: WindowClosed
		do: [ :evt | spaceForm stopStepping. "BlMorphicWindowCloseEvent new sentTo: eventHandler "].
		
	self
		onAnnouncement: MorphGotFocus
		do: [ :evt | ].
		
	self
		onAnnouncement: MorphLostFocus
		do: [ :evt | ].

"	self
		onAnnouncement: WindowResizing
		do: [ :evt | 
			self resizeDuring: [ BlMorphicWindowResizeEvent new
				width: self spaceExtent x;
				height: self spaceExtent y;
				sentTo: eventHandler ] ]"
]

{ #category : #testing }
TextBlocMorphicWindow >> isInSpaceArea: anEvent [
	"Return true if given morphic event is within space area, false otherwise"
	<return: #Boolean>
	
	^ spaceForm fullBounds containsPoint: anEvent position
]

{ #category : #testing }
TextBlocMorphicWindow >> keyDown: anEvent [
	anEvent sentTo: eventHandler
]

{ #category : #testing }
TextBlocMorphicWindow >> keyUp: anEvent [
	anEvent sentTo: eventHandler
]

{ #category : #testing }
TextBlocMorphicWindow >> pointToSpace: aPoint [

	^ aPoint - self spacePosition
]

{ #category : #testing }
TextBlocMorphicWindow >> processEvent: anEvent using: defaultDispatcher [
	
	(self isInSpaceArea: anEvent)
		ifFalse: [ ^ super processEvent: anEvent using: defaultDispatcher ].

	anEvent sentTo: eventHandler.
	
	"quick fix for issue #15 : 
	In morphic, if the drop event is mark as handled, the dragged window is removed"
	anEvent isDropEvent
		ifFalse: [ anEvent wasHandled: true ]
]

{ #category : #geometry }
TextBlocMorphicWindow >> resizeDuring: aBlock [
	
	preventResize
		ifTrue: [ ^ self ].
	
	preventResize := true.
	aBlock ensure: [ preventResize := false ]
]

{ #category : #geometry }
TextBlocMorphicWindow >> spaceExtent [
	| aDelta |
	
	"we compute decorations extent first"
	aDelta := self fullBounds extent - spaceForm extent.
	^ self extent - aDelta
]

{ #category : #geometry }
TextBlocMorphicWindow >> spaceExtent: anExtent [

	self resizeDuring: [
		self spaceExtent = anExtent
			ifFalse: [
				| aDelta |
				"we compute decorations extent first"
				aDelta := self fullBounds extent - spaceForm extent.
				super extent: anExtent + aDelta ] ]
]

{ #category : #testing }
TextBlocMorphicWindow >> spacePosition [
	"Return position of space area"
	<return: #Point>

	^ spaceForm position
]

{ #category : #testing }
TextBlocMorphicWindow >> takesKeyboardFocus [
	"Answer whether the receiver can normally take keyboard focus."

	^ true
]

{ #category : #testing }
TextBlocMorphicWindow >> wantsKeyboardFocus [
	"Answer whether the receiver would like keyboard focus
	in the general case (mouse action normally)."

	^ true
]
