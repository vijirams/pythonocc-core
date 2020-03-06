/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/
%define TOPTRANSDOCSTRING
"TopTrans module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_toptrans.html"
%enddef
%module (package="OCC.Core", docstring=TOPTRANSDOCSTRING) TopTrans


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<TopTrans_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TopAbs_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import TopAbs.i
/* public enums */
/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(TopTrans_Array2OfOrientation) NCollection_Array2<TopAbs_Orientation>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Array2<TopAbs_Orientation> TopTrans_Array2OfOrientation;
/* end typedefs declaration */

/*********************************
* class TopTrans_CurveTransition *
*********************************/
class TopTrans_CurveTransition {
	public:
		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Add a curve element to the boundary. if or is reversed the curve is before the intersection, else if or is forward the curv is after the intersection and if or is internal the intersection is in the middle of the curv.

	:param Tole:
	:type Tole: float
	:param Tang:
	:type Tang: gp_Dir
	:param Norm:
	:type Norm: gp_Dir
	:param Curv:
	:type Curv: float
	:param S:
	:type S: TopAbs_Orientation
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None
") Compare;
		void Compare(const Standard_Real Tole, const gp_Dir & Tang, const gp_Dir & Norm, const Standard_Real Curv, const TopAbs_Orientation S, const TopAbs_Orientation Or);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Initialize a transition with the local description of a curve.

	:param Tgt:
	:type Tgt: gp_Dir
	:param Norm:
	:type Norm: gp_Dir
	:param Curv:
	:type Curv: float
	:rtype: None
") Reset;
		void Reset(const gp_Dir & Tgt, const gp_Dir & Norm, const Standard_Real Curv);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Initialize a transition with the local description of a straigth line.

	:param Tgt:
	:type Tgt: gp_Dir
	:rtype: None
") Reset;
		void Reset(const gp_Dir & Tgt);

		/****************** StateAfter ******************/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "Returns the state of the curve after the intersection, this is the position relative to the boundary of a point very close to the intersection on the positive side of the tangent.

	:rtype: TopAbs_State
") StateAfter;
		TopAbs_State StateAfter();

		/****************** StateBefore ******************/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "Returns the state of the curve before the intersection, this is the position relative to the boundary of a point very close to the intersection on the negative side of the tangent.

	:rtype: TopAbs_State
") StateBefore;
		TopAbs_State StateBefore();

		/****************** TopTrans_CurveTransition ******************/
		%feature("compactdefaultargs") TopTrans_CurveTransition;
		%feature("autodoc", "Create an empty curve transition.

	:rtype: None
") TopTrans_CurveTransition;
		 TopTrans_CurveTransition();

};


%extend TopTrans_CurveTransition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TopTrans_SurfaceTransition *
***********************************/
class TopTrans_SurfaceTransition {
	public:
		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Add a face element to the boundary. //! - s defines topological orientation for the face : s forward means: along the intersection curve on the reference surface, transition states while crossing the face are out,in. s reversed means states are in,out. s internal means states are in,in. //! - o defines curve's position on face : o forward means the face is before the intersection o reversed means the face is after o internal means the curve intersection is in the face. prequesitory : norm oriented outside 'geometric matter'.

	:param Tole:
	:type Tole: float
	:param Norm:
	:type Norm: gp_Dir
	:param MaxD:
	:type MaxD: gp_Dir
	:param MinD:
	:type MinD: gp_Dir
	:param MaxCurv:
	:type MaxCurv: float
	:param MinCurv:
	:type MinCurv: float
	:param S:
	:type S: TopAbs_Orientation
	:param O:
	:type O: TopAbs_Orientation
	:rtype: None
") Compare;
		void Compare(const Standard_Real Tole, const gp_Dir & Norm, const gp_Dir & MaxD, const gp_Dir & MinD, const Standard_Real MaxCurv, const Standard_Real MinCurv, const TopAbs_Orientation S, const TopAbs_Orientation O);

		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Add a plane or a cylindric face to the boundary.

	:param Tole:
	:type Tole: float
	:param Norm:
	:type Norm: gp_Dir
	:param S:
	:type S: TopAbs_Orientation
	:param O:
	:type O: TopAbs_Orientation
	:rtype: None
") Compare;
		void Compare(const Standard_Real Tole, const gp_Dir & Norm, const TopAbs_Orientation S, const TopAbs_Orientation O);

		/****************** GetAfter ******************/
		%feature("compactdefaultargs") GetAfter;
		%feature("autodoc", "	:param Tran:
	:type Tran: TopAbs_Orientation
	:rtype: TopAbs_State
") GetAfter;
		static TopAbs_State GetAfter(const TopAbs_Orientation Tran);

		/****************** GetBefore ******************/
		%feature("compactdefaultargs") GetBefore;
		%feature("autodoc", "	:param Tran:
	:type Tran: TopAbs_Orientation
	:rtype: TopAbs_State
") GetBefore;
		static TopAbs_State GetBefore(const TopAbs_Orientation Tran);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Initialize a surface transition with the local description of the intersection curve and of the reference surface. prequesitory : norm oriented outside 'geometric matter'.

	:param Tgt:
	:type Tgt: gp_Dir
	:param Norm:
	:type Norm: gp_Dir
	:param MaxD:
	:type MaxD: gp_Dir
	:param MinD:
	:type MinD: gp_Dir
	:param MaxCurv:
	:type MaxCurv: float
	:param MinCurv:
	:type MinCurv: float
	:rtype: None
") Reset;
		void Reset(const gp_Dir & Tgt, const gp_Dir & Norm, const gp_Dir & MaxD, const gp_Dir & MinD, const Standard_Real MaxCurv, const Standard_Real MinCurv);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "Initialize a surface transition with the local description of a straight line.

	:param Tgt:
	:type Tgt: gp_Dir
	:param Norm:
	:type Norm: gp_Dir
	:rtype: None
") Reset;
		void Reset(const gp_Dir & Tgt, const gp_Dir & Norm);

		/****************** StateAfter ******************/
		%feature("compactdefaultargs") StateAfter;
		%feature("autodoc", "Returns the state of the reference surface after interference, this is the position relative to the surface of a point very close to the intersection on the positive side of the tangent.

	:rtype: TopAbs_State
") StateAfter;
		TopAbs_State StateAfter();

		/****************** StateBefore ******************/
		%feature("compactdefaultargs") StateBefore;
		%feature("autodoc", "Returns the state of the reference surface before the interference, this is the position relative to the surface of a point very close to the intersection on the negative side of the tangent.

	:rtype: TopAbs_State
") StateBefore;
		TopAbs_State StateBefore();

		/****************** TopTrans_SurfaceTransition ******************/
		%feature("compactdefaultargs") TopTrans_SurfaceTransition;
		%feature("autodoc", "Create an empty surface transition.

	:rtype: None
") TopTrans_SurfaceTransition;
		 TopTrans_SurfaceTransition();

};


%extend TopTrans_SurfaceTransition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
