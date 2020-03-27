from typing import NewType, Optional

from OCC.Core.BOPAlgo import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TopoDS import *
from OCC.Core.TopTools import *
from OCC.Core.Message import *
from OCC.Core.IntTools import *
from OCC.Core.BOPDS import *
from OCC.Core.BRepTools import *
from OCC.Core.BOPTools import *
from OCC.Core.TopAbs import *

BOPAlgo_PArgumentAnalyzer = NewType('BOPAlgo_PArgumentAnalyzer', BOPAlgo_ArgumentAnalyzer)
BOPAlgo_PBOP = NewType('BOPAlgo_PBOP', BOPAlgo_BOP)
BOPAlgo_PBuilder = NewType('BOPAlgo_PBuilder', BOPAlgo_Builder)
BOPAlgo_PPaveFiller = NewType('BOPAlgo_PPaveFiller', BOPAlgo_PaveFiller)
BOPAlgo_PSection = NewType('BOPAlgo_PSection', BOPAlgo_Section)
BOPAlgo_PWireEdgeSet = NewType('BOPAlgo_PWireEdgeSet', BOPAlgo_WireEdgeSet)

class BOPAlgo_CheckStatus:
	BOPAlgo_CheckUnknown: int = ...
	BOPAlgo_BadType: int = ...
	BOPAlgo_SelfIntersect: int = ...
	BOPAlgo_TooSmallEdge: int = ...
	BOPAlgo_NonRecoverableFace: int = ...
	BOPAlgo_IncompatibilityOfVertex: int = ...
	BOPAlgo_IncompatibilityOfEdge: int = ...
	BOPAlgo_IncompatibilityOfFace: int = ...
	BOPAlgo_OperationAborted: int = ...
	BOPAlgo_GeomAbs_C0: int = ...
	BOPAlgo_InvalidCurveOnSurface: int = ...
	BOPAlgo_NotValid: int = ...

class BOPAlgo_Operation:
	BOPAlgo_COMMON: int = ...
	BOPAlgo_FUSE: int = ...
	BOPAlgo_CUT: int = ...
	BOPAlgo_CUT21: int = ...
	BOPAlgo_SECTION: int = ...
	BOPAlgo_UNKNOWN: int = ...

class BOPAlgo_GlueEnum:
	BOPAlgo_GlueOff: int = ...
	BOPAlgo_GlueShift: int = ...
	BOPAlgo_GlueFull: int = ...

class BOPAlgo_CheckResult:
	def __init__(self) -> None: ...
	def AddFaultyShape1(self, TheShape: TopoDS_Shape) -> None: ...
	def AddFaultyShape2(self, TheShape: TopoDS_Shape) -> None: ...
	def GetCheckStatus(self) -> BOPAlgo_CheckStatus: ...
	def GetFaultyShapes1(self) -> TopTools_ListOfShape: ...
	def GetFaultyShapes2(self) -> TopTools_ListOfShape: ...
	def GetMaxDistance1(self) -> float: ...
	def GetMaxDistance2(self) -> float: ...
	def GetMaxParameter1(self) -> float: ...
	def GetMaxParameter2(self) -> float: ...
	def GetShape1(self) -> TopoDS_Shape: ...
	def GetShape2(self) -> TopoDS_Shape: ...
	def SetCheckStatus(self, TheStatus: BOPAlgo_CheckStatus) -> None: ...
	def SetMaxDistance1(self, theDist: float) -> None: ...
	def SetMaxDistance2(self, theDist: float) -> None: ...
	def SetMaxParameter1(self, thePar: float) -> None: ...
	def SetMaxParameter2(self, thePar: float) -> None: ...
	def SetShape1(self, TheShape: TopoDS_Shape) -> None: ...
	def SetShape2(self, TheShape: TopoDS_Shape) -> None: ...

class BOPAlgo_Options:
	def __init__(self) -> None: ...
	def __init__(self, theAllocator: NCollection_BaseAllocator) -> None: ...
	def AddError(self, theAlert: Message_Alert) -> None: ...
	def AddWarning(self, theAlert: Message_Alert) -> None: ...
	def Allocator(self) -> NCollection_BaseAllocator: ...
	def Clear(self) -> None: ...
	def ClearWarnings(self) -> None: ...
	def FuzzyValue(self) -> float: ...
	@staticmethod
	def GetParallelMode(self) -> bool: ...
	def GetReport(self) -> Message_Report: ...
	def HasError(self, theType: Standard_Type) -> bool: ...
	def HasErrors(self) -> bool: ...
	def HasWarning(self, theType: Standard_Type) -> bool: ...
	def HasWarnings(self) -> bool: ...
	def RunParallel(self) -> bool: ...
	def SetFuzzyValue(self, theFuzz: float) -> None: ...
	@staticmethod
	def SetParallelMode(self, theNewMode: bool) -> None: ...
	def SetProgressIndicator(self, theObj: Message_ProgressIndicator) -> None: ...
	def SetRunParallel(self, theFlag: bool) -> None: ...
	def SetUseOBB(self, theUseOBB: bool) -> None: ...
	def UseOBB(self) -> bool: ...

class BOPAlgo_SectionAttribute:
	def __init__(self) -> None: ...
	def __init__(self, theAproximation: bool, thePCurveOnS1: bool, thePCurveOnS2: bool) -> None: ...
	def Approximation(self, theApprox: bool) -> None: ...
	def Approximation(self) -> bool: ...
	def PCurveOnS1(self, thePCurveOnS1: bool) -> None: ...
	def PCurveOnS1(self) -> bool: ...
	def PCurveOnS2(self, thePCurveOnS2: bool) -> None: ...
	def PCurveOnS2(self) -> bool: ...

class BOPAlgo_Tools:
	@staticmethod
	def ClassifyFaces(self, theFaces: TopTools_ListOfShape, theSolids: TopTools_ListOfShape, theRunParallel: bool, theContext: IntTools_Context, theInParts: TopTools_IndexedDataMapOfShapeListOfShape, theShapeBoxMap: Optional[TopTools_DataMapOfShapeBox], theSolidsIF: Optional[TopTools_DataMapOfShapeListOfShape]) -> None: ...
	@staticmethod
	def ComputeToleranceOfCB(self, theCB: BOPDS_CommonBlock, theDS: BOPDS_PDS, theContext: IntTools_Context) -> float: ...
	@staticmethod
	def EdgesToWires(self, theEdges: TopoDS_Shape, theWires: TopoDS_Shape, theShared: Optional[bool], theAngTol: Optional[float]) -> int: ...
	@staticmethod
	def FillInternals(self, theSolids: TopTools_ListOfShape, theParts: TopTools_ListOfShape, theImages: TopTools_DataMapOfShapeListOfShape, theContext: IntTools_Context) -> None: ...
	@staticmethod
	def IntersectVertices(self, theVertices: TopTools_IndexedDataMapOfShapeReal, theFuzzyValue: float, theChains: TopTools_ListOfListOfShape) -> None: ...
	@staticmethod
	def PerformCommonBlocks(self, theMBlocks: BOPDS_IndexedDataMapOfPaveBlockListOfPaveBlock, theAllocator: NCollection_BaseAllocator, theDS: BOPDS_PDS, theContext: Optional[IntTools_Context]) -> None: ...
	@staticmethod
	def PerformCommonBlocks(self, theMBlocks: BOPDS_IndexedDataMapOfPaveBlockListOfInteger, theAllocator: NCollection_BaseAllocator, pDS: BOPDS_PDS, theContext: Optional[IntTools_Context]) -> None: ...
	@staticmethod
	def TreatCompound(self, theS: TopoDS_Shape, theMFence: TopTools_MapOfShape, theLS: TopTools_ListOfShape) -> None: ...
	@staticmethod
	def WiresToFaces(self, theWires: TopoDS_Shape, theFaces: TopoDS_Shape, theAngTol: Optional[float]) -> bool: ...

class BOPAlgo_WireEdgeSet:
	def __init__(self) -> None: ...
	def __init__(self, theAllocator: NCollection_BaseAllocator) -> None: ...
	def AddShape(self, sS: TopoDS_Shape) -> None: ...
	def AddStartElement(self, sS: TopoDS_Shape) -> None: ...
	def Clear(self) -> None: ...
	def Face(self) -> TopoDS_Face: ...
	def SetFace(self, aF: TopoDS_Face) -> None: ...
	def Shapes(self) -> TopTools_ListOfShape: ...
	def StartElements(self) -> TopTools_ListOfShape: ...

class BOPAlgo_Algo(BOPAlgo_Options):
	def Perform(self) -> None: ...

class BOPAlgo_MakeConnected(BOPAlgo_Options):
	def __init__(self) -> None: ...
	def AddArgument(self, theS: TopoDS_Shape) -> None: ...
	def Arguments(self) -> TopTools_ListOfShape: ...
	def Clear(self) -> None: ...
	def ClearRepetitions(self) -> None: ...
	def GetModified(self, theS: TopoDS_Shape) -> TopTools_ListOfShape: ...
	def GetOrigins(self, theS: TopoDS_Shape) -> TopTools_ListOfShape: ...
	def History(self) -> BRepTools_History: ...
	def MaterialsOnNegativeSide(self, theS: TopoDS_Shape) -> TopTools_ListOfShape: ...
	def MaterialsOnPositiveSide(self, theS: TopoDS_Shape) -> TopTools_ListOfShape: ...
	def Perform(self) -> None: ...
	def PeriodicShape(self) -> TopoDS_Shape: ...
	def PeriodicityTool(self) -> BOPAlgo_MakePeriodic: ...
	def RepeatShape(self, theDirectionID: int, theTimes: int) -> None: ...
	def SetArguments(self, theArgs: TopTools_ListOfShape) -> None: ...
	def Shape(self) -> TopoDS_Shape: ...

class BOPAlgo_MakePeriodic(BOPAlgo_Options):
	def __init__(self) -> None: ...
	def Clear(self) -> None: ...
	def ClearRepetitions(self) -> None: ...
	def GetTwins(self, theS: TopoDS_Shape) -> TopTools_ListOfShape: ...
	def History(self) -> BRepTools_History: ...
	def IsInputTrimmed(self, theDirectionID: int) -> bool: ...
	def IsInputXTrimmed(self) -> bool: ...
	def IsInputYTrimmed(self) -> bool: ...
	def IsInputZTrimmed(self) -> bool: ...
	def IsPeriodic(self, theDirectionID: int) -> bool: ...
	def IsXPeriodic(self) -> bool: ...
	def IsYPeriodic(self) -> bool: ...
	def IsZPeriodic(self) -> bool: ...
	def MakePeriodic(self, theDirectionID: int, theIsPeriodic: bool, thePeriod: Optional[float]) -> None: ...
	def MakeXPeriodic(self, theIsPeriodic: bool, thePeriod: Optional[float]) -> None: ...
	def MakeYPeriodic(self, theIsPeriodic: bool, thePeriod: Optional[float]) -> None: ...
	def MakeZPeriodic(self, theIsPeriodic: bool, thePeriod: Optional[float]) -> None: ...
	def Perform(self) -> None: ...
	def Period(self, theDirectionID: int) -> float: ...
	def PeriodFirst(self, theDirectionID: int) -> float: ...
	def PeriodicityParameters(self) -> False: ...
	def RepeatShape(self, theDirectionID: int, theTimes: int) -> TopoDS_Shape: ...
	def RepeatedShape(self) -> TopoDS_Shape: ...
	def SetShape(self, theShape: TopoDS_Shape) -> None: ...
	def SetTrimmed(self, theDirectionID: int, theIsTrimmed: bool, theFirst: Optional[float]) -> None: ...
	def SetXTrimmed(self, theIsTrimmed: bool, theFirst: Optional[bool]) -> None: ...
	def SetYTrimmed(self, theIsTrimmed: bool, theFirst: Optional[bool]) -> None: ...
	def SetZTrimmed(self, theIsTrimmed: bool, theFirst: Optional[bool]) -> None: ...
	def Shape(self) -> TopoDS_Shape: ...
	@staticmethod
	def ToDirectionID(self, theDirectionID: int) -> int: ...
	def XPeriod(self) -> float: ...
	def XPeriodFirst(self) -> float: ...
	def XRepeat(self, theTimes: int) -> TopoDS_Shape: ...
	def YPeriod(self) -> float: ...
	def YPeriodFirst(self) -> float: ...
	def YRepeat(self, theTimes: int) -> TopoDS_Shape: ...
	def ZPeriod(self) -> float: ...
	def ZPeriodFirst(self) -> float: ...
	def ZRepeat(self, theTimes: int) -> TopoDS_Shape: ...

class BOPAlgo_ArgumentAnalyzer(BOPAlgo_Algo):
	def __init__(self) -> None: ...
	def GetArgumentTypeMode(self) -> bool: ...
	def SetArgumentTypeMode(self, value: bool) -> None: ...
	def GetContinuityMode(self) -> bool: ...
	def SetContinuityMode(self, value: bool) -> None: ...
	def GetCurveOnSurfaceMode(self) -> bool: ...
	def SetCurveOnSurfaceMode(self, value: bool) -> None: ...
	def GetCheckResult(self) -> BOPAlgo_ListOfCheckResult: ...
	def GetShape1(self) -> TopoDS_Shape: ...
	def GetShape2(self) -> TopoDS_Shape: ...
	def HasFaulty(self) -> bool: ...
	def GetMergeEdgeMode(self) -> bool: ...
	def SetMergeEdgeMode(self, value: bool) -> None: ...
	def GetMergeVertexMode(self) -> bool: ...
	def SetMergeVertexMode(self, value: bool) -> None: ...
	def OperationType(self) -> BOPAlgo_Operation: ...
	def Perform(self) -> None: ...
	def GetRebuildFaceMode(self) -> bool: ...
	def SetRebuildFaceMode(self, value: bool) -> None: ...
	def GetSelfInterMode(self) -> bool: ...
	def SetSelfInterMode(self, value: bool) -> None: ...
	def SetShape1(self, TheShape: TopoDS_Shape) -> None: ...
	def SetShape2(self, TheShape: TopoDS_Shape) -> None: ...
	def GetSmallEdgeMode(self) -> bool: ...
	def SetSmallEdgeMode(self, value: bool) -> None: ...
	def GetStopOnFirstFaulty(self) -> bool: ...
	def SetStopOnFirstFaulty(self, value: bool) -> None: ...
	def GetTangentMode(self) -> bool: ...
	def SetTangentMode(self, value: bool) -> None: ...

class BOPAlgo_BuilderArea(BOPAlgo_Algo):
	def Areas(self) -> TopTools_ListOfShape: ...
	def IsAvoidInternalShapes(self) -> bool: ...
	def Loops(self) -> TopTools_ListOfShape: ...
	def SetAvoidInternalShapes(self, theAvoidInternal: bool) -> None: ...
	def SetContext(self, theContext: IntTools_Context) -> None: ...
	def SetShapes(self, theLS: TopTools_ListOfShape) -> None: ...
	def Shapes(self) -> TopTools_ListOfShape: ...

class BOPAlgo_BuilderShape(BOPAlgo_Algo):
	def Generated(self, theS: TopoDS_Shape) -> TopTools_ListOfShape: ...
	def HasDeleted(self) -> bool: ...
	def HasGenerated(self) -> bool: ...
	def HasHistory(self) -> bool: ...
	def HasModified(self) -> bool: ...
	def History(self) -> BRepTools_History: ...
	def IsDeleted(self, theS: TopoDS_Shape) -> bool: ...
	def Modified(self, theS: TopoDS_Shape) -> TopTools_ListOfShape: ...
	def SetToFillHistory(self, theHistFlag: bool) -> None: ...
	def Shape(self) -> TopoDS_Shape: ...

class BOPAlgo_PaveFiller(BOPAlgo_Algo):
	def __init__(self) -> None: ...
	def __init__(self, theAllocator: NCollection_BaseAllocator) -> None: ...
	def AddArgument(self, theShape: TopoDS_Shape) -> None: ...
	def Arguments(self) -> TopTools_ListOfShape: ...
	def Context(self) -> IntTools_Context: ...
	def DS(self) -> BOPDS_DS: ...
	def Glue(self) -> BOPAlgo_GlueEnum: ...
	def IsAvoidBuildPCurve(self) -> bool: ...
	def NonDestructive(self) -> bool: ...
	def PDS(self) -> BOPDS_PDS: ...
	def Perform(self) -> None: ...
	def SetArguments(self, theLS: TopTools_ListOfShape) -> None: ...
	def SetAvoidBuildPCurve(self, theValue: bool) -> None: ...
	def SetGlue(self, theGlue: BOPAlgo_GlueEnum) -> None: ...
	def SetNonDestructive(self, theFlag: bool) -> None: ...
	def SetSectionAttribute(self, theSecAttr: BOPAlgo_SectionAttribute) -> None: ...

class BOPAlgo_ShellSplitter(BOPAlgo_Algo):
	def __init__(self) -> None: ...
	def __init__(self, theAllocator: NCollection_BaseAllocator) -> None: ...
	def AddStartElement(self, theS: TopoDS_Shape) -> None: ...
	def Perform(self) -> None: ...
	def Shells(self) -> TopTools_ListOfShape: ...
	@staticmethod
	def SplitBlock(self, theCB: BOPTools_ConnexityBlock) -> None: ...
	def StartElements(self) -> TopTools_ListOfShape: ...

class BOPAlgo_WireSplitter(BOPAlgo_Algo):
	def __init__(self) -> None: ...
	def __init__(self, theAllocator: NCollection_BaseAllocator) -> None: ...
	def Context(self) -> IntTools_Context: ...
	@staticmethod
	def MakeWire(self, theLE: TopTools_ListOfShape, theW: TopoDS_Wire) -> None: ...
	def Perform(self) -> None: ...
	def SetContext(self, theContext: IntTools_Context) -> None: ...
	def SetWES(self, theWES: BOPAlgo_WireEdgeSet) -> None: ...
	@staticmethod
	def SplitBlock(self, theF: TopoDS_Face, theCB: BOPTools_ConnexityBlock, theContext: IntTools_Context) -> None: ...
	def WES(self) -> BOPAlgo_WireEdgeSet: ...

class BOPAlgo_Builder(BOPAlgo_BuilderShape):
	def __init__(self) -> None: ...
	def __init__(self, theAllocator: NCollection_BaseAllocator) -> None: ...
	def AddArgument(self, theShape: TopoDS_Shape) -> None: ...
	def Arguments(self) -> TopTools_ListOfShape: ...
	def BuildBOP(self, theObjects: TopTools_ListOfShape, theObjState: TopAbs_State, theTools: TopTools_ListOfShape, theToolsState: TopAbs_State, theReport: Optional[Message_Report]) -> None: ...
	def BuildBOP(self, theObjects: TopTools_ListOfShape, theTools: TopTools_ListOfShape, theOperation: BOPAlgo_Operation, theReport: Optional[Message_Report]) -> None: ...
	def CheckInverted(self) -> bool: ...
	def Clear(self) -> None: ...
	def Context(self) -> IntTools_Context: ...
	def Glue(self) -> BOPAlgo_GlueEnum: ...
	def Images(self) -> TopTools_DataMapOfShapeListOfShape: ...
	def NonDestructive(self) -> bool: ...
	def Origins(self) -> TopTools_DataMapOfShapeListOfShape: ...
	def PDS(self) -> BOPDS_PDS: ...
	def PPaveFiller(self) -> BOPAlgo_PPaveFiller: ...
	def Perform(self) -> None: ...
	def PerformWithFiller(self, theFiller: BOPAlgo_PaveFiller) -> None: ...
	def SetArguments(self, theLS: TopTools_ListOfShape) -> None: ...
	def SetCheckInverted(self, theCheck: bool) -> None: ...
	def SetGlue(self, theGlue: BOPAlgo_GlueEnum) -> None: ...
	def SetNonDestructive(self, theFlag: bool) -> None: ...
	def ShapesSD(self) -> TopTools_DataMapOfShapeShape: ...

class BOPAlgo_BuilderFace(BOPAlgo_BuilderArea):
	def __init__(self) -> None: ...
	def __init__(self, theAllocator: NCollection_BaseAllocator) -> None: ...
	def Face(self) -> TopoDS_Face: ...
	def Orientation(self) -> TopAbs_Orientation: ...
	def Perform(self) -> None: ...
	def SetFace(self, theFace: TopoDS_Face) -> None: ...

class BOPAlgo_BuilderSolid(BOPAlgo_BuilderArea):
	def __init__(self) -> None: ...
	def __init__(self, theAllocator: NCollection_BaseAllocator) -> None: ...
	def GetBoxesMap(self) -> TopTools_DataMapOfShapeBox: ...
	def Perform(self) -> None: ...

class BOPAlgo_CheckerSI(BOPAlgo_PaveFiller):
	def __init__(self) -> None: ...
	def Perform(self) -> None: ...
	def SetLevelOfCheck(self, theLevel: int) -> None: ...

class BOPAlgo_RemoveFeatures(BOPAlgo_BuilderShape):
	def __init__(self) -> None: ...
	def AddFaceToRemove(self, theFace: TopoDS_Shape) -> None: ...
	def AddFacesToRemove(self, theFaces: TopTools_ListOfShape) -> None: ...
	def Clear(self) -> None: ...
	def FacesToRemove(self) -> TopTools_ListOfShape: ...
	def InputShape(self) -> TopoDS_Shape: ...
	def Perform(self) -> None: ...
	def SetShape(self, theShape: TopoDS_Shape) -> None: ...

class BOPAlgo_CellsBuilder(BOPAlgo_Builder):
	def __init__(self) -> None: ...
	def __init__(self, theAllocator: NCollection_BaseAllocator) -> None: ...
	def AddAllToResult(self, theMaterial: Optional[int], theUpdate: Optional[bool]) -> None: ...
	def AddToResult(self, theLSToTake: TopTools_ListOfShape, theLSToAvoid: TopTools_ListOfShape, theMaterial: Optional[int], theUpdate: Optional[bool]) -> None: ...
	def Clear(self) -> None: ...
	def GetAllParts(self) -> TopoDS_Shape: ...
	def MakeContainers(self) -> None: ...
	def RemoveAllFromResult(self) -> None: ...
	def RemoveFromResult(self, theLSToTake: TopTools_ListOfShape, theLSToAvoid: TopTools_ListOfShape) -> None: ...
	def RemoveInternalBoundaries(self) -> None: ...

class BOPAlgo_MakerVolume(BOPAlgo_Builder):
	def __init__(self) -> None: ...
	def __init__(self, theAllocator: NCollection_BaseAllocator) -> None: ...
	def Box(self) -> TopoDS_Solid: ...
	def Clear(self) -> None: ...
	def Faces(self) -> TopTools_ListOfShape: ...
	def IsAvoidInternalShapes(self) -> bool: ...
	def IsIntersect(self) -> bool: ...
	def Perform(self) -> None: ...
	def SetAvoidInternalShapes(self, theAvoidInternal: bool) -> None: ...
	def SetIntersect(self, bIntersect: bool) -> None: ...

class BOPAlgo_Section(BOPAlgo_Builder):
	def __init__(self) -> None: ...
	def __init__(self, theAllocator: NCollection_BaseAllocator) -> None: ...

class BOPAlgo_ToolsProvider(BOPAlgo_Builder):
	def __init__(self) -> None: ...
	def __init__(self, theAllocator: NCollection_BaseAllocator) -> None: ...
	def AddTool(self, theShape: TopoDS_Shape) -> None: ...
	def Clear(self) -> None: ...
	def SetTools(self, theShapes: TopTools_ListOfShape) -> None: ...
	def Tools(self) -> TopTools_ListOfShape: ...

class BOPAlgo_BOP(BOPAlgo_ToolsProvider):
	def __init__(self) -> None: ...
	def __init__(self, theAllocator: NCollection_BaseAllocator) -> None: ...
	def Clear(self) -> None: ...
	def Operation(self) -> BOPAlgo_Operation: ...
	def Perform(self) -> None: ...
	def SetOperation(self, theOperation: BOPAlgo_Operation) -> None: ...

class BOPAlgo_Splitter(BOPAlgo_ToolsProvider):
	def __init__(self) -> None: ...
	def __init__(self, theAllocator: NCollection_BaseAllocator) -> None: ...
	def Perform(self) -> None: ...