from typing import NewType, Optional

from OCC.Core.BRepMesh import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.IMeshTools import *
from OCC.Core.gp import *
from OCC.Core.TopAbs import *
from OCC.Core.TopoDS import *
from OCC.Core.TCollection import *
from OCC.Core.TColStd import *
from OCC.Core.BRepAdaptor import *
from OCC.Core.GeomAbs import *
from OCC.Core.Adaptor3d import *
from OCC.Core.Poly import *
from OCC.Core.Bnd import *
from OCC.Core.TopLoc import *
from OCC.Core.Geom2d import *
from OCC.Core.Geom import *
from OCC.Core.IMeshData import *


class BRepMesh_FactoryError:
	BRepMesh_FE_NOERROR: int = ...
	BRepMesh_FE_LIBRARYNOTFOUND: int = ...
	BRepMesh_FE_FUNCTIONNOTFOUND: int = ...
	BRepMesh_FE_CANNOTCREATEALGO: int = ...

class BRepMesh_DegreeOfFreedom:
	BRepMesh_Free: int = ...
	BRepMesh_InVolume: int = ...
	BRepMesh_OnSurface: int = ...
	BRepMesh_OnCurve: int = ...
	BRepMesh_Fixed: int = ...
	BRepMesh_Frontier: int = ...
	BRepMesh_Deleted: int = ...

class BRepMesh_BaseMeshAlgo(IMeshTools_MeshAlgo):
	pass

class BRepMesh_Circle:
	def __init__(self) -> None: ...
	def __init__(self, theLocation: gp_XY, theRadius: float) -> None: ...
	def Location(self) -> gp_XY: ...
	def Radius(self) -> float: ...
	def SetLocation(self, theLocation: gp_XY) -> None: ...
	def SetRadius(self, theRadius: float) -> None: ...

class BRepMesh_CircleInspector(NCollection_CellFilter_InspectorXY):
	def __init__(self, theTolerance: float, theReservedSize: int, theAllocator: NCollection_IncAllocator) -> None: ...
	def Bind(self, theIndex: int, theCircle: BRepMesh_Circle) -> None: ...
	def Circle(self, theIndex: int) -> BRepMesh_Circle: ...
	def Circles(self) -> False: ...
	def GetShotCircles(self) -> False: ...
	def Inspect(self, theTargetIndex: int) -> NCollection_CellFilter_Action: ...
	@staticmethod
	def IsEqual(self, theIndex: int, theTargetIndex: int) -> bool: ...
	def SetPoint(self, thePoint: gp_XY) -> None: ...

class BRepMesh_CircleTool:
	def __init__(self, theAllocator: NCollection_IncAllocator) -> None: ...
	def __init__(self, theReservedSize: int, theAllocator: NCollection_IncAllocator) -> None: ...
	def Bind(self, theIndex: int, theCircle: gp_Circ2d) -> None: ...
	def Bind(self, theIndex: int, thePoint1: gp_XY, thePoint2: gp_XY, thePoint3: gp_XY) -> bool: ...
	def Delete(self, theIndex: int) -> None: ...
	def IsEmpty(self) -> bool: ...
	@staticmethod
	def MakeCircle(self, thePoint1: gp_XY, thePoint2: gp_XY, thePoint3: gp_XY, theLocation: gp_XY, theRadius: float) -> bool: ...
	def MocBind(self, theIndex: int) -> None: ...
	def Select(self, thePoint: gp_XY) -> False: ...
	def SetCellSize(self, theSize: float) -> None: ...
	def SetCellSize(self, theSizeX: float, theSizeY: float) -> None: ...
	def SetMinMaxSize(self, theMin: gp_XY, theMax: gp_XY) -> None: ...

class BRepMesh_Classifier(Standard_Transient):
	def __init__(self) -> None: ...
	def Perform(self, thePoint: gp_Pnt2d) -> TopAbs_State: ...

class BRepMesh_Context(IMeshTools_Context):
	def __init__(self) -> None: ...

class BRepMesh_CurveTessellator(IMeshTools_CurveTessellator):
	def PointsNb(self) -> int: ...
	def Value(self, theIndex: int, thePoint: gp_Pnt, theParameter: float) -> bool: ...

class BRepMesh_DataStructureOfDelaun(Standard_Transient):
	def __init__(self, theAllocator: NCollection_IncAllocator, theReservedNodeSize: Optional[int]) -> None: ...
	def AddElement(self, theElement: BRepMesh_Triangle) -> int: ...
	def AddLink(self, theLink: BRepMesh_Edge) -> int: ...
	def AddNode(self, theNode: BRepMesh_Vertex, isForceAdd: Optional[bool]) -> int: ...
	def Allocator(self) -> NCollection_IncAllocator: ...
	def ClearDeleted(self) -> None: ...
	def ClearDomain(self) -> None: ...
	def Data(self) -> BRepMesh_VertexTool: ...
	def Dump(self, theFileNameStr: str) -> None: ...
	def ElementNodes(self, theElement: BRepMesh_Triangle, _list: List[int]) -> None: ...
	def ElementsConnectedTo(self, theLinkIndex: int) -> BRepMesh_PairOfIndex: ...
	def ElementsOfDomain(self) -> False: ...
	def GetElement(self, theIndex: int) -> BRepMesh_Triangle: ...
	def GetLink(self, theIndex: int) -> BRepMesh_Edge: ...
	def GetNode(self, theIndex: int) -> BRepMesh_Vertex: ...
	def IndexOf(self, theNode: BRepMesh_Vertex) -> int: ...
	def IndexOf(self, theLink: BRepMesh_Edge) -> int: ...
	def LinksConnectedTo(self, theIndex: int) -> False: ...
	def LinksOfDomain(self) -> False: ...
	def NbElements(self) -> int: ...
	def NbLinks(self) -> int: ...
	def NbNodes(self) -> int: ...
	def RemoveElement(self, theIndex: int) -> None: ...
	def RemoveLink(self, theIndex: int, isForce: Optional[bool]) -> None: ...
	def RemoveNode(self, theIndex: int, isForce: Optional[bool]) -> None: ...
	def SubstituteElement(self, theIndex: int, theNewElement: BRepMesh_Triangle) -> bool: ...
	def SubstituteLink(self, theIndex: int, theNewLink: BRepMesh_Edge) -> bool: ...
	def SubstituteNode(self, theIndex: int, theNewNode: BRepMesh_Vertex) -> bool: ...

class BRepMesh_Deflection(Standard_Transient):
	@staticmethod
	def ComputeAbsoluteDeflection(self, theShape: TopoDS_Shape, theRelativeDeflection: float, theMaxShapeSize: float) -> float: ...

class BRepMesh_Delaun:
	def __init__(self, theOldMesh: BRepMesh_DataStructureOfDelaun, theCellsCountU: int, theCellsCountV: int, isFillCircles: bool) -> None: ...
	def Circles(self) -> BRepMesh_CircleTool: ...
	def Contains(self, theTriangleId: int, theVertex: BRepMesh_Vertex, theSqTolerance: float, theEdgeOn: int) -> bool: ...
	def GetEdge(self, theIndex: int) -> BRepMesh_Edge: ...
	def GetTriangle(self, theIndex: int) -> BRepMesh_Triangle: ...
	def GetVertex(self, theIndex: int) -> BRepMesh_Vertex: ...
	def InitCirclesTool(self, theCellsCountU: int, theCellsCountV: int) -> None: ...
	def RemoveVertex(self, theVertex: BRepMesh_Vertex) -> None: ...
	def Result(self) -> BRepMesh_DataStructureOfDelaun: ...
	def UseEdge(self, theEdge: int) -> bool: ...

class BRepMesh_DiscretFactory:
	def DefaultName(self) -> TCollection_AsciiString: ...
	def Discret(self, theShape: TopoDS_Shape, theLinDeflection: float, theAngDeflection: float) -> BRepMesh_DiscretRoot: ...
	def ErrorStatus(self) -> BRepMesh_FactoryError: ...
	def FunctionName(self) -> TCollection_AsciiString: ...
	@staticmethod
	def Get(self) -> BRepMesh_DiscretFactory: ...
	def Names(self) -> TColStd_MapOfAsciiString: ...
	def SetDefault(self, theName: TCollection_AsciiString, theFuncName: Optional[TCollection_AsciiString]) -> bool: ...
	def SetDefaultName(self, theName: TCollection_AsciiString) -> bool: ...
	def SetFunctionName(self, theFuncName: TCollection_AsciiString) -> bool: ...

class BRepMesh_DiscretRoot(Standard_Transient):
	def IsDone(self) -> bool: ...
	def Perform(self) -> None: ...
	def SetShape(self, theShape: TopoDS_Shape) -> None: ...
	def Shape(self) -> TopoDS_Shape: ...

class BRepMesh_EdgeDiscret(IMeshTools_ModelAlgo):
	def __init__(self) -> None: ...

class BRepMesh_FaceChecker(Standard_Transient):
	def Perform(self) -> bool: ...

class BRepMesh_FaceDiscret(IMeshTools_ModelAlgo):
	def __init__(self, theAlgoFactory: IMeshTools_MeshAlgoFactory) -> None: ...

class BRepMesh_GeomTool:
	def __init__(self, theCurve: BRepAdaptor_Curve, theFirstParam: float, theLastParam: float, theLinDeflection: float, theAngDeflection: float, theMinPointsNb: Optional[int], theMinSize: Optional[float]) -> None: ...
	def __init__(self, theSurface: BRepAdaptor_HSurface, theIsoType: GeomAbs_IsoType, theParamIso: float, theFirstParam: float, theLastParam: float, theLinDeflection: float, theAngDeflection: float, theMinPointsNb: Optional[int], theMinSize: Optional[float]) -> None: ...
	def AddPoint(self, thePoint: gp_Pnt, theParam: float, theIsReplace: Optional[bool]) -> int: ...
	@staticmethod
	def CellsCount(self, theSurface: Adaptor3d_HSurface, theVerticesNb: int, theDeflection: float, theRangeSplitter: BRepMesh_DefaultRangeSplitter) -> False: ...
	def NbPoints(self) -> int: ...
	@staticmethod
	def SquareDeflectionOfSegment(self, theFirstPoint: gp_Pnt, theLastPoint: gp_Pnt, theMidPoint: gp_Pnt) -> float: ...
	def Value(self, theIndex: int, theIsoParam: float, theParam: float, thePoint: gp_Pnt, theUV: gp_Pnt2d) -> bool: ...
	def Value(self, theIndex: int, theSurface: BRepAdaptor_HSurface, theParam: float, thePoint: gp_Pnt, theUV: gp_Pnt2d) -> bool: ...

class BRepMesh_MeshAlgoFactory(IMeshTools_MeshAlgoFactory):
	def __init__(self) -> None: ...
	def GetAlgo(self, theSurfaceType: GeomAbs_SurfaceType, theParameters: IMeshTools_Parameters) -> IMeshTools_MeshAlgo: ...

class BRepMesh_MeshTool(Standard_Transient):
	def __init__(self, theStructure: BRepMesh_DataStructureOfDelaun) -> None: ...
	def AddAndLegalizeTriangle(self, thePoint1: int, thePoint2: int, thePoint3: int) -> None: ...
	def AddLink(self, theFirstNode: int, theLastNode: int, theLinkIndex: int, theLinkOri: bool) -> None: ...
	def AddTriangle(self, thePoint1: int, thePoint2: int, thePoint3: int, _list: List[int]) -> None: ...
	def CleanFrontierLinks(self) -> None: ...
	def EraseFreeLinks(self) -> None: ...
	def EraseItemsConnectedTo(self, theNodeIndex: int) -> None: ...
	def GetStructure(self) -> BRepMesh_DataStructureOfDelaun: ...
	def Legalize(self, theLinkIndex: int) -> None: ...

class BRepMesh_ModelBuilder(IMeshTools_ModelBuilder):
	def __init__(self) -> None: ...

class BRepMesh_ModelHealer(IMeshTools_ModelAlgo):
	def __init__(self) -> None: ...

class BRepMesh_ModelPostProcessor(IMeshTools_ModelAlgo):
	def __init__(self) -> None: ...

class BRepMesh_ModelPreProcessor(IMeshTools_ModelAlgo):
	def __init__(self) -> None: ...

class BRepMesh_OrientedEdge:
	def __init__(self) -> None: ...
	def __init__(self, theFirstNode: int, theLastNode: int) -> None: ...
	def FirstNode(self) -> int: ...
	def HashCode(self, theUpperBound: int) -> int: ...
	def IsEqual(self, theOther: BRepMesh_OrientedEdge) -> bool: ...
	def LastNode(self) -> int: ...

class BRepMesh_PairOfIndex:
	def __init__(self) -> None: ...
	def Append(self, theIndex: int) -> None: ...
	def Clear(self) -> None: ...
	def Extent(self) -> int: ...
	def FirstIndex(self) -> int: ...
	def Index(self, thePairPos: int) -> int: ...
	def IsEmpty(self) -> bool: ...
	def LastIndex(self) -> int: ...
	def Prepend(self, theIndex: int) -> None: ...
	def RemoveIndex(self, thePairPos: int) -> None: ...
	def SetIndex(self, thePairPos: int, theIndex: int) -> None: ...

class BRepMesh_SelectorOfDataStructureOfDelaun(Standard_Transient):
	def __init__(self) -> None: ...
	def __init__(self, theMesh: BRepMesh_DataStructureOfDelaun) -> None: ...
	def AddNeighbours(self) -> None: ...
	def Elements(self) -> False: ...
	def FrontierLinks(self) -> False: ...
	def Initialize(self, theMesh: BRepMesh_DataStructureOfDelaun) -> None: ...
	def Links(self) -> False: ...
	def NeighboursByEdgeOf(self, theElement: BRepMesh_Triangle) -> None: ...
	def NeighboursOf(self, theNode: BRepMesh_Vertex) -> None: ...
	def NeighboursOf(self, theLink: BRepMesh_Edge) -> None: ...
	def NeighboursOf(self, theElement: BRepMesh_Triangle) -> None: ...
	def NeighboursOfElement(self, theElementIndex: int) -> None: ...
	def NeighboursOfLink(self, theLinkIndex: int) -> None: ...
	def NeighboursOfNode(self, theNodeIndex: int) -> None: ...
	def Nodes(self) -> False: ...

class BRepMesh_ShapeTool(Standard_Transient):
	@staticmethod
	def AddInFace(self, theFace: TopoDS_Face, theTriangulation: Poly_Triangulation) -> None: ...
	@staticmethod
	def BoxMaxDimension(self, theBox: Bnd_Box, theMaxDimension: float) -> None: ...
	@staticmethod
	def MaxFaceTolerance(self, theFace: TopoDS_Face) -> float: ...
	@staticmethod
	def NullifyEdge(self, theEdge: TopoDS_Edge, theTriangulation: Poly_Triangulation, theLocation: TopLoc_Location) -> None: ...
	@staticmethod
	def NullifyEdge(self, theEdge: TopoDS_Edge, theLocation: TopLoc_Location) -> None: ...
	@staticmethod
	def NullifyFace(self, theFace: TopoDS_Face) -> None: ...
	@staticmethod
	def Range(self, theEdge: TopoDS_Edge, theFace: TopoDS_Face, thePCurve: Geom2d_Curve, theFirstParam: float, theLastParam: float, isConsiderOrientation: Optional[bool]) -> bool: ...
	@staticmethod
	def Range(self, theEdge: TopoDS_Edge, theCurve: Geom_Curve, theFirstParam: float, theLastParam: float, isConsiderOrientation: Optional[bool]) -> bool: ...
	@staticmethod
	def UVPoints(self, theEdge: TopoDS_Edge, theFace: TopoDS_Face, theFirstPoint2d: gp_Pnt2d, theLastPoint2d: gp_Pnt2d, isConsiderOrientation: Optional[bool]) -> bool: ...
	@staticmethod
	def UpdateEdge(self, theEdge: TopoDS_Edge, thePolygon: Poly_PolygonOnTriangulation, theTriangulation: Poly_Triangulation, theLocation: TopLoc_Location) -> None: ...
	@staticmethod
	def UpdateEdge(self, theEdge: TopoDS_Edge, thePolygon: Poly_Polygon3D) -> None: ...
	@staticmethod
	def UpdateEdge(self, theEdge: TopoDS_Edge, thePolygon1: Poly_PolygonOnTriangulation, thePolygon2: Poly_PolygonOnTriangulation, theTriangulation: Poly_Triangulation, theLocation: TopLoc_Location) -> None: ...
	@staticmethod
	def UseLocation(self, thePnt: gp_Pnt, theLoc: TopLoc_Location) -> gp_Pnt: ...

class BRepMesh_ShapeVisitor(IMeshTools_ShapeVisitor):
	def __init__(self, theModel: IMeshData_Model) -> None: ...
	def Visit(self, theFace: TopoDS_Face) -> None: ...
	def Visit(self, theEdge: TopoDS_Edge) -> None: ...

class BRepMesh_Triangle:
	def __init__(self) -> None: ...
	def __init__(self, _list: List[int], _list: List[bool], theMovability: BRepMesh_DegreeOfFreedom) -> None: ...
	def Edges(self, _list: List[int], _list: List[bool]) -> None: ...
	def HashCode(self, theUpperBound: int) -> int: ...
	def Initialize(self, _list: List[int], _list: List[bool], theMovability: BRepMesh_DegreeOfFreedom) -> None: ...
	def IsEqual(self, theOther: BRepMesh_Triangle) -> bool: ...
	def Movability(self) -> BRepMesh_DegreeOfFreedom: ...
	def SetMovability(self, theMovability: BRepMesh_DegreeOfFreedom) -> None: ...

class BRepMesh_Vertex:
	def __init__(self) -> None: ...
	def __init__(self, theUV: gp_XY, theLocation3d: int, theMovability: BRepMesh_DegreeOfFreedom) -> None: ...
	def __init__(self, theU: float, theV: float, theMovability: BRepMesh_DegreeOfFreedom) -> None: ...
	def ChangeCoord(self) -> gp_XY: ...
	def Coord(self) -> gp_XY: ...
	def HashCode(self, theUpperBound: int) -> int: ...
	def Initialize(self, theUV: gp_XY, theLocation3d: int, theMovability: BRepMesh_DegreeOfFreedom) -> None: ...
	def IsEqual(self, theOther: BRepMesh_Vertex) -> bool: ...
	def Location3d(self) -> int: ...
	def Movability(self) -> BRepMesh_DegreeOfFreedom: ...
	def SetMovability(self, theMovability: BRepMesh_DegreeOfFreedom) -> None: ...

class BRepMesh_VertexInspector(NCollection_CellFilter_InspectorXY):
	def __init__(self, theAllocator: NCollection_IncAllocator) -> None: ...
	def Add(self, theVertex: BRepMesh_Vertex) -> int: ...
	def Clear(self) -> None: ...
	def Delete(self, theIndex: int) -> None: ...
	def GetCoincidentPoint(self) -> int: ...
	def GetListOfDelPoints(self) -> False: ...
	def GetVertex(self, theIndex: int) -> BRepMesh_Vertex: ...
	def Inspect(self, theTargetIndex: int) -> NCollection_CellFilter_Action: ...
	@staticmethod
	def IsEqual(self, theIndex: int, theTargetIndex: int) -> bool: ...
	def NbVertices(self) -> int: ...
	def SetPoint(self, thePoint: gp_XY) -> None: ...
	def SetTolerance(self, theTolerance: float) -> None: ...
	def SetTolerance(self, theToleranceX: float, theToleranceY: float) -> None: ...

class BRepMesh_VertexTool(Standard_Transient):
	def __init__(self, theAllocator: NCollection_IncAllocator) -> None: ...
	def Add(self, theVertex: BRepMesh_Vertex, isForceAdd: bool) -> int: ...
	def DeleteVertex(self, theIndex: int) -> None: ...
	def Extent(self) -> int: ...
	def FindIndex(self, theVertex: BRepMesh_Vertex) -> int: ...
	def FindKey(self, theIndex: int) -> BRepMesh_Vertex: ...
	def GetListOfDelNodes(self) -> False: ...
	def GetTolerance(self, theToleranceX: float, theToleranceY: float) -> None: ...
	def IsEmpty(self) -> bool: ...
	def RemoveLast(self) -> None: ...
	def SetCellSize(self, theSize: float) -> None: ...
	def SetCellSize(self, theSizeX: float, theSizeY: float) -> None: ...
	def SetTolerance(self, theTolerance: float) -> None: ...
	def SetTolerance(self, theToleranceX: float, theToleranceY: float) -> None: ...
	def Substitute(self, theIndex: int, theVertex: BRepMesh_Vertex) -> None: ...

class BRepMesh_Edge(BRepMesh_OrientedEdge):
	def __init__(self) -> None: ...
	def __init__(self, theFirstNode: int, theLastNode: int, theMovability: BRepMesh_DegreeOfFreedom) -> None: ...
	def IsEqual(self, theOther: BRepMesh_Edge) -> bool: ...
	def IsSameOrientation(self, theOther: BRepMesh_Edge) -> bool: ...
	def Movability(self) -> BRepMesh_DegreeOfFreedom: ...
	def SetMovability(self, theMovability: BRepMesh_DegreeOfFreedom) -> None: ...

class BRepMesh_IncrementalMesh(BRepMesh_DiscretRoot):
	def __init__(self) -> None: ...
	def __init__(self, theShape: TopoDS_Shape, theLinDeflection: float, isRelative: Optional[bool], theAngDeflection: Optional[float], isInParallel: Optional[bool]) -> None: ...
	def __init__(self, theShape: TopoDS_Shape, theParameters: IMeshTools_Parameters) -> None: ...
	def ChangeParameters(self) -> IMeshTools_Parameters: ...
	@staticmethod
	def Discret(self, theShape: TopoDS_Shape, theLinDeflection: float, theAngDeflection: float, theAlgo: BRepMesh_DiscretRoot) -> int: ...
	def GetStatusFlags(self) -> int: ...
	def IsModified(self) -> bool: ...
	@staticmethod
	def IsParallelDefault(self) -> bool: ...
	def Parameters(self) -> IMeshTools_Parameters: ...
	def Perform(self) -> None: ...
	def Perform(self, theContext: IMeshTools_Context) -> None: ...
	@staticmethod
	def SetParallelDefault(self, isInParallel: bool) -> None: ...

class BRepMesh_DelaunayBaseMeshAlgo(BRepMesh_ConstrainedBaseMeshAlgo):
	def __init__(self) -> None: ...
