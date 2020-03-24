from typing import NewType, Optional

from OCC.Core.XmlTObjDrivers import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.XmlMDF import *
from OCC.Core.Message import *
from OCC.Core.TDocStd import *
from OCC.Core.XmlLDrivers import *
from OCC.Core.TCollection import *
from OCC.Core.TDF import *
from OCC.Core.XmlObjMgt import *


class XmlTObjDrivers:
	@staticmethod
	def AddDrivers(self, aDriverTable: XmlMDF_ADriverTable, anMsgDrv: Message_Messenger) -> None: ...
	@staticmethod
	def DefineFormat(self, theApp: TDocStd_Application) -> None: ...
	@staticmethod
	def Factory(self, aGUID: Standard_GUID) -> Standard_Transient: ...

class XmlTObjDrivers_DocumentRetrievalDriver(XmlLDrivers_DocumentRetrievalDriver):
	def AttributeDrivers(self, theMsgDriver: Message_Messenger) -> XmlMDF_ADriverTable: ...
	def __init__(self) -> None: ...

class XmlTObjDrivers_DocumentStorageDriver(XmlLDrivers_DocumentStorageDriver):
	def AttributeDrivers(self, theMsgDriver: Message_Messenger) -> XmlMDF_ADriverTable: ...
	def __init__(self, theCopyright: TCollection_ExtendedString) -> None: ...

class XmlTObjDrivers_IntSparseArrayDriver(XmlMDF_ADriver):
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, theSource: XmlObjMgt_Persistent, theTarget: TDF_Attribute, theRelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, theSource: TDF_Attribute, theTarget: XmlObjMgt_Persistent, theRelocTable: XmlObjMgt_SRelocationTable) -> None: ...
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...

class XmlTObjDrivers_ModelDriver(XmlMDF_ADriver):
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, Source: XmlObjMgt_Persistent, Target: TDF_Attribute, RelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, Source: TDF_Attribute, Target: XmlObjMgt_Persistent, RelocTable: XmlObjMgt_SRelocationTable) -> None: ...
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...

class XmlTObjDrivers_ObjectDriver(XmlMDF_ADriver):
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, Source: XmlObjMgt_Persistent, Target: TDF_Attribute, RelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, Source: TDF_Attribute, Target: XmlObjMgt_Persistent, RelocTable: XmlObjMgt_SRelocationTable) -> None: ...
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...

class XmlTObjDrivers_ReferenceDriver(XmlMDF_ADriver):
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, Source: XmlObjMgt_Persistent, Target: TDF_Attribute, RelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, Source: TDF_Attribute, Target: XmlObjMgt_Persistent, RelocTable: XmlObjMgt_SRelocationTable) -> None: ...
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...

class XmlTObjDrivers_XYZDriver(XmlMDF_ADriver):
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, Source: XmlObjMgt_Persistent, Target: TDF_Attribute, RelocTable: XmlObjMgt_RRelocationTable) -> bool: ...
	def Paste(self, Source: TDF_Attribute, Target: XmlObjMgt_Persistent, RelocTable: XmlObjMgt_SRelocationTable) -> None: ...
	def __init__(self, theMessageDriver: Message_Messenger) -> None: ...
