from typing import NewType, Optional

from OCC.Core.TNaming import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TDF import *
from OCC.Core.TopTools import *
from OCC.Core.TopLoc import *
from OCC.Core.TopoDS import *
from OCC.Core.gp import *
from OCC.Core.TColStd import *
from OCC.Core.TopAbs import *

TNaming_PtrAttribute = NewType('TNaming_PtrAttribute', TNaming_NamedShape)
TNaming_PtrNode = NewType('TNaming_PtrNode', TNaming_Node)
TNaming_PtrRefShape = NewType('TNaming_PtrRefShape', TNaming_RefShape)

class TNaming_Evolution:
	TNaming_PRIMITIVE: int = ...
	TNaming_GENERATED: int = ...
	TNaming_MODIFY: int = ...
	TNaming_DELETE: int = ...
	TNaming_REPLACE: int = ...
	TNaming_SELECTED: int = ...

class TNaming_NameType:
	TNaming_UNKNOWN: int = ...
	TNaming_IDENTITY: int = ...
	TNaming_MODIFUNTIL: int = ...
	TNaming_GENERATION: int = ...
	TNaming_INTERSECTION: int = ...
	TNaming_UNION: int = ...
	TNaming_SUBSTRACTION: int = ...
	TNaming_CONSTSHAPE: int = ...
	TNaming_FILTERBYNEIGHBOURGS: int = ...
	TNaming_ORIENTATION: int = ...
	TNaming_WIREIN: int = ...
	TNaming_SHELLIN: int = ...

class TNaming:
	@staticmethod
	def ChangeShapes(self, label: TDF_Label, M: TopTools_DataMapOfShapeShape) -> None: ...
	@staticmethod
	def Displace(self, label: TDF_Label, aLocation: TopLoc_Location, WithOld: Optional[bool]) -> None: ...
	@staticmethod
	def FindUniqueContext(self, S: TopoDS_Shape, Context: TopoDS_Shape) -> TopoDS_Shape: ...
	@staticmethod
	def FindUniqueContextSet(self, S: TopoDS_Shape, Context: TopoDS_Shape, Arr: TopTools_HArray1OfShape) -> TopoDS_Shape: ...
	@staticmethod
	def IDList(self, anIDList: TDF_IDList) -> None: ...
	@staticmethod
	def MakeShape(self, MS: TopTools_MapOfShape) -> TopoDS_Shape: ...
	@staticmethod
	def OuterShell(self, theSolid: TopoDS_Solid, theShell: TopoDS_Shell) -> bool: ...
	@staticmethod
	def OuterWire(self, theFace: TopoDS_Face, theWire: TopoDS_Wire) -> bool: ...
	@staticmethod
	def Replicate(self, NS: TNaming_NamedShape, T: gp_Trsf, L: TDF_Label) -> None: ...
	@staticmethod
	def Replicate(self, SH: TopoDS_Shape, T: gp_Trsf, L: TDF_Label) -> None: ...
	@staticmethod
	def Substitute(self, labelsource: TDF_Label, labelcible: TDF_Label, mapOldNew: TopTools_DataMapOfShapeShape) -> None: ...
	@staticmethod
	def SubstituteSShape(self, accesslabel: TDF_Label, From: TopoDS_Shape, To: TopoDS_Shape) -> bool: ...
	@staticmethod
	def Transform(self, label: TDF_Label, aTransformation: gp_Trsf) -> None: ...
	@staticmethod
	def Update(self, label: TDF_Label, mapOldNew: TopTools_DataMapOfShapeShape) -> None: ...

class TNaming_Builder:
	def Delete(self, oldShape: TopoDS_Shape) -> None: ...
	def Generated(self, newShape: TopoDS_Shape) -> None: ...
	def Generated(self, oldShape: TopoDS_Shape, newShape: TopoDS_Shape) -> None: ...
	def Modify(self, oldShape: TopoDS_Shape, newShape: TopoDS_Shape) -> None: ...
	def NamedShape(self) -> TNaming_NamedShape: ...
	def Select(self, aShape: TopoDS_Shape, inShape: TopoDS_Shape) -> None: ...
	def __init__(self, aLabel: TDF_Label) -> None: ...

class TNaming_CopyShape:
	@staticmethod
	def CopyTool(self, aShape: TopoDS_Shape, aMap: TColStd_IndexedDataMapOfTransientTransient, aResult: TopoDS_Shape) -> None: ...
	@staticmethod
	def Translate(self, aShape: TopoDS_Shape, aMap: TColStd_IndexedDataMapOfTransientTransient, aResult: TopoDS_Shape, TrTool: TNaming_TranslateTool) -> None: ...
	@staticmethod
	def Translate(self, L: TopLoc_Location, aMap: TColStd_IndexedDataMapOfTransientTransient) -> TopLoc_Location: ...

class TNaming_DeltaOnModification(TDF_DeltaOnModification):
	def Apply(self) -> None: ...
	def __init__(self, NS: TNaming_NamedShape) -> None: ...

class TNaming_DeltaOnRemoval(TDF_DeltaOnRemoval):
	def Apply(self) -> None: ...
	def __init__(self, NS: TNaming_NamedShape) -> None: ...

class TNaming_Identifier:
	def AncestorIdentification(self, Localizer: TNaming_Localizer, Context: TopoDS_Shape) -> None: ...
	def ArgIsFeature(self) -> bool: ...
	def Feature(self) -> TNaming_NamedShape: ...
	def FeatureArg(self) -> TNaming_NamedShape: ...
	def GeneratedIdentification(self, Localizer: TNaming_Localizer, NS: TNaming_NamedShape) -> None: ...
	def Identification(self, Localizer: TNaming_Localizer, NS: TNaming_NamedShape) -> None: ...
	def InitArgs(self) -> None: ...
	def IsDone(self) -> bool: ...
	def IsFeature(self) -> bool: ...
	def MoreArgs(self) -> bool: ...
	def NamedShapeOfGeneration(self) -> TNaming_NamedShape: ...
	def NextArg(self) -> None: ...
	def PrimitiveIdentification(self, Localizer: TNaming_Localizer, NS: TNaming_NamedShape) -> None: ...
	def ShapeArg(self) -> TopoDS_Shape: ...
	def ShapeContext(self) -> TopoDS_Shape: ...
	def __init__(self, Lab: TDF_Label, S: TopoDS_Shape, Context: TopoDS_Shape, Geom: bool) -> None: ...
	def __init__(self, Lab: TDF_Label, S: TopoDS_Shape, ContextNS: TNaming_NamedShape, Geom: bool) -> None: ...
	def Type(self) -> TNaming_NameType: ...

class TNaming_Iterator:
	def Evolution(self) -> TNaming_Evolution: ...
	def IsModification(self) -> bool: ...
	def More(self) -> bool: ...
	def NewShape(self) -> TopoDS_Shape: ...
	def Next(self) -> None: ...
	def OldShape(self) -> TopoDS_Shape: ...
	def __init__(self, anAtt: TNaming_NamedShape) -> None: ...
	def __init__(self, aLabel: TDF_Label) -> None: ...
	def __init__(self, aLabel: TDF_Label, aTrans: int) -> None: ...

class TNaming_IteratorOnShapesSet:
	def Init(self, S: TNaming_ShapesSet) -> None: ...
	def More(self) -> bool: ...
	def Next(self) -> None: ...
	def __init__(self) -> None: ...
	def __init__(self, S: TNaming_ShapesSet) -> None: ...
	def Value(self) -> TopoDS_Shape: ...

class TNaming_Localizer:
	def Ancestors(self, S: TopoDS_Shape, Type: TopAbs_ShapeEnum) -> TopTools_IndexedDataMapOfShapeListOfShape: ...
	def Backward(self, NS: TNaming_NamedShape, S: TopoDS_Shape, Primitives: TNaming_MapOfNamedShape, ValidShapes: TopTools_MapOfShape) -> None: ...
	def FindFeaturesInAncestors(self, S: TopoDS_Shape, In: TopoDS_Shape, AncInFeatures: TopTools_MapOfShape) -> None: ...
	@staticmethod
	def FindGenerator(self, NS: TNaming_NamedShape, S: TopoDS_Shape, theListOfGenerators: TopTools_ListOfShape) -> None: ...
	def FindNeighbourg(self, Cont: TopoDS_Shape, S: TopoDS_Shape, Neighbourg: TopTools_MapOfShape) -> None: ...
	@staticmethod
	def FindShapeContext(self, NS: TNaming_NamedShape, theS: TopoDS_Shape, theSC: TopoDS_Shape) -> None: ...
	def GoBack(self, S: TopoDS_Shape, Lab: TDF_Label, Evol: TNaming_Evolution, OldS: TopTools_ListOfShape, OldLab: TNaming_ListOfNamedShape) -> None: ...
	def Init(self, US: TNaming_UsedShapes, CurTrans: int) -> None: ...
	@staticmethod
	def IsNew(self, S: TopoDS_Shape, NS: TNaming_NamedShape) -> bool: ...
	def SubShapes(self, S: TopoDS_Shape, Type: TopAbs_ShapeEnum) -> TopTools_MapOfShape: ...
	def __init__(self) -> None: ...

class TNaming_Name:
	def Append(self, arg: TNaming_NamedShape) -> None: ...
	def Arguments(self) -> TNaming_ListOfNamedShape: ...
	def ContextLabel(self, theLab: TDF_Label) -> None: ...
	def ContextLabel(self) -> TDF_Label: ...
	def Index(self, I: int) -> None: ...
	def Index(self) -> int: ...
	def Orientation(self, theOrientation: TopAbs_Orientation) -> None: ...
	def Orientation(self) -> TopAbs_Orientation: ...
	def Paste(self, into: TNaming_Name, RT: TDF_RelocationTable) -> None: ...
	def Shape(self, theShape: TopoDS_Shape) -> None: ...
	def Shape(self) -> TopoDS_Shape: ...
	def ShapeType(self, aType: TopAbs_ShapeEnum) -> None: ...
	def ShapeType(self) -> TopAbs_ShapeEnum: ...
	def Solve(self, aLab: TDF_Label, Valid: TDF_LabelMap) -> bool: ...
	def StopNamedShape(self, arg: TNaming_NamedShape) -> None: ...
	def StopNamedShape(self) -> TNaming_NamedShape: ...
	def __init__(self) -> None: ...
	def Type(self, aType: TNaming_NameType) -> None: ...
	def Type(self) -> TNaming_NameType: ...

class TNaming_NamedShape(TDF_Attribute):
	def AfterUndo(self, anAttDelta: TDF_AttributeDelta, forceIt: Optional[bool]) -> bool: ...
	def BackupCopy(self) -> TDF_Attribute: ...
	def BeforeRemoval(self) -> None: ...
	def BeforeUndo(self, anAttDelta: TDF_AttributeDelta, forceIt: Optional[bool]) -> bool: ...
	def Clear(self) -> None: ...
	def DeltaOnModification(self, anOldAttribute: TDF_Attribute) -> TDF_DeltaOnModification: ...
	def DeltaOnModification(self, aDelta: TDF_DeltaOnModification) -> None: ...
	def DeltaOnRemoval(self) -> TDF_DeltaOnRemoval: ...
	def Evolution(self) -> TNaming_Evolution: ...
	def Get(self) -> TopoDS_Shape: ...
	@staticmethod
	def GetID(self) -> Standard_GUID: ...
	def ID(self) -> Standard_GUID: ...
	def IsEmpty(self) -> bool: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, intoAttribute: TDF_Attribute, aRelocTationable: TDF_RelocationTable) -> None: ...
	def References(self, aDataSet: TDF_DataSet) -> None: ...
	def Restore(self, anAttribute: TDF_Attribute) -> None: ...
	def SetVersion(self, version: int) -> None: ...
	def __init__(self) -> None: ...
	def Version(self) -> int: ...

class TNaming_Naming(TDF_Attribute):
	def ChangeName(self) -> TNaming_Name: ...
	@staticmethod
	def GetID(self) -> Standard_GUID: ...
	def GetName(self) -> TNaming_Name: ...
	def ID(self) -> Standard_GUID: ...
	@staticmethod
	def Insert(self, under: TDF_Label) -> TNaming_Naming: ...
	def IsDefined(self) -> bool: ...
	@staticmethod
	def Name(self, where: TDF_Label, Selection: TopoDS_Shape, Context: TopoDS_Shape, Geometry: Optional[bool], KeepOrientation: Optional[bool], BNproblem: Optional[bool]) -> TNaming_NamedShape: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, Into: TDF_Attribute, RT: TDF_RelocationTable) -> None: ...
	def References(self, aDataSet: TDF_DataSet) -> None: ...
	def Regenerate(self, scope: TDF_LabelMap) -> bool: ...
	def Restore(self, With: TDF_Attribute) -> None: ...
	def Solve(self, scope: TDF_LabelMap) -> bool: ...
	def __init__(self) -> None: ...

class TNaming_NamingTool:
	@staticmethod
	def BuildDescendants(self, NS: TNaming_NamedShape, Labels: TDF_LabelMap) -> None: ...
	@staticmethod
	def CurrentShape(self, Valid: TDF_LabelMap, Forbiden: TDF_LabelMap, NS: TNaming_NamedShape, MS: TopTools_IndexedMapOfShape) -> None: ...
	@staticmethod
	def CurrentShapeFromShape(self, Valid: TDF_LabelMap, Forbiden: TDF_LabelMap, Acces: TDF_Label, S: TopoDS_Shape, MS: TopTools_IndexedMapOfShape) -> None: ...

class TNaming_NewShapeIterator:
	def IsModification(self) -> bool: ...
	def Label(self) -> TDF_Label: ...
	def More(self) -> bool: ...
	def NamedShape(self) -> TNaming_NamedShape: ...
	def Next(self) -> None: ...
	def Shape(self) -> TopoDS_Shape: ...
	def __init__(self, aShape: TopoDS_Shape, Transaction: int, access: TDF_Label) -> None: ...
	def __init__(self, aShape: TopoDS_Shape, access: TDF_Label) -> None: ...
	def __init__(self, anIterator: TNaming_NewShapeIterator) -> None: ...
	def __init__(self, anIterator: TNaming_Iterator) -> None: ...

class TNaming_OldShapeIterator:
	def IsModification(self) -> bool: ...
	def Label(self) -> TDF_Label: ...
	def More(self) -> bool: ...
	def NamedShape(self) -> TNaming_NamedShape: ...
	def Next(self) -> None: ...
	def Shape(self) -> TopoDS_Shape: ...
	def __init__(self, aShape: TopoDS_Shape, Transaction: int, access: TDF_Label) -> None: ...
	def __init__(self, aShape: TopoDS_Shape, access: TDF_Label) -> None: ...
	def __init__(self, anIterator: TNaming_OldShapeIterator) -> None: ...
	def __init__(self, anIterator: TNaming_Iterator) -> None: ...

class TNaming_RefShape:
	def FirstUse(self, aPtr: TNaming_PtrNode) -> None: ...
	def FirstUse(self) -> TNaming_PtrNode: ...
	def Label(self) -> TDF_Label: ...
	def NamedShape(self) -> TNaming_NamedShape: ...
	def Shape(self, S: TopoDS_Shape) -> None: ...
	def Shape(self) -> TopoDS_Shape: ...
	def __init__(self) -> None: ...
	def __init__(self, S: TopoDS_Shape) -> None: ...

class TNaming_SameShapeIterator:
	def Label(self) -> TDF_Label: ...
	def More(self) -> bool: ...
	def Next(self) -> None: ...
	def __init__(self, aShape: TopoDS_Shape, access: TDF_Label) -> None: ...

class TNaming_Scope:
	def ChangeValid(self) -> TDF_LabelMap: ...
	def ClearValid(self) -> None: ...
	def CurrentShape(self, NS: TNaming_NamedShape) -> TopoDS_Shape: ...
	def GetValid(self) -> TDF_LabelMap: ...
	def IsValid(self, L: TDF_Label) -> bool: ...
	def __init__(self) -> None: ...
	def __init__(self, WithValid: bool) -> None: ...
	def __init__(self, valid: TDF_LabelMap) -> None: ...
	def Unvalid(self, L: TDF_Label) -> None: ...
	def UnvalidChildren(self, L: TDF_Label, withroot: Optional[bool]) -> None: ...
	def Valid(self, L: TDF_Label) -> None: ...
	def ValidChildren(self, L: TDF_Label, withroot: Optional[bool]) -> None: ...
	def WithValid(self) -> bool: ...
	def WithValid(self, mode: bool) -> None: ...

class TNaming_Selector:
	def Arguments(self, args: TDF_AttributeMap) -> None: ...
	@staticmethod
	def IsIdentified(self, access: TDF_Label, selection: TopoDS_Shape, NS: TNaming_NamedShape, Geometry: Optional[bool]) -> bool: ...
	def NamedShape(self) -> TNaming_NamedShape: ...
	def Select(self, Selection: TopoDS_Shape, Context: TopoDS_Shape, Geometry: Optional[bool], KeepOrientatation: Optional[bool]) -> bool: ...
	def Select(self, Selection: TopoDS_Shape, Geometry: Optional[bool], KeepOrientatation: Optional[bool]) -> bool: ...
	def Solve(self, Valid: TDF_LabelMap) -> bool: ...
	def __init__(self, aLabel: TDF_Label) -> None: ...

class TNaming_ShapesSet:
	def Add(self, S: TopoDS_Shape) -> bool: ...
	def Add(self, Shapes: TNaming_ShapesSet) -> None: ...
	def ChangeMap(self) -> TopTools_MapOfShape: ...
	def Clear(self) -> None: ...
	def Contains(self, S: TopoDS_Shape) -> bool: ...
	def Filter(self, Shapes: TNaming_ShapesSet) -> None: ...
	def IsEmpty(self) -> bool: ...
	def Map(self) -> TopTools_MapOfShape: ...
	def NbShapes(self) -> int: ...
	def Remove(self, S: TopoDS_Shape) -> bool: ...
	def Remove(self, Shapes: TNaming_ShapesSet) -> None: ...
	def __init__(self) -> None: ...
	def __init__(self, S: TopoDS_Shape, Type: Optional[TopAbs_ShapeEnum]) -> None: ...

class TNaming_Tool:
	@staticmethod
	def Collect(self, NS: TNaming_NamedShape, Labels: TNaming_MapOfNamedShape, OnlyModif: Optional[bool]) -> None: ...
	@staticmethod
	def CurrentNamedShape(self, NS: TNaming_NamedShape, Updated: TDF_LabelMap) -> TNaming_NamedShape: ...
	@staticmethod
	def CurrentNamedShape(self, NS: TNaming_NamedShape) -> TNaming_NamedShape: ...
	@staticmethod
	def CurrentShape(self, NS: TNaming_NamedShape) -> TopoDS_Shape: ...
	@staticmethod
	def CurrentShape(self, NS: TNaming_NamedShape, Updated: TDF_LabelMap) -> TopoDS_Shape: ...
	@staticmethod
	def FindShape(self, Valid: TDF_LabelMap, Forbiden: TDF_LabelMap, Arg: TNaming_NamedShape, S: TopoDS_Shape) -> None: ...
	@staticmethod
	def GeneratedShape(self, S: TopoDS_Shape, Generation: TNaming_NamedShape) -> TopoDS_Shape: ...
	@staticmethod
	def GetShape(self, NS: TNaming_NamedShape) -> TopoDS_Shape: ...
	@staticmethod
	def HasLabel(self, access: TDF_Label, aShape: TopoDS_Shape) -> bool: ...
	@staticmethod
	def InitialShape(self, aShape: TopoDS_Shape, anAcces: TDF_Label, Labels: TDF_LabelList) -> TopoDS_Shape: ...
	@staticmethod
	def Label(self, access: TDF_Label, aShape: TopoDS_Shape, TransDef: int) -> TDF_Label: ...
	@staticmethod
	def NamedShape(self, aShape: TopoDS_Shape, anAcces: TDF_Label) -> TNaming_NamedShape: ...
	@staticmethod
	def OriginalShape(self, NS: TNaming_NamedShape) -> TopoDS_Shape: ...
	@staticmethod
	def ValidUntil(self, access: TDF_Label, S: TopoDS_Shape) -> int: ...

class TNaming_TranslateTool(Standard_Transient):
	def Add(self, S1: TopoDS_Shape, S2: TopoDS_Shape) -> None: ...
	def MakeCompSolid(self, S: TopoDS_Shape) -> None: ...
	def MakeCompound(self, S: TopoDS_Shape) -> None: ...
	def MakeEdge(self, S: TopoDS_Shape) -> None: ...
	def MakeFace(self, S: TopoDS_Shape) -> None: ...
	def MakeShell(self, S: TopoDS_Shape) -> None: ...
	def MakeSolid(self, S: TopoDS_Shape) -> None: ...
	def MakeVertex(self, S: TopoDS_Shape) -> None: ...
	def MakeWire(self, S: TopoDS_Shape) -> None: ...
	def UpdateEdge(self, S1: TopoDS_Shape, S2: TopoDS_Shape, M: TColStd_IndexedDataMapOfTransientTransient) -> None: ...
	def UpdateFace(self, S1: TopoDS_Shape, S2: TopoDS_Shape, M: TColStd_IndexedDataMapOfTransientTransient) -> None: ...
	def UpdateShape(self, S1: TopoDS_Shape, S2: TopoDS_Shape) -> None: ...
	def UpdateVertex(self, S1: TopoDS_Shape, S2: TopoDS_Shape, M: TColStd_IndexedDataMapOfTransientTransient) -> None: ...

class TNaming_Translator:
	def Add(self, aShape: TopoDS_Shape) -> None: ...
	def Copied(self, aShape: TopoDS_Shape) -> TopoDS_Shape: ...
	def Copied(self) -> TopTools_DataMapOfShapeShape: ...
	def DumpMap(self, isWrite: Optional[bool]) -> None: ...
	def IsDone(self) -> bool: ...
	def Perform(self) -> None: ...
	def __init__(self) -> None: ...

class TNaming_UsedShapes(TDF_Attribute):
	def AfterUndo(self, anAttDelta: TDF_AttributeDelta, forceIt: Optional[bool]) -> bool: ...
	def BackupCopy(self) -> TDF_Attribute: ...
	def BeforeRemoval(self) -> None: ...
	def DeltaOnAddition(self) -> TDF_DeltaOnAddition: ...
	def DeltaOnRemoval(self) -> TDF_DeltaOnRemoval: ...
	def Destroy(self) -> None: ...
	@staticmethod
	def GetID(self) -> Standard_GUID: ...
	def ID(self) -> Standard_GUID: ...
	def Map(self) -> TNaming_DataMapOfShapePtrRefShape: ...
	def NewEmpty(self) -> TDF_Attribute: ...
	def Paste(self, intoAttribute: TDF_Attribute, aRelocTationable: TDF_RelocationTable) -> None: ...
	def References(self, aDataSet: TDF_DataSet) -> None: ...
	def Restore(self, anAttribute: TDF_Attribute) -> None: ...
