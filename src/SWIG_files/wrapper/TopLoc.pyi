from typing import NewType, Optional

from OCC.Core.TopLoc import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.gp import *


class TopLoc_Datum3D(Standard_Transient):
	def __init__(self) -> None: ...
	def __init__(self, T: gp_Trsf) -> None: ...
	def Transformation(self) -> gp_Trsf: ...

class TopLoc_ItemLocation:
	def __init__(self, D: TopLoc_Datum3D, P: int) -> None: ...

class TopLoc_Location:
	def Divided(self, Other: TopLoc_Location) -> TopLoc_Location: ...
	def FirstDatum(self) -> TopLoc_Datum3D: ...
	def FirstPower(self) -> int: ...
	def HashCode(self, theUpperBound: int) -> int: ...
	def Identity(self) -> None: ...
	def Inverted(self) -> TopLoc_Location: ...
	def IsDifferent(self, Other: TopLoc_Location) -> bool: ...
	def IsEqual(self, Other: TopLoc_Location) -> bool: ...
	def IsIdentity(self) -> bool: ...
	def Multiplied(self, Other: TopLoc_Location) -> TopLoc_Location: ...
	def NextLocation(self) -> TopLoc_Location: ...
	def Powered(self, pwr: int) -> TopLoc_Location: ...
	def Predivided(self, Other: TopLoc_Location) -> TopLoc_Location: ...
	def __init__(self) -> None: ...
	def __init__(self, T: gp_Trsf) -> None: ...
	def __init__(self, D: TopLoc_Datum3D) -> None: ...
	def Transformation(self) -> gp_Trsf: ...

class TopLoc_SListNodeOfItemLocation(Standard_Transient):
	def Tail(self) -> TopLoc_SListOfItemLocation: ...
	def __init__(self, I: TopLoc_ItemLocation, aTail: TopLoc_SListOfItemLocation) -> None: ...
	def Value(self) -> TopLoc_ItemLocation: ...

class TopLoc_SListOfItemLocation:
	def Assign(self, Other: TopLoc_SListOfItemLocation) -> TopLoc_SListOfItemLocation: ...
	def Clear(self) -> None: ...
	def Construct(self, anItem: TopLoc_ItemLocation) -> None: ...
	def IsEmpty(self) -> bool: ...
	def More(self) -> bool: ...
	def Next(self) -> None: ...
	def Tail(self) -> TopLoc_SListOfItemLocation: ...
	def ToTail(self) -> None: ...
	def __init__(self) -> None: ...
	def __init__(self, anItem: TopLoc_ItemLocation, aTail: TopLoc_SListOfItemLocation) -> None: ...
	def __init__(self, Other: TopLoc_SListOfItemLocation) -> None: ...
	def __init__(self, theOther: TopLoc_SListOfItemLocation) -> None: ...
	def Value(self) -> TopLoc_ItemLocation: ...
