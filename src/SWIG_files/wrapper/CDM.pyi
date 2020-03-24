from typing import NewType, Optional

from OCC.Core.CDM import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TColStd import *
from OCC.Core.TCollection import *
from OCC.Core.Message import *
from OCC.Core.Resource import *

CDM_DocumentPointer = NewType('CDM_DocumentPointer', CDM_Document)
CDM_NamesDirectory = NewType('CDM_NamesDirectory', TColStd_DataMapOfStringInteger)

class CDM_CanCloseStatus:
	CDM_CCS_OK: int = ...
	CDM_CCS_NotOpen: int = ...
	CDM_CCS_UnstoredReferenced: int = ...
	CDM_CCS_ModifiedReferenced: int = ...
	CDM_CCS_ReferenceRejection: int = ...

class CDM_Application(Standard_Transient):
	def BeginOfUpdate(self, aDocument: CDM_Document) -> None: ...
	def EndOfUpdate(self, aDocument: CDM_Document, theStatus: bool, ErrorString: TCollection_ExtendedString) -> None: ...
	def MessageDriver(self) -> Message_Messenger: ...
	def Name(self) -> TCollection_ExtendedString: ...
	def Resources(self) -> Resource_Manager: ...
	def Version(self) -> TCollection_AsciiString: ...
	def Write(self, aString: Standard_ExtString) -> None: ...

class CDM_Document(Standard_Transient):
	def AddComment(self, aComment: TCollection_ExtendedString) -> None: ...
	def Application(self) -> CDM_Application: ...
	def CanClose(self) -> CDM_CanCloseStatus: ...
	def CanCloseReference(self, aDocument: CDM_Document, aReferenceIdentifier: int) -> bool: ...
	def ChangeStorageFormatVersion(self, theVersion: int) -> None: ...
	def Close(self) -> None: ...
	def CloseReference(self, aDocument: CDM_Document, aReferenceIdentifier: int) -> None: ...
	def Comment(self) -> Standard_ExtString: ...
	def Comments(self, aComments: TColStd_SequenceOfExtendedString) -> None: ...
	def CopyReference(self, aFromDocument: CDM_Document, aReferenceIdentifier: int) -> int: ...
	def CreateReference(self, anOtherDocument: CDM_Document) -> int: ...
	def CreateReference(self, aMetaData: CDM_MetaData, aReferenceIdentifier: int, anApplication: CDM_Application, aToDocumentVersion: int, UseStorageConfiguration: bool) -> None: ...
	def CreateReference(self, aMetaData: CDM_MetaData, anApplication: CDM_Application, aDocumentVersion: int, UseStorageConfiguration: bool) -> int: ...
	def DeepReferences(self, aDocument: CDM_Document) -> bool: ...
	def Description(self) -> TCollection_ExtendedString: ...
	def Document(self, aReferenceIdentifier: int) -> CDM_Document: ...
	def Extensions(self, Extensions: TColStd_SequenceOfExtendedString) -> None: ...
	def FileExtension(self) -> TCollection_ExtendedString: ...
	def FindDescription(self) -> bool: ...
	def FindFileExtension(self) -> bool: ...
	@staticmethod
	def FindFromPresentation(self, aPresentation: TCollection_ExtendedString) -> CDM_Document: ...
	@staticmethod
	def FindPresentation(self, aPresentation: TCollection_ExtendedString) -> bool: ...
	def Folder(self) -> TCollection_ExtendedString: ...
	def FromReferencesNumber(self) -> int: ...
	def GetAlternativeDocument(self, aFormat: TCollection_ExtendedString, anAlternativeDocument: CDM_Document) -> bool: ...
	def HasRequestedFolder(self) -> bool: ...
	def HasRequestedPreviousVersion(self) -> bool: ...
	def IsInSession(self, aReferenceIdentifier: int) -> bool: ...
	def IsModified(self) -> bool: ...
	def IsOpened(self) -> bool: ...
	def IsOpened(self, aReferenceIdentifier: int) -> bool: ...
	def IsReadOnly(self) -> bool: ...
	def IsReadOnly(self, aReferenceIdentifier: int) -> bool: ...
	def IsStored(self, aReferenceIdentifier: int) -> bool: ...
	def IsStored(self) -> bool: ...
	def IsUpToDate(self, aReferenceIdentifier: int) -> bool: ...
	def LoadResources(self) -> None: ...
	def MetaData(self) -> CDM_MetaData: ...
	def Modifications(self) -> int: ...
	def Modify(self) -> None: ...
	def Name(self, aReferenceIdentifier: int) -> TCollection_ExtendedString: ...
	def Open(self, anApplication: CDM_Application) -> None: ...
	def Presentation(self) -> Standard_ExtString: ...
	def Reference(self, aReferenceIdentifier: int) -> CDM_Reference: ...
	def ReferenceCounter(self) -> int: ...
	def RemoveAllReferences(self) -> None: ...
	def RemoveReference(self, aReferenceIdentifier: int) -> None: ...
	def RequestedComment(self) -> TCollection_ExtendedString: ...
	def RequestedFolder(self) -> TCollection_ExtendedString: ...
	def RequestedName(self) -> TCollection_ExtendedString: ...
	def RequestedPreviousVersion(self) -> TCollection_ExtendedString: ...
	def SetComment(self, aComment: TCollection_ExtendedString) -> None: ...
	def SetComments(self, aComments: TColStd_SequenceOfExtendedString) -> None: ...
	def SetIsReadOnly(self) -> None: ...
	def SetIsUpToDate(self, aReferenceIdentifier: int) -> None: ...
	def SetMetaData(self, aMetaData: CDM_MetaData) -> None: ...
	def SetModifications(self, Modifications: int) -> None: ...
	def SetReferenceCounter(self, aReferenceCounter: int) -> None: ...
	def SetRequestedComment(self, aComment: TCollection_ExtendedString) -> None: ...
	def SetRequestedFolder(self, aFolder: TCollection_ExtendedString) -> None: ...
	def SetRequestedName(self, aName: TCollection_ExtendedString) -> None: ...
	def SetRequestedPreviousVersion(self, aPreviousVersion: TCollection_ExtendedString) -> None: ...
	def ShallowReferences(self, aDocument: CDM_Document) -> bool: ...
	def StorageFormat(self) -> TCollection_ExtendedString: ...
	def StorageFormatVersion(self) -> int: ...
	def StorageVersion(self) -> int: ...
	def ToReferencesNumber(self) -> int: ...
	def UnModify(self) -> None: ...
	def UnsetIsReadOnly(self) -> None: ...
	def UnsetIsStored(self) -> None: ...
	def UnsetRequestedPreviousVersion(self) -> None: ...
	def Update(self, aToDocument: CDM_Document, aReferenceIdentifier: int, aModifContext: None) -> None: ...
	def Update(self, ErrorString: TCollection_ExtendedString) -> bool: ...
	def Update(self) -> None: ...
	def UpdateFromDocuments(self, aModifContext: None) -> None: ...

class CDM_MetaData(Standard_Transient):
	def Document(self) -> CDM_Document: ...
	def FileName(self) -> TCollection_ExtendedString: ...
	def Folder(self) -> TCollection_ExtendedString: ...
	def HasVersion(self) -> bool: ...
	def IsReadOnly(self) -> bool: ...
	def IsRetrieved(self) -> bool: ...
	@staticmethod
	def LookUp(self, aFolder: TCollection_ExtendedString, aName: TCollection_ExtendedString, aPath: TCollection_ExtendedString, aFileName: TCollection_ExtendedString, ReadOnly: bool) -> CDM_MetaData: ...
	@staticmethod
	def LookUp(self, aFolder: TCollection_ExtendedString, aName: TCollection_ExtendedString, aPath: TCollection_ExtendedString, aVersion: TCollection_ExtendedString, aFileName: TCollection_ExtendedString, ReadOnly: bool) -> CDM_MetaData: ...
	def Name(self) -> TCollection_ExtendedString: ...
	def Path(self) -> TCollection_ExtendedString: ...
	def SetIsReadOnly(self) -> None: ...
	def UnsetDocument(self) -> None: ...
	def UnsetIsReadOnly(self) -> None: ...
	def Version(self) -> TCollection_ExtendedString: ...

class CDM_Reference(Standard_Transient):
	def DocumentVersion(self) -> int: ...
	def FromDocument(self) -> CDM_Document: ...
	def IsReadOnly(self) -> bool: ...
	def ReferenceIdentifier(self) -> int: ...
	def ToDocument(self) -> CDM_Document: ...

class CDM_ReferenceIterator:
	def __init__(self, aDocument: CDM_Document) -> None: ...
	def Document(self) -> CDM_Document: ...
	def DocumentVersion(self) -> int: ...
	def More(self) -> bool: ...
	def Next(self) -> None: ...
	def ReferenceIdentifier(self) -> int: ...
