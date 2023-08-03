.SUFFIXES: .java .class

.java.class : 
	javac $*.java

all : APIApplication.class APIAttribute.class APIContent.class \
APIDialog.class APIDocument.class APIInterface.class APILanguage.class \
APIPresentation.class APIReference.class APIRegistry.class \
APISelection.class APITree.class APIView.class Application.class \
Attribute.class AttributeType.class Button.class Document.class \
Element.class ElementType.class Interface.class InterfaceThread.class \
Language.class Presentation.class Registry.class SSchema.class Tree.class \
Extra.class APILibMsg.class IntPtr.class userThreadPool.class Action.class \
SampleAction.class

clean :
	rm -f *.class
