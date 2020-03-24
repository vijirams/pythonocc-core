from typing import NewType, Optional

from OCC.Core.IGESToBRep import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.IGESData import *
from OCC.Core.TColStd import *
from OCC.Core.TopoDS import *
from OCC.Core.Transfer import *
from OCC.Core.Interface import *
from OCC.Core.Message import *
from OCC.Core.Geom import *
from OCC.Core.gp import *
from OCC.Core.ShapeExtend import *
from OCC.Core.Geom2d import *


class IGESToBRep:
	@staticmethod
	def AlgoContainer(self) -> IGESToBRep_AlgoContainer: ...
	@staticmethod
	def IGESCurveToSequenceOfIGESCurve(self, curve: IGESData_IGESEntity, sequence: TColStd_HSequenceOfTransient) -> int: ...
	@staticmethod
	def Init(self) -> None: ...
	@staticmethod
	def IsBRepEntity(self, start: IGESData_IGESEntity) -> bool: ...
	@staticmethod
	def IsBasicCurve(self, start: IGESData_IGESEntity) -> bool: ...
	@staticmethod
	def IsBasicSurface(self, start: IGESData_IGESEntity) -> bool: ...
	@staticmethod
	def IsCurveAndSurface(self, start: IGESData_IGESEntity) -> bool: ...
	@staticmethod
	def IsTopoCurve(self, start: IGESData_IGESEntity) -> bool: ...
	@staticmethod
	def IsTopoSurface(self, start: IGESData_IGESEntity) -> bool: ...
	@staticmethod
	def SetAlgoContainer(self, aContainer: IGESToBRep_AlgoContainer) -> None: ...
	@staticmethod
	def TransferPCurve(self, fromedge: TopoDS_Edge, toedge: TopoDS_Edge, face: TopoDS_Face) -> bool: ...

class IGESToBRep_Actor(Transfer_ActorOfTransientProcess):
	def GetContinuity(self) -> int: ...
	def __init__(self) -> None: ...
	def Recognize(self, start: Standard_Transient) -> bool: ...
	def SetContinuity(self, continuity: Optional[int]) -> None: ...
	def SetModel(self, model: Interface_InterfaceModel) -> None: ...
	def Transfer(self, start: Standard_Transient, TP: Transfer_TransientProcess) -> Transfer_Binder: ...
	def UsedTolerance(self) -> float: ...

class IGESToBRep_AlgoContainer(Standard_Transient):
	def __init__(self) -> None: ...
	def SetToolContainer(self, TC: IGESToBRep_ToolContainer) -> None: ...
	def ToolContainer(self) -> IGESToBRep_ToolContainer: ...

class IGESToBRep_CurveAndSurface:
	def AddShapeResult(self, start: IGESData_IGESEntity, result: TopoDS_Shape) -> None: ...
	def GetContinuity(self) -> int: ...
	def GetEpsCoeff(self) -> float: ...
	def GetEpsGeom(self) -> float: ...
	def GetEpsilon(self) -> float: ...
	def GetMaxTol(self) -> float: ...
	def GetMinTol(self) -> float: ...
	def GetModeApprox(self) -> bool: ...
	def GetModeTransfer(self) -> bool: ...
	def GetModel(self) -> IGESData_IGESModel: ...
	def GetOptimized(self) -> bool: ...
	def GetShapeResult(self, start: IGESData_IGESEntity) -> TopoDS_Shape: ...
	def GetShapeResult(self, start: IGESData_IGESEntity, num: int) -> TopoDS_Shape: ...
	def GetSurfaceCurve(self) -> int: ...
	def GetTransferProcess(self) -> Transfer_TransientProcess: ...
	def GetUVResolution(self) -> float: ...
	def GetUnitFactor(self) -> float: ...
	def HasShapeResult(self, start: IGESData_IGESEntity) -> bool: ...
	def __init__(self) -> None: ...
	def __init__(self, CS: IGESToBRep_CurveAndSurface) -> None: ...
	def __init__(self, eps: float, epsGeom: float, epsCoeff: float, mode: bool, modeapprox: bool, optimized: bool) -> None: ...
	def Init(self) -> None: ...
	def NbShapeResult(self, start: IGESData_IGESEntity) -> int: ...
	def SendFail(self, start: IGESData_IGESEntity, amsg: Message_Msg) -> None: ...
	def SendMsg(self, start: IGESData_IGESEntity, amsg: Message_Msg) -> None: ...
	def SendWarning(self, start: IGESData_IGESEntity, amsg: Message_Msg) -> None: ...
	def SetContinuity(self, continuity: int) -> None: ...
	def SetEpsCoeff(self, eps: float) -> None: ...
	def SetEpsGeom(self, eps: float) -> None: ...
	def SetEpsilon(self, eps: float) -> None: ...
	def SetMaxTol(self, maxtol: float) -> None: ...
	def SetMinTol(self, mintol: float) -> None: ...
	def SetModeApprox(self, mode: bool) -> None: ...
	def SetModeTransfer(self, mode: bool) -> None: ...
	def SetModel(self, model: IGESData_IGESModel) -> None: ...
	def SetOptimized(self, optimized: bool) -> None: ...
	def SetShapeResult(self, start: IGESData_IGESEntity, result: TopoDS_Shape) -> None: ...
	def SetSurface(self, theSurface: Geom_Surface) -> None: ...
	def SetSurfaceCurve(self, ival: int) -> None: ...
	def SetTransferProcess(self, TP: Transfer_TransientProcess) -> None: ...
	def Surface(self) -> Geom_Surface: ...
	def TransferCurveAndSurface(self, start: IGESData_IGESEntity) -> TopoDS_Shape: ...
	def TransferGeometry(self, start: IGESData_IGESEntity) -> TopoDS_Shape: ...
	def UpdateMinMaxTol(self) -> None: ...

class IGESToBRep_IGESBoundary(Standard_Transient):
	def Check(self, result: bool, checkclosure: bool, okCurve3d: bool, okCurve2d: bool) -> None: ...
	def __init__(self) -> None: ...
	def __init__(self, CS: IGESToBRep_CurveAndSurface) -> None: ...
	def Init(self, CS: IGESToBRep_CurveAndSurface, entity: IGESData_IGESEntity, face: TopoDS_Face, trans: gp_Trsf2d, uFact: float, filepreference: int) -> None: ...
	def Transfer(self, okCurve: bool, okCurve3d: bool, okCurve2d: bool, curve3d: IGESData_IGESEntity, toreverse3d: bool, curves2d: IGESData_HArray1OfIGESEntity, number: int) -> bool: ...
	def Transfer(self, okCurve: bool, okCurve3d: bool, okCurve2d: bool, curve3d: ShapeExtend_WireData, curves2d: IGESData_HArray1OfIGESEntity, toreverse2d: bool, number: int, lsewd: ShapeExtend_WireData) -> bool: ...
	def WireData(self) -> ShapeExtend_WireData: ...
	def WireData2d(self) -> ShapeExtend_WireData: ...
	def WireData3d(self) -> ShapeExtend_WireData: ...

class IGESToBRep_Reader:
	def Actor(self) -> IGESToBRep_Actor: ...
	def Check(self, withprint: bool) -> bool: ...
	def Clear(self) -> None: ...
	def __init__(self) -> None: ...
	def IsDone(self) -> bool: ...
	def LoadFile(self, filename: str) -> int: ...
	def Model(self) -> IGESData_IGESModel: ...
	def NbShapes(self) -> int: ...
	def OneShape(self) -> TopoDS_Shape: ...
	def SetModel(self, model: IGESData_IGESModel) -> None: ...
	def SetTransientProcess(self, TP: Transfer_TransientProcess) -> None: ...
	def Shape(self, num: Optional[int]) -> TopoDS_Shape: ...
	def Transfer(self, num: int) -> bool: ...
	def TransferRoots(self, onlyvisible: Optional[bool]) -> None: ...
	def TransientProcess(self) -> Transfer_TransientProcess: ...
	def UsedTolerance(self) -> float: ...

class IGESToBRep_ToolContainer(Standard_Transient):
	def IGESBoundary(self) -> IGESToBRep_IGESBoundary: ...
	def __init__(self) -> None: ...

class IGESToBRep_BRepEntity(IGESToBRep_CurveAndSurface):
	def __init__(self) -> None: ...
	def __init__(self, CS: IGESToBRep_CurveAndSurface) -> None: ...
	def __init__(self, eps: float, epsGeom: float, epsCoeff: float, mode: bool, modeapprox: bool, optimized: bool) -> None: ...
	def TransferBRepEntity(self, start: IGESData_IGESEntity) -> TopoDS_Shape: ...

class IGESToBRep_BasicCurve(IGESToBRep_CurveAndSurface):
	def __init__(self) -> None: ...
	def __init__(self, CS: IGESToBRep_CurveAndSurface) -> None: ...
	def __init__(self, eps: float, epsGeom: float, epsCoeff: float, mode: bool, modeapprox: bool, optimized: bool) -> None: ...
	def Transfer2dBasicCurve(self, start: IGESData_IGESEntity) -> Geom2d_Curve: ...
	def TransferBasicCurve(self, start: IGESData_IGESEntity) -> Geom_Curve: ...

class IGESToBRep_BasicSurface(IGESToBRep_CurveAndSurface):
	def __init__(self) -> None: ...
	def __init__(self, CS: IGESToBRep_CurveAndSurface) -> None: ...
	def __init__(self, eps: float, epsGeom: float, epsCoeff: float, mode: bool, modeapprox: bool, optimized: bool) -> None: ...
	def TransferBasicSurface(self, start: IGESData_IGESEntity) -> Geom_Surface: ...

class IGESToBRep_TopoCurve(IGESToBRep_CurveAndSurface):
	def Approx2dBSplineCurve(self, start: Geom2d_BSplineCurve) -> None: ...
	def ApproxBSplineCurve(self, start: Geom_BSplineCurve) -> None: ...
	def BadCase(self) -> bool: ...
	def Curve(self, num: Optional[int]) -> Geom_Curve: ...
	def Curve2d(self, num: Optional[int]) -> Geom2d_Curve: ...
	def __init__(self) -> None: ...
	def __init__(self, CS: IGESToBRep_CurveAndSurface) -> None: ...
	def __init__(self, CS: IGESToBRep_TopoCurve) -> None: ...
	def __init__(self, eps: float, epsGeom: float, epsCoeff: float, mode: bool, modeapprox: bool, optimized: bool) -> None: ...
	def NbCurves(self) -> int: ...
	def NbCurves2d(self) -> int: ...
	def SetBadCase(self, value: bool) -> None: ...
	def Transfer2dTopoBasicCurve(self, start: IGESData_IGESEntity, face: TopoDS_Face, trans: gp_Trsf2d, uFact: float) -> TopoDS_Shape: ...
	def Transfer2dTopoCurve(self, start: IGESData_IGESEntity, face: TopoDS_Face, trans: gp_Trsf2d, uFact: float) -> TopoDS_Shape: ...
	def TransferTopoBasicCurve(self, start: IGESData_IGESEntity) -> TopoDS_Shape: ...
	def TransferTopoCurve(self, start: IGESData_IGESEntity) -> TopoDS_Shape: ...

class IGESToBRep_TopoSurface(IGESToBRep_CurveAndSurface):
	def __init__(self) -> None: ...
	def __init__(self, CS: IGESToBRep_CurveAndSurface) -> None: ...
	def __init__(self, eps: float, epsGeom: float, epsCoeff: float, mode: bool, modeapprox: bool, optimized: bool) -> None: ...
	def ParamSurface(self, start: IGESData_IGESEntity, trans: gp_Trsf2d, uFact: float) -> TopoDS_Shape: ...
	def TransferTopoBasicSurface(self, start: IGESData_IGESEntity) -> TopoDS_Shape: ...
	def TransferTopoSurface(self, start: IGESData_IGESEntity) -> TopoDS_Shape: ...
