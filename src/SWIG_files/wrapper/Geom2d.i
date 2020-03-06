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
%define GEOM2DDOCSTRING
"Geom2d module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_geom2d.html"
%enddef
%module (package="OCC.Core", docstring=GEOM2DDOCSTRING) Geom2d


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
#include<Geom2d_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
%import GeomAbs.i
%import TColgp.i
%import TColStd.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(Geom2d_Geometry)
%wrap_handle(Geom2d_Transformation)
%wrap_handle(Geom2d_AxisPlacement)
%wrap_handle(Geom2d_Curve)
%wrap_handle(Geom2d_Point)
%wrap_handle(Geom2d_Vector)
%wrap_handle(Geom2d_BoundedCurve)
%wrap_handle(Geom2d_CartesianPoint)
%wrap_handle(Geom2d_Conic)
%wrap_handle(Geom2d_Direction)
%wrap_handle(Geom2d_Line)
%wrap_handle(Geom2d_OffsetCurve)
%wrap_handle(Geom2d_VectorWithMagnitude)
%wrap_handle(Geom2d_BSplineCurve)
%wrap_handle(Geom2d_BezierCurve)
%wrap_handle(Geom2d_Circle)
%wrap_handle(Geom2d_Ellipse)
%wrap_handle(Geom2d_Hyperbola)
%wrap_handle(Geom2d_Parabola)
%wrap_handle(Geom2d_TrimmedCurve)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/************************
* class Geom2d_Geometry *
************************/
%nodefaultctor Geom2d_Geometry;
class Geom2d_Geometry : public Standard_Transient {
	public:
		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: opencascade::handle<Geom2d_Geometry>
") Copy;
		virtual opencascade::handle<Geom2d_Geometry> Copy();

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "Performs the symmetrical transformation of a geometry with respect to the point p which is the center of the symmetry and assigns the result to this geometric object.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Mirror;
		void Mirror(const gp_Pnt2d & P);

		/****************** Mirror ******************/
		%feature("compactdefaultargs") Mirror;
		%feature("autodoc", "Performs the symmetrical transformation of a geometry with respect to an axis placement which is the axis of the symmetry.

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") Mirror;
		void Mirror(const gp_Ax2d & A);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: opencascade::handle<Geom2d_Geometry>
") Mirrored;
		opencascade::handle<Geom2d_Geometry> Mirrored(const gp_Pnt2d & P);

		/****************** Mirrored ******************/
		%feature("compactdefaultargs") Mirrored;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax2d
	:rtype: opencascade::handle<Geom2d_Geometry>
") Mirrored;
		opencascade::handle<Geom2d_Geometry> Mirrored(const gp_Ax2d & A);

		/****************** Rotate ******************/
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "Rotates a geometry. p is the center of the rotation. ang is the angular value of the rotation in radians.

	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None
") Rotate;
		void Rotate(const gp_Pnt2d & P, const Standard_Real Ang);

		/****************** Rotated ******************/
		%feature("compactdefaultargs") Rotated;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: opencascade::handle<Geom2d_Geometry>
") Rotated;
		opencascade::handle<Geom2d_Geometry> Rotated(const gp_Pnt2d & P, const Standard_Real Ang);

		/****************** Scale ******************/
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "Scales a geometry. s is the scaling value.

	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None
") Scale;
		void Scale(const gp_Pnt2d & P, const Standard_Real S);

		/****************** Scaled ******************/
		%feature("compactdefaultargs") Scaled;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: opencascade::handle<Geom2d_Geometry>
") Scaled;
		opencascade::handle<Geom2d_Geometry> Scaled(const gp_Pnt2d & P, const Standard_Real S);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Transformation of a geometric object. this tansformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations. (see class transformation of the package geom2d). the following transformations have the same properties as the previous ones but they don't modified the object itself. a copy of the object is returned.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		virtual void Transform(const gp_Trsf2d & T);

		/****************** Transformed ******************/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf2d
	:rtype: opencascade::handle<Geom2d_Geometry>
") Transformed;
		opencascade::handle<Geom2d_Geometry> Transformed(const gp_Trsf2d & T);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Translates a geometry. v is the vector of the tanslation.

	:param V:
	:type V: gp_Vec2d
	:rtype: None
") Translate;
		void Translate(const gp_Vec2d & V);

		/****************** Translate ******************/
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "Translates a geometry from the point p1 to the point p2.

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") Translate;
		void Translate(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec2d
	:rtype: opencascade::handle<Geom2d_Geometry>
") Translated;
		opencascade::handle<Geom2d_Geometry> Translated(const gp_Vec2d & V);

		/****************** Translated ******************/
		%feature("compactdefaultargs") Translated;
		%feature("autodoc", "	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: opencascade::handle<Geom2d_Geometry>
") Translated;
		opencascade::handle<Geom2d_Geometry> Translated(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

};


%make_alias(Geom2d_Geometry)

%extend Geom2d_Geometry {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Geom2d_Transformation *
******************************/
class Geom2d_Transformation : public Standard_Transient {
	public:
		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object, which is a copy of this transformation.

	:rtype: opencascade::handle<Geom2d_Transformation>
") Copy;
		opencascade::handle<Geom2d_Transformation> Copy();

		/****************** Form ******************/
		%feature("compactdefaultargs") Form;
		%feature("autodoc", "Returns the nature of this transformation as a value of the gp_trsfform enumeration. returns the nature of the transformation. it can be identity, rotation, translation, pntmirror, ax1mirror, scale, compoundtrsf.

	:rtype: gp_TrsfForm
") Form;
		gp_TrsfForm Form();

		/****************** Geom2d_Transformation ******************/
		%feature("compactdefaultargs") Geom2d_Transformation;
		%feature("autodoc", "Creates an identity transformation.

	:rtype: None
") Geom2d_Transformation;
		 Geom2d_Transformation();

		/****************** Geom2d_Transformation ******************/
		%feature("compactdefaultargs") Geom2d_Transformation;
		%feature("autodoc", "Creates a persistent copy of t.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Geom2d_Transformation;
		 Geom2d_Transformation(const gp_Trsf2d & T);

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Computes the inverse of this transformation. and assigns the result to this transformatio //! raised if the the transformation is singular. this means that the scalefactor is lower or equal to resolution from package gp.

	:rtype: None
") Invert;
		void Invert();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Computes the inverse of this transformation and creates a new one. raises constructionerror if the the transformation is singular. this means that the scalefactor is lower or equal to resolution from package gp.

	:rtype: opencascade::handle<Geom2d_Transformation>
") Inverted;
		opencascade::handle<Geom2d_Transformation> Inverted();

		/****************** IsNegative ******************/
		%feature("compactdefaultargs") IsNegative;
		%feature("autodoc", "Checks whether this transformation is an indirect transformation: returns true if the determinant of the matrix of the vectorial part of the transformation is less than 0.

	:rtype: bool
") IsNegative;
		Standard_Boolean IsNegative();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "	:param Other:
	:type Other: Geom2d_Transformation
	:rtype: opencascade::handle<Geom2d_Transformation>
") Multiplied;
		opencascade::handle<Geom2d_Transformation> Multiplied(const opencascade::handle<Geom2d_Transformation> & Other);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Computes the transformation composed with other and <self> . <self> = <self> * other. //! computes the following composition of transformations if n > 0 <self> * <self> * .......* <self>. if n = 0 identity if n < 0 <self>.invert() * .........* <self>.invert().

	:param Other:
	:type Other: Geom2d_Transformation
	:rtype: None
") Multiply;
		void Multiply(const opencascade::handle<Geom2d_Transformation> & Other);

		/****************** Power ******************/
		%feature("compactdefaultargs") Power;
		%feature("autodoc", "Raised if n < 0 and if the transformation is not inversible.

	:param N:
	:type N: int
	:rtype: None
") Power;
		void Power(const Standard_Integer N);

		/****************** Powered ******************/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "Raised if n < 0 and if the transformation is not inversible.

	:param N:
	:type N: int
	:rtype: opencascade::handle<Geom2d_Transformation>
") Powered;
		opencascade::handle<Geom2d_Transformation> Powered(const Standard_Integer N);

		/****************** PreMultiply ******************/
		%feature("compactdefaultargs") PreMultiply;
		%feature("autodoc", "Computes the matrix of the transformation composed with <self> and other. <self> = other * <self>.

	:param Other:
	:type Other: Geom2d_Transformation
	:rtype: None
") PreMultiply;
		void PreMultiply(const opencascade::handle<Geom2d_Transformation> & Other);

		/****************** ScaleFactor ******************/
		%feature("compactdefaultargs") ScaleFactor;
		%feature("autodoc", "Returns the scale value of the transformation.

	:rtype: float
") ScaleFactor;
		Standard_Real ScaleFactor();

		/****************** SetMirror ******************/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "Makes the transformation into a symmetrical transformation with respect to a point p. p is the center of the symmetry.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetMirror;
		void SetMirror(const gp_Pnt2d & P);

		/****************** SetMirror ******************/
		%feature("compactdefaultargs") SetMirror;
		%feature("autodoc", "Makes the transformation into a symmetrical transformation with respect to an axis a. a is the center of the axial symmetry.

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") SetMirror;
		void SetMirror(const gp_Ax2d & A);

		/****************** SetRotation ******************/
		%feature("compactdefaultargs") SetRotation;
		%feature("autodoc", "Assigns to this transformation the geometric properties of a rotation at angle ang (in radians) about point p.

	:param P:
	:type P: gp_Pnt2d
	:param Ang:
	:type Ang: float
	:rtype: None
") SetRotation;
		void SetRotation(const gp_Pnt2d & P, const Standard_Real Ang);

		/****************** SetScale ******************/
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "Makes the transformation into a scale. p is the center of the scale and s is the scaling value.

	:param P:
	:type P: gp_Pnt2d
	:param S:
	:type S: float
	:rtype: None
") SetScale;
		void SetScale(const gp_Pnt2d & P, const Standard_Real S);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "Makes a transformation allowing passage from the coordinate system 'fromsystem1' to the coordinate system 'tosystem2'.

	:param FromSystem1:
	:type FromSystem1: gp_Ax2d
	:param ToSystem2:
	:type ToSystem2: gp_Ax2d
	:rtype: None
") SetTransformation;
		void SetTransformation(const gp_Ax2d & FromSystem1, const gp_Ax2d & ToSystem2);

		/****************** SetTransformation ******************/
		%feature("compactdefaultargs") SetTransformation;
		%feature("autodoc", "Makes the transformation allowing passage from the basic coordinate system {p(0.,0.,0.), vx (1.,0.,0.), vy (0.,1.,0.)} to the local coordinate system defined with the ax2d tosystem.

	:param ToSystem:
	:type ToSystem: gp_Ax2d
	:rtype: None
") SetTransformation;
		void SetTransformation(const gp_Ax2d & ToSystem);

		/****************** SetTranslation ******************/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "Makes the transformation into a translation. v is the vector of the translation.

	:param V:
	:type V: gp_Vec2d
	:rtype: None
") SetTranslation;
		void SetTranslation(const gp_Vec2d & V);

		/****************** SetTranslation ******************/
		%feature("compactdefaultargs") SetTranslation;
		%feature("autodoc", "Makes the transformation into a translation from the point p1 to the point p2.

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") SetTranslation;
		void SetTranslation(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** SetTrsf2d ******************/
		%feature("compactdefaultargs") SetTrsf2d;
		%feature("autodoc", "Makes the transformation into a transformation t from package gp.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") SetTrsf2d;
		void SetTrsf2d(const gp_Trsf2d & T);

		/****************** Transforms ******************/
		%feature("compactdefaultargs") Transforms;
		%feature("autodoc", "Applies the transformation <self> to the triplet {x, y}.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: None
") Transforms;
		void Transforms(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Trsf2d ******************/
		%feature("compactdefaultargs") Trsf2d;
		%feature("autodoc", "Converts this transformation into a gp_trsf2d transformation. returns a non persistent copy of <self>. -c++: return const&.

	:rtype: gp_Trsf2d
") Trsf2d;
		gp_Trsf2d Trsf2d();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the coefficients of the global matrix of tranformation. it is a 2 rows x 3 columns matrix. //! raised if row < 1 or row > 2 or col < 1 or col > 2 //! computes the reverse transformation.

	:param Row:
	:type Row: int
	:param Col:
	:type Col: int
	:rtype: float
") Value;
		Standard_Real Value(const Standard_Integer Row, const Standard_Integer Col);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Other:
	:type Other: Geom2d_Transformation
	:rtype: opencascade::handle<Geom2d_Transformation>
") operator *;
		opencascade::handle<Geom2d_Transformation> operator *(const opencascade::handle<Geom2d_Transformation> & Other);


            %extend{
                void __imul_wrapper__(const opencascade::handle<Geom2d_Transformation> other) {
                *self *= other;
                }
            }
            %pythoncode {
            def __imul__(self, right):
                self.__imul_wrapper__(right)
                return self
            }
};


%make_alias(Geom2d_Transformation)

%extend Geom2d_Transformation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Geom2d_AxisPlacement *
*****************************/
class Geom2d_AxisPlacement : public Geom2d_Geometry {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Computes the angle between the 'direction' of two axis placement in radians. the result is comprised between -pi and pi.

	:param Other:
	:type Other: Geom2d_AxisPlacement
	:rtype: float
") Angle;
		Standard_Real Angle(const opencascade::handle<Geom2d_AxisPlacement> & Other);

		/****************** Ax2d ******************/
		%feature("compactdefaultargs") Ax2d;
		%feature("autodoc", "Converts this axis into a gp_ax2d axis.

	:rtype: gp_Ax2d
") Ax2d;
		gp_Ax2d Ax2d();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this axis.

	:rtype: opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Returns the 'direction' of <self>. -c++: return const&.

	:rtype: gp_Dir2d
") Direction;
		gp_Dir2d Direction();

		/****************** Geom2d_AxisPlacement ******************/
		%feature("compactdefaultargs") Geom2d_AxisPlacement;
		%feature("autodoc", "Constructs an axis by conversion of the gp_ax2d axis a.

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") Geom2d_AxisPlacement;
		 Geom2d_AxisPlacement(const gp_Ax2d & A);

		/****************** Geom2d_AxisPlacement ******************/
		%feature("compactdefaultargs") Geom2d_AxisPlacement;
		%feature("autodoc", "Constructs an axis from a given origin p and unit vector v.

	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Dir2d
	:rtype: None
") Geom2d_AxisPlacement;
		 Geom2d_AxisPlacement(const gp_Pnt2d & P, const gp_Dir2d & V);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the 'location' point (origin) of the axis placement. -c++: return const&.

	:rtype: gp_Pnt2d
") Location;
		gp_Pnt2d Location();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Reverses the unit vector of this axis. note: - reverse assigns the result to this axis, while - reversed creates a new one.

	:rtype: opencascade::handle<Geom2d_AxisPlacement>
") Reversed;
		opencascade::handle<Geom2d_AxisPlacement> Reversed();

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Changes the complete definition of the axis placement.

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") SetAxis;
		void SetAxis(const gp_Ax2d & A);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Changes the 'direction' of the axis placement.

	:param V:
	:type V: gp_Dir2d
	:rtype: None
") SetDirection;
		void SetDirection(const gp_Dir2d & V);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Changes the 'location' point (origin) of the axis placement.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetLocation;
		void SetLocation(const gp_Pnt2d & P);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this axis.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform(const gp_Trsf2d & T);

};


%make_alias(Geom2d_AxisPlacement)

%extend Geom2d_AxisPlacement {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Geom2d_Curve *
*********************/
%nodefaultctor Geom2d_Curve;
class Geom2d_Curve : public Geom2d_Geometry {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "It is the global continuity of the curve : c0 : only geometric continuity, c1 : continuity of the first derivative all along the curve, c2 : continuity of the second derivative all along the curve, c3 : continuity of the third derivative all along the curve, g1 : tangency continuity all along the curve, g2 : curvature continuity all along the curve, cn : the order of continuity is infinite.

	:rtype: GeomAbs_Shape
") Continuity;
		virtual GeomAbs_Shape Continuity();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. if the curve is periodic then the returned point is p(u) with u = ustart + (u - uend) where ustart and uend are the parametric bounds of the curve. //! raised only for the 'offsetcurve' if it is not possible to compute the current point. for example when the first derivative on the basis curve and the offset direction are parallel.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		virtual void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the point p of parameter u and the first derivative v1. raised if the continuity of the curve is not c1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") D1;
		virtual void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. raised if the continuity of the curve is not c2.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		virtual void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first, the second and the third derivative. raised if the continuity of the curve is not c3.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") D3;
		virtual void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this curve, computes the vector corresponding to the nth derivative. exceptions stdfail_undefinedderivative if: - the continuity of the curve is not 'cn', or - the derivative vector cannot be computed easily; this is the case with specific types of curve (for example, a rational bspline curve where n is greater than 3). standard_rangeerror if n is less than 1.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		virtual gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter. warnings : it can be realfirst or reallast from package standard if the curve is infinite.

	:rtype: float
") FirstParameter;
		virtual Standard_Real FirstParameter();

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns true if the degree of continuity of this curve is at least n. exceptions standard_rangeerror if n is less than 0.

	:param N:
	:type N: int
	:rtype: bool
") IsCN;
		virtual Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the curve is closed. examples : some curves such as circle are always closed, others such as line are never closed (by definition). some curves such as offsetcurve can be closed or not. these curves are considered as closed if the distance between the first point and the last point of the curve is lower or equal to the resolution from package gp wich is a fixed criterion independant of the application.

	:rtype: bool
") IsClosed;
		virtual Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns true if the parameter of the curve is periodic. it is possible only if the curve is closed and if the following relation is satisfied : for each parametric value u the distance between the point p(u) and the point p (u + t) is lower or equal to resolution from package gp, t is the period and must be a constant. there are three possibilities : . the curve is never periodic by definition (segmentline) . the curve is always periodic by definition (circle) . the curve can be defined as periodic (bspline). in this case a function setperiodic allows you to give the shape of the curve. the general rule for this case is : if a curve can be periodic or not the default periodicity set is non periodic and you have to turn (explicitly) the curve into a periodic curve if you want the curve to be periodic.

	:rtype: bool
") IsPeriodic;
		virtual Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Value of the last parameter. warnings : it can be realfirst or reallast from package standard if the curve is infinite.

	:rtype: float
") LastParameter;
		virtual Standard_Real LastParameter();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns the coefficient required to compute the parametric transformation of this curve when transformation t is applied. this coefficient is the ratio between the parameter of a point on this curve and the parameter of the transformed point on the new curve transformed by t. note: this function generally returns 1. but it can be redefined (for example, on a line).

	:param T:
	:type T: gp_Trsf2d
	:rtype: float
") ParametricTransformation;
		virtual Standard_Real ParametricTransformation(const gp_Trsf2d & T);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Returns thne period of this curve. raises if the curve is not periodic.

	:rtype: float
") Period;
		virtual Standard_Real Period();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Changes the direction of parametrization of <self>. the 'firstparameter' and the 'lastparameter' are not changed but the orientation of the curve is modified. if the curve is bounded the startpoint of the initial curve becomes the endpoint of the reversed curve and the endpoint of the initial curve becomes the startpoint of the reversed curve.

	:rtype: None
") Reverse;
		virtual void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Creates a reversed duplicate changes the orientation of this curve. the first and last parameters are not changed, but the parametric direction of the curve is reversed. if the curve is bounded: - the start point of the initial curve becomes the end point of the reversed curve, and - the end point of the initial curve becomes the start point of the reversed curve. - reversed creates a new curve.

	:rtype: opencascade::handle<Geom2d_Curve>
") Reversed;
		opencascade::handle<Geom2d_Curve> Reversed();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed curve for the point of parameter u on this curve. note: the point of parameter u on this curve is identical to the point of parameter reversedparameter(u) on the reversed curve.

	:param U:
	:type U: float
	:rtype: float
") ReversedParameter;
		virtual Standard_Real ReversedParameter(const Standard_Real U);

		/****************** TransformedParameter ******************/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "Computes the parameter on the curve transformed by t for the point of parameter u on this curve. note: this function generally returns u but it can be redefined (for example, on a line).

	:param U:
	:type U: float
	:param T:
	:type T: gp_Trsf2d
	:rtype: float
") TransformedParameter;
		virtual Standard_Real TransformedParameter(const Standard_Real U, const gp_Trsf2d & T);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the point of parameter u on <self>. if the curve is periodic then the returned point is p(u) with u = ustart + (u - uend) where ustart and uend are the parametric bounds of the curve. //! it is implemented with d0. //! raised only for the 'offsetcurve' if it is not possible to compute the current point. for example when the first derivative on the basis curve and the offset direction are parallel.

	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value;
		gp_Pnt2d Value(const Standard_Real U);

};


%make_alias(Geom2d_Curve)

%extend Geom2d_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Geom2d_Point *
*********************/
%nodefaultctor Geom2d_Point;
class Geom2d_Point : public Geom2d_Geometry {
	public:
		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinates of <self>.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: None
") Coord;
		virtual void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between <self> and <other>.

	:param Other:
	:type Other: Geom2d_Point
	:rtype: float
") Distance;
		Standard_Real Distance(const opencascade::handle<Geom2d_Point> & Other);

		/****************** Pnt2d ******************/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "Returns a non persistent copy of <self>.

	:rtype: gp_Pnt2d
") Pnt2d;
		virtual gp_Pnt2d Pnt2d();

		/****************** SquareDistance ******************/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "Computes the square distance between <self> and <other>.

	:param Other:
	:type Other: Geom2d_Point
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance(const opencascade::handle<Geom2d_Point> & Other);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns the x coordinate of <self>.

	:rtype: float
") X;
		virtual Standard_Real X();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns the y coordinate of <self>.

	:rtype: float
") Y;
		virtual Standard_Real Y();

};


%make_alias(Geom2d_Point)

%extend Geom2d_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Geom2d_Vector *
**********************/
%nodefaultctor Geom2d_Vector;
class Geom2d_Vector : public Geom2d_Geometry {
	public:
		/****************** Angle ******************/
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "Computes the angular value, in radians, between this vector and vector other. the result is a value between -pi and pi. the orientation is from this vector to vector other. raises vectorwithnullmagnitude if one of the two vectors is a vector with null magnitude because the angular value is indefinite.

	:param Other:
	:type Other: Geom2d_Vector
	:rtype: float
") Angle;
		Standard_Real Angle(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinates of <self>.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: None
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "Cross product of <self> with the vector <other>.

	:param Other:
	:type Other: Geom2d_Vector
	:rtype: float
") Crossed;
		virtual Standard_Real Crossed(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Dot ******************/
		%feature("compactdefaultargs") Dot;
		%feature("autodoc", "Returns the scalar product of 2 vectors.

	:param Other:
	:type Other: Geom2d_Vector
	:rtype: float
") Dot;
		Standard_Real Dot(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Magnitude ******************/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Returns the magnitude of <self>.

	:rtype: float
") Magnitude;
		virtual Standard_Real Magnitude();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the vector <self>.

	:rtype: None
") Reverse;
		void Reverse();

		/****************** Reversed ******************/
		%feature("compactdefaultargs") Reversed;
		%feature("autodoc", "Returns a copy of <self> reversed.

	:rtype: opencascade::handle<Geom2d_Vector>
") Reversed;
		opencascade::handle<Geom2d_Vector> Reversed();

		/****************** SquareMagnitude ******************/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Returns the square magnitude of <self>.

	:rtype: float
") SquareMagnitude;
		virtual Standard_Real SquareMagnitude();

		/****************** Vec2d ******************/
		%feature("compactdefaultargs") Vec2d;
		%feature("autodoc", "Returns a non persistent copy of <self>.

	:rtype: gp_Vec2d
") Vec2d;
		gp_Vec2d Vec2d();

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns the x coordinate of <self>.

	:rtype: float
") X;
		Standard_Real X();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns the y coordinate of <self>.

	:rtype: float
") Y;
		Standard_Real Y();

};


%make_alias(Geom2d_Vector)

%extend Geom2d_Vector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom2d_BoundedCurve *
****************************/
%nodefaultctor Geom2d_BoundedCurve;
class Geom2d_BoundedCurve : public Geom2d_Curve {
	public:
		/****************** EndPoint ******************/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Returns the end point of the curve. the end point is the value of the curve for the 'lastparameter' of the curve.

	:rtype: gp_Pnt2d
") EndPoint;
		virtual gp_Pnt2d EndPoint();

		/****************** StartPoint ******************/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns the start point of the curve. the start point is the value of the curve for the 'firstparameter' of the curve.

	:rtype: gp_Pnt2d
") StartPoint;
		virtual gp_Pnt2d StartPoint();

};


%make_alias(Geom2d_BoundedCurve)

%extend Geom2d_BoundedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Geom2d_CartesianPoint *
******************************/
class Geom2d_CartesianPoint : public Geom2d_Point {
	public:
		/****************** Coord ******************/
		%feature("compactdefaultargs") Coord;
		%feature("autodoc", "Returns the coordinates of <self>.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: None
") Coord;
		void Coord(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** Geom2d_CartesianPoint ******************/
		%feature("compactdefaultargs") Geom2d_CartesianPoint;
		%feature("autodoc", "Returns a persistent copy of p.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Geom2d_CartesianPoint;
		 Geom2d_CartesianPoint(const gp_Pnt2d & P);

		/****************** Geom2d_CartesianPoint ******************/
		%feature("compactdefaultargs") Geom2d_CartesianPoint;
		%feature("autodoc", "	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: None
") Geom2d_CartesianPoint;
		 Geom2d_CartesianPoint(const Standard_Real X, const Standard_Real Y);

		/****************** Pnt2d ******************/
		%feature("compactdefaultargs") Pnt2d;
		%feature("autodoc", "Returns a non persistent cartesian point with the same coordinates as <self>. -c++: return const&.

	:rtype: gp_Pnt2d
") Pnt2d;
		gp_Pnt2d Pnt2d();

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "Set <self> to x, y coordinates.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: None
") SetCoord;
		void SetCoord(const Standard_Real X, const Standard_Real Y);

		/****************** SetPnt2d ******************/
		%feature("compactdefaultargs") SetPnt2d;
		%feature("autodoc", "Set <self> to p.x(), p.y() coordinates.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetPnt2d;
		void SetPnt2d(const gp_Pnt2d & P);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "Changes the x coordinate of me.

	:param X:
	:type X: float
	:rtype: None
") SetX;
		void SetX(const Standard_Real X);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "Changes the y coordinate of me.

	:param Y:
	:type Y: float
	:rtype: None
") SetY;
		void SetY(const Standard_Real Y);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****************** X ******************/
		%feature("compactdefaultargs") X;
		%feature("autodoc", "Returns the x coordinate of <self>.

	:rtype: float
") X;
		Standard_Real X();

		/****************** Y ******************/
		%feature("compactdefaultargs") Y;
		%feature("autodoc", "Returns the y coordinate of <self>.

	:rtype: float
") Y;
		Standard_Real Y();

};


%make_alias(Geom2d_CartesianPoint)

%extend Geom2d_CartesianPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class Geom2d_Conic *
*********************/
%nodefaultctor Geom2d_Conic;
class Geom2d_Conic : public Geom2d_Curve {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns geomabs_cn which is the global continuity of any conic.

	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the eccentricity value of the conic e. e = 0 for a circle 0 < e < 1 for an ellipse (e = 0 if majorradius = minorradius) e > 1 for a hyperbola e = 1 for a parabola.

	:rtype: float
") Eccentricity;
		virtual Standard_Real Eccentricity();

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns true, the order of continuity of a conic is infinite.

	:param N:
	:type N: int
	:rtype: bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location point of the conic. for the circle, the ellipse and the hyperbola it is the center of the conic. for the parabola it is the vertex of the parabola.

	:rtype: gp_Pnt2d
") Location;
		gp_Pnt2d Location();

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Returns the local coordinates system of the conic.

	:rtype: gp_Ax22d
") Position;
		const gp_Ax22d Position();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the direction of parameterization of <self>. the local coordinate system of the conic is modified.

	:rtype: None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Returns the parameter on the reversed curve for the point of parameter u on <self>.

	:param U:
	:type U: float
	:rtype: float
") ReversedParameter;
		virtual Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetAxis ******************/
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "Modifies this conic, redefining its local coordinate system partially, by assigning p as its origin.

	:param A:
	:type A: gp_Ax22d
	:rtype: None
") SetAxis;
		void SetAxis(const gp_Ax22d & A);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Modifies this conic, redefining its local coordinate system fully, by assigning a as this coordinate system.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetLocation;
		void SetLocation(const gp_Pnt2d & P);

		/****************** SetXAxis ******************/
		%feature("compactdefaultargs") SetXAxis;
		%feature("autodoc", "	:param A:
	:type A: gp_Ax2d
	:rtype: None
") SetXAxis;
		void SetXAxis(const gp_Ax2d & A);

		/****************** SetYAxis ******************/
		%feature("compactdefaultargs") SetYAxis;
		%feature("autodoc", "Assigns the origin and unit vector of axis a to the origin of the local coordinate system of this conic and either: - its 'x direction', or - its 'y direction'. the other unit vector of the local coordinate system of this conic is recomputed normal to a, without changing the orientation of the local coordinate system (right-handed or left-handed).

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") SetYAxis;
		void SetYAxis(const gp_Ax2d & A);

		/****************** XAxis ******************/
		%feature("compactdefaultargs") XAxis;
		%feature("autodoc", "Returns the 'xaxis' of the conic. this axis defines the origin of parametrization of the conic. this axis and the 'yaxis' define the local coordinate system of the conic. -c++: return const&.

	:rtype: gp_Ax2d
") XAxis;
		gp_Ax2d XAxis();

		/****************** YAxis ******************/
		%feature("compactdefaultargs") YAxis;
		%feature("autodoc", "Returns the 'yaxis' of the conic. the 'yaxis' is perpendicular to the 'xaxis'.

	:rtype: gp_Ax2d
") YAxis;
		gp_Ax2d YAxis();

};


%make_alias(Geom2d_Conic)

%extend Geom2d_Conic {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Geom2d_Direction *
*************************/
class Geom2d_Direction : public Geom2d_Vector {
	public:
		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this unit vector.

	:rtype: opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "Computes the cross product between <self> and <other>.

	:param Other:
	:type Other: Geom2d_Vector
	:rtype: float
") Crossed;
		Standard_Real Crossed(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Dir2d ******************/
		%feature("compactdefaultargs") Dir2d;
		%feature("autodoc", "Converts this unit vector into a gp_dir2d unit vector.

	:rtype: gp_Dir2d
") Dir2d;
		gp_Dir2d Dir2d();

		/****************** Geom2d_Direction ******************/
		%feature("compactdefaultargs") Geom2d_Direction;
		%feature("autodoc", "Creates a unit vector with it 2 cartesian coordinates. //! raised if sqrt( x*x + y*y) <= resolution from gp.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: None
") Geom2d_Direction;
		 Geom2d_Direction(const Standard_Real X, const Standard_Real Y);

		/****************** Geom2d_Direction ******************/
		%feature("compactdefaultargs") Geom2d_Direction;
		%feature("autodoc", "Creates a persistent copy of <self>.

	:param V:
	:type V: gp_Dir2d
	:rtype: None
") Geom2d_Direction;
		 Geom2d_Direction(const gp_Dir2d & V);

		/****************** Magnitude ******************/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Returns 1.0.

	:rtype: float
") Magnitude;
		Standard_Real Magnitude();

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "Assigns the coordinates x and y to this unit vector, then normalizes it. exceptions standard_constructionerror if sqrt(x*x + y*y) is less than or equal to gp::resolution().

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: None
") SetCoord;
		void SetCoord(const Standard_Real X, const Standard_Real Y);

		/****************** SetDir2d ******************/
		%feature("compactdefaultargs") SetDir2d;
		%feature("autodoc", "Converts the gp_dir2d unit vector v into this unit vector.

	:param V:
	:type V: gp_Dir2d
	:rtype: None
") SetDir2d;
		void SetDir2d(const gp_Dir2d & V);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "Assigns a value to the x coordinate of this unit vector, then normalizes it. exceptions standard_constructionerror if the value assigned causes the magnitude of the vector to become less than or equal to gp::resolution().

	:param X:
	:type X: float
	:rtype: None
") SetX;
		void SetX(const Standard_Real X);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "Assigns a value to the y coordinate of this unit vector, then normalizes it. exceptions standard_constructionerror if the value assigned causes the magnitude of the vector to become less than or equal to gp::resolution().

	:param Y:
	:type Y: float
	:rtype: None
") SetY;
		void SetY(const Standard_Real Y);

		/****************** SquareMagnitude ******************/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Returns 1.0.

	:rtype: float
") SquareMagnitude;
		Standard_Real SquareMagnitude();

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this unit vector, then normalizes it.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform(const gp_Trsf2d & T);

};


%make_alias(Geom2d_Direction)

%extend Geom2d_Direction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class Geom2d_Line *
********************/
class Geom2d_Line : public Geom2d_Curve {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns geomabs_cn, which is the global continuity of any line.

	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object, which is a copy of this line.

	:rtype: opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. p (u) = o + u * dir where o is the 'location' point of the line and dir the direction of the line.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the point p of parameter u and the first derivative v1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2. v2 is a vector with null magnitude for a line.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "V2 and v3 are vectors with null magnitude for a line.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this line, computes the vector corresponding to the nth derivative. note: if n is greater than or equal to 2, the result is a vector with null magnitude. exceptions standard_rangeerror if n is less than 1.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Direction ******************/
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "Changes the direction of the line.

	:rtype: gp_Dir2d
") Direction;
		const gp_Dir2d Direction();

		/****************** Distance ******************/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "Computes the distance between <self> and the point p.

	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Distance;
		Standard_Real Distance(const gp_Pnt2d & P);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns realfirst from standard.

	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Geom2d_Line ******************/
		%feature("compactdefaultargs") Geom2d_Line;
		%feature("autodoc", "Creates a line located in 2d space with the axis placement a. the location of a is the origin of the line.

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") Geom2d_Line;
		 Geom2d_Line(const gp_Ax2d & A);

		/****************** Geom2d_Line ******************/
		%feature("compactdefaultargs") Geom2d_Line;
		%feature("autodoc", "Creates a line by conversion of the gp_lin2d line l.

	:param L:
	:type L: gp_Lin2d
	:rtype: None
") Geom2d_Line;
		 Geom2d_Line(const gp_Lin2d & L);

		/****************** Geom2d_Line ******************/
		%feature("compactdefaultargs") Geom2d_Line;
		%feature("autodoc", "Constructs a line passing through point p and parallel to vector v (p and v are, respectively, the origin and the unit vector of the positioning axis of the line).

	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Dir2d
	:rtype: None
") Geom2d_Line;
		 Geom2d_Line(const gp_Pnt2d & P, const gp_Dir2d & V);

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns true.

	:param N:
	:type N: int
	:rtype: bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns false.

	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns false.

	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns reallast from standard.

	:rtype: float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Lin2d ******************/
		%feature("compactdefaultargs") Lin2d;
		%feature("autodoc", "Returns non persistent line from gp with the same geometric properties as <self>.

	:rtype: gp_Lin2d
") Lin2d;
		gp_Lin2d Lin2d();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Changes the 'location' point (origin) of the line.

	:rtype: gp_Pnt2d
") Location;
		const gp_Pnt2d Location();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns the coefficient required to compute the parametric transformation of this line when transformation t is applied. this coefficient is the ratio between the parameter of a point on this line and the parameter of the transformed point on the new line transformed by t. for a line, the returned value is the scale factor of the transformation t.

	:param T:
	:type T: gp_Trsf2d
	:rtype: float
") ParametricTransformation;
		virtual Standard_Real ParametricTransformation(const gp_Trsf2d & T);

		/****************** Position ******************/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	:rtype: gp_Ax2d
") Position;
		const gp_Ax2d Position();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Changes the orientation of this line. as a result, the unit vector of the positioning axis of this line is reversed.

	:rtype: None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed line for the point of parameter u on this line. for a line, the returned value is -u.

	:param U:
	:type U: float
	:rtype: float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetDirection ******************/
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "Changes the direction of the line.

	:param V:
	:type V: gp_Dir2d
	:rtype: None
") SetDirection;
		void SetDirection(const gp_Dir2d & V);

		/****************** SetLin2d ******************/
		%feature("compactdefaultargs") SetLin2d;
		%feature("autodoc", "Set <self> so that <self> has the same geometric properties as l.

	:param L:
	:type L: gp_Lin2d
	:rtype: None
") SetLin2d;
		void SetLin2d(const gp_Lin2d & L);

		/****************** SetLocation ******************/
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "Changes the 'location' point (origin) of the line.

	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetLocation;
		void SetLocation(const gp_Pnt2d & P);

		/****************** SetPosition ******************/
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "Changes the 'location' and a the 'direction' of <self>.

	:param A:
	:type A: gp_Ax2d
	:rtype: None
") SetPosition;
		void SetPosition(const gp_Ax2d & A);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this line.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****************** TransformedParameter ******************/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "Computes the parameter on the line transformed by t for the point of parameter u on this line. for a line, the returned value is equal to u multiplied by the scale factor of transformation t.

	:param U:
	:type U: float
	:param T:
	:type T: gp_Trsf2d
	:rtype: float
") TransformedParameter;
		virtual Standard_Real TransformedParameter(const Standard_Real U, const gp_Trsf2d & T);

};


%make_alias(Geom2d_Line)

%extend Geom2d_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Geom2d_OffsetCurve *
***************************/
class Geom2d_OffsetCurve : public Geom2d_Curve {
	public:
		/****************** BasisCurve ******************/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Returns the basis curve of this offset curve. the basis curve can be an offset curve.

	:rtype: opencascade::handle<Geom2d_Curve>
") BasisCurve;
		opencascade::handle<Geom2d_Curve> BasisCurve();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Continuity of the offset curve : c0 : only geometric continuity, c1 : continuity of the first derivative all along the curve, c2 : continuity of the second derivative all along the curve, c3 : continuity of the third derivative all along the curve, g1 : tangency continuity all along the curve, g2 : curvature continuity all along the curve, cn : the order of continuity is infinite. warnings : returns the continuity of the basis curve - 1. the offset curve must have a unique normal direction defined at any point. value and derivatives //! warnings : the exception undefinedvalue or undefinedderivative is raised if it is not possible to compute a unique offset direction. if t is the first derivative with not null length and z the direction normal to the plane of the curve, the relation ||t(u) ^ z|| != 0 must be satisfied to evaluate the offset curve. no check is done at the creation time and we suppose in this package that the offset curve is well defined.

	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object, which is a copy of this offset curve.

	:rtype: opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Warning! this should not be called if the basis curve is not at least c1. nevertheless if used on portion where the curve is c1, it is ok.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Warning! this should not be called if the continuity of the basis curve is not c2. nevertheless, it's ok to use it on portion where the curve is c2.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Warning! this should not be called if the continuity of the basis curve is not c3. nevertheless, it's ok to use it on portion where the curve is c3.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Warning! this should not be called if the continuity of the basis curve is not c4. nevertheless, it's ok to use it on portion where the curve is c4.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "The returned vector gives the value of the derivative for the order of derivation n. warning! this should not be called raises undefunedderivative if the continuity of the basis curve is not cn+1. nevertheless, it's ok to use it on portion where the curve is cn+1 raises rangeerror if n < 1. raises notimplemented if n > 3. the following functions compute the value and derivatives on the offset curve and returns the derivatives on the basis curve too. the computation of the value and derivatives on the basis curve are used to evaluate the offset curve warnings : the exception undefinedvalue or undefinedderivative is raised if it is not possible to compute a unique offset direction.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter of this offset curve. the first parameter corresponds to the start point of the curve. note: the first and last parameters of this offset curve are also the ones of its basis curve.

	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Geom2d_OffsetCurve ******************/
		%feature("compactdefaultargs") Geom2d_OffsetCurve;
		%feature("autodoc", "Constructs a curve offset from the basis curve c, where offset is the distance between the offset curve and the basis curve at any point. a point on the offset curve is built by measuring the offset value along a normal vector at a point on c. this normal vector is obtained by rotating the vector tangential to c at 90 degrees in the anti-trigonometric sense. the side of c on which the offset value is measured is indicated by this normal vector if offset is positive, or in the inverse sense if offset is negative. if isnotcheckc0 = true checking if basis curve has c0-continuity is not made. warnings : in this package the entities are not shared. the offsetcurve is built with a copy of the curve c. so when c is modified the offsetcurve is not modified warning! if isnotcheckc0 = false, constructionerror raised if the basis curve c is not at least c1. no check is done to know if ||v^z|| != 0.0 at any point.

	:param C:
	:type C: Geom2d_Curve
	:param Offset:
	:type Offset: float
	:param isNotCheckC0: default value is Standard_False
	:type isNotCheckC0: bool
	:rtype: None
") Geom2d_OffsetCurve;
		 Geom2d_OffsetCurve(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real Offset, const Standard_Boolean isNotCheckC0 = Standard_False);

		/****************** GetBasisCurveContinuity ******************/
		%feature("compactdefaultargs") GetBasisCurveContinuity;
		%feature("autodoc", "Returns continuity of the basis curve.

	:rtype: GeomAbs_Shape
") GetBasisCurveContinuity;
		GeomAbs_Shape GetBasisCurveContinuity();

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Is the order of continuity of the curve n ? warnings : this method answer true if the continuity of the basis curve is n + 1. we suppose in this class that a normal direction to the basis curve (used to compute the offset curve) is defined at any point on the basis curve. raised if n < 0.

	:param N:
	:type N: int
	:rtype: bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the distance between the start point and the end point of the curve is lower or equal to resolution from package gp.

	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Is the parametrization of a curve is periodic ? if the basis curve is a circle or an ellipse the corresponding offsetcurve is periodic. if the basis curve can't be periodic (for example beziercurve) the offsetcurve can't be periodic.

	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the value of the last parameter of this offset curve. the last parameter corresponds to the end point. note: the first and last parameters of this offset curve are also the ones of its basis curve.

	:rtype: float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Offset ******************/
		%feature("compactdefaultargs") Offset;
		%feature("autodoc", "Returns the offset value of this offset curve.

	:rtype: float
") Offset;
		Standard_Real Offset();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! transformed(t)->value(u * parametrictransformation(t)) //! is the same point as //! value(u).transformed(t) //! this methods calls the basis curve method.

	:param T:
	:type T: gp_Trsf2d
	:rtype: float
") ParametricTransformation;
		virtual Standard_Real ParametricTransformation(const gp_Trsf2d & T);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Returns the period of this offset curve, i.e. the period of the basis curve of this offset curve. exceptions standard_nosuchobject if the basis curve is not periodic.

	:rtype: float
") Period;
		virtual Standard_Real Period();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Changes the direction of parametrization of <self>. as a result: - the basis curve is reversed, - the start point of the initial curve becomes the end point of the reversed curve, - the end point of the initial curve becomes the start point of the reversed curve, and - the first and last parameters are recomputed.

	:rtype: None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed curve for the point of parameter u on this offset curve.

	:param U:
	:type U: float
	:rtype: float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetBasisCurve ******************/
		%feature("compactdefaultargs") SetBasisCurve;
		%feature("autodoc", "Changes this offset curve by assigning c as the basis curve from which it is built. if isnotcheckc0 = true checking if basis curve has c0-continuity is not made. exceptions if isnotcheckc0 = false, standard_constructionerror if the curve c is not at least 'c1' continuous.

	:param C:
	:type C: Geom2d_Curve
	:param isNotCheckC0: default value is Standard_False
	:type isNotCheckC0: bool
	:rtype: None
") SetBasisCurve;
		void SetBasisCurve(const opencascade::handle<Geom2d_Curve> & C, const Standard_Boolean isNotCheckC0 = Standard_False);

		/****************** SetOffsetValue ******************/
		%feature("compactdefaultargs") SetOffsetValue;
		%feature("autodoc", "Changes this offset curve by assigning d as the offset value.

	:param D:
	:type D: float
	:rtype: None
") SetOffsetValue;
		void SetOffsetValue(const Standard_Real D);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this offset curve. note: the basis curve is also modified.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****************** TransformedParameter ******************/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "Returns the parameter on the transformed curve for the transform of the point of parameter u on <self>. //! me->transformed(t)->value(me->transformedparameter(u,t)) //! is the same point as //! me->value(u).transformed(t) //! this methods calls the basis curve method.

	:param U:
	:type U: float
	:param T:
	:type T: gp_Trsf2d
	:rtype: float
") TransformedParameter;
		virtual Standard_Real TransformedParameter(const Standard_Real U, const gp_Trsf2d & T);

};


%make_alias(Geom2d_OffsetCurve)

%extend Geom2d_OffsetCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class Geom2d_VectorWithMagnitude *
***********************************/
class Geom2d_VectorWithMagnitude : public Geom2d_Vector {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the vector other to <self>.

	:param Other:
	:type Other: Geom2d_Vector
	:rtype: None
") Add;
		void Add(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "	:param Other:
	:type Other: Geom2d_Vector
	:rtype: opencascade::handle<Geom2d_VectorWithMagnitude>
") Added;
		opencascade::handle<Geom2d_VectorWithMagnitude> Added(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this vector.

	:rtype: opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** Crossed ******************/
		%feature("compactdefaultargs") Crossed;
		%feature("autodoc", "Computes the cross product between <self> and other <self> ^ other. a new vector is returned.

	:param Other:
	:type Other: Geom2d_Vector
	:rtype: float
") Crossed;
		Standard_Real Crossed(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "Divides <self> by a scalar.

	:param Scalar:
	:type Scalar: float
	:rtype: None
") Divide;
		void Divide(const Standard_Real Scalar);

		/****************** Divided ******************/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "Divides <self> by a scalar. a new vector is returned.

	:param Scalar:
	:type Scalar: float
	:rtype: opencascade::handle<Geom2d_VectorWithMagnitude>
") Divided;
		opencascade::handle<Geom2d_VectorWithMagnitude> Divided(const Standard_Real Scalar);

		/****************** Geom2d_VectorWithMagnitude ******************/
		%feature("compactdefaultargs") Geom2d_VectorWithMagnitude;
		%feature("autodoc", "Creates a persistent copy of v.

	:param V:
	:type V: gp_Vec2d
	:rtype: None
") Geom2d_VectorWithMagnitude;
		 Geom2d_VectorWithMagnitude(const gp_Vec2d & V);

		/****************** Geom2d_VectorWithMagnitude ******************/
		%feature("compactdefaultargs") Geom2d_VectorWithMagnitude;
		%feature("autodoc", "Creates a vector with two cartesian coordinates.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: None
") Geom2d_VectorWithMagnitude;
		 Geom2d_VectorWithMagnitude(const Standard_Real X, const Standard_Real Y);

		/****************** Geom2d_VectorWithMagnitude ******************/
		%feature("compactdefaultargs") Geom2d_VectorWithMagnitude;
		%feature("autodoc", "Creates a vector from the point p1 to the point p2. the magnitude of the vector is the distance between p1 and p2.

	:param P1:
	:type P1: gp_Pnt2d
	:param P2:
	:type P2: gp_Pnt2d
	:rtype: None
") Geom2d_VectorWithMagnitude;
		 Geom2d_VectorWithMagnitude(const gp_Pnt2d & P1, const gp_Pnt2d & P2);

		/****************** Magnitude ******************/
		%feature("compactdefaultargs") Magnitude;
		%feature("autodoc", "Returns the magnitude of <self>.

	:rtype: float
") Magnitude;
		Standard_Real Magnitude();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Computes the product of the vector <self> by a scalar. a new vector is returned. //! -c++: alias operator * collision with same operator defined for the class vector!.

	:param Scalar:
	:type Scalar: float
	:rtype: opencascade::handle<Geom2d_VectorWithMagnitude>
") Multiplied;
		opencascade::handle<Geom2d_VectorWithMagnitude> Multiplied(const Standard_Real Scalar);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Computes the product of the vector <self> by a scalar.

	:param Scalar:
	:type Scalar: float
	:rtype: None
") Multiply;
		void Multiply(const Standard_Real Scalar);

		/****************** Normalize ******************/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Normalizes <self>. //! raised if the magnitude of the vector is lower or equal to resolution from package gp.

	:rtype: None
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Returns a copy of <self> normalized. //! raised if the magnitude of the vector is lower or equal to resolution from package gp.

	:rtype: opencascade::handle<Geom2d_VectorWithMagnitude>
") Normalized;
		opencascade::handle<Geom2d_VectorWithMagnitude> Normalized();

		/****************** SetCoord ******************/
		%feature("compactdefaultargs") SetCoord;
		%feature("autodoc", "Set <self> to x, y coordinates.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:rtype: None
") SetCoord;
		void SetCoord(const Standard_Real X, const Standard_Real Y);

		/****************** SetVec2d ******************/
		%feature("compactdefaultargs") SetVec2d;
		%feature("autodoc", "	:param V:
	:type V: gp_Vec2d
	:rtype: None
") SetVec2d;
		void SetVec2d(const gp_Vec2d & V);

		/****************** SetX ******************/
		%feature("compactdefaultargs") SetX;
		%feature("autodoc", "Changes the x coordinate of <self>.

	:param X:
	:type X: float
	:rtype: None
") SetX;
		void SetX(const Standard_Real X);

		/****************** SetY ******************/
		%feature("compactdefaultargs") SetY;
		%feature("autodoc", "Changes the y coordinate of <self>.

	:param Y:
	:type Y: float
	:rtype: None
") SetY;
		void SetY(const Standard_Real Y);

		/****************** SquareMagnitude ******************/
		%feature("compactdefaultargs") SquareMagnitude;
		%feature("autodoc", "Returns the square magnitude of <self>.

	:rtype: float
") SquareMagnitude;
		Standard_Real SquareMagnitude();

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "Subtracts the vector other to <self>.

	:param Other:
	:type Other: Geom2d_Vector
	:rtype: None
") Subtract;
		void Subtract(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "	:param Other:
	:type Other: Geom2d_Vector
	:rtype: opencascade::handle<Geom2d_VectorWithMagnitude>
") Subtracted;
		opencascade::handle<Geom2d_VectorWithMagnitude> Subtracted(const opencascade::handle<Geom2d_Vector> & Other);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this vector.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform(const gp_Trsf2d & T);


            %extend{
                void __imul_wrapper__(const Standard_Real other) {
                *self *= other;
                }
            }
            %pythoncode {
            def __imul__(self, right):
                self.__imul_wrapper__(right)
                return self
            }
		/****************** operator + ******************/
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "	:param Other:
	:type Other: Geom2d_Vector
	:rtype: opencascade::handle<Geom2d_VectorWithMagnitude>
") operator +;
		opencascade::handle<Geom2d_VectorWithMagnitude> operator +(const opencascade::handle<Geom2d_Vector> & Other);


            %extend{
                void __iadd_wrapper__(const opencascade::handle<Geom2d_Vector> other) {
                *self += other;
                }
            }
            %pythoncode {
            def __iadd__(self, right):
                self.__iadd_wrapper__(right)
                return self
            }
		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:param Other:
	:type Other: Geom2d_Vector
	:rtype: opencascade::handle<Geom2d_VectorWithMagnitude>
") operator -;
		opencascade::handle<Geom2d_VectorWithMagnitude> operator -(const opencascade::handle<Geom2d_Vector> & Other);


            %extend{
                void __isub_wrapper__(const opencascade::handle<Geom2d_Vector> other) {
                *self -= other;
                }
            }
            %pythoncode {
            def __isub__(self, right):
                self.__isub_wrapper__(right)
                return self
            }
		/****************** operator / ******************/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "	:param Scalar:
	:type Scalar: float
	:rtype: opencascade::handle<Geom2d_VectorWithMagnitude>
") operator /;
		opencascade::handle<Geom2d_VectorWithMagnitude> operator /(const Standard_Real Scalar);


            %extend{
                void __itruediv_wrapper__(const Standard_Real other) {
                *self /= other;
                }
            }
            %pythoncode {
            def __itruediv__(self, right):
                self.__itruediv_wrapper__(right)
                return self
            }
};


%make_alias(Geom2d_VectorWithMagnitude)

%extend Geom2d_VectorWithMagnitude {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom2d_BSplineCurve *
****************************/
class Geom2d_BSplineCurve : public Geom2d_BoundedCurve {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the global continuity of the curve : c0 : only geometric continuity, c1 : continuity of the first derivative all along the curve, c2 : continuity of the second derivative all along the curve, c3 : continuity of the third derivative all along the curve, cn : the order of continuity is infinite. for a b-spline curve of degree d if a knot ui has a multiplicity p the b-spline curve is only cd-p continuous at ui. so the global continuity of the curve can't be greater than cd-p where p is the maximum multiplicity of the interior knots. in the interior of a knot span the curve is infinitely continuously differentiable.

	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this bspline curve.

	:rtype: opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Raised if the continuity of the curve is not c1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Raised if the continuity of the curve is not c2.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "For this bspline curve, computes - the point p of parameter u, or - the point p and one or more of the following values: - v1, the first derivative vector, - v2, the second derivative vector, - v3, the third derivative vector. warning on a point where the continuity of the curve is not the one requested, these functions impact the part defined by the parameter with a value greater than u, i.e. the part of the curve to the 'right' of the singularity. raises undefinedderivative if the continuity of the curve is not c3.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this bspline curve, computes the vector corresponding to the nth derivative. warning on a point where the continuity of the curve is not the one requested, this function impacts the part defined by the parameter with a value greater than u, i.e. the part of the curve to the 'right' of the singularity. raises undefinedderivative if the continuity of the curve is not cn. rangeerror if n < 1. the following functions computes the point of parameter u and the derivatives at this point on the b-spline curve arc defined between the knot fromk1 and the knot tok2. u can be out of bounds [knot (fromk1), knot (tok2)] but for the computation we only use the definition of the curve between these two knots. this method is useful to compute local derivative, if the order of continuity of the whole curve is not greater enough. inside the parametric domain knot (fromk1), knot (tok2) the evaluations are the same as if we consider the whole definition of the curve. of course the evaluations are different outside this parametric domain.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Returns the degree of this bspline curve. in this class the degree of the basis normalized b-spline functions cannot be greater than 'maxdegree' computation of value and derivatives.

	:rtype: int
") Degree;
		Standard_Integer Degree();

		/****************** EndPoint ******************/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Returns the last point of the curve. warnings : the last point of the curve is different from the last pole of the curve if the multiplicity of the last knot is lower than degree.

	:rtype: gp_Pnt2d
") EndPoint;
		gp_Pnt2d EndPoint();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Computes the parametric value of the start point of the curve. it is a knot value.

	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** FirstUKnotIndex ******************/
		%feature("compactdefaultargs") FirstUKnotIndex;
		%feature("autodoc", "For a b-spline curve the first parameter (which gives the start point of the curve) is a knot value but if the multiplicity of the first knot index is lower than degree + 1 it is not the first knot of the curve. this method computes the index of the knot corresponding to the first parameter.

	:rtype: int
") FirstUKnotIndex;
		Standard_Integer FirstUKnotIndex();

		/****************** Geom2d_BSplineCurve ******************/
		%feature("compactdefaultargs") Geom2d_BSplineCurve;
		%feature("autodoc", "Creates a non-rational b_spline curve on the basis <knots, multiplicities> of degree <degree>. the following conditions must be verified. 0 < degree <= maxdegree. //! knots.length() == mults.length() >= 2 //! knots(i) < knots(i+1) (knots are increasing) //! 1 <= mults(i) <= degree //! on a non periodic curve the first and last multiplicities may be degree+1 (this is even recommanded if you want the curve to start and finish on the first and last pole). //! on a periodic curve the first and the last multicities must be the same. //! on non-periodic curves //! poles.length() == sum(mults(i)) - degree - 1 >= 2 //! on periodic curves //! poles.length() == sum(mults(i)) except the first or last.

	:param Poles:
	:type Poles: TColgp_Array1OfPnt2d
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Multiplicities:
	:type Multiplicities: TColStd_Array1OfInteger
	:param Degree:
	:type Degree: int
	:param Periodic: default value is Standard_False
	:type Periodic: bool
	:rtype: None
") Geom2d_BSplineCurve;
		 Geom2d_BSplineCurve(const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Multiplicities, const Standard_Integer Degree, const Standard_Boolean Periodic = Standard_False);

		/****************** Geom2d_BSplineCurve ******************/
		%feature("compactdefaultargs") Geom2d_BSplineCurve;
		%feature("autodoc", "Creates a rational b_spline curve on the basis <knots, multiplicities> of degree <degree>. the following conditions must be verified. 0 < degree <= maxdegree. //! knots.length() == mults.length() >= 2 //! knots(i) < knots(i+1) (knots are increasing) //! 1 <= mults(i) <= degree //! on a non periodic curve the first and last multiplicities may be degree+1 (this is even recommanded if you want the curve to start and finish on the first and last pole). //! on a periodic curve the first and the last multicities must be the same. //! on non-periodic curves //! poles.length() == sum(mults(i)) - degree - 1 >= 2 //! on periodic curves //! poles.length() == sum(mults(i)) except the first or last.

	:param Poles:
	:type Poles: TColgp_Array1OfPnt2d
	:param Weights:
	:type Weights: TColStd_Array1OfReal
	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Multiplicities:
	:type Multiplicities: TColStd_Array1OfInteger
	:param Degree:
	:type Degree: int
	:param Periodic: default value is Standard_False
	:type Periodic: bool
	:rtype: None
") Geom2d_BSplineCurve;
		 Geom2d_BSplineCurve(const TColgp_Array1OfPnt2d & Poles, const TColStd_Array1OfReal & Weights, const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Multiplicities, const Standard_Integer Degree, const Standard_Boolean Periodic = Standard_False);

		/****************** IncreaseDegree ******************/
		%feature("compactdefaultargs") IncreaseDegree;
		%feature("autodoc", "Increases the degree of this bspline curve to degree. as a result, the poles, weights and multiplicities tables are modified; the knots table is not changed. nothing is done if degree is less than or equal to the current degree. exceptions standard_constructionerror if degree is greater than geom2d_bsplinecurve::maxdegree().

	:param Degree:
	:type Degree: int
	:rtype: None
") IncreaseDegree;
		void IncreaseDegree(const Standard_Integer Degree);

		/****************** IncreaseMultiplicity ******************/
		%feature("compactdefaultargs") IncreaseMultiplicity;
		%feature("autodoc", "Increases the multiplicity of the knot <index> to <m>. //! if <m> is lower or equal to the current multiplicity nothing is done. if <m> is higher than the degree the degree is used. if <index> is not in [firstuknotindex, lastuknotindex].

	:param Index:
	:type Index: int
	:param M:
	:type M: int
	:rtype: None
") IncreaseMultiplicity;
		void IncreaseMultiplicity(const Standard_Integer Index, const Standard_Integer M);

		/****************** IncreaseMultiplicity ******************/
		%feature("compactdefaultargs") IncreaseMultiplicity;
		%feature("autodoc", "Increases the multiplicities of the knots in [i1,i2] to <m>. //! for each knot if <m> is lower or equal to the current multiplicity nothing is done. if <m> is higher than the degree the degree is used. as a result, the poles and weights tables of this curve are modified. warning it is forbidden to modify the multiplicity of the first or last knot of a non-periodic curve. be careful as geom2d does not protect against this. exceptions standard_outofrange if either index, i1 or i2 is outside the bounds of the knots table.

	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:param M:
	:type M: int
	:rtype: None
") IncreaseMultiplicity;
		void IncreaseMultiplicity(const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer M);

		/****************** IncrementMultiplicity ******************/
		%feature("compactdefaultargs") IncrementMultiplicity;
		%feature("autodoc", "Increases by m the multiplicity of the knots of indexes i1 to i2 in the knots table of this bspline curve. for each knot, the resulting multiplicity is limited to the degree of this curve. if m is negative, nothing is done. as a result, the poles and weights tables of this bspline curve are modified. warning it is forbidden to modify the multiplicity of the first or last knot of a non-periodic curve. be careful as geom2d does not protect against this. exceptions standard_outofrange if i1 or i2 is outside the bounds of the knots table.

	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:param M:
	:type M: int
	:rtype: None
") IncrementMultiplicity;
		void IncrementMultiplicity(const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer M);

		/****************** InsertKnot ******************/
		%feature("compactdefaultargs") InsertKnot;
		%feature("autodoc", "Inserts a knot value in the sequence of knots. if <u> is an existing knot the multiplicity is increased by <m>. //! if u is not on the parameter range nothing is done. //! if the multiplicity is negative or null nothing is done. the new multiplicity is limited to the degree. //! the tolerance criterion for knots equality is the max of epsilon(u) and parametrictolerance. warning - if u is less than the first parameter or greater than the last parameter of this bspline curve, nothing is done. - if m is negative or null, nothing is done. - the multiplicity of a knot is limited to the degree of this bspline curve.

	:param U:
	:type U: float
	:param M: default value is 1
	:type M: int
	:param ParametricTolerance: default value is 0.0
	:type ParametricTolerance: float
	:rtype: None
") InsertKnot;
		void InsertKnot(const Standard_Real U, const Standard_Integer M = 1, const Standard_Real ParametricTolerance = 0.0);

		/****************** InsertKnots ******************/
		%feature("compactdefaultargs") InsertKnots;
		%feature("autodoc", "Inserts the values of the array knots, with the respective multiplicities given by the array mults, into the knots table of this bspline curve. if a value of the array knots is an existing knot, its multiplicity is: - increased by m, if add is true, or - increased to m, if add is false (default value). the tolerance criterion used for knot equality is the larger of the values parametrictolerance (defaulted to 0.) and standard_real::epsilon(u), where u is the current knot value. warning - for a value of the array knots which is less than the first parameter or greater than the last parameter of this bspline curve, nothing is done. - for a value of the array mults which is negative or null, nothing is done. - the multiplicity of a knot is limited to the degree of this bspline curve.

	:param Knots:
	:type Knots: TColStd_Array1OfReal
	:param Mults:
	:type Mults: TColStd_Array1OfInteger
	:param ParametricTolerance: default value is 0.0
	:type ParametricTolerance: float
	:param Add: default value is Standard_False
	:type Add: bool
	:rtype: None
") InsertKnots;
		void InsertKnots(const TColStd_Array1OfReal & Knots, const TColStd_Array1OfInteger & Mults, const Standard_Real ParametricTolerance = 0.0, const Standard_Boolean Add = Standard_False);

		/****************** InsertPoleAfter ******************/
		%feature("compactdefaultargs") InsertPoleAfter;
		%feature("autodoc", "The new pole is inserted after the pole of range index. if the curve was non rational it can become rational. //! raised if the b-spline is nonuniform or piecewisebezier or if weight <= 0.0 raised if index is not in the range [1, number of poles].

	:param Index:
	:type Index: int
	:param P:
	:type P: gp_Pnt2d
	:param Weight: default value is 1.0
	:type Weight: float
	:rtype: None
") InsertPoleAfter;
		void InsertPoleAfter(const Standard_Integer Index, const gp_Pnt2d & P, const Standard_Real Weight = 1.0);

		/****************** InsertPoleBefore ******************/
		%feature("compactdefaultargs") InsertPoleBefore;
		%feature("autodoc", "The new pole is inserted before the pole of range index. if the curve was non rational it can become rational. //! raised if the b-spline is nonuniform or piecewisebezier or if weight <= 0.0 raised if index is not in the range [1, number of poles].

	:param Index:
	:type Index: int
	:param P:
	:type P: gp_Pnt2d
	:param Weight: default value is 1.0
	:type Weight: float
	:rtype: None
") InsertPoleBefore;
		void InsertPoleBefore(const Standard_Integer Index, const gp_Pnt2d & P, const Standard_Real Weight = 1.0);

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Returns true if the degree of continuity of this bspline curve is at least n. a bspline curve is at least geomabs_c0. exceptions standard_rangeerror if n is negative.

	:param N:
	:type N: int
	:rtype: bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the distance between the first point and the last point of the curve is lower or equal to resolution from package gp. warnings : the first and the last point can be different from the first pole and the last pole of the curve.

	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsG1 ******************/
		%feature("compactdefaultargs") IsG1;
		%feature("autodoc", "Check if curve has at least g1 continuity in interval [thetf, thetl] returns true if iscn(1) or angle betweem 'left' and 'right' first derivatives at knots with c0 continuity is less then theangtol only knots in interval [thetf, thetl] is checked.

	:param theTf:
	:type theTf: float
	:param theTl:
	:type theTl: float
	:param theAngTol:
	:type theAngTol: float
	:rtype: bool
") IsG1;
		Standard_Boolean IsG1(const Standard_Real theTf, const Standard_Real theTl, const Standard_Real theAngTol);

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns true if the curve is periodic.

	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns true if the weights are not identical. the tolerance criterion is epsilon of the class real.

	:rtype: bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** Knot ******************/
		%feature("compactdefaultargs") Knot;
		%feature("autodoc", "Returns the knot of range index. when there is a knot with a multiplicity greater than 1 the knot is not repeated. the method multiplicity can be used to get the multiplicity of the knot. raised if index < 1 or index > nbknots.

	:param Index:
	:type Index: int
	:rtype: float
") Knot;
		Standard_Real Knot(const Standard_Integer Index);

		/****************** KnotDistribution ******************/
		%feature("compactdefaultargs") KnotDistribution;
		%feature("autodoc", "Returns nonuniform or uniform or quasiuniform or piecewisebezier. if all the knots differ by a positive constant from the preceding knot the bspline curve can be : - uniform if all the knots are of multiplicity 1, - quasiuniform if all the knots are of multiplicity 1 except for the first and last knot which are of multiplicity degree + 1, - piecewisebezier if the first and last knots have multiplicity degree + 1 and if interior knots have multiplicity degree a piecewise bezier with only two knots is a beziercurve. else the curve is non uniform. the tolerance criterion is epsilon from class real.

	:rtype: GeomAbs_BSplKnotDistribution
") KnotDistribution;
		GeomAbs_BSplKnotDistribution KnotDistribution();

		/****************** KnotSequence ******************/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "Returns the knots sequence. in this sequence the knots with a multiplicity greater than 1 are repeated. example : k = {k1, k1, k1, k2, k3, k3, k4, k4, k4} //! raised if k.lower() is less than number of first knot in knot sequence with repetitions or k.upper() is more than number of last knot in knot sequence with repetitions.

	:param K:
	:type K: TColStd_Array1OfReal
	:rtype: None
") KnotSequence;
		void KnotSequence(TColStd_Array1OfReal & K);

		/****************** KnotSequence ******************/
		%feature("compactdefaultargs") KnotSequence;
		%feature("autodoc", "Returns the knots sequence. in this sequence the knots with a multiplicity greater than 1 are repeated. example : k = {k1, k1, k1, k2, k3, k3, k4, k4, k4}.

	:rtype: TColStd_Array1OfReal
") KnotSequence;
		const TColStd_Array1OfReal & KnotSequence();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Returns the knot values of the b-spline curve; //! raised k.lower() is less than number of first knot or k.upper() is more than number of last knot.

	:param K:
	:type K: TColStd_Array1OfReal
	:rtype: None
") Knots;
		void Knots(TColStd_Array1OfReal & K);

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "Returns the knot values of the b-spline curve;.

	:rtype: TColStd_Array1OfReal
") Knots;
		const TColStd_Array1OfReal & Knots();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Computes the parametric value of the end point of the curve. it is a knot value.

	:rtype: float
") LastParameter;
		Standard_Real LastParameter();

		/****************** LastUKnotIndex ******************/
		%feature("compactdefaultargs") LastUKnotIndex;
		%feature("autodoc", "For a bspline curve the last parameter (which gives the end point of the curve) is a knot value but if the multiplicity of the last knot index is lower than degree + 1 it is not the last knot of the curve. this method computes the index of the knot corresponding to the last parameter.

	:rtype: int
") LastUKnotIndex;
		Standard_Integer LastUKnotIndex();

		/****************** LocalD0 ******************/
		%feature("compactdefaultargs") LocalD0;
		%feature("autodoc", "Raised if fromk1 = tok2.

	:param U:
	:type U: float
	:param FromK1:
	:type FromK1: int
	:param ToK2:
	:type ToK2: int
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") LocalD0;
		void LocalD0(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, gp_Pnt2d & P);

		/****************** LocalD1 ******************/
		%feature("compactdefaultargs") LocalD1;
		%feature("autodoc", "Raised if the local continuity of the curve is not c1 between the knot k1 and the knot k2. raised if fromk1 = tok2.

	:param U:
	:type U: float
	:param FromK1:
	:type FromK1: int
	:param ToK2:
	:type ToK2: int
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") LocalD1;
		void LocalD1(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** LocalD2 ******************/
		%feature("compactdefaultargs") LocalD2;
		%feature("autodoc", "Raised if the local continuity of the curve is not c2 between the knot k1 and the knot k2. raised if fromk1 = tok2.

	:param U:
	:type U: float
	:param FromK1:
	:type FromK1: int
	:param ToK2:
	:type ToK2: int
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") LocalD2;
		void LocalD2(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** LocalD3 ******************/
		%feature("compactdefaultargs") LocalD3;
		%feature("autodoc", "Raised if the local continuity of the curve is not c3 between the knot k1 and the knot k2. raised if fromk1 = tok2.

	:param U:
	:type U: float
	:param FromK1:
	:type FromK1: int
	:param ToK2:
	:type ToK2: int
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") LocalD3;
		void LocalD3(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** LocalDN ******************/
		%feature("compactdefaultargs") LocalDN;
		%feature("autodoc", "Raised if the local continuity of the curve is not cn between the knot k1 and the knot k2. raised if fromk1 = tok2. raised if n < 1.

	:param U:
	:type U: float
	:param FromK1:
	:type FromK1: int
	:param ToK2:
	:type ToK2: int
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") LocalDN;
		gp_Vec2d LocalDN(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2, const Standard_Integer N);

		/****************** LocalValue ******************/
		%feature("compactdefaultargs") LocalValue;
		%feature("autodoc", "Raised if fromk1 = tok2.

	:param U:
	:type U: float
	:param FromK1:
	:type FromK1: int
	:param ToK2:
	:type ToK2: int
	:rtype: gp_Pnt2d
") LocalValue;
		gp_Pnt2d LocalValue(const Standard_Real U, const Standard_Integer FromK1, const Standard_Integer ToK2);

		/****************** LocateU ******************/
		%feature("compactdefaultargs") LocateU;
		%feature("autodoc", "Locates the parametric value u in the sequence of knots. if 'withknotrepetition' is true we consider the knot's representation with repetition of multiple knot value, otherwise we consider the knot's representation with no repetition of multiple knot values. knots (i1) <= u <= knots (i2) . if i1 = i2 u is a knot value (the tolerance criterion parametrictolerance is used). . if i1 < 1 => u < knots (1) - abs(parametrictolerance) . if i2 > nbknots => u > knots (nbknots) + abs(parametrictolerance).

	:param U:
	:type U: float
	:param ParametricTolerance:
	:type ParametricTolerance: float
	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:param WithKnotRepetition: default value is Standard_False
	:type WithKnotRepetition: bool
	:rtype: None
") LocateU;
		void LocateU(const Standard_Real U, const Standard_Real ParametricTolerance, Standard_Integer &OutValue, Standard_Integer &OutValue, const Standard_Boolean WithKnotRepetition = Standard_False);

		/****************** MaxDegree ******************/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Returns the value of the maximum degree of the normalized b-spline basis functions in this package.

	:rtype: int
") MaxDegree;
		static Standard_Integer MaxDegree();

		/****************** MovePoint ******************/
		%feature("compactdefaultargs") MovePoint;
		%feature("autodoc", "Moves the point of parameter u of this bspline curve to p. index1 and index2 are the indexes in the table of poles of this bspline curve of the first and last poles designated to be moved. firstmodifiedpole and lastmodifiedpole are the indexes of the first and last poles, which are effectively modified. in the event of incompatibility between index1, index2 and the value u: - no change is made to this bspline curve, and - the firstmodifiedpole and lastmodifiedpole are returned null. exceptions standard_outofrange if: - index1 is greater than or equal to index2, or - index1 or index2 is less than 1 or greater than the number of poles of this bspline curve.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param Index1:
	:type Index1: int
	:param Index2:
	:type Index2: int
	:param FirstModifiedPole:
	:type FirstModifiedPole: int
	:param LastModifiedPole:
	:type LastModifiedPole: int
	:rtype: None
") MovePoint;
		void MovePoint(const Standard_Real U, const gp_Pnt2d & P, const Standard_Integer Index1, const Standard_Integer Index2, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** MovePointAndTangent ******************/
		%feature("compactdefaultargs") MovePointAndTangent;
		%feature("autodoc", "Move a point with parameter u to p. and makes it tangent at u be tangent. startingcondition = -1 means first can move endingcondition = -1 means last point can move startingcondition = 0 means the first point cannot move endingcondition = 0 means the last point cannot move startingcondition = 1 means the first point and tangent cannot move endingcondition = 1 means the last point and tangent cannot move and so forth errorstatus != 0 means that there are not enought degree of freedom with the constrain to deform the curve accordingly.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param Tangent:
	:type Tangent: gp_Vec2d
	:param Tolerance:
	:type Tolerance: float
	:param StartingCondition:
	:type StartingCondition: int
	:param EndingCondition:
	:type EndingCondition: int
	:param ErrorStatus:
	:type ErrorStatus: int
	:rtype: None
") MovePointAndTangent;
		void MovePointAndTangent(const Standard_Real U, const gp_Pnt2d & P, const gp_Vec2d & Tangent, const Standard_Real Tolerance, const Standard_Integer StartingCondition, const Standard_Integer EndingCondition, Standard_Integer &OutValue);

		/****************** Multiplicities ******************/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "Returns the multiplicity of the knots of the curve. //! raised if the length of m is not equal to nbknots.

	:param M:
	:type M: TColStd_Array1OfInteger
	:rtype: None
") Multiplicities;
		void Multiplicities(TColStd_Array1OfInteger & M);

		/****************** Multiplicities ******************/
		%feature("compactdefaultargs") Multiplicities;
		%feature("autodoc", "Returns the multiplicity of the knots of the curve.

	:rtype: TColStd_Array1OfInteger
") Multiplicities;
		const TColStd_Array1OfInteger & Multiplicities();

		/****************** Multiplicity ******************/
		%feature("compactdefaultargs") Multiplicity;
		%feature("autodoc", "Returns the multiplicity of the knots of range index. raised if index < 1 or index > nbknots.

	:param Index:
	:type Index: int
	:rtype: int
") Multiplicity;
		Standard_Integer Multiplicity(const Standard_Integer Index);

		/****************** NbKnots ******************/
		%feature("compactdefaultargs") NbKnots;
		%feature("autodoc", "Returns the number of knots. this method returns the number of knot without repetition of multiple knots.

	:rtype: int
") NbKnots;
		Standard_Integer NbKnots();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Returns the number of poles.

	:rtype: int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** PeriodicNormalization ******************/
		%feature("compactdefaultargs") PeriodicNormalization;
		%feature("autodoc", "Computes the parameter normalized within the 'first' period of this bspline curve, if it is periodic: the returned value is in the range param1 and param1 + period, where: - param1 is the 'first parameter', and - period the period of this bspline curve. note: if this curve is not periodic, u is not modified.

	:param U:
	:type U: float
	:rtype: None
") PeriodicNormalization;
		void PeriodicNormalization(Standard_Real &OutValue);

		/****************** Pole ******************/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "Returns the pole of range index. raised if index < 1 or index > nbpoles.

	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d
") Pole;
		const gp_Pnt2d Pole(const Standard_Integer Index);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns the poles of the b-spline curve; //! raised if the length of p is not equal to the number of poles.

	:param P:
	:type P: TColgp_Array1OfPnt2d
	:rtype: None
") Poles;
		void Poles(TColgp_Array1OfPnt2d & P);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns the poles of the b-spline curve;.

	:rtype: TColgp_Array1OfPnt2d
") Poles;
		const TColgp_Array1OfPnt2d & Poles();

		/****************** RemoveKnot ******************/
		%feature("compactdefaultargs") RemoveKnot;
		%feature("autodoc", "Reduces the multiplicity of the knot of index index to m. if m is equal to 0, the knot is removed. with a modification of this type, the array of poles is also modified. two different algorithms are systematically used to compute the new poles of the curve. if, for each pole, the distance between the pole calculated using the first algorithm and the same pole calculated using the second algorithm, is less than tolerance, this ensures that the curve is not modified by more than tolerance. under these conditions, true is returned; otherwise, false is returned. a low tolerance is used to prevent modification of the curve. a high tolerance is used to 'smooth' the curve. exceptions standard_outofrange if index is outside the bounds of the knots table.

	:param Index:
	:type Index: int
	:param M:
	:type M: int
	:param Tolerance:
	:type Tolerance: float
	:rtype: bool
") RemoveKnot;
		Standard_Boolean RemoveKnot(const Standard_Integer Index, const Standard_Integer M, const Standard_Real Tolerance);

		/****************** RemovePole ******************/
		%feature("compactdefaultargs") RemovePole;
		%feature("autodoc", "Removes the pole of range index if the curve was rational it can become non rational. //! raised if the b-spline is nonuniform or piecewisebezier. raised if the number of poles of the b-spline curve is lower or equal to 2 before removing. raised if index is not in the range [1, number of poles].

	:param Index:
	:type Index: int
	:rtype: None
") RemovePole;
		void RemovePole(const Standard_Integer Index);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Computes for this bspline curve the parametric tolerance utolerance for a given tolerance tolerance3d (relative to dimensions in the plane). if f(t) is the equation of this bspline curve, utolerance ensures that: | t1 - t0| < utolerance ===> |f(t1) - f(t0)| < toleranceuv.

	:param ToleranceUV:
	:type ToleranceUV: float
	:param UTolerance:
	:type UTolerance: float
	:rtype: None
") Resolution;
		void Resolution(const Standard_Real ToleranceUV, Standard_Real &OutValue);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the orientation of this bspline curve. as a result - the knots and poles tables are modified; - the start point of the initial curve becomes the end point of the reversed curve; - the end point of the initial curve becomes the start point of the reversed curve.

	:rtype: None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed curve for the point of parameter u on this bspline curve. the returned value is: ufirst + ulast - u, where ufirst and ulast are the values of the first and last parameters of this bspline curve.

	:param U:
	:type U: float
	:rtype: float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Modifies this bspline curve by segmenting it between u1 and u2. either of these values can be outside the bounds of the curve, but u2 must be greater than u1. all data structure tables of this bspline curve are modified, but the knots located between u1 and u2 are retained. the degree of the curve is not modified. //! parameter thetolerance defines the possible proximity of the segment boundaries and b-spline knots to treat them as equal. //! warnings : even if <self> is not closed it can become closed after the segmentation for example if u1 or u2 are out of the bounds of the curve <self> or if the curve makes loop. after the segmentation the length of a curve can be null. - the segmentation of a periodic curve over an interval corresponding to its period generates a non-periodic curve with equivalent geometry. exceptions standard_domainerror if u2 is less than u1. raises if u2 < u1. standard_domainerror if u2 - u1 exceeds the period for periodic curves. i.e. ((u2 - u1) - period) > precision::pconfusion().

	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param theTolerance: default value is Precision::PConfusion()
	:type theTolerance: float
	:rtype: None
") Segment;
		void Segment(const Standard_Real U1, const Standard_Real U2, const Standard_Real theTolerance = Precision::PConfusion());

		/****************** SetKnot ******************/
		%feature("compactdefaultargs") SetKnot;
		%feature("autodoc", "Modifies this bspline curve by assigning the value k to the knot of index index in the knots table. this is a relatively local modification because k must be such that: knots(index - 1) < k < knots(index + 1) exceptions standard_constructionerror if: - k is not such that: knots(index - 1) < k < knots(index + 1) - m is greater than the degree of this bspline curve or lower than the previous multiplicity of knot of index index in the knots table. standard_outofrange if index is outside the bounds of the knots table.

	:param Index:
	:type Index: int
	:param K:
	:type K: float
	:rtype: None
") SetKnot;
		void SetKnot(const Standard_Integer Index, const Standard_Real K);

		/****************** SetKnot ******************/
		%feature("compactdefaultargs") SetKnot;
		%feature("autodoc", "Modifies this bspline curve by assigning the value k to the knot of index index in the knots table. this is a relatively local modification because k must be such that: knots(index - 1) < k < knots(index + 1) the second syntax allows you also to increase the multiplicity of the knot to m (but it is not possible to decrease the multiplicity of the knot with this function). exceptions standard_constructionerror if: - k is not such that: knots(index - 1) < k < knots(index + 1) - m is greater than the degree of this bspline curve or lower than the previous multiplicity of knot of index index in the knots table. standard_outofrange if index is outside the bounds of the knots table.

	:param Index:
	:type Index: int
	:param K:
	:type K: float
	:param M:
	:type M: int
	:rtype: None
") SetKnot;
		void SetKnot(const Standard_Integer Index, const Standard_Real K, const Standard_Integer M);

		/****************** SetKnots ******************/
		%feature("compactdefaultargs") SetKnots;
		%feature("autodoc", "Modifies this bspline curve by assigning the array k to its knots table. the multiplicity of the knots is not modified. exceptions standard_constructionerror if the values in the array k are not in ascending order. standard_outofrange if the bounds of the array k are not respectively 1 and the number of knots of this bspline curve.

	:param K:
	:type K: TColStd_Array1OfReal
	:rtype: None
") SetKnots;
		void SetKnots(const TColStd_Array1OfReal & K);

		/****************** SetNotPeriodic ******************/
		%feature("compactdefaultargs") SetNotPeriodic;
		%feature("autodoc", "Changes this bspline curve into a non-periodic curve. if this curve is already non-periodic, it is not modified. note that the poles and knots tables are modified. warning if this curve is periodic, as the multiplicity of the first and last knots is not modified, and is not equal to degree + 1, where degree is the degree of this bspline curve, the start and end points of the curve are not its first and last poles.

	:rtype: None
") SetNotPeriodic;
		void SetNotPeriodic();

		/****************** SetOrigin ******************/
		%feature("compactdefaultargs") SetOrigin;
		%feature("autodoc", "Assigns the knot of index index in the knots table as the origin of this periodic bspline curve. as a consequence, the knots and poles tables are modified. exceptions standard_nosuchobject if this curve is not periodic. standard_domainerror if index is outside the bounds of the knots table.

	:param Index:
	:type Index: int
	:rtype: None
") SetOrigin;
		void SetOrigin(const Standard_Integer Index);

		/****************** SetPeriodic ******************/
		%feature("compactdefaultargs") SetPeriodic;
		%feature("autodoc", "Changes this bspline curve into a periodic curve. to become periodic, the curve must first be closed. next, the knot sequence must be periodic. for this, firstuknotindex and lastuknotindex are used to compute i1 and i2, the indexes in the knots array of the knots corresponding to the first and last parameters of this bspline curve. the period is therefore knot(i2) - knot(i1). consequently, the knots and poles tables are modified. exceptions standard_constructionerror if this bspline curve is not closed.

	:rtype: None
") SetPeriodic;
		void SetPeriodic();

		/****************** SetPole ******************/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Modifies this bspline curve by assigning p to the pole of index index in the poles table. exceptions standard_outofrange if index is outside the bounds of the poles table. standard_constructionerror if weight is negative or null.

	:param Index:
	:type Index: int
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetPole;
		void SetPole(const Standard_Integer Index, const gp_Pnt2d & P);

		/****************** SetPole ******************/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Modifies this bspline curve by assigning p to the pole of index index in the poles table. the second syntax also allows you to modify the weight of the modified pole, which becomes weight. in this case, if this bspline curve is non-rational, it can become rational and vice versa. exceptions standard_outofrange if index is outside the bounds of the poles table. standard_constructionerror if weight is negative or null.

	:param Index:
	:type Index: int
	:param P:
	:type P: gp_Pnt2d
	:param Weight:
	:type Weight: float
	:rtype: None
") SetPole;
		void SetPole(const Standard_Integer Index, const gp_Pnt2d & P, const Standard_Real Weight);

		/****************** SetWeight ******************/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "Assigns the weight weight to the pole of index index of the poles table. if the curve was non rational it can become rational. if the curve was rational it can become non rational. exceptions standard_outofrange if index is outside the bounds of the poles table. standard_constructionerror if weight is negative or null.

	:param Index:
	:type Index: int
	:param Weight:
	:type Weight: float
	:rtype: None
") SetWeight;
		void SetWeight(const Standard_Integer Index, const Standard_Real Weight);

		/****************** StartPoint ******************/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns the start point of the curve. warnings : this point is different from the first pole of the curve if the multiplicity of the first knot is lower than degree.

	:rtype: gp_Pnt2d
") StartPoint;
		gp_Pnt2d StartPoint();

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this bspline curve.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****************** Weight ******************/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "Returns the weight of the pole of range index . raised if index < 1 or index > nbpoles.

	:param Index:
	:type Index: int
	:rtype: float
") Weight;
		Standard_Real Weight(const Standard_Integer Index);

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns the weights of the b-spline curve; //! raised if the length of w is not equal to nbpoles.

	:param W:
	:type W: TColStd_Array1OfReal
	:rtype: None
") Weights;
		void Weights(TColStd_Array1OfReal & W);

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns the weights of the b-spline curve;.

	:rtype: TColStd_Array1OfReal *
") Weights;
		const TColStd_Array1OfReal * Weights();

};


%make_alias(Geom2d_BSplineCurve)

%extend Geom2d_BSplineCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Geom2d_BezierCurve *
***************************/
class Geom2d_BezierCurve : public Geom2d_BoundedCurve {
	public:
		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns geomabs_cn, which is the continuity of any bezier curve.

	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this bezier curve.

	:rtype: opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For this bezier curve, computes - the point p of parameter u, or - the point p and one or more of the following values: - v1, the first derivative vector, - v2, the second derivative vector, - v3, the third derivative vector. note: the parameter u can be outside the bounds of the curve. raises rangeerror if n < 1.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Degree ******************/
		%feature("compactdefaultargs") Degree;
		%feature("autodoc", "Returns the polynomial degree of the curve. it is the number of poles less one. in this package the degree of a bezier curve cannot be greater than 'maxdegree'.

	:rtype: int
") Degree;
		Standard_Integer Degree();

		/****************** EndPoint ******************/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Returns the end point or start point of this bezier curve.

	:rtype: gp_Pnt2d
") EndPoint;
		gp_Pnt2d EndPoint();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter of this bezier curve. this is 0.0, which gives the start point of this bezier curve.

	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Geom2d_BezierCurve ******************/
		%feature("compactdefaultargs") Geom2d_BezierCurve;
		%feature("autodoc", "Creates a non rational bezier curve with a set of poles : curvepoles. the weights are defaulted to all being 1. raises constructionerror if the number of poles is greater than maxdegree + 1 or lower than 2.

	:param CurvePoles:
	:type CurvePoles: TColgp_Array1OfPnt2d
	:rtype: None
") Geom2d_BezierCurve;
		 Geom2d_BezierCurve(const TColgp_Array1OfPnt2d & CurvePoles);

		/****************** Geom2d_BezierCurve ******************/
		%feature("compactdefaultargs") Geom2d_BezierCurve;
		%feature("autodoc", "Creates a rational bezier curve with the set of poles curvepoles and the set of weights poleweights . if all the weights are identical the curve is considered as non rational. raises constructionerror if the number of poles is greater than maxdegree + 1 or lower than 2 or curvepoles and curveweights have not the same length or one weight value is lower or equal to resolution from package gp.

	:param CurvePoles:
	:type CurvePoles: TColgp_Array1OfPnt2d
	:param PoleWeights:
	:type PoleWeights: TColStd_Array1OfReal
	:rtype: None
") Geom2d_BezierCurve;
		 Geom2d_BezierCurve(const TColgp_Array1OfPnt2d & CurvePoles, const TColStd_Array1OfReal & PoleWeights);

		/****************** Increase ******************/
		%feature("compactdefaultargs") Increase;
		%feature("autodoc", "Increases the degree of a bezier curve. degree is the new degree of <self>. raises constructionerror if degree is greater than maxdegree or lower than 2 or lower than the initial degree of <self>.

	:param Degree:
	:type Degree: int
	:rtype: None
") Increase;
		void Increase(const Standard_Integer Degree);

		/****************** InsertPoleAfter ******************/
		%feature("compactdefaultargs") InsertPoleAfter;
		%feature("autodoc", "Inserts a pole with its weight in the set of poles after the pole of range index. if the curve was non rational it can become rational if all the weights are not identical. raised if index is not in the range [0, nbpoles] //! raised if the resulting number of poles is greater than maxdegree + 1.

	:param Index:
	:type Index: int
	:param P:
	:type P: gp_Pnt2d
	:param Weight: default value is 1.0
	:type Weight: float
	:rtype: None
") InsertPoleAfter;
		void InsertPoleAfter(const Standard_Integer Index, const gp_Pnt2d & P, const Standard_Real Weight = 1.0);

		/****************** InsertPoleBefore ******************/
		%feature("compactdefaultargs") InsertPoleBefore;
		%feature("autodoc", "Inserts a pole with its weight in the set of poles after the pole of range index. if the curve was non rational it can become rational if all the weights are not identical. raised if index is not in the range [1, nbpoles+1] //! raised if the resulting number of poles is greater than maxdegree + 1.

	:param Index:
	:type Index: int
	:param P:
	:type P: gp_Pnt2d
	:param Weight: default value is 1.0
	:type Weight: float
	:rtype: None
") InsertPoleBefore;
		void InsertPoleBefore(const Standard_Integer Index, const gp_Pnt2d & P, const Standard_Real Weight = 1.0);

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "Continuity of the curve, returns true.

	:param N:
	:type N: int
	:rtype: bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the distance between the first point and the last point of the curve is lower or equal to the resolution from package gp.

	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns false. a beziercurve cannot be periodic in this package.

	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "Returns false if all the weights are identical. the tolerance criterion is resolution from package gp.

	:rtype: bool
") IsRational;
		Standard_Boolean IsRational();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the value of the last parameter of this bezier curve. this is 1.0, which gives the end point of this bezier curve.

	:rtype: float
") LastParameter;
		Standard_Real LastParameter();

		/****************** MaxDegree ******************/
		%feature("compactdefaultargs") MaxDegree;
		%feature("autodoc", "Returns the value of the maximum polynomial degree of a beziercurve. this value is 25.

	:rtype: int
") MaxDegree;
		static Standard_Integer MaxDegree();

		/****************** NbPoles ******************/
		%feature("compactdefaultargs") NbPoles;
		%feature("autodoc", "Returns the number of poles for this bezier curve.

	:rtype: int
") NbPoles;
		Standard_Integer NbPoles();

		/****************** Pole ******************/
		%feature("compactdefaultargs") Pole;
		%feature("autodoc", "Returns the pole of range index. raised if index is not in the range [1, nbpoles].

	:param Index:
	:type Index: int
	:rtype: gp_Pnt2d
") Pole;
		const gp_Pnt2d Pole(const Standard_Integer Index);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns all the poles of the curve. //! raised if the length of p is not equal to the number of poles.

	:param P:
	:type P: TColgp_Array1OfPnt2d
	:rtype: None
") Poles;
		void Poles(TColgp_Array1OfPnt2d & P);

		/****************** Poles ******************/
		%feature("compactdefaultargs") Poles;
		%feature("autodoc", "Returns all the poles of the curve.

	:rtype: TColgp_Array1OfPnt2d
") Poles;
		const TColgp_Array1OfPnt2d & Poles();

		/****************** RemovePole ******************/
		%feature("compactdefaultargs") RemovePole;
		%feature("autodoc", "Removes the pole of range index. if the curve was rational it can become non rational. raised if index is not in the range [1, nbpoles].

	:param Index:
	:type Index: int
	:rtype: None
") RemovePole;
		void RemovePole(const Standard_Integer Index);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "Computes for this bezier curve the parametric tolerance utolerance for a given tolerance tolerance3d (relative to dimensions in the plane). if f(t) is the equation of this bezier curve, utolerance ensures that | t1 - t0| < utolerance ===> |f(t1) - f(t0)| < toleranceuv.

	:param ToleranceUV:
	:type ToleranceUV: float
	:param UTolerance:
	:type UTolerance: float
	:rtype: None
") Resolution;
		void Resolution(const Standard_Real ToleranceUV, Standard_Real &OutValue);

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Reverses the direction of parametrization of <self> value (newu) = value (1 - oldu).

	:rtype: None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Returns the parameter on the reversed curve for the point of parameter u on <self>. //! returns 1-u.

	:param U:
	:type U: float
	:rtype: float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** Segment ******************/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "Segments the curve between u1 and u2 which can be out of the bounds of the curve. the curve is oriented from u1 to u2. the control points are modified, the first and the last point are not the same but the parametrization range is [0, 1] else it could not be a bezier curve. warnings : even if <self> is not closed it can become closed after the segmentation for example if u1 or u2 are out of the bounds of the curve <self> or if the curve makes loop. after the segmentation the length of a curve can be null.

	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:rtype: None
") Segment;
		void Segment(const Standard_Real U1, const Standard_Real U2);

		/****************** SetPole ******************/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Substitutes the pole of range index with p. if the curve <self> is rational the weight of range index is not modified. raised if index is not in the range [1, nbpoles].

	:param Index:
	:type Index: int
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") SetPole;
		void SetPole(const Standard_Integer Index, const gp_Pnt2d & P);

		/****************** SetPole ******************/
		%feature("compactdefaultargs") SetPole;
		%feature("autodoc", "Substitutes the pole and the weights of range index. if the curve <self> is not rational it can become rational if all the weights are not identical. if the curve was rational it can become non rational if all the weights are identical. raised if index is not in the range [1, nbpoles] raised if weight <= resolution from package gp.

	:param Index:
	:type Index: int
	:param P:
	:type P: gp_Pnt2d
	:param Weight:
	:type Weight: float
	:rtype: None
") SetPole;
		void SetPole(const Standard_Integer Index, const gp_Pnt2d & P, const Standard_Real Weight);

		/****************** SetWeight ******************/
		%feature("compactdefaultargs") SetWeight;
		%feature("autodoc", "Changes the weight of the pole of range index. if the curve <self> is not rational it can become rational if all the weights are not identical. if the curve was rational it can become non rational if all the weights are identical. raised if index is not in the range [1, nbpoles] raised if weight <= resolution from package gp.

	:param Index:
	:type Index: int
	:param Weight:
	:type Weight: float
	:rtype: None
") SetWeight;
		void SetWeight(const Standard_Integer Index, const Standard_Real Weight);

		/****************** StartPoint ******************/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns value (u=1), it is the first control point of the curve.

	:rtype: gp_Pnt2d
") StartPoint;
		gp_Pnt2d StartPoint();

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this bezier curve.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****************** Weight ******************/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "Returns the weight of range index. raised if index is not in the range [1, nbpoles].

	:param Index:
	:type Index: int
	:rtype: float
") Weight;
		Standard_Real Weight(const Standard_Integer Index);

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns all the weights of the curve. //! raised if the length of w is not equal to the number of poles.

	:param W:
	:type W: TColStd_Array1OfReal
	:rtype: None
") Weights;
		void Weights(TColStd_Array1OfReal & W);

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "Returns all the weights of the curve.

	:rtype: TColStd_Array1OfReal *
") Weights;
		const TColStd_Array1OfReal * Weights();

};


%make_alias(Geom2d_BezierCurve)

%extend Geom2d_BezierCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class Geom2d_Circle *
**********************/
class Geom2d_Circle : public Geom2d_Conic {
	public:
		/****************** Circ2d ******************/
		%feature("compactdefaultargs") Circ2d;
		%feature("autodoc", "Returns the non persistent circle from gp with the same geometric properties as <self>.

	:rtype: gp_Circ2d
") Circ2d;
		gp_Circ2d Circ2d();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this circle.

	:rtype: opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. p = c + r * cos (u) * xdir + r * sin (u) * ydir where c is the center of the circle , xdir the xdirection and ydir the ydirection of the circle's local coordinate system.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the point p of parameter u and the first derivative v1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first second and third derivatives v1 v2 and v3.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this circle, computes the vector corresponding to the nth derivative. exceptions: standard_rangeerror if n is less than 1.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns 0., which is the eccentricity of any circle.

	:rtype: float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns 0.0.

	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Geom2d_Circle ******************/
		%feature("compactdefaultargs") Geom2d_Circle;
		%feature("autodoc", "Constructs a circle by conversion of the gp_circ2d circle c.

	:param C:
	:type C: gp_Circ2d
	:rtype: None
") Geom2d_Circle;
		 Geom2d_Circle(const gp_Circ2d & C);

		/****************** Geom2d_Circle ******************/
		%feature("compactdefaultargs") Geom2d_Circle;
		%feature("autodoc", "Constructs a circle of radius radius, whose center is the origin of axis a; a is the 'x axis' of the local coordinate system of the circle; this coordinate system is direct if sense is true (default value) or indirect if sense is false. note: it is possible to create a circle where radius is equal to 0.0. exceptions standard_constructionerror if radius is negative.

	:param A:
	:type A: gp_Ax2d
	:param Radius:
	:type Radius: float
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") Geom2d_Circle;
		 Geom2d_Circle(const gp_Ax2d & A, const Standard_Real Radius, const Standard_Boolean Sense = Standard_True);

		/****************** Geom2d_Circle ******************/
		%feature("compactdefaultargs") Geom2d_Circle;
		%feature("autodoc", "Constructs a circle of radius radius, where the coordinate system a locates the circle and defines its orientation in the plane such that: - the center of the circle is the origin of a, - the orientation (direct or indirect) of a gives the orientation of the circle.

	:param A:
	:type A: gp_Ax22d
	:param Radius:
	:type Radius: float
	:rtype: None
") Geom2d_Circle;
		 Geom2d_Circle(const gp_Ax22d & A, const Standard_Real Radius);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true.

	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns true. the period of a circle is 2.*pi.

	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns 2*pi.

	:rtype: float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Radius ******************/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Returns the radius of this circle.

	:rtype: float
") Radius;
		Standard_Real Radius();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed circle for the point of parameter u on this circle. for a circle, the returned value is: 2.*pi - u.

	:param U:
	:type U: float
	:rtype: float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetCirc2d ******************/
		%feature("compactdefaultargs") SetCirc2d;
		%feature("autodoc", "Converts the gp_circ2d circle c into this circle.

	:param C:
	:type C: gp_Circ2d
	:rtype: None
") SetCirc2d;
		void SetCirc2d(const gp_Circ2d & C);

		/****************** SetRadius ******************/
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	:param R:
	:type R: float
	:rtype: None
") SetRadius;
		void SetRadius(const Standard_Real R);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this circle.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform(const gp_Trsf2d & T);

};


%make_alias(Geom2d_Circle)

%extend Geom2d_Circle {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Geom2d_Ellipse *
***********************/
class Geom2d_Ellipse : public Geom2d_Conic {
	public:
		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this ellipse.

	:rtype: opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. p = c + majorradius * cos (u) * xdir + minorradius * sin (u) * ydir where c is the center of the ellipse , xdir the direction of the 'xaxis' and 'ydir' the 'yaxis' of the ellipse.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u. the vectors v1 and v2 are the first and second derivatives at this point.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first second and third derivatives v1 v2 and v3.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this ellipse, computes the vector corresponding to the nth derivative. exceptions standard_rangeerror if n is less than 1.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Directrix1 ******************/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "Computes the directrices of this ellipse. this directrix is the line normal to the xaxis of the ellipse in the local plane (z = 0) at a distance d = majorradius / e from the center of the ellipse, where e is the eccentricity of the ellipse. this line is parallel to the 'yaxis'. the intersection point between directrix1 and the 'xaxis' is the 'location' point of the directrix1. this point is on the positive side of the 'xaxis'. raises constructionerror if eccentricity = 0.0. (the ellipse degenerates into a circle).

	:rtype: gp_Ax2d
") Directrix1;
		gp_Ax2d Directrix1();

		/****************** Directrix2 ******************/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "This line is obtained by the symmetrical transformation of 'directrix1' with respect to the 'yaxis' of the ellipse. raises constructionerror if eccentricity = 0.0. (the ellipse degenerates into a circle).

	:rtype: gp_Ax2d
") Directrix2;
		gp_Ax2d Directrix2();

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the eccentricity of the ellipse between 0.0 and 1.0 if f is the distance between the center of the ellipse and the focus1 then the eccentricity e = f / majorradius. returns 0 if majorradius = 0.

	:rtype: float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** Elips2d ******************/
		%feature("compactdefaultargs") Elips2d;
		%feature("autodoc", "Converts this ellipse into a gp_elips2d ellipse.

	:rtype: gp_Elips2d
") Elips2d;
		gp_Elips2d Elips2d();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter of this ellipse. this is 0.0, which gives the start point of this ellipse. the start point and end point of an ellipse are coincident.

	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Computes the focal distance. the focal distance is the distance between the center and a focus of the ellipse.

	:rtype: float
") Focal;
		Standard_Real Focal();

		/****************** Focus1 ******************/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Returns the first focus of the ellipse. this focus is on the positive side of the 'xaxis' of the ellipse.

	:rtype: gp_Pnt2d
") Focus1;
		gp_Pnt2d Focus1();

		/****************** Focus2 ******************/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Returns the second focus of the ellipse. this focus is on the negative side of the 'xaxis' of the ellipse.

	:rtype: gp_Pnt2d
") Focus2;
		gp_Pnt2d Focus2();

		/****************** Geom2d_Ellipse ******************/
		%feature("compactdefaultargs") Geom2d_Ellipse;
		%feature("autodoc", "Creates an ellipse by conversion of the gp_elips2d ellipse e.

	:param E:
	:type E: gp_Elips2d
	:rtype: None
") Geom2d_Ellipse;
		 Geom2d_Ellipse(const gp_Elips2d & E);

		/****************** Geom2d_Ellipse ******************/
		%feature("compactdefaultargs") Geom2d_Ellipse;
		%feature("autodoc", "Creates an ellipse defined by its major and minor radii, majorradius and minorradius, and positioned in the plane by its major axis majoraxis; the center of the ellipse is the origin of majoraxis and the unit vector of majoraxis is the 'x direction' of the local coordinate system of the ellipse; this coordinate system is direct if sense is true (default value) or indirect if sense is false. warnings : it is not forbidden to create an ellipse with majorradius = minorradius. exceptions standard_constructionerror if: - majorradius is less than minorradius, or - minorradius is less than 0.

	:param MajorAxis:
	:type MajorAxis: gp_Ax2d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") Geom2d_Ellipse;
		 Geom2d_Ellipse(const gp_Ax2d & MajorAxis, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Boolean Sense = Standard_True);

		/****************** Geom2d_Ellipse ******************/
		%feature("compactdefaultargs") Geom2d_Ellipse;
		%feature("autodoc", "Creates an ellipse defined by its major and minor radii, majorradius and minorradius, where the coordinate system axis locates the ellipse and defines its orientation in the plane such that: - the center of the ellipse is the origin of axis, - the 'x direction' of axis defines the major axis of the ellipse, - the 'y direction' of axis defines the minor axis of the ellipse, - the orientation of axis (direct or indirect) gives the orientation of the ellipse. warnings : it is not forbidden to create an ellipse with majorradius = minorradius. exceptions standard_constructionerror if: - majorradius is less than minorradius, or - minorradius is less than 0.

	:param Axis:
	:type Axis: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") Geom2d_Ellipse;
		 Geom2d_Ellipse(const gp_Ax22d & Axis, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return true.

	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return true.

	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the value of the last parameter of this ellipse. this is 2.*pi, which gives the end point of this ellipse. the start point and end point of an ellipse are coincident.

	:rtype: float
") LastParameter;
		Standard_Real LastParameter();

		/****************** MajorRadius ******************/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major radius of this ellipse.

	:rtype: float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the minor radius of this ellipse.

	:rtype: float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Computes the parameter of this ellipse. this value is given by the formula p = (1 - e * e) * majorradius where e is the eccentricity of the ellipse. returns 0 if majorradius = 0.

	:rtype: float
") Parameter;
		Standard_Real Parameter();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed ellipse for the point of parameter u on this ellipse. for an ellipse, the returned value is: 2.*pi - u.

	:param U:
	:type U: float
	:rtype: float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetElips2d ******************/
		%feature("compactdefaultargs") SetElips2d;
		%feature("autodoc", "Converts the gp_elips2d ellipse e into this ellipse.

	:param E:
	:type E: gp_Elips2d
	:rtype: None
") SetElips2d;
		void SetElips2d(const gp_Elips2d & E);

		/****************** SetMajorRadius ******************/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "Assigns a value to the major radius of this ellipse. exceptions standard_constructionerror if: - the major radius of this ellipse becomes less than the minor radius, or - minorradius is less than 0.

	:param MajorRadius:
	:type MajorRadius: float
	:rtype: None
") SetMajorRadius;
		void SetMajorRadius(const Standard_Real MajorRadius);

		/****************** SetMinorRadius ******************/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "Assigns a value to the minor radius of this ellipse. exceptions standard_constructionerror if: - the major radius of this ellipse becomes less than the minor radius, or - minorradius is less than 0.

	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real MinorRadius);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this ellipse.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform(const gp_Trsf2d & T);

};


%make_alias(Geom2d_Ellipse)

%extend Geom2d_Ellipse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class Geom2d_Hyperbola *
*************************/
class Geom2d_Hyperbola : public Geom2d_Conic {
	public:
		/****************** Asymptote1 ******************/
		%feature("compactdefaultargs") Asymptote1;
		%feature("autodoc", "In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = (b/a)*x where a is the major radius of the hyperbola and b is the minor radius of the hyperbola. raised if majorradius = 0.0.

	:rtype: gp_Ax2d
") Asymptote1;
		gp_Ax2d Asymptote1();

		/****************** Asymptote2 ******************/
		%feature("compactdefaultargs") Asymptote2;
		%feature("autodoc", "In the local coordinate system of the hyperbola the equation of the hyperbola is (x*x)/(a*a) - (y*y)/(b*b) = 1.0 and the equation of the first asymptote is y = -(b/a)*x. where a is the major radius of the hyperbola and b is the minor radius of the hyperbola. raised if majorradius = 0.0.

	:rtype: gp_Ax2d
") Asymptote2;
		gp_Ax2d Asymptote2();

		/****************** ConjugateBranch1 ******************/
		%feature("compactdefaultargs") ConjugateBranch1;
		%feature("autodoc", "Computes the first conjugate branch relative to this hyperbola. note: the diagram given under the class purpose indicates where these two branches of hyperbola are positioned in relation to this branch of hyperbola.

	:rtype: gp_Hypr2d
") ConjugateBranch1;
		gp_Hypr2d ConjugateBranch1();

		/****************** ConjugateBranch2 ******************/
		%feature("compactdefaultargs") ConjugateBranch2;
		%feature("autodoc", "Computes the second conjugate branch relative to this hyperbola. note: the diagram given under the class purpose indicates where these two branches of hyperbola are positioned in relation to this branch of hyperbola.

	:rtype: gp_Hypr2d
") ConjugateBranch2;
		gp_Hypr2d ConjugateBranch2();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object which is a copy of this hyperbola.

	:rtype: opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. p = c + majorradius * cosh (u) * xdir + minorradius * sinh (u) * ydir where c is the center of the hyperbola , xdir the xdirection and ydir the ydirection of the hyperbola's local coordinate system.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the point p of parameter u and the first derivative v1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first second and third derivatives v1 v2 and v3.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this hyperbola, computes the vector corresponding to the nth derivative. exceptions standard_rangeerror if n is less than 1.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Directrix1 ******************/
		%feature("compactdefaultargs") Directrix1;
		%feature("autodoc", "This directrix is the line normal to the xaxis of the hyperbola in the local plane (z = 0) at a distance d = majorradius / e from the center of the hyperbola, where e is the eccentricity of the hyperbola. this line is parallel to the 'yaxis'. the intersection point between directrix1 and the 'xaxis' is the location point of the directrix1. this point is on the positive side of the 'xaxis'.

	:rtype: gp_Ax2d
") Directrix1;
		gp_Ax2d Directrix1();

		/****************** Directrix2 ******************/
		%feature("compactdefaultargs") Directrix2;
		%feature("autodoc", "This line is obtained by the symmetrical transformation of 'directrix1' with respect to the 'yaxis' of the hyperbola.

	:rtype: gp_Ax2d
") Directrix2;
		gp_Ax2d Directrix2();

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the excentricity of the hyperbola (e > 1). if f is the distance between the location of the hyperbola and the focus1 then the eccentricity e = f / majorradius. raised if majorradius = 0.0.

	:rtype: float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns realfirst from standard.

	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Computes the focal distance. it is the distance between the two focus of the hyperbola.

	:rtype: float
") Focal;
		Standard_Real Focal();

		/****************** Focus1 ******************/
		%feature("compactdefaultargs") Focus1;
		%feature("autodoc", "Returns the first focus of the hyperbola. this focus is on the positive side of the 'xaxis' of the hyperbola.

	:rtype: gp_Pnt2d
") Focus1;
		gp_Pnt2d Focus1();

		/****************** Focus2 ******************/
		%feature("compactdefaultargs") Focus2;
		%feature("autodoc", "Returns the second focus of the hyperbola. this focus is on the negative side of the 'xaxis' of the hyperbola.

	:rtype: gp_Pnt2d
") Focus2;
		gp_Pnt2d Focus2();

		/****************** Geom2d_Hyperbola ******************/
		%feature("compactdefaultargs") Geom2d_Hyperbola;
		%feature("autodoc", "Creates an hyperbola from a non persistent one from package gp.

	:param H:
	:type H: gp_Hypr2d
	:rtype: None
") Geom2d_Hyperbola;
		 Geom2d_Hyperbola(const gp_Hypr2d & H);

		/****************** Geom2d_Hyperbola ******************/
		%feature("compactdefaultargs") Geom2d_Hyperbola;
		%feature("autodoc", "Majoraxis is the 'xaxis' of the hyperbola. the yaxis is in the direct sense if 'sense' is true; the major radius of the hyperbola is on this 'xaxis' and the minor radius is on the 'yaxis' of the hyperbola. raised if majorradius < 0.0 or if minorradius < 0.0.

	:param MajorAxis:
	:type MajorAxis: gp_Ax2d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") Geom2d_Hyperbola;
		 Geom2d_Hyperbola(const gp_Ax2d & MajorAxis, const Standard_Real MajorRadius, const Standard_Real MinorRadius, const Standard_Boolean Sense = Standard_True);

		/****************** Geom2d_Hyperbola ******************/
		%feature("compactdefaultargs") Geom2d_Hyperbola;
		%feature("autodoc", "The xdirection of 'axis' is the 'xaxis' of the hyperbola and the ydirection of 'axis' is the 'yaxis'. the major radius of the hyperbola is on this 'xaxis' and the minor radius is on the 'yaxis' of the hyperbola. raised if majorradius < 0.0 or if minorradius < 0.0.

	:param Axis:
	:type Axis: gp_Ax22d
	:param MajorRadius:
	:type MajorRadius: float
	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") Geom2d_Hyperbola;
		 Geom2d_Hyperbola(const gp_Ax22d & Axis, const Standard_Real MajorRadius, const Standard_Real MinorRadius);

		/****************** Hypr2d ******************/
		%feature("compactdefaultargs") Hypr2d;
		%feature("autodoc", "Converts this hyperbola into a gp_hypr2d one.

	:rtype: gp_Hypr2d
") Hypr2d;
		gp_Hypr2d Hypr2d();

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns false.

	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Return false for an hyperbola.

	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns reallast from standard.

	:rtype: float
") LastParameter;
		Standard_Real LastParameter();

		/****************** MajorRadius ******************/
		%feature("compactdefaultargs") MajorRadius;
		%feature("autodoc", "Returns the major or minor radius of this hyperbola. the major radius is also the distance between the center of the hyperbola and the apex of the main branch (located on the 'x axis' of the hyperbola).

	:rtype: float
") MajorRadius;
		Standard_Real MajorRadius();

		/****************** MinorRadius ******************/
		%feature("compactdefaultargs") MinorRadius;
		%feature("autodoc", "Returns the major or minor radius of this hyperbola. the minor radius is also the distance between the center of the hyperbola and the apex of a conjugate branch (located on the 'y axis' of the hyperbola).

	:rtype: float
") MinorRadius;
		Standard_Real MinorRadius();

		/****************** OtherBranch ******************/
		%feature("compactdefaultargs") OtherBranch;
		%feature("autodoc", "Computes the 'other' branch of this hyperbola. this is a symmetrical branch with respect to the center of this hyperbola. note: the diagram given under the class purpose indicates where the 'other' branch is positioned in relation to this branch of the hyperbola. ^ yaxis | firstconjugatebranch | other | main ---------------------------- c ------------------------------------------&gtxaxis branch | branch | | secondconjugatebranch | warning the major radius can be less than the minor radius.

	:rtype: gp_Hypr2d
") OtherBranch;
		gp_Hypr2d OtherBranch();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Computes the parameter of this hyperbola. the parameter is: p = (e*e - 1) * majorradius where e is the eccentricity of this hyperbola and majorradius its major radius. exceptions standard_domainerror if the major radius of this hyperbola is null.

	:rtype: float
") Parameter;
		Standard_Real Parameter();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed hyperbola, for the point of parameter u on this hyperbola. for a hyperbola, the returned value is -u.

	:param U:
	:type U: float
	:rtype: float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetHypr2d ******************/
		%feature("compactdefaultargs") SetHypr2d;
		%feature("autodoc", "Converts the gp_hypr2d hyperbola h into this hyperbola.

	:param H:
	:type H: gp_Hypr2d
	:rtype: None
") SetHypr2d;
		void SetHypr2d(const gp_Hypr2d & H);

		/****************** SetMajorRadius ******************/
		%feature("compactdefaultargs") SetMajorRadius;
		%feature("autodoc", "Assigns a value to the major or minor radius of this hyperbola. exceptions standard_constructionerror if: - majorradius is less than 0.0, - minorradius is less than 0.0.

	:param MajorRadius:
	:type MajorRadius: float
	:rtype: None
") SetMajorRadius;
		void SetMajorRadius(const Standard_Real MajorRadius);

		/****************** SetMinorRadius ******************/
		%feature("compactdefaultargs") SetMinorRadius;
		%feature("autodoc", "Assigns a value to the major or minor radius of this hyperbola. exceptions standard_constructionerror if: - majorradius is less than 0.0, - minorradius is less than 0.0.

	:param MinorRadius:
	:type MinorRadius: float
	:rtype: None
") SetMinorRadius;
		void SetMinorRadius(const Standard_Real MinorRadius);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this hyperbola.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform(const gp_Trsf2d & T);

};


%make_alias(Geom2d_Hyperbola)

%extend Geom2d_Hyperbola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class Geom2d_Parabola *
************************/
class Geom2d_Parabola : public Geom2d_Conic {
	public:
		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object, which is a copy of this parabola.

	:rtype: opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "Returns in p the point of parameter u. if u = 0 the returned point is the origin of the xaxis and the yaxis of the parabola and it is the vertex of the parabola. p = s + f * (u * u * xdir + * u * ydir) where s is the vertex of the parabola, xdir the xdirection and ydir the ydirection of the parabola's local coordinate system.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Returns the point p of parameter u and the first derivative v1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Returns the point p of parameter u, the first and second derivatives v1 and v2.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Returns the point p of parameter u, the first second and third derivatives v1 v2 and v3.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this parabola, computes the vector corresponding to the nth derivative. exceptions standard_rangeerror if n is less than 1.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** Directrix ******************/
		%feature("compactdefaultargs") Directrix;
		%feature("autodoc", "The directrix is parallel to the 'yaxis' of the parabola. the 'location' point of the directrix is the intersection point between the directrix and the symmetry axis ('xaxis') of the parabola.

	:rtype: gp_Ax2d
") Directrix;
		gp_Ax2d Directrix();

		/****************** Eccentricity ******************/
		%feature("compactdefaultargs") Eccentricity;
		%feature("autodoc", "Returns the eccentricity e = 1.0.

	:rtype: float
") Eccentricity;
		Standard_Real Eccentricity();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns realfirst from standard.

	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Focal ******************/
		%feature("compactdefaultargs") Focal;
		%feature("autodoc", "Computes the focal length of this parabola. the focal length is the distance between the apex and the focus of the parabola.

	:rtype: float
") Focal;
		Standard_Real Focal();

		/****************** Focus ******************/
		%feature("compactdefaultargs") Focus;
		%feature("autodoc", "Computes the focus of this parabola the focus is on the positive side of the 'x axis' of the local coordinate system of the parabola.

	:rtype: gp_Pnt2d
") Focus;
		gp_Pnt2d Focus();

		/****************** Geom2d_Parabola ******************/
		%feature("compactdefaultargs") Geom2d_Parabola;
		%feature("autodoc", "Creates a parabola from a non persistent one.

	:param Prb:
	:type Prb: gp_Parab2d
	:rtype: None
") Geom2d_Parabola;
		 Geom2d_Parabola(const gp_Parab2d & Prb);

		/****************** Geom2d_Parabola ******************/
		%feature("compactdefaultargs") Geom2d_Parabola;
		%feature("autodoc", "Creates a parabola with its 'mirroraxis' and it's focal length 'focal'. mirroraxis is the axis of symmetry of the curve, it is the 'xaxis'. the 'yaxis' is parallel to the directrix of the parabola and is in the direct sense if sense is true. the 'location' point of 'mirroraxis' is the vertex of the parabola raised if focal < 0.0.

	:param MirrorAxis:
	:type MirrorAxis: gp_Ax2d
	:param Focal:
	:type Focal: float
	:param Sense: default value is Standard_True
	:type Sense: bool
	:rtype: None
") Geom2d_Parabola;
		 Geom2d_Parabola(const gp_Ax2d & MirrorAxis, const Standard_Real Focal, const Standard_Boolean Sense = Standard_True);

		/****************** Geom2d_Parabola ******************/
		%feature("compactdefaultargs") Geom2d_Parabola;
		%feature("autodoc", "Creates a parabola with its axis and it's focal length 'focal'. the xdirection of axis is the axis of symmetry of the curve, it is the 'xaxis'. the 'yaxis' is parallel to the directrix of the parabola. the 'location' point of 'axis' is the vertex of the parabola. raised if focal < 0.0.

	:param Axis:
	:type Axis: gp_Ax22d
	:param Focal:
	:type Focal: float
	:rtype: None
") Geom2d_Parabola;
		 Geom2d_Parabola(const gp_Ax22d & Axis, const Standard_Real Focal);

		/****************** Geom2d_Parabola ******************/
		%feature("compactdefaultargs") Geom2d_Parabola;
		%feature("autodoc", "D is the directrix of the parabola and f the focus point. the symmetry axis 'xaxis' of the parabola is normal to the directrix and pass through the focus point f, but its 'location' point is the vertex of the parabola. the 'yaxis' of the parabola is parallel to d and its 'location' point is the vertex of the parabola.

	:param D:
	:type D: gp_Ax2d
	:param F:
	:type F: gp_Pnt2d
	:rtype: None
") Geom2d_Parabola;
		 Geom2d_Parabola(const gp_Ax2d & D, const gp_Pnt2d & F);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns false.

	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Returns false.

	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns reallast from standard.

	:rtype: float
") LastParameter;
		Standard_Real LastParameter();

		/****************** Parab2d ******************/
		%feature("compactdefaultargs") Parab2d;
		%feature("autodoc", "Returns the non persistent parabola from gp with the same geometric properties as <self>.

	:rtype: gp_Parab2d
") Parab2d;
		gp_Parab2d Parab2d();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Computes the parameter of this parabola, which is the distance between its focus and its directrix. this distance is twice the focal length. if p is the parameter of the parabola, the equation of the parabola in its local coordinate system is: y**2 = 2.*p*x.

	:rtype: float
") Parameter;
		Standard_Real Parameter();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! transformed(t)->value(u * parametrictransformation(t)) //! is the same point as //! value(u).transformed(t) //! this methods returns t.scalefactor().

	:param T:
	:type T: gp_Trsf2d
	:rtype: float
") ParametricTransformation;
		Standard_Real ParametricTransformation(const gp_Trsf2d & T);

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Computes the parameter on the reversed parabola for the point of parameter u on this parabola. for a parabola, the returned value is -u.

	:param U:
	:type U: float
	:rtype: float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetFocal ******************/
		%feature("compactdefaultargs") SetFocal;
		%feature("autodoc", "Assigns the value focal to the focal length of this parabola. exceptions standard_constructionerror if focal is negative.

	:param Focal:
	:type Focal: float
	:rtype: None
") SetFocal;
		void SetFocal(const Standard_Real Focal);

		/****************** SetParab2d ******************/
		%feature("compactdefaultargs") SetParab2d;
		%feature("autodoc", "Converts the gp_parab2d parabola prb into this parabola.

	:param Prb:
	:type Prb: gp_Parab2d
	:rtype: None
") SetParab2d;
		void SetParab2d(const gp_Parab2d & Prb);

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this parabola.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****************** TransformedParameter ******************/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "Computes the parameter on the transformed parabola, for the point of parameter u on this parabola. for a parabola, the returned value is equal to u multiplied by the scale factor of transformation t.

	:param U:
	:type U: float
	:param T:
	:type T: gp_Trsf2d
	:rtype: float
") TransformedParameter;
		Standard_Real TransformedParameter(const Standard_Real U, const gp_Trsf2d & T);

};


%make_alias(Geom2d_Parabola)

%extend Geom2d_Parabola {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Geom2d_TrimmedCurve *
****************************/
class Geom2d_TrimmedCurve : public Geom2d_BoundedCurve {
	public:
		/****************** BasisCurve ******************/
		%feature("compactdefaultargs") BasisCurve;
		%feature("autodoc", "Returns the basis curve. warning this function does not return a constant reference. consequently, any modification of the returned value directly modifies the trimmed curve.

	:rtype: opencascade::handle<Geom2d_Curve>
") BasisCurve;
		opencascade::handle<Geom2d_Curve> BasisCurve();

		/****************** Continuity ******************/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "Returns the global continuity of the basis curve of this trimmed curve. c0 : only geometric continuity, c1 : continuity of the first derivative all along the curve, c2 : continuity of the second derivative all along the curve, c3 : continuity of the third derivative all along the curve, cn : the order of continuity is infinite.

	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity();

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Creates a new object, which is a copy of this trimmed curve.

	:rtype: opencascade::handle<Geom2d_Geometry>
") Copy;
		opencascade::handle<Geom2d_Geometry> Copy();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "If the basis curve is an offsetcurve sometimes it is not possible to do the evaluation of the curve at the parameter u (see class offsetcurve).

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0(const Standard_Real U, gp_Pnt2d & P);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "Raised if the continuity of the curve is not c1.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") D1;
		void D1(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "Raised if the continuity of the curve is not c2.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		void D2(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****************** D3 ******************/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "Raised if the continuity of the curve is not c3.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") D3;
		void D3(const Standard_Real U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****************** DN ******************/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "For the point of parameter u of this trimmed curve, computes the vector corresponding to the nth derivative. warning the returned derivative vector has the same orientation as the derivative vector of the basis curve, even if the trimmed curve does not have the same orientation as the basis curve. exceptions standard_rangeerror if n is less than 1. geometric transformations.

	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN(const Standard_Real U, const Standard_Integer N);

		/****************** EndPoint ******************/
		%feature("compactdefaultargs") EndPoint;
		%feature("autodoc", "Returns the end point of <self>. this point is the evaluation of the curve for the 'lastparameter'.

	:rtype: gp_Pnt2d
") EndPoint;
		gp_Pnt2d EndPoint();

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "Returns the value of the first parameter of <self>. the first parameter is the parameter of the 'startpoint' of the trimmed curve.

	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter();

		/****************** Geom2d_TrimmedCurve ******************/
		%feature("compactdefaultargs") Geom2d_TrimmedCurve;
		%feature("autodoc", "Creates a trimmed curve from the basis curve c limited between u1 and u2. //! . u1 can be greater or lower than u2. . the returned curve is oriented from u1 to u2. . if the basis curve c is periodic there is an ambiguity because two parts are available. in this case by default the trimmed curve has the same orientation as the basis curve (sense = true). if sense = false then the orientation of the trimmed curve is opposite to the orientation of the basis curve c. if the curve is closed but not periodic it is not possible to keep the part of the curve including the junction point (except if the junction point is at the beginning or at the end of the trimmed curve) because you could lose the fundamental characteristics of the basis curve which are used for example to compute the derivatives of the trimmed curve. so for a closed curve the rules are the same as for a open curve. warnings : in this package the entities are not shared. the trimmedcurve is built with a copy of the curve c. so when c is modified the trimmedcurve is not modified warnings : if <c> is periodic and <theadjustperiodic> is true, parametrics bounds of the trimmedcurve, can be different to [<u1>;<u2>}, if <u1> or <u2> are not in the principal period. include : for more explanation see the scheme given with this class. raises constructionerror the c is not periodic and u1 or u2 are out of the bounds of c. raised if u1 = u2.

	:param C:
	:type C: Geom2d_Curve
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Sense: default value is Standard_True
	:type Sense: bool
	:param theAdjustPeriodic: default value is Standard_True
	:type theAdjustPeriodic: bool
	:rtype: None
") Geom2d_TrimmedCurve;
		 Geom2d_TrimmedCurve(const opencascade::handle<Geom2d_Curve> & C, const Standard_Real U1, const Standard_Real U2, const Standard_Boolean Sense = Standard_True, const Standard_Boolean theAdjustPeriodic = Standard_True);

		/****************** IsCN ******************/
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "--- purpose returns true if the order of continuity of the trimmed curve is n. a trimmed curve is at least 'c0' continuous. warnings : the continuity of the trimmed curve can be greater than the continuity of the basis curve because you consider only a part of the basis curve. raised if n < 0.

	:param N:
	:type N: int
	:rtype: bool
") IsCN;
		Standard_Boolean IsCN(const Standard_Integer N);

		/****************** IsClosed ******************/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Returns true if the distance between the startpoint and the endpoint is lower or equal to resolution from package gp.

	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed();

		/****************** IsPeriodic ******************/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "Always returns false (independently of the type of basis curve).

	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic();

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "Returns the value of the last parameter of <self>. the last parameter is the parameter of the 'endpoint' of the trimmed curve.

	:rtype: float
") LastParameter;
		Standard_Real LastParameter();

		/****************** ParametricTransformation ******************/
		%feature("compactdefaultargs") ParametricTransformation;
		%feature("autodoc", "Returns a coefficient to compute the parameter on the transformed curve for the transform of the point on <self>. //! transformed(t)->value(u * parametrictransformation(t)) //! is the same point as //! value(u).transformed(t) //! this methods calls the basis curve method.

	:param T:
	:type T: gp_Trsf2d
	:rtype: float
") ParametricTransformation;
		virtual Standard_Real ParametricTransformation(const gp_Trsf2d & T);

		/****************** Period ******************/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "Returns the period of the basis curve of this trimmed curve. exceptions standard_nosuchobject if the basis curve is not periodic.

	:rtype: float
") Period;
		virtual Standard_Real Period();

		/****************** Reverse ******************/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Changes the direction of parametrization of <self>. the first and the last parametric values are modified. the 'startpoint' of the initial curve becomes the 'endpoint' of the reversed curve and the 'endpoint' of the initial curve becomes the 'startpoint' of the reversed curve. example - if the trimmed curve is defined by: - a basis curve whose parameter range is [ 0.,1. ], and - the two trim values u1 (first parameter) and u2 (last parameter), the reversed trimmed curve is defined by: - the reversed basis curve, whose parameter range is still [ 0.,1. ], and - the two trim values 1. - u2 (first parameter) and 1. - u1 (last parameter).

	:rtype: None
") Reverse;
		void Reverse();

		/****************** ReversedParameter ******************/
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "Returns the parameter on the reversed curve for the point of parameter u on <self>. //! returns ufirst + ulast - u.

	:param U:
	:type U: float
	:rtype: float
") ReversedParameter;
		Standard_Real ReversedParameter(const Standard_Real U);

		/****************** SetTrim ******************/
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "Changes this trimmed curve, by redefining the parameter values u1 and u2, which limit its basis curve. note: if the basis curve is periodic, the trimmed curve has the same orientation as the basis curve if sense is true (default value) or the opposite orientation if sense is false. warning if the basis curve is periodic and theadjustperiodic is true, the bounds of the trimmed curve may be different from u1 and u2 if the parametric origin of the basis curve is within the arc of the trimmed curve. in this case, the modified parameter will be equal to u1 or u2 plus or minus the period. if theadjustperiodic is false, parameters u1 and u2 will stay unchanged. exceptions standard_constructionerror if: - the basis curve is not periodic, and either u1 or u2 are outside the bounds of the basis curve, or - u1 is equal to u2.

	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Sense: default value is Standard_True
	:type Sense: bool
	:param theAdjustPeriodic: default value is Standard_True
	:type theAdjustPeriodic: bool
	:rtype: None
") SetTrim;
		void SetTrim(const Standard_Real U1, const Standard_Real U2, const Standard_Boolean Sense = Standard_True, const Standard_Boolean theAdjustPeriodic = Standard_True);

		/****************** StartPoint ******************/
		%feature("compactdefaultargs") StartPoint;
		%feature("autodoc", "Returns the start point of <self>. this point is the evaluation of the curve from the 'firstparameter'. value and derivatives warnings : the returned derivatives have the same orientation as the derivatives of the basis curve.

	:rtype: gp_Pnt2d
") StartPoint;
		gp_Pnt2d StartPoint();

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Applies the transformation t to this trimmed curve. warning the basis curve is also modified.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform(const gp_Trsf2d & T);

		/****************** TransformedParameter ******************/
		%feature("compactdefaultargs") TransformedParameter;
		%feature("autodoc", "Returns the parameter on the transformed curve for the transform of the point of parameter u on <self>. //! me->transformed(t)->value(me->transformedparameter(u,t)) //! is the same point as //! me->value(u).transformed(t) //! this methods calls the basis curve method.

	:param U:
	:type U: float
	:param T:
	:type T: gp_Trsf2d
	:rtype: float
") TransformedParameter;
		virtual Standard_Real TransformedParameter(const Standard_Real U, const gp_Trsf2d & T);

};


%make_alias(Geom2d_TrimmedCurve)

%extend Geom2d_TrimmedCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
