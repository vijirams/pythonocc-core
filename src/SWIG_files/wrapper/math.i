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
%define MATHDOCSTRING
"math module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_math.html"
%enddef
%module (package="OCC.Core", docstring=MATHDOCSTRING) math


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
#include<math_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Message_module.hxx>
#include<gp_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Precision_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import Message.i
%import gp.i
/* public enums */
enum math_Status {
	math_OK = 0,
	math_TooManyIterations = 1,
	math_FunctionError = 2,
	math_DirectionSearchError = 3,
	math_NotBracketed = 4,
};

/* end public enums declaration */

/* handles */
/* end handles declaration */

/* templates */
%template(math_Array1OfValueAndWeight) NCollection_Array1<math_ValueAndWeight>;

%extend NCollection_Array1<math_ValueAndWeight> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<math_ValueAndWeight> math_Array1OfValueAndWeight;
/* end typedefs declaration */

/*********************
* class PSO_Particle *
*********************/
/*************
* class math *
*************/
%rename(math) math;
class math {
	public:
		/****************** GaussPoints ******************/
		%feature("compactdefaultargs") GaussPoints;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Points:
	:type Points: math_Vector
	:rtype: None
") GaussPoints;
		static void GaussPoints(const Standard_Integer Index, math_Vector & Points);

		/****************** GaussPointsMax ******************/
		%feature("compactdefaultargs") GaussPointsMax;
		%feature("autodoc", "	:rtype: int
") GaussPointsMax;
		static Standard_Integer GaussPointsMax();

		/****************** GaussWeights ******************/
		%feature("compactdefaultargs") GaussWeights;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Weights:
	:type Weights: math_Vector
	:rtype: None
") GaussWeights;
		static void GaussWeights(const Standard_Integer Index, math_Vector & Weights);

		/****************** KronrodPointsAndWeights ******************/
		%feature("compactdefaultargs") KronrodPointsAndWeights;
		%feature("autodoc", "Returns a vector of kronrod points and a vector of their weights for gauss-kronrod computation method. index should be odd and greater then or equal to 3, as the number of kronrod points is equal to 2*n + 1, where n is a number of gauss points. points and weights should have the size equal to index. each even element of points represents a gauss point value of n-th gauss quadrature. the values from index equal to 3 to 123 are stored in a table (see the file math_kronrod.cxx). if index is greater, then points and weights will be computed. returns standard_true if index is odd, it is equal to the size of points and weights and the computation of points and weights is performed successfully. otherwise this method returns standard_false.

	:param Index:
	:type Index: int
	:param Points:
	:type Points: math_Vector
	:param Weights:
	:type Weights: math_Vector
	:rtype: bool
") KronrodPointsAndWeights;
		static Standard_Boolean KronrodPointsAndWeights(const Standard_Integer Index, math_Vector & Points, math_Vector & Weights);

		/****************** KronrodPointsMax ******************/
		%feature("compactdefaultargs") KronrodPointsMax;
		%feature("autodoc", "Returns the maximal number of points for that the values are stored in the table. if the number is greater then kronrodpointsmax, the points will be computed.

	:rtype: int
") KronrodPointsMax;
		static Standard_Integer KronrodPointsMax();

		/****************** OrderedGaussPointsAndWeights ******************/
		%feature("compactdefaultargs") OrderedGaussPointsAndWeights;
		%feature("autodoc", "Returns a vector of gauss points and a vector of their weights. the difference with the method gausspoints is the following: - the points are returned in increasing order. - if index is greater then gausspointsmax, the points are computed. returns standard_true if index is positive, points' and weights' length is equal to index, points and weights are successfully computed.

	:param Index:
	:type Index: int
	:param Points:
	:type Points: math_Vector
	:param Weights:
	:type Weights: math_Vector
	:rtype: bool
") OrderedGaussPointsAndWeights;
		static Standard_Boolean OrderedGaussPointsAndWeights(const Standard_Integer Index, math_Vector & Points, math_Vector & Weights);

};


%extend math {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class math_BFGS *
******************/
class math_BFGS {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Returns the gradient vector at the minimum. exception notdone is raised if the minimum was not found.

	:rtype: math_Vector
") Gradient;
		const math_Vector & Gradient();

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Returns the value of the gradient vector at the minimum in grad. exception notdone is raised if the minimum was not found. exception dimensionerror is raised if the range of grad is not equal to the range of the startingpoint.

	:param Grad:
	:type Grad: math_Vector
	:rtype: None
") Gradient;
		void Gradient(math_Vector & Grad);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsSolutionReached ******************/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "This method is called at the end of each iteration to check if the solution is found. it can be redefined in a sub-class to implement a specific test to stop the iterations.

	:param F:
	:type F: math_MultipleVarFunctionWithGradient
	:rtype: bool
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_MultipleVarFunctionWithGradient & F);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location vector of the minimum. exception notdone is raised if the minimum was not found.

	:rtype: math_Vector
") Location;
		const math_Vector & Location();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Outputs the location vector of the minimum in loc. exception notdone is raised if the minimum was not found. exception dimensionerror is raised if the range of loc is not equal to the range of the startingpoint.

	:param Loc:
	:type Loc: math_Vector
	:rtype: None
") Location;
		void Location(math_Vector & Loc);

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Returns the value of the minimum. exception notdone is raised if the minimum was not found.

	:rtype: float
") Minimum;
		Standard_Real Minimum();

		/****************** NbIterations ******************/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Returns the number of iterations really done in the calculation of the minimum. the exception notdone is raised if the minimum was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Given the starting point startingpoint, minimization is done on the function f. the solution f = fi is found when : 2.0 * abs(fi - fi-1) <= tolerance * (abs(fi) + abs(fi-1) + zeps). tolerance, zeps and maximum number of iterations are given in the constructor.

	:param F:
	:type F: math_MultipleVarFunctionWithGradient
	:param StartingPoint:
	:type StartingPoint: math_Vector
	:rtype: None
") Perform;
		void Perform(math_MultipleVarFunctionWithGradient & F, const math_Vector & StartingPoint);

		/****************** SetBoundary ******************/
		%feature("compactdefaultargs") SetBoundary;
		%feature("autodoc", "Set boundaries for conditional optimization. the expected indices range of vectors is [1, nbvariables].

	:param theLeftBorder:
	:type theLeftBorder: math_Vector
	:param theRightBorder:
	:type theRightBorder: math_Vector
	:rtype: None
") SetBoundary;
		void SetBoundary(const math_Vector & theLeftBorder, const math_Vector & theRightBorder);

		/****************** math_BFGS ******************/
		%feature("compactdefaultargs") math_BFGS;
		%feature("autodoc", "Initializes the computation of the minimum of a function with nbvariables. tolerance, zeps and nbiterations are described in the method perform. warning: a call to the perform method must be made after this initialization to effectively compute the minimum of the function f.

	:param NbVariables:
	:type NbVariables: int
	:param Tolerance: default value is 1.0e-8
	:type Tolerance: float
	:param NbIterations: default value is 200
	:type NbIterations: int
	:param ZEPS: default value is 1.0e-12
	:type ZEPS: float
	:rtype: None
") math_BFGS;
		 math_BFGS(const Standard_Integer NbVariables, const Standard_Real Tolerance = 1.0e-8, const Standard_Integer NbIterations = 200, const Standard_Real ZEPS = 1.0e-12);

};


%extend math_BFGS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class math_BissecNewton *
**************************/
class math_BissecNewton {
	public:
		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the value of the derivative at the root. exception notdone is raised if the minimum was not found.

	:rtype: float
") Derivative;
		Standard_Real Derivative();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Tests is the root has been successfully found.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsSolutionReached ******************/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "This method is called at the end of each iteration to check if the solution has been found. it can be redefined in a sub-class to implement a specific test to stop the iterations.

	:param theFunction:
	:type theFunction: math_FunctionWithDerivative
	:rtype: bool
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_FunctionWithDerivative & theFunction);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "A combination of newton-raphson and bissection methods is done to find the root of the function f between the bounds bound1 and bound2 on the function f. the tolerance required on the root is given by tolx. the solution is found when: abs(xi - xi-1) <= tolx and f(xi) * f(xi-1) <= 0 the maximum number of iterations allowed is given by nbiterations.

	:param F:
	:type F: math_FunctionWithDerivative
	:param Bound1:
	:type Bound1: float
	:param Bound2:
	:type Bound2: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:rtype: None
") Perform;
		void Perform(math_FunctionWithDerivative & F, const Standard_Real Bound1, const Standard_Real Bound2, const Standard_Integer NbIterations = 100);

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns the value of the root. exception notdone is raised if the minimum was not found.

	:rtype: float
") Root;
		Standard_Real Root();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the function at the root. exception notdone is raised if the minimum was not found.

	:rtype: float
") Value;
		Standard_Real Value();

		/****************** math_BissecNewton ******************/
		%feature("compactdefaultargs") math_BissecNewton;
		%feature("autodoc", "Constructor. @param thextolerance - algorithm tolerance.

	:param theXTolerance:
	:type theXTolerance: float
	:rtype: None
") math_BissecNewton;
		 math_BissecNewton(const Standard_Real theXTolerance);

};


%extend math_BissecNewton {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class math_BracketMinimum *
****************************/
class math_BracketMinimum {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** FunctionValues ******************/
		%feature("compactdefaultargs") FunctionValues;
		%feature("autodoc", "Returns the bracketed triplet function values. exceptions stdfail_notdone if the algorithm fails (and isdone returns false).

	:param FA:
	:type FA: float
	:param FB:
	:type FB: float
	:param FC:
	:type FC: float
	:rtype: None
") FunctionValues;
		void FunctionValues(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The method performing the job. it is called automatically by constructors with the function.

	:param F:
	:type F: math_Function
	:rtype: None
") Perform;
		void Perform(math_Function & F);

		/****************** SetFA ******************/
		%feature("compactdefaultargs") SetFA;
		%feature("autodoc", "Set function value at a.

	:param theValue:
	:type theValue: float
	:rtype: None
") SetFA;
		void SetFA(const Standard_Real theValue);

		/****************** SetFB ******************/
		%feature("compactdefaultargs") SetFB;
		%feature("autodoc", "Set function value at b.

	:param theValue:
	:type theValue: float
	:rtype: None
") SetFB;
		void SetFB(const Standard_Real theValue);

		/****************** SetLimits ******************/
		%feature("compactdefaultargs") SetLimits;
		%feature("autodoc", "Set limits of the parameter. by default no limits are applied to the parameter change. if no minimum is found in limits then isdone() will return false. the user is in charge of providing a and b to be in limits.

	:param theLeft:
	:type theLeft: float
	:param theRight:
	:type theRight: float
	:rtype: None
") SetLimits;
		void SetLimits(const Standard_Real theLeft, const Standard_Real theRight);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the bracketed triplet of abscissae. exceptions stdfail_notdone if the algorithm fails (and isdone returns false).

	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:rtype: None
") Values;
		void Values(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** math_BracketMinimum ******************/
		%feature("compactdefaultargs") math_BracketMinimum;
		%feature("autodoc", "Constructor preparing a and b parameters only. it does not perform the job.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:rtype: None
") math_BracketMinimum;
		 math_BracketMinimum(const Standard_Real A, const Standard_Real B);

		/****************** math_BracketMinimum ******************/
		%feature("compactdefaultargs") math_BracketMinimum;
		%feature("autodoc", "Given two initial values this class computes a bracketing triplet of abscissae ax, bx, cx (such that bx is between ax and cx, f(bx) is less than both f(bx) and f(cx)) the brent minimization is done on the function f.

	:param F:
	:type F: math_Function
	:param A:
	:type A: float
	:param B:
	:type B: float
	:rtype: None
") math_BracketMinimum;
		 math_BracketMinimum(math_Function & F, const Standard_Real A, const Standard_Real B);

		/****************** math_BracketMinimum ******************/
		%feature("compactdefaultargs") math_BracketMinimum;
		%feature("autodoc", "Given two initial values this class computes a bracketing triplet of abscissae ax, bx, cx (such that bx is between ax and cx, f(bx) is less than both f(bx) and f(cx)) the brent minimization is done on the function f. this constructor has to be used if f(a) is known.

	:param F:
	:type F: math_Function
	:param A:
	:type A: float
	:param B:
	:type B: float
	:param FA:
	:type FA: float
	:rtype: None
") math_BracketMinimum;
		 math_BracketMinimum(math_Function & F, const Standard_Real A, const Standard_Real B, const Standard_Real FA);

		/****************** math_BracketMinimum ******************/
		%feature("compactdefaultargs") math_BracketMinimum;
		%feature("autodoc", "Given two initial values this class computes a bracketing triplet of abscissae ax, bx, cx (such that bx is between ax and cx, f(bx) is less than both f(bx) and f(cx)) the brent minimization is done on the function f. this constructor has to be used if f(a) and f(b) are known.

	:param F:
	:type F: math_Function
	:param A:
	:type A: float
	:param B:
	:type B: float
	:param FA:
	:type FA: float
	:param FB:
	:type FB: float
	:rtype: None
") math_BracketMinimum;
		 math_BracketMinimum(math_Function & F, const Standard_Real A, const Standard_Real B, const Standard_Real FA, const Standard_Real FB);

};


%extend math_BracketMinimum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class math_BracketedRoot *
***************************/
class math_BracketedRoot {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbIterations ******************/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Returns the number of iterations really done during the computation of the root. exception notdone is raised if the minimum was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns the value of the root. exception notdone is raised if the minimum was not found.

	:rtype: float
") Root;
		Standard_Real Root();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the function at the root. exception notdone is raised if the minimum was not found.

	:rtype: float
") Value;
		Standard_Real Value();

		/****************** math_BracketedRoot ******************/
		%feature("compactdefaultargs") math_BracketedRoot;
		%feature("autodoc", "The brent method is used to find the root of the function f between the bounds bound1 and bound2 on the function f. if f(bound1)*f(bound2) >0 the brent method fails. the tolerance required for the root is given by tolerance. the solution is found when : abs(xi - xi-1) <= tolerance; the maximum number of iterations allowed is given by nbiterations.

	:param F:
	:type F: math_Function
	:param Bound1:
	:type Bound1: float
	:param Bound2:
	:type Bound2: float
	:param Tolerance:
	:type Tolerance: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:param ZEPS: default value is 1.0e-12
	:type ZEPS: float
	:rtype: None
") math_BracketedRoot;
		 math_BracketedRoot(math_Function & F, const Standard_Real Bound1, const Standard_Real Bound2, const Standard_Real Tolerance, const Standard_Integer NbIterations = 100, const Standard_Real ZEPS = 1.0e-12);

};


%extend math_BracketedRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class math_BrentMinimum *
**************************/
class math_BrentMinimum {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsSolutionReached ******************/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "This method is called at the end of each iteration to check if the solution is found. it can be redefined in a sub-class to implement a specific test to stop the iterations.

	:param theFunction:
	:type theFunction: math_Function
	:rtype: bool
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_Function & theFunction);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location value of the minimum. exception notdone is raised if the minimum was not found.

	:rtype: float
") Location;
		Standard_Real Location();

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Returns the value of the minimum. exception notdone is raised if the minimum was not found.

	:rtype: float
") Minimum;
		Standard_Real Minimum();

		/****************** NbIterations ******************/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Returns the number of iterations really done during the computation of the minimum. exception notdone is raised if the minimum was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Brent minimization is performed on function f from a given bracketing triplet of abscissas ax, bx, cx (such that bx is between ax and cx, f(bx) is less than both f(bx) and f(cx)) the solution is found when: abs(xi - xi-1) <= tolx * abs(xi) + zeps;.

	:param F:
	:type F: math_Function
	:param Ax:
	:type Ax: float
	:param Bx:
	:type Bx: float
	:param Cx:
	:type Cx: float
	:rtype: None
") Perform;
		void Perform(math_Function & F, const Standard_Real Ax, const Standard_Real Bx, const Standard_Real Cx);

		/****************** math_BrentMinimum ******************/
		%feature("compactdefaultargs") math_BrentMinimum;
		%feature("autodoc", "This constructor should be used in a sub-class to initialize correctly all the fields of this class.

	:param TolX:
	:type TolX: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:param ZEPS: default value is 1.0e-12
	:type ZEPS: float
	:rtype: None
") math_BrentMinimum;
		 math_BrentMinimum(const Standard_Real TolX, const Standard_Integer NbIterations = 100, const Standard_Real ZEPS = 1.0e-12);

		/****************** math_BrentMinimum ******************/
		%feature("compactdefaultargs") math_BrentMinimum;
		%feature("autodoc", "This constructor should be used in a sub-class to initialize correctly all the fields of this class. it has to be used if f(bx) is known.

	:param TolX:
	:type TolX: float
	:param Fbx:
	:type Fbx: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:param ZEPS: default value is 1.0e-12
	:type ZEPS: float
	:rtype: None
") math_BrentMinimum;
		 math_BrentMinimum(const Standard_Real TolX, const Standard_Real Fbx, const Standard_Integer NbIterations = 100, const Standard_Real ZEPS = 1.0e-12);

};


%extend math_BrentMinimum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class math_BullardGenerator *
******************************/
class math_BullardGenerator {
	public:
		/****************** NextInt ******************/
		%feature("compactdefaultargs") NextInt;
		%feature("autodoc", "Generates new 64-bit integer value.

	:rtype: unsigned int
") NextInt;
		unsigned int NextInt();

		/****************** NextReal ******************/
		%feature("compactdefaultargs") NextReal;
		%feature("autodoc", "Generates new floating-point value.

	:rtype: float
") NextReal;
		Standard_Real NextReal();

		/****************** SetSeed ******************/
		%feature("compactdefaultargs") SetSeed;
		%feature("autodoc", "Setup new seed / reset defaults.

	:param theSeed: default value is 1
	:type theSeed: unsigned int
	:rtype: None
") SetSeed;
		void SetSeed(unsigned int theSeed = 1);

		/****************** math_BullardGenerator ******************/
		%feature("compactdefaultargs") math_BullardGenerator;
		%feature("autodoc", "Creates new xorshift 64-bit rng.

	:param theSeed: default value is 1
	:type theSeed: unsigned int
	:rtype: None
") math_BullardGenerator;
		 math_BullardGenerator(unsigned int theSeed = 1);

};


%extend math_BullardGenerator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class math_ComputeGaussPointsAndWeights *
******************************************/
class math_ComputeGaussPointsAndWeights {
	public:
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	:rtype: math_Vector
") Points;
		math_Vector Points();

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "	:rtype: math_Vector
") Weights;
		math_Vector Weights();

		/****************** math_ComputeGaussPointsAndWeights ******************/
		%feature("compactdefaultargs") math_ComputeGaussPointsAndWeights;
		%feature("autodoc", "	:param Number:
	:type Number: int
	:rtype: None
") math_ComputeGaussPointsAndWeights;
		 math_ComputeGaussPointsAndWeights(const Standard_Integer Number);

};


%extend math_ComputeGaussPointsAndWeights {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class math_ComputeKronrodPointsAndWeights *
********************************************/
class math_ComputeKronrodPointsAndWeights {
	public:
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "	:rtype: math_Vector
") Points;
		math_Vector Points();

		/****************** Weights ******************/
		%feature("compactdefaultargs") Weights;
		%feature("autodoc", "	:rtype: math_Vector
") Weights;
		math_Vector Weights();

		/****************** math_ComputeKronrodPointsAndWeights ******************/
		%feature("compactdefaultargs") math_ComputeKronrodPointsAndWeights;
		%feature("autodoc", "	:param Number:
	:type Number: int
	:rtype: None
") math_ComputeKronrodPointsAndWeights;
		 math_ComputeKronrodPointsAndWeights(const Standard_Integer Number);

};


%extend math_ComputeKronrodPointsAndWeights {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class math_Crout *
*******************/
class math_Crout {
	public:
		/****************** Determinant ******************/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "Returns the value of the determinant of the previously lu decomposed matrix a. zero is returned if the matrix a is considered as singular. exceptions stdfail_notdone if the algorithm fails (and isdone returns false).

	:rtype: float
") Determinant;
		Standard_Real Determinant();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Inverse ******************/
		%feature("compactdefaultargs") Inverse;
		%feature("autodoc", "Returns the inverse matrix of a. only the inferior triangle is returned. exception notdone is raised if notdone.

	:rtype: math_Matrix
") Inverse;
		const math_Matrix & Inverse();

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Returns in inv the inverse matrix of a. only the inferior triangle is returned. exception notdone is raised if notdone.

	:param Inv:
	:type Inv: math_Matrix
	:rtype: None
") Invert;
		void Invert(math_Matrix & Inv);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Solve ******************/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "Given an input vector <b>, this routine returns the solution of the set of linear equations a . x = b. exception notdone is raised if the decomposition was not done successfully. exception dimensionerror is raised if the range of b is not equal to the rowrange of a.

	:param B:
	:type B: math_Vector
	:param X:
	:type X: math_Vector
	:rtype: None
") Solve;
		void Solve(const math_Vector & B, math_Vector & X);

		/****************** math_Crout ******************/
		%feature("compactdefaultargs") math_Crout;
		%feature("autodoc", "Given an input matrix a, this algorithm inverts a by the crout algorithm. the user can give only the inferior triangle for the implementation. a can be decomposed like this: a = l * d * t(l) where l is triangular inferior and d is diagonal. if one element of a is less than minpivot, a is considered as singular. exception notsquare is raised if a is not a square matrix.

	:param A:
	:type A: math_Matrix
	:param MinPivot: default value is 1.0e-20
	:type MinPivot: float
	:rtype: None
") math_Crout;
		 math_Crout(const math_Matrix & A, const Standard_Real MinPivot = 1.0e-20);

};


%extend math_Crout {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class math_DirectPolynomialRoots *
***********************************/
class math_DirectPolynomialRoots {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** InfiniteRoots ******************/
		%feature("compactdefaultargs") InfiniteRoots;
		%feature("autodoc", "Returns true if there is an infinity of roots, otherwise returns false.

	:rtype: bool
") InfiniteRoots;
		Standard_Boolean InfiniteRoots();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbSolutions ******************/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Returns the number of solutions. an exception is raised if there are an infinity of roots.

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the nieme root. an exception is raised if there are an infinity of roots. exception rangeerror is raised if nieme is < 1 or nieme > nbsolutions.

	:param Nieme:
	:type Nieme: int
	:rtype: float
") Value;
		Standard_Real Value(const Standard_Integer Nieme);

		/****************** math_DirectPolynomialRoots ******************/
		%feature("compactdefaultargs") math_DirectPolynomialRoots;
		%feature("autodoc", "Computes all the real roots of the polynomial ax4 + bx3 + cx2 + dx + e using a direct method.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:param D:
	:type D: float
	:param E:
	:type E: float
	:rtype: None
") math_DirectPolynomialRoots;
		 math_DirectPolynomialRoots(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D, const Standard_Real E);

		/****************** math_DirectPolynomialRoots ******************/
		%feature("compactdefaultargs") math_DirectPolynomialRoots;
		%feature("autodoc", "Computes all the real roots of the polynomial ax3 + bx2 + cx + d using a direct method.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:param D:
	:type D: float
	:rtype: None
") math_DirectPolynomialRoots;
		 math_DirectPolynomialRoots(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D);

		/****************** math_DirectPolynomialRoots ******************/
		%feature("compactdefaultargs") math_DirectPolynomialRoots;
		%feature("autodoc", "Computes all the real roots of the polynomial ax2 + bx + c using a direct method.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:rtype: None
") math_DirectPolynomialRoots;
		 math_DirectPolynomialRoots(const Standard_Real A, const Standard_Real B, const Standard_Real C);

		/****************** math_DirectPolynomialRoots ******************/
		%feature("compactdefaultargs") math_DirectPolynomialRoots;
		%feature("autodoc", "Computes the real root of the polynomial ax + b.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:rtype: None
") math_DirectPolynomialRoots;
		 math_DirectPolynomialRoots(const Standard_Real A, const Standard_Real B);

};


%extend math_DirectPolynomialRoots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class math_DoubleTab *
***********************/
class math_DoubleTab {
	public:
		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:param Other:
	:type Other: math_DoubleTab
	:rtype: None
") Copy;
		void Copy(math_DoubleTab & Other);

		/****************** Free ******************/
		%feature("compactdefaultargs") Free;
		%feature("autodoc", "	:rtype: None
") Free;
		void Free();

		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param InitValue:
	:type InitValue: float
	:rtype: None
") Init;
		void Init(const Standard_Real InitValue);

		/****************** SetLowerCol ******************/
		%feature("compactdefaultargs") SetLowerCol;
		%feature("autodoc", "	:param LowerCol:
	:type LowerCol: int
	:rtype: None
") SetLowerCol;
		void SetLowerCol(const Standard_Integer LowerCol);

		/****************** SetLowerRow ******************/
		%feature("compactdefaultargs") SetLowerRow;
		%feature("autodoc", "	:param LowerRow:
	:type LowerRow: int
	:rtype: None
") SetLowerRow;
		void SetLowerRow(const Standard_Integer LowerRow);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetValue(const Standard_Integer RowIndex,const Standard_Integer ColIndex) {
            return (Standard_Real) $self->Value(RowIndex,ColIndex);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetValue(const Standard_Integer RowIndex,const Standard_Integer ColIndex,Standard_Real value) {
            $self->Value(RowIndex,ColIndex)=value;
            }
        };
		/****************** math_DoubleTab ******************/
		%feature("compactdefaultargs") math_DoubleTab;
		%feature("autodoc", "	:param LowerRow:
	:type LowerRow: int
	:param UpperRow:
	:type UpperRow: int
	:param LowerCol:
	:type LowerCol: int
	:param UpperCol:
	:type UpperCol: int
	:rtype: None
") math_DoubleTab;
		 math_DoubleTab(const Standard_Integer LowerRow, const Standard_Integer UpperRow, const Standard_Integer LowerCol, const Standard_Integer UpperCol);

		/****************** math_DoubleTab ******************/
		%feature("compactdefaultargs") math_DoubleTab;
		%feature("autodoc", "	:param Tab:
	:type Tab: Standard_Address
	:param LowerRow:
	:type LowerRow: int
	:param UpperRow:
	:type UpperRow: int
	:param LowerCol:
	:type LowerCol: int
	:param UpperCol:
	:type UpperCol: int
	:rtype: None
") math_DoubleTab;
		 math_DoubleTab(const Standard_Address Tab, const Standard_Integer LowerRow, const Standard_Integer UpperRow, const Standard_Integer LowerCol, const Standard_Integer UpperCol);

		/****************** math_DoubleTab ******************/
		%feature("compactdefaultargs") math_DoubleTab;
		%feature("autodoc", "	:param Other:
	:type Other: math_DoubleTab
	:rtype: None
") math_DoubleTab;
		 math_DoubleTab(const math_DoubleTab & Other);

};


%extend math_DoubleTab {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class math_EigenValuesSearcher *
*********************************/
class math_EigenValuesSearcher {
	public:
		/****************** Dimension ******************/
		%feature("compactdefaultargs") Dimension;
		%feature("autodoc", "Returns the dimension of matrix.

	:rtype: int
") Dimension;
		Standard_Integer Dimension();

		/****************** EigenValue ******************/
		%feature("compactdefaultargs") EigenValue;
		%feature("autodoc", "Returns the index_th eigen value of matrix index must be in [1, dimension()].

	:param Index:
	:type Index: int
	:rtype: float
") EigenValue;
		Standard_Real EigenValue(const Standard_Integer Index);

		/****************** EigenVector ******************/
		%feature("compactdefaultargs") EigenVector;
		%feature("autodoc", "Returns the index_th eigen vector of matrix index must be in [1, dimension()].

	:param Index:
	:type Index: int
	:rtype: math_Vector
") EigenVector;
		math_Vector EigenVector(const Standard_Integer Index);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns standard_true if computation is performed successfully.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** math_EigenValuesSearcher ******************/
		%feature("compactdefaultargs") math_EigenValuesSearcher;
		%feature("autodoc", "	:param Diagonal:
	:type Diagonal: TColStd_Array1OfReal
	:param Subdiagonal:
	:type Subdiagonal: TColStd_Array1OfReal
	:rtype: None
") math_EigenValuesSearcher;
		 math_EigenValuesSearcher(const TColStd_Array1OfReal & Diagonal, const TColStd_Array1OfReal & Subdiagonal);

};


%extend math_EigenValuesSearcher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class math_FRPR *
******************/
class math_FRPR {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Returns the gradient vector at the minimum. exception notdone is raised if the minimum was not found.

	:rtype: math_Vector
") Gradient;
		const math_Vector & Gradient();

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Outputs the gradient vector at the minimum in grad. exception notdone is raised if the minimum was not found. exception dimensionerror is raised if the range of grad is not equal to the range of the startingpoint.

	:param Grad:
	:type Grad: math_Vector
	:rtype: None
") Gradient;
		void Gradient(math_Vector & Grad);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsSolutionReached ******************/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "The solution f = fi is found when: 2.0 * abs(fi - fi-1) <= tolerance * (abs(fi) + abs(fi-1)) + zeps. the maximum number of iterations allowed is given by nbiterations.

	:param theFunction:
	:type theFunction: math_MultipleVarFunctionWithGradient
	:rtype: bool
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_MultipleVarFunctionWithGradient & theFunction);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location vector of the minimum. exception notdone is raised if the minimum was not found.

	:rtype: math_Vector
") Location;
		const math_Vector & Location();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Outputs the location vector of the minimum in loc. exception notdone is raised if the minimum was not found. exception dimensionerror is raised if the range of loc is not equal to the range of the startingpoint.

	:param Loc:
	:type Loc: math_Vector
	:rtype: None
") Location;
		void Location(math_Vector & Loc);

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Returns the value of the minimum. exception notdone is raised if the minimum was not found.

	:rtype: float
") Minimum;
		Standard_Real Minimum();

		/****************** NbIterations ******************/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Returns the number of iterations really done during the computation of the minimum. exception notdone is raised if the minimum was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The solution f = fi is found when 2.0 * abs(fi - fi-1) <= tolerance * (abs(fi) + abs(fi-1) + zeps).

	:param theFunction:
	:type theFunction: math_MultipleVarFunctionWithGradient
	:param theStartingPoint:
	:type theStartingPoint: math_Vector
	:rtype: None
") Perform;
		void Perform(math_MultipleVarFunctionWithGradient & theFunction, const math_Vector & theStartingPoint);

		/****************** math_FRPR ******************/
		%feature("compactdefaultargs") math_FRPR;
		%feature("autodoc", "Initializes the computation of the minimum of f. warning: constructor does not perform computations.

	:param theFunction:
	:type theFunction: math_MultipleVarFunctionWithGradient
	:param theTolerance:
	:type theTolerance: float
	:param theNbIterations: default value is 200
	:type theNbIterations: int
	:param theZEPS: default value is 1.0e-12
	:type theZEPS: float
	:rtype: None
") math_FRPR;
		 math_FRPR(const math_MultipleVarFunctionWithGradient & theFunction, const Standard_Real theTolerance, const Standard_Integer theNbIterations = 200, const Standard_Real theZEPS = 1.0e-12);

};


%extend math_FRPR {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class math_Function *
**********************/
%nodefaultctor math_Function;
class math_Function {
	public:
		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Returns the state of the function corresponding to the latest call of any methods associated with the function. this function is called by each of the algorithms described later which defined the function integer algorithm::statenumber(). the algorithm has the responsibility to call this function when it has found a solution (i.e. a root or a minimum) and has to maintain the association between the solution found and this statenumber. byu default, this method returns 0 (which means for the algorithm: no state has been saved). it is the responsibility of the programmer to decide if he needs to save the current state of the function and to return an integer that allows retrieval of the state.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value of the function <f> for a given value of variable <x>. returns true if the computation was done successfully, false otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float
	:rtype: bool
") Value;
		virtual Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

};


%extend math_Function {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class math_FunctionAllRoots *
******************************/
class math_FunctionAllRoots {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetInterval ******************/
		%feature("compactdefaultargs") GetInterval;
		%feature("autodoc", "Returns the interval of parameter of range index. an exception is raised if isdone returns false; an exception is raised if index<=0 or index >nbintervals.

	:param Index:
	:type Index: int
	:param A:
	:type A: float
	:param B:
	:type B: float
	:rtype: None
") GetInterval;
		void GetInterval(const Standard_Integer Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetIntervalState ******************/
		%feature("compactdefaultargs") GetIntervalState;
		%feature("autodoc", "Returns the state number associated to the interval index. an exception is raised if isdone returns false; an exception is raised if index<=0 or index >nbintervals.

	:param Index:
	:type Index: int
	:param IFirst:
	:type IFirst: int
	:param ILast:
	:type ILast: int
	:rtype: None
") GetIntervalState;
		void GetIntervalState(const Standard_Integer Index, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****************** GetPoint ******************/
		%feature("compactdefaultargs") GetPoint;
		%feature("autodoc", "Returns the parameter of the point of range index. an exception is raised if isdone returns false; an exception is raised if index<=0 or index >nbpoints.

	:param Index:
	:type Index: int
	:rtype: float
") GetPoint;
		Standard_Real GetPoint(const Standard_Integer Index);

		/****************** GetPointState ******************/
		%feature("compactdefaultargs") GetPointState;
		%feature("autodoc", "Returns the state number associated to the point index. an exception is raised if isdone returns false; an exception is raised if index<=0 or index >nbintervals.

	:param Index:
	:type Index: int
	:rtype: int
") GetPointState;
		Standard_Integer GetPointState(const Standard_Integer Index);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computation has been done successfully.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "Returns the number of intervals on which the function is null. an exception is raised if isdone returns false.

	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points where the function is null. an exception is raised if isdone returns false.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** math_FunctionAllRoots ******************/
		%feature("compactdefaultargs") math_FunctionAllRoots;
		%feature("autodoc", "The algorithm uses the sample to find intervals on which the function is null. an interval is found if, for at least two consecutive points of the sample, ui and ui+1, we get |f(ui)|<=epsnul and |f(ui+1)|<=epsnul. the real bounds of an interval are computed with the functionroots. algorithm. between two intervals, the roots of the function f are calculated using the functionroots algorithm.

	:param F:
	:type F: math_FunctionWithDerivative
	:param S:
	:type S: math_FunctionSample
	:param EpsX:
	:type EpsX: float
	:param EpsF:
	:type EpsF: float
	:param EpsNul:
	:type EpsNul: float
	:rtype: None
") math_FunctionAllRoots;
		 math_FunctionAllRoots(math_FunctionWithDerivative & F, const math_FunctionSample & S, const Standard_Real EpsX, const Standard_Real EpsF, const Standard_Real EpsNul);

};


%extend math_FunctionAllRoots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class math_FunctionRoot *
**************************/
class math_FunctionRoot {
	public:
		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the value of the derivative at the root. exception notdone is raised if the root was not found.

	:rtype: float
") Derivative;
		Standard_Real Derivative();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbIterations ******************/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Returns the number of iterations really done on the computation of the root. exception notdone is raised if the root was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns the value of the root. exception notdone is raised if the root was not found.

	:rtype: float
") Root;
		Standard_Real Root();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the function at the root. exception notdone is raised if the root was not found.

	:rtype: float
") Value;
		Standard_Real Value();

		/****************** math_FunctionRoot ******************/
		%feature("compactdefaultargs") math_FunctionRoot;
		%feature("autodoc", "The newton-raphson method is done to find the root of the function f from the initial guess guess.the tolerance required on the root is given by tolerance. iterations are stopped if the expected solution does not stay in the range a..b. the solution is found when abs(xi - xi-1) <= tolerance; the maximum number of iterations allowed is given by nbiterations.

	:param F:
	:type F: math_FunctionWithDerivative
	:param Guess:
	:type Guess: float
	:param Tolerance:
	:type Tolerance: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:rtype: None
") math_FunctionRoot;
		 math_FunctionRoot(math_FunctionWithDerivative & F, const Standard_Real Guess, const Standard_Real Tolerance, const Standard_Integer NbIterations = 100);

		/****************** math_FunctionRoot ******************/
		%feature("compactdefaultargs") math_FunctionRoot;
		%feature("autodoc", "The newton-raphson method is done to find the root of the function f from the initial guess guess. the tolerance required on the root is given by tolerance. iterations are stopped if the expected solution does not stay in the range a..b the solution is found when abs(xi - xi-1) <= tolerance; the maximum number of iterations allowed is given by nbiterations.

	:param F:
	:type F: math_FunctionWithDerivative
	:param Guess:
	:type Guess: float
	:param Tolerance:
	:type Tolerance: float
	:param A:
	:type A: float
	:param B:
	:type B: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:rtype: None
") math_FunctionRoot;
		 math_FunctionRoot(math_FunctionWithDerivative & F, const Standard_Real Guess, const Standard_Real Tolerance, const Standard_Real A, const Standard_Real B, const Standard_Integer NbIterations = 100);

};


%extend math_FunctionRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class math_FunctionRoots *
***************************/
class math_FunctionRoots {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsAllNull ******************/
		%feature("compactdefaultargs") IsAllNull;
		%feature("autodoc", "Returns true if the function is considered as null between a and b. exceptions stdfail_notdone if the algorithm fails (and isdone returns false).

	:rtype: bool
") IsAllNull;
		Standard_Boolean IsAllNull();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbSolutions ******************/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Returns the number of solutions found. exceptions stdfail_notdone if the algorithm fails (and isdone returns false).

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** StateNumber ******************/
		%feature("compactdefaultargs") StateNumber;
		%feature("autodoc", "Returns the statenumber of the nieme root. exception rangeerror is raised if nieme is < 1 or nieme > nbsolutions.

	:param Nieme:
	:type Nieme: int
	:rtype: int
") StateNumber;
		Standard_Integer StateNumber(const Standard_Integer Nieme);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the nth value of the root of function f. exceptions stdfail_notdone if the algorithm fails (and isdone returns false).

	:param Nieme:
	:type Nieme: int
	:rtype: float
") Value;
		Standard_Real Value(const Standard_Integer Nieme);

		/****************** math_FunctionRoots ******************/
		%feature("compactdefaultargs") math_FunctionRoots;
		%feature("autodoc", "Calculates all the real roots of a function f-k within the range a..b. whithout conditions on a and b a solution x is found when abs(xi - xi-1) <= epsx and abs(f(xi)-k) <= epsf. the function is considered as null between a and b if abs(f-k) <= epsnull within this range.

	:param F:
	:type F: math_FunctionWithDerivative
	:param A:
	:type A: float
	:param B:
	:type B: float
	:param NbSample:
	:type NbSample: int
	:param EpsX: default value is 0.0
	:type EpsX: float
	:param EpsF: default value is 0.0
	:type EpsF: float
	:param EpsNull: default value is 0.0
	:type EpsNull: float
	:param K: default value is 0.0
	:type K: float
	:rtype: None
") math_FunctionRoots;
		 math_FunctionRoots(math_FunctionWithDerivative & F, const Standard_Real A, const Standard_Real B, const Standard_Integer NbSample, const Standard_Real EpsX = 0.0, const Standard_Real EpsF = 0.0, const Standard_Real EpsNull = 0.0, const Standard_Real K = 0.0);

};


%extend math_FunctionRoots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class math_FunctionSample *
****************************/
class math_FunctionSample {
	public:
		/****************** Bounds ******************/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "Returns the bounds of parameters.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:rtype: None
") Bounds;
		virtual void Bounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** GetParameter ******************/
		%feature("compactdefaultargs") GetParameter;
		%feature("autodoc", "Returns the value of parameter of the point of range index : a + ((index-1)/(nbpoints-1))*b. an exception is raised if index<=0 or index>nbpoints.

	:param Index:
	:type Index: int
	:rtype: float
") GetParameter;
		virtual Standard_Real GetParameter(const Standard_Integer Index);

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of sample points.

	:rtype: int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** math_FunctionSample ******************/
		%feature("compactdefaultargs") math_FunctionSample;
		%feature("autodoc", "	:param A:
	:type A: float
	:param B:
	:type B: float
	:param N:
	:type N: int
	:rtype: None
") math_FunctionSample;
		 math_FunctionSample(const Standard_Real A, const Standard_Real B, const Standard_Integer N);

};


%extend math_FunctionSample {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class math_FunctionSet *
*************************/
%nodefaultctor math_FunctionSet;
class math_FunctionSet {
	public:
		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Returns the state of the function corresponding to the latestcall of any methods associated with the function. this function is called by each of the algorithms described later which define the function integer algorithm::statenumber(). the algorithm has the responsibility to call this function when it has found a solution (i.e. a root or a minimum) and has to maintain the association between the solution found and this statenumber. byu default, this method returns 0 (which means for the algorithm: no state has been saved). it is the responsibility of the programmer to decide if he needs to save the current state of the function and to return an integer that allows retrieval of the state.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

	:rtype: int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function.

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

	:param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:rtype: bool
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

};


%extend math_FunctionSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class math_FunctionSetRoot *
*****************************/
class math_FunctionSetRoot {
	public:
		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the matrix value of the derivative at the root. exception notdone is raised if the root was not found.

	:rtype: math_Matrix
") Derivative;
		const math_Matrix & Derivative();

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Outputs the matrix value of the derivative at the root in der. exception notdone is raised if the root was not found. exception dimensionerror is raised if the column range of <der> is not equal to the range of the startingpoint.

	:param Der:
	:type Der: math_Matrix
	:rtype: None
") Derivative;
		void Derivative(math_Matrix & Der);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** FunctionSetErrors ******************/
		%feature("compactdefaultargs") FunctionSetErrors;
		%feature("autodoc", "Returns the vector value of the error done on the functions at the root. exception notdone is raised if the root was not found.

	:rtype: math_Vector
") FunctionSetErrors;
		const math_Vector & FunctionSetErrors();

		/****************** FunctionSetErrors ******************/
		%feature("compactdefaultargs") FunctionSetErrors;
		%feature("autodoc", "Outputs the vector value of the error done on the functions at the root in err. exception notdone is raised if the root was not found. exception dimensionerror is raised if the range of err is not equal to the range of the startingpoint.

	:param Err:
	:type Err: math_Vector
	:rtype: None
") FunctionSetErrors;
		void FunctionSetErrors(math_Vector & Err);

		/****************** IsDivergent ******************/
		%feature("compactdefaultargs") IsDivergent;
		%feature("autodoc", "	:rtype: bool
") IsDivergent;
		Standard_Boolean IsDivergent();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsSolutionReached ******************/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "This routine is called at the end of each iteration to check if the solution was found. it can be redefined in a sub-class to implement a specific test to stop the iterations. in this case, the solution is found when: abs(xi - xi-1) <= tolerance for all unknowns.

	:param F:
	:type F: math_FunctionSetWithDerivatives
	:rtype: bool
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_FunctionSetWithDerivatives & F);

		/****************** NbIterations ******************/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Returns the number of iterations really done during the computation of the root. exception notdone is raised if the root was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Improves the root of function from the initial guess point. the infinum and supremum may be given to constrain the solution. in this case, the solution is found when: abs(xi - xi-1)(j) <= tolerance(j) for all unknowns.

	:param theFunction:
	:type theFunction: math_FunctionSetWithDerivatives
	:param theStartingPoint:
	:type theStartingPoint: math_Vector
	:param theStopOnDivergent: default value is Standard_False
	:type theStopOnDivergent: bool
	:rtype: None
") Perform;
		void Perform(math_FunctionSetWithDerivatives & theFunction, const math_Vector & theStartingPoint, const Standard_Boolean theStopOnDivergent = Standard_False);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Improves the root of function from the initial guess point. the infinum and supremum may be given to constrain the solution. in this case, the solution is found when: abs(xi - xi-1) <= tolerance for all unknowns.

	:param theFunction:
	:type theFunction: math_FunctionSetWithDerivatives
	:param theStartingPoint:
	:type theStartingPoint: math_Vector
	:param theInfBound:
	:type theInfBound: math_Vector
	:param theSupBound:
	:type theSupBound: math_Vector
	:param theStopOnDivergent: default value is Standard_False
	:type theStopOnDivergent: bool
	:rtype: None
") Perform;
		void Perform(math_FunctionSetWithDerivatives & theFunction, const math_Vector & theStartingPoint, const math_Vector & theInfBound, const math_Vector & theSupBound, const Standard_Boolean theStopOnDivergent = Standard_False);

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns the value of the root of function f. exception notdone is raised if the root was not found.

	:rtype: math_Vector
") Root;
		const math_Vector & Root();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Outputs the root vector in root. exception notdone is raised if the root was not found. exception dimensionerror is raised if the range of root is not equal to the range of the startingpoint.

	:param Root:
	:type Root: math_Vector
	:rtype: None
") Root;
		void Root(math_Vector & Root);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Initializes the tolerance values.

	:param Tolerance:
	:type Tolerance: math_Vector
	:rtype: None
") SetTolerance;
		void SetTolerance(const math_Vector & Tolerance);

		/****************** StateNumber ******************/
		%feature("compactdefaultargs") StateNumber;
		%feature("autodoc", "Returns the statenumber (as returned by f.getstatenumber()) associated to the root found.

	:rtype: int
") StateNumber;
		Standard_Integer StateNumber();

		/****************** math_FunctionSetRoot ******************/
		%feature("compactdefaultargs") math_FunctionSetRoot;
		%feature("autodoc", "Is used in a sub-class to initialize correctly all the fields of this class. the range (1, f.nbvariables()) must be especially respected for all vectors and matrix declarations.

	:param F:
	:type F: math_FunctionSetWithDerivatives
	:param Tolerance:
	:type Tolerance: math_Vector
	:param NbIterations: default value is 100
	:type NbIterations: int
	:rtype: None
") math_FunctionSetRoot;
		 math_FunctionSetRoot(math_FunctionSetWithDerivatives & F, const math_Vector & Tolerance, const Standard_Integer NbIterations = 100);

		/****************** math_FunctionSetRoot ******************/
		%feature("compactdefaultargs") math_FunctionSetRoot;
		%feature("autodoc", "Is used in a sub-class to initialize correctly all the fields of this class. the range (1, f.nbvariables()) must be especially respected for all vectors and matrix declarations. the method settolerance must be called after this constructor.

	:param F:
	:type F: math_FunctionSetWithDerivatives
	:param NbIterations: default value is 100
	:type NbIterations: int
	:rtype: None
") math_FunctionSetRoot;
		 math_FunctionSetRoot(math_FunctionSetWithDerivatives & F, const Standard_Integer NbIterations = 100);

};


%extend math_FunctionSetRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class math_Gauss *
*******************/
class math_Gauss {
	public:
		/****************** Determinant ******************/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "This routine returns the value of the determinant of the previously lu decomposed matrix a. exception notdone may be raised if the decomposition of a was not done successfully, zero is returned if the matrix a was considered as singular.

	:rtype: float
") Determinant;
		Standard_Real Determinant();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "This routine outputs inv the inverse of the previously lu decomposed matrix a. exception dimensionerror is raised if the ranges of b are not equal to the ranges of a.

	:param Inv:
	:type Inv: math_Matrix
	:rtype: None
") Invert;
		void Invert(math_Matrix & Inv);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Solve ******************/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "Given the input vector b this routine returns the solution x of the set of linear equations a . x = b. exception notdone is raised if the decomposition of a was not done successfully. exception dimensionerror is raised if the range of b is not equal to the number of rows of a.

	:param B:
	:type B: math_Vector
	:param X:
	:type X: math_Vector
	:rtype: None
") Solve;
		void Solve(const math_Vector & B, math_Vector & X);

		/****************** Solve ******************/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "Given the input vector b this routine solves the set of linear equations a . x = b. b is replaced by the vector solution x. exception notdone is raised if the decomposition of a was not done successfully. exception dimensionerror is raised if the range of b is not equal to the number of rows of a.

	:param B:
	:type B: math_Vector
	:rtype: None
") Solve;
		void Solve(math_Vector & B);

		/****************** math_Gauss ******************/
		%feature("compactdefaultargs") math_Gauss;
		%feature("autodoc", "Given an input n x n matrix a this constructor performs its lu decomposition with partial pivoting (interchange of rows). this lu decomposition is stored internally and may be used to do subsequent calculation. if the largest pivot found is less than minpivot the matrix a is considered as singular. exception notsquare is raised if a is not a square matrix.

	:param A:
	:type A: math_Matrix
	:param MinPivot: default value is 1.0e-20
	:type MinPivot: float
	:param aProgress: default value is opencascade::handle<Message_ProgressIndicator>()
	:type aProgress: Message_ProgressIndicator
	:rtype: None
") math_Gauss;
		 math_Gauss(const math_Matrix & A, const Standard_Real MinPivot = 1.0e-20, const opencascade::handle<Message_ProgressIndicator> & aProgress = opencascade::handle<Message_ProgressIndicator>());

};


%extend math_Gauss {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class math_GaussLeastSquare *
******************************/
class math_GaussLeastSquare {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.e.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Solve ******************/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "Given the input vector <b> this routine solves the set of linear equations a . x = b. exception notdone is raised if the decomposition of a was not done successfully. exception dimensionerror is raised if the range of b inv is not equal to the rowrange of a. exception dimensionerror is raised if the range of x inv is not equal to the colrange of a.

	:param B:
	:type B: math_Vector
	:param X:
	:type X: math_Vector
	:rtype: None
") Solve;
		void Solve(const math_Vector & B, math_Vector & X);

		/****************** math_GaussLeastSquare ******************/
		%feature("compactdefaultargs") math_GaussLeastSquare;
		%feature("autodoc", "Given an input n x m matrix a with n >= m this constructor performs the lu decomposition with partial pivoting (interchange of rows) of the matrix aa = a.transposed() * a; this lu decomposition is stored internally and may be used to do subsequent calculation. if the largest pivot found is less than minpivot the matrix <a> is considered as singular.

	:param A:
	:type A: math_Matrix
	:param MinPivot: default value is 1.0e-20
	:type MinPivot: float
	:rtype: None
") math_GaussLeastSquare;
		 math_GaussLeastSquare(const math_Matrix & A, const Standard_Real MinPivot = 1.0e-20);

};


%extend math_GaussLeastSquare {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class math_GaussMultipleIntegration *
**************************************/
class math_GaussMultipleIntegration {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the integral.

	:rtype: float
") Value;
		Standard_Real Value();

		/****************** math_GaussMultipleIntegration ******************/
		%feature("compactdefaultargs") math_GaussMultipleIntegration;
		%feature("autodoc", "The gauss-legendre integration with order = points of integration for each unknow, is done on the function f between the bounds lower and upper.

	:param F:
	:type F: math_MultipleVarFunction
	:param Lower:
	:type Lower: math_Vector
	:param Upper:
	:type Upper: math_Vector
	:param Order:
	:type Order: math_IntegerVector
	:rtype: None
") math_GaussMultipleIntegration;
		 math_GaussMultipleIntegration(math_MultipleVarFunction & F, const math_Vector & Lower, const math_Vector & Upper, const math_IntegerVector & Order);

};


%extend math_GaussMultipleIntegration {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class math_GaussSetIntegration *
*********************************/
class math_GaussSetIntegration {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the integral.

	:rtype: math_Vector
") Value;
		const math_Vector & Value();

		/****************** math_GaussSetIntegration ******************/
		%feature("compactdefaultargs") math_GaussSetIntegration;
		%feature("autodoc", "The gauss-legendre integration with order = points of integration for each unknow, is done on the function f between the bounds lower and upper.

	:param F:
	:type F: math_FunctionSet
	:param Lower:
	:type Lower: math_Vector
	:param Upper:
	:type Upper: math_Vector
	:param Order:
	:type Order: math_IntegerVector
	:rtype: None
") math_GaussSetIntegration;
		 math_GaussSetIntegration(math_FunctionSet & F, const math_Vector & Lower, const math_Vector & Upper, const math_IntegerVector & Order);

};


%extend math_GaussSetIntegration {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class math_GaussSingleIntegration *
************************************/
class math_GaussSingleIntegration {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if all has been correctly done.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the integral.

	:rtype: float
") Value;
		Standard_Real Value();

		/****************** math_GaussSingleIntegration ******************/
		%feature("compactdefaultargs") math_GaussSingleIntegration;
		%feature("autodoc", "	:rtype: None
") math_GaussSingleIntegration;
		 math_GaussSingleIntegration();

		/****************** math_GaussSingleIntegration ******************/
		%feature("compactdefaultargs") math_GaussSingleIntegration;
		%feature("autodoc", "The gauss-legendre integration with n = order points of integration, is done on the function f between the bounds lower and upper.

	:param F:
	:type F: math_Function
	:param Lower:
	:type Lower: float
	:param Upper:
	:type Upper: float
	:param Order:
	:type Order: int
	:rtype: None
") math_GaussSingleIntegration;
		 math_GaussSingleIntegration(math_Function & F, const Standard_Real Lower, const Standard_Real Upper, const Standard_Integer Order);

		/****************** math_GaussSingleIntegration ******************/
		%feature("compactdefaultargs") math_GaussSingleIntegration;
		%feature("autodoc", "The gauss-legendre integration with n = order points of integration and given tolerance = tol is done on the function f between the bounds lower and upper.

	:param F:
	:type F: math_Function
	:param Lower:
	:type Lower: float
	:param Upper:
	:type Upper: float
	:param Order:
	:type Order: int
	:param Tol:
	:type Tol: float
	:rtype: None
") math_GaussSingleIntegration;
		 math_GaussSingleIntegration(math_Function & F, const Standard_Real Lower, const Standard_Real Upper, const Standard_Integer Order, const Standard_Real Tol);

};


%extend math_GaussSingleIntegration {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class math_GlobOptMin *
************************/
class math_GlobOptMin {
	public:
		class NCollection_CellFilter_Inspector {};
		/****************** GetContinuity ******************/
		%feature("compactdefaultargs") GetContinuity;
		%feature("autodoc", "	:rtype: int
") GetContinuity;
		Standard_Integer GetContinuity();

		/****************** GetF ******************/
		%feature("compactdefaultargs") GetF;
		%feature("autodoc", "Get best functional value.

	:rtype: float
") GetF;
		Standard_Real GetF();

		/****************** GetFunctionalMinimalValue ******************/
		%feature("compactdefaultargs") GetFunctionalMinimalValue;
		%feature("autodoc", "	:rtype: float
") GetFunctionalMinimalValue;
		Standard_Real GetFunctionalMinimalValue();

		/****************** GetLipConstState ******************/
		%feature("compactdefaultargs") GetLipConstState;
		%feature("autodoc", "	:rtype: bool
") GetLipConstState;
		Standard_Boolean GetLipConstState();

		/****************** GetTol ******************/
		%feature("compactdefaultargs") GetTol;
		%feature("autodoc", "Method to get tolerances. @param thediscretizationtol - parameter space discretization tolerance. @param thesametol - functional value space indifference tolerance.

	:param theDiscretizationTol:
	:type theDiscretizationTol: float
	:param theSameTol:
	:type theSameTol: float
	:rtype: None
") GetTol;
		void GetTol(Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** NbExtrema ******************/
		%feature("compactdefaultargs") NbExtrema;
		%feature("autodoc", "Return count of global extremas.

	:rtype: int
") NbExtrema;
		Standard_Integer NbExtrema();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "@param isfindsinglesolution - defines whether to find single solution or all solutions.

	:param isFindSingleSolution: default value is Standard_False
	:type isFindSingleSolution: bool
	:rtype: None
") Perform;
		void Perform(const Standard_Boolean isFindSingleSolution = Standard_False);

		/****************** Points ******************/
		%feature("compactdefaultargs") Points;
		%feature("autodoc", "Return solution theindex, 1 <= theindex <= nbextrema.

	:param theIndex:
	:type theIndex: int
	:param theSol:
	:type theSol: math_Vector
	:rtype: None
") Points;
		void Points(const Standard_Integer theIndex, math_Vector & theSol);

		/****************** SetContinuity ******************/
		%feature("compactdefaultargs") SetContinuity;
		%feature("autodoc", "Set / get continuity of local borders splits (0 ~ c0, 1 ~ c1, 2 ~ c2).

	:param theCont:
	:type theCont: int
	:rtype: None
") SetContinuity;
		void SetContinuity(const Standard_Integer theCont);

		/****************** SetFunctionalMinimalValue ******************/
		%feature("compactdefaultargs") SetFunctionalMinimalValue;
		%feature("autodoc", "Set / get functional minimal value.

	:param theMinimalValue:
	:type theMinimalValue: float
	:rtype: None
") SetFunctionalMinimalValue;
		void SetFunctionalMinimalValue(const Standard_Real theMinimalValue);

		/****************** SetGlobalParams ******************/
		%feature("compactdefaultargs") SetGlobalParams;
		%feature("autodoc", "@param thefunc - objective functional. @param thelowerborder - lower corner of the search box. @param theupperborder - upper corner of the search box. @param thec - lipschitz constant. @param thediscretizationtol - parameter space discretization tolerance. @param thesametol - functional value space indifference tolerance.

	:param theFunc:
	:type theFunc: math_MultipleVarFunction *
	:param theLowerBorder:
	:type theLowerBorder: math_Vector
	:param theUpperBorder:
	:type theUpperBorder: math_Vector
	:param theC: default value is 9
	:type theC: float
	:param theDiscretizationTol: default value is 1.0e-2
	:type theDiscretizationTol: float
	:param theSameTol: default value is 1.0e-7
	:type theSameTol: float
	:rtype: None
") SetGlobalParams;
		void SetGlobalParams(math_MultipleVarFunction * theFunc, const math_Vector & theLowerBorder, const math_Vector & theUpperBorder, const Standard_Real theC = 9, const Standard_Real theDiscretizationTol = 1.0e-2, const Standard_Real theSameTol = 1.0e-7);

		/****************** SetLipConstState ******************/
		%feature("compactdefaultargs") SetLipConstState;
		%feature("autodoc", "Set / get lipchitz constant modification state. true means that the constant is locked and unlocked otherwise.

	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetLipConstState;
		void SetLipConstState(const Standard_Boolean theFlag);

		/****************** SetLocalParams ******************/
		%feature("compactdefaultargs") SetLocalParams;
		%feature("autodoc", "Method to reduce bounding box. perform will use this box. @param thelocala - lower corner of the local box. @param thelocalb - upper corner of the local box.

	:param theLocalA:
	:type theLocalA: math_Vector
	:param theLocalB:
	:type theLocalB: math_Vector
	:rtype: None
") SetLocalParams;
		void SetLocalParams(const math_Vector & theLocalA, const math_Vector & theLocalB);

		/****************** SetTol ******************/
		%feature("compactdefaultargs") SetTol;
		%feature("autodoc", "Method to set tolerances. @param thediscretizationtol - parameter space discretization tolerance. @param thesametol - functional value space indifference tolerance.

	:param theDiscretizationTol:
	:type theDiscretizationTol: float
	:param theSameTol:
	:type theSameTol: float
	:rtype: None
") SetTol;
		void SetTol(const Standard_Real theDiscretizationTol, const Standard_Real theSameTol);

		/****************** math_GlobOptMin ******************/
		%feature("compactdefaultargs") math_GlobOptMin;
		%feature("autodoc", "Constructor. perform method is not called from it. @param thefunc - objective functional. @param thelowerborder - lower corner of the search box. @param theupperborder - upper corner of the search box. @param thec - lipschitz constant. @param thediscretizationtol - parameter space discretization tolerance. @param thesametol - functional value space indifference tolerance.

	:param theFunc:
	:type theFunc: math_MultipleVarFunction *
	:param theLowerBorder:
	:type theLowerBorder: math_Vector
	:param theUpperBorder:
	:type theUpperBorder: math_Vector
	:param theC: default value is 9
	:type theC: float
	:param theDiscretizationTol: default value is 1.0e-2
	:type theDiscretizationTol: float
	:param theSameTol: default value is 1.0e-7
	:type theSameTol: float
	:rtype: None
") math_GlobOptMin;
		 math_GlobOptMin(math_MultipleVarFunction * theFunc, const math_Vector & theLowerBorder, const math_Vector & theUpperBorder, const Standard_Real theC = 9, const Standard_Real theDiscretizationTol = 1.0e-2, const Standard_Real theSameTol = 1.0e-7);

};


%extend math_GlobOptMin {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class math_Householder *
*************************/
class math_Householder {
	public:
		/****************** AllValues ******************/
		%feature("compactdefaultargs") AllValues;
		%feature("autodoc", "Returns the matrix sol of all the solutions of the system a.x = b. exception notdone is raised is the resolution has not be done.

	:rtype: math_Matrix
") AllValues;
		const math_Matrix & AllValues();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Given the integer index, this routine returns the corresponding least square solution sol. exception notdone is raised if the resolution has not be done. exception outofrange is raised if index <=0 or index is more than the number of columns of b.

	:param sol:
	:type sol: math_Vector
	:param Index: default value is 1
	:type Index: int
	:rtype: None
") Value;
		void Value(math_Vector & sol, const Standard_Integer Index = 1);

		/****************** math_Householder ******************/
		%feature("compactdefaultargs") math_Householder;
		%feature("autodoc", "Given an input matrix a with n>= m, given an input matrix b this constructor performs the least square resolution of the set of linear equations a.x = b for each column of b. if a column norm is less than eps, the resolution can't be done. exception dimensionerror is raised if the row number of b is different from the a row number.

	:param A:
	:type A: math_Matrix
	:param B:
	:type B: math_Matrix
	:param EPS: default value is 1.0e-20
	:type EPS: float
	:rtype: None
") math_Householder;
		 math_Householder(const math_Matrix & A, const math_Matrix & B, const Standard_Real EPS = 1.0e-20);

		/****************** math_Householder ******************/
		%feature("compactdefaultargs") math_Householder;
		%feature("autodoc", "Given an input matrix a with n>= m, given an input matrix b this constructor performs the least square resolution of the set of linear equations a.x = b for each column of b. if a column norm is less than eps, the resolution can't be done. exception dimensionerror is raised if the row number of b is different from the a row number.

	:param A:
	:type A: math_Matrix
	:param B:
	:type B: math_Matrix
	:param lowerArow:
	:type lowerArow: int
	:param upperArow:
	:type upperArow: int
	:param lowerAcol:
	:type lowerAcol: int
	:param upperAcol:
	:type upperAcol: int
	:param EPS: default value is 1.0e-20
	:type EPS: float
	:rtype: None
") math_Householder;
		 math_Householder(const math_Matrix & A, const math_Matrix & B, const Standard_Integer lowerArow, const Standard_Integer upperArow, const Standard_Integer lowerAcol, const Standard_Integer upperAcol, const Standard_Real EPS = 1.0e-20);

		/****************** math_Householder ******************/
		%feature("compactdefaultargs") math_Householder;
		%feature("autodoc", "Given an input matrix a with n>= m, given an input vector b this constructor performs the least square resolution of the set of linear equations a.x = b. if a column norm is less than eps, the resolution can't be done. exception dimensionerror is raised if the length of b is different from the a row number.

	:param A:
	:type A: math_Matrix
	:param B:
	:type B: math_Vector
	:param EPS: default value is 1.0e-20
	:type EPS: float
	:rtype: None
") math_Householder;
		 math_Householder(const math_Matrix & A, const math_Vector & B, const Standard_Real EPS = 1.0e-20);

};


%extend math_Householder {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class math_IntegerVector *
***************************/
class math_IntegerVector {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the integervector 'theright' to an integervector. an exception is raised if the integervectors have not the same length. an exception is raised if the lengths are not equal.

	:param theRight:
	:type theRight: math_IntegerVector
	:rtype: None
") Add;
		void Add(const math_IntegerVector & theRight);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Sets an integervector to the sum of the integervector 'theleft' and the integervector 'theright'. an exception is raised if the lengths are different.

	:param theLeft:
	:type theLeft: math_IntegerVector
	:param theRight:
	:type theRight: math_IntegerVector
	:rtype: None
") Add;
		void Add(const math_IntegerVector & theLeft, const math_IntegerVector & theRight);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "Adds the integervector 'theright' to an integervector. an exception is raised if the integervectors have not the same length. an exception is raised if the lengths are not equal.

	:param theRight:
	:type theRight: math_IntegerVector
	:rtype: math_IntegerVector
") Added;
		math_IntegerVector Added(const math_IntegerVector & theRight);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize an integervector with all the elements set to theinitialvalue.

	:param theInitialValue:
	:type theInitialValue: int
	:rtype: None
") Init;
		void Init(const Standard_Integer theInitialValue);

		/****************** Initialized ******************/
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "Initialises an integervector by copying 'theother'. an exception is raised if the lengths are different.

	:param theOther:
	:type theOther: math_IntegerVector
	:rtype: math_IntegerVector
") Initialized;
		math_IntegerVector & Initialized(const math_IntegerVector & theOther);

		/****************** Inverse ******************/
		%feature("compactdefaultargs") Inverse;
		%feature("autodoc", "Returns the inverse integervector of an integervector.

	:rtype: math_IntegerVector
") Inverse;
		math_IntegerVector Inverse();

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Inverses an integervector.

	:rtype: None
") Invert;
		void Invert();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of an integervector.

	:rtype: int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns the value of the lower index of an integervector.

	:rtype: int
") Lower;
		Standard_Integer Lower();

		/****************** Max ******************/
		%feature("compactdefaultargs") Max;
		%feature("autodoc", "Returns the value of the index of the maximum element of an integervector.

	:rtype: int
") Max;
		Standard_Integer Max();

		/****************** Min ******************/
		%feature("compactdefaultargs") Min;
		%feature("autodoc", "Returns the value of the index of the minimum element of an integervector.

	:rtype: int
") Min;
		Standard_Integer Min();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Returns the product of an integervector by an integer value.

	:param theRight:
	:type theRight: int
	:rtype: math_IntegerVector
") Multiplied;
		math_IntegerVector Multiplied(const Standard_Integer theRight);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Returns the inner product of 2 integervectors. an exception is raised if the lengths are not equal.

	:param theRight:
	:type theRight: math_IntegerVector
	:rtype: int
") Multiplied;
		Standard_Integer Multiplied(const math_IntegerVector & theRight);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Returns the product of an integervector by an integer value.

	:param theRight:
	:type theRight: int
	:rtype: None
") Multiply;
		void Multiply(const Standard_Integer theRight);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Returns the multiplication of an integer by an integervector.

	:param theLeft:
	:type theLeft: int
	:param theRight:
	:type theRight: math_IntegerVector
	:rtype: None
") Multiply;
		void Multiply(const Standard_Integer theLeft, const math_IntegerVector & theRight);

		/****************** Norm ******************/
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "Returns the value of the norm of an integervector.

	:rtype: float
") Norm;
		Standard_Real Norm();

		/****************** Norm2 ******************/
		%feature("compactdefaultargs") Norm2;
		%feature("autodoc", "Returns the value of the square of the norm of an integervector.

	:rtype: float
") Norm2;
		Standard_Real Norm2();

		/****************** Opposite ******************/
		%feature("compactdefaultargs") Opposite;
		%feature("autodoc", "Returns the opposite of an integervector.

	:rtype: math_IntegerVector
") Opposite;
		math_IntegerVector Opposite();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets an integervector from 'thei1' to 'thei2' to the integervector 'thev'; an exception is raised if 'thei1' is less than 'lowerindex' or 'thei2' is greater than 'upperindex' or 'thei1' is greater than 'thei2'. an exception is raised if 'thei2-thei1+1' is different from the length of 'thev'.

	:param theI1:
	:type theI1: int
	:param theI2:
	:type theI2: int
	:param theV:
	:type theV: math_IntegerVector
	:rtype: None
") Set;
		void Set(const Standard_Integer theI1, const Standard_Integer theI2, const math_IntegerVector & theV);

		/****************** Slice ******************/
		%feature("compactdefaultargs") Slice;
		%feature("autodoc", "Slices the values of the integervector between 'thei1' and 'thei2': example: [2, 1, 2, 3, 4, 5] becomes [2, 4, 3, 2, 1, 5] between 2 and 5. an exception is raised if 'thei1' is less than 'lowerindex' or 'thei2' is greater than 'upperindex'.

	:param theI1:
	:type theI1: int
	:param theI2:
	:type theI2: int
	:rtype: math_IntegerVector
") Slice;
		math_IntegerVector Slice(const Standard_Integer theI1, const Standard_Integer theI2);

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "Sets an integervector to the substraction of 'theright' from 'theleft'. an exception is raised if the integervectors have not the same length.

	:param theLeft:
	:type theLeft: math_IntegerVector
	:param theRight:
	:type theRight: math_IntegerVector
	:rtype: None
") Subtract;
		void Subtract(const math_IntegerVector & theLeft, const math_IntegerVector & theRight);

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "Returns the subtraction of 'theright' from 'me'. an exception is raised if the integervectors have not the same length.

	:param theRight:
	:type theRight: math_IntegerVector
	:rtype: None
") Subtract;
		void Subtract(const math_IntegerVector & theRight);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "Returns the subtraction of 'theright' from 'me'. an exception is raised if the integervectors have not the same length.

	:param theRight:
	:type theRight: math_IntegerVector
	:rtype: math_IntegerVector
") Subtracted;
		math_IntegerVector Subtracted(const math_IntegerVector & theRight);

		/****************** TMultiplied ******************/
		%feature("compactdefaultargs") TMultiplied;
		%feature("autodoc", "Returns the product of a vector and a real value.

	:param theRight:
	:type theRight: int
	:rtype: math_IntegerVector
") TMultiplied;
		math_IntegerVector TMultiplied(const Standard_Integer theRight);

		/****************** Upper ******************/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Returns the value of the upper index of an integervector.

	:rtype: int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Accesses the value of index thenum of an integervector.

	:param theNum:
	:type theNum: int
	:rtype: int
") Value;
		const Standard_Integer & Value(const Standard_Integer theNum);


        %feature("autodoc","1");
        %extend {
            Standard_Integer GetValue(const Standard_Integer theNum) {
            return (Standard_Integer) $self->Value(theNum);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetValue(const Standard_Integer theNum,Standard_Integer value) {
            $self->Value(theNum)=value;
            }
        };
		/****************** math_IntegerVector ******************/
		%feature("compactdefaultargs") math_IntegerVector;
		%feature("autodoc", "Contructs an integervector in the range [lower..upper].

	:param theFirst:
	:type theFirst: int
	:param theLast:
	:type theLast: int
	:rtype: None
") math_IntegerVector;
		 math_IntegerVector(const Standard_Integer theFirst, const Standard_Integer theLast);

		/****************** math_IntegerVector ******************/
		%feature("compactdefaultargs") math_IntegerVector;
		%feature("autodoc", "Contructs an integervector in the range [lower..upper] with all the elements set to theinitialvalue.

	:param theFirst:
	:type theFirst: int
	:param theLast:
	:type theLast: int
	:param theInitialValue:
	:type theInitialValue: int
	:rtype: None
") math_IntegerVector;
		 math_IntegerVector(const Standard_Integer theFirst, const Standard_Integer theLast, const Standard_Integer theInitialValue);

		/****************** math_IntegerVector ******************/
		%feature("compactdefaultargs") math_IntegerVector;
		%feature("autodoc", "Constructs an integervector in the range [lower..upper] which share the 'c array' thetab.

	:param theTab:
	:type theTab: int *
	:param theFirst:
	:type theFirst: int
	:param theLast:
	:type theLast: int
	:rtype: None
") math_IntegerVector;
		 math_IntegerVector(const Standard_Integer * theTab, const Standard_Integer theFirst, const Standard_Integer theLast);

		/****************** math_IntegerVector ******************/
		%feature("compactdefaultargs") math_IntegerVector;
		%feature("autodoc", "Constructs a copy for initialization. an exception is raised if the lengths of the integervectors are different.

	:param theOther:
	:type theOther: math_IntegerVector
	:rtype: None
") math_IntegerVector;
		 math_IntegerVector(const math_IntegerVector & theOther);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param theRight:
	:type theRight: int
	:rtype: math_IntegerVector
") operator *;
		math_IntegerVector operator *(const Standard_Integer theRight);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param theRight:
	:type theRight: math_IntegerVector
	:rtype: int
") operator *;
		Standard_Integer operator *(const math_IntegerVector & theRight);


            %extend{
                void __imul_wrapper__(const Standard_Integer other) {
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
		%feature("autodoc", "	:param theRight:
	:type theRight: math_IntegerVector
	:rtype: math_IntegerVector
") operator +;
		math_IntegerVector operator +(const math_IntegerVector & theRight);


            %extend{
                void __iadd_wrapper__(const math_IntegerVector other) {
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
		%feature("autodoc", "	:rtype: math_IntegerVector
") operator -;
		math_IntegerVector operator -();

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:param theRight:
	:type theRight: math_IntegerVector
	:rtype: math_IntegerVector
") operator -;
		math_IntegerVector operator -(const math_IntegerVector & theRight);


            %extend{
                void __isub_wrapper__(const math_IntegerVector other) {
                *self -= other;
                }
            }
            %pythoncode {
            def __isub__(self, right):
                self.__isub_wrapper__(right)
                return self
            }
};


%extend math_IntegerVector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class math_Jacobi *
********************/
class math_Jacobi {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the eigenvalue number num. eigenvalues are in the range (1..n). exception notdone is raised if calculation is not done successfully.

	:param Num:
	:type Num: int
	:rtype: float
") Value;
		Standard_Real Value(const Standard_Integer Num);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the eigenvalues vector. exception notdone is raised if calculation is not done successfully.

	:rtype: math_Vector
") Values;
		const math_Vector & Values();

		/****************** Vector ******************/
		%feature("compactdefaultargs") Vector;
		%feature("autodoc", "Returns the eigenvector v of number num. eigenvectors are in the range (1..n). exception notdone is raised if calculation is not done successfully.

	:param Num:
	:type Num: int
	:param V:
	:type V: math_Vector
	:rtype: None
") Vector;
		void Vector(const Standard_Integer Num, math_Vector & V);

		/****************** Vectors ******************/
		%feature("compactdefaultargs") Vectors;
		%feature("autodoc", "Returns the eigenvectors matrix. exception notdone is raised if calculation is not done successfully.

	:rtype: math_Matrix
") Vectors;
		const math_Matrix & Vectors();

		/****************** math_Jacobi ******************/
		%feature("compactdefaultargs") math_Jacobi;
		%feature("autodoc", "Given a real n x n matrix a, this constructor computes all its eigenvalues and eigenvectors using the jacobi method. the exception notsquare is raised if the matrix is not square. no verification that the matrix a is really symmetric is done.

	:param A:
	:type A: math_Matrix
	:rtype: None
") math_Jacobi;
		 math_Jacobi(const math_Matrix & A);

};


%extend math_Jacobi {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class math_KronrodSingleIntegration *
**************************************/
class math_KronrodSingleIntegration {
	public:
		/****************** AbsolutError ******************/
		%feature("compactdefaultargs") AbsolutError;
		%feature("autodoc", "Returns the value of the relative error reached.

	:rtype: float
") AbsolutError;
		Standard_Real AbsolutError();

		/****************** ErrorReached ******************/
		%feature("compactdefaultargs") ErrorReached;
		%feature("autodoc", "Returns the value of the relative error reached.

	:rtype: float
") ErrorReached;
		Standard_Real ErrorReached();

		/****************** GKRule ******************/
		%feature("compactdefaultargs") GKRule;
		%feature("autodoc", "	:param theFunction:
	:type theFunction: math_Function
	:param theLower:
	:type theLower: float
	:param theUpper:
	:type theUpper: float
	:param theGaussP:
	:type theGaussP: math_Vector
	:param theGaussW:
	:type theGaussW: math_Vector
	:param theKronrodP:
	:type theKronrodP: math_Vector
	:param theKronrodW:
	:type theKronrodW: math_Vector
	:param theValue:
	:type theValue: float
	:param theError:
	:type theError: float
	:rtype: bool
") GKRule;
		static Standard_Boolean GKRule(math_Function & theFunction, const Standard_Real theLower, const Standard_Real theUpper, const math_Vector & theGaussP, const math_Vector & theGaussW, const math_Vector & theKronrodP, const math_Vector & theKronrodW, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns standard_true if computation is performed successfully.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbIterReached ******************/
		%feature("compactdefaultargs") NbIterReached;
		%feature("autodoc", "Returns the number of iterations that were made to compute result.

	:rtype: int
") NbIterReached;
		Standard_Integer NbIterReached();

		/****************** OrderReached ******************/
		%feature("compactdefaultargs") OrderReached;
		%feature("autodoc", "Returns the number of kronrod points for which the result is computed.

	:rtype: int
") OrderReached;
		Standard_Integer OrderReached();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computation of the integral. takes the function, the lower and upper bound values, the initial number of kronrod points, the relative tolerance value and the maximal number of iterations as parameters. thenbpnts should be odd and greater then or equal to 3.

	:param theFunction:
	:type theFunction: math_Function
	:param theLower:
	:type theLower: float
	:param theUpper:
	:type theUpper: float
	:param theNbPnts:
	:type theNbPnts: int
	:rtype: None
") Perform;
		void Perform(math_Function & theFunction, const Standard_Real theLower, const Standard_Real theUpper, const Standard_Integer theNbPnts);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computation of the integral. takes the function, the lower and upper bound values, the initial number of kronrod points, the relative tolerance value and the maximal number of iterations as parameters. thenbpnts should be odd and greater then or equal to 3. note that thetolerance is relative, i.e. the criterion of solution reaching is: abs(kronrod - gauss)/abs(kronrod) < thetolerance. thetolerance should be positive.

	:param theFunction:
	:type theFunction: math_Function
	:param theLower:
	:type theLower: float
	:param theUpper:
	:type theUpper: float
	:param theNbPnts:
	:type theNbPnts: int
	:param theTolerance:
	:type theTolerance: float
	:param theMaxNbIter:
	:type theMaxNbIter: int
	:rtype: None
") Perform;
		void Perform(math_Function & theFunction, const Standard_Real theLower, const Standard_Real theUpper, const Standard_Integer theNbPnts, const Standard_Real theTolerance, const Standard_Integer theMaxNbIter);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the integral.

	:rtype: float
") Value;
		Standard_Real Value();

		/****************** math_KronrodSingleIntegration ******************/
		%feature("compactdefaultargs") math_KronrodSingleIntegration;
		%feature("autodoc", "An empty constructor.

	:rtype: None
") math_KronrodSingleIntegration;
		 math_KronrodSingleIntegration();

		/****************** math_KronrodSingleIntegration ******************/
		%feature("compactdefaultargs") math_KronrodSingleIntegration;
		%feature("autodoc", "Constructor. takes the function, the lower and upper bound values, the initial number of kronrod points.

	:param theFunction:
	:type theFunction: math_Function
	:param theLower:
	:type theLower: float
	:param theUpper:
	:type theUpper: float
	:param theNbPnts:
	:type theNbPnts: int
	:rtype: None
") math_KronrodSingleIntegration;
		 math_KronrodSingleIntegration(math_Function & theFunction, const Standard_Real theLower, const Standard_Real theUpper, const Standard_Integer theNbPnts);

		/****************** math_KronrodSingleIntegration ******************/
		%feature("compactdefaultargs") math_KronrodSingleIntegration;
		%feature("autodoc", "Constructor. takes the function, the lower and upper bound values, the initial number of kronrod points, the tolerance value and the maximal number of iterations as parameters.

	:param theFunction:
	:type theFunction: math_Function
	:param theLower:
	:type theLower: float
	:param theUpper:
	:type theUpper: float
	:param theNbPnts:
	:type theNbPnts: int
	:param theTolerance:
	:type theTolerance: float
	:param theMaxNbIter:
	:type theMaxNbIter: int
	:rtype: None
") math_KronrodSingleIntegration;
		 math_KronrodSingleIntegration(math_Function & theFunction, const Standard_Real theLower, const Standard_Real theUpper, const Standard_Integer theNbPnts, const Standard_Real theTolerance, const Standard_Integer theMaxNbIter);

};


%extend math_KronrodSingleIntegration {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class math_Matrix *
********************/
class math_Matrix {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the matrix <right> to a matrix. an exception is raised if the dimensions are different. warning in order to save time when copying matrices, it is preferable to use operator += or the function add whenever possible.

	:param Right:
	:type Right: math_Matrix
	:rtype: None
") Add;
		void Add(const math_Matrix & Right);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Sets a matrix to the addition of <left> and <right>. an exception is raised if the dimensions are different.

	:param Left:
	:type Left: math_Matrix
	:param Right:
	:type Right: math_Matrix
	:rtype: None
") Add;
		void Add(const math_Matrix & Left, const math_Matrix & Right);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "Adds the matrix <right> to a matrix. an exception is raised if the dimensions are different.

	:param Right:
	:type Right: math_Matrix
	:rtype: math_Matrix
") Added;
		math_Matrix Added(const math_Matrix & Right);

		/****************** Col ******************/
		%feature("compactdefaultargs") Col;
		%feature("autodoc", "Returns the column of index <col> of a matrix.

	:param Col:
	:type Col: int
	:rtype: math_Vector
") Col;
		math_Vector Col(const Standard_Integer Col);

		/****************** ColNumber ******************/
		%feature("compactdefaultargs") ColNumber;
		%feature("autodoc", "Returns the number of rows of this matrix. note that for a matrix a you always have the following relations: - a.rownumber() = a.upperrow() - a.lowerrow() + 1 - a.colnumber() = a.uppercol() - a.lowercol() + 1 - the length of a row of a is equal to the number of columns of a, - the length of a column of a is equal to the number of rows of a.returns the row range of a matrix.

	:rtype: int
") ColNumber;
		Standard_Integer ColNumber();

		/****************** Determinant ******************/
		%feature("compactdefaultargs") Determinant;
		%feature("autodoc", "Computes the determinant of a matrix. an exception is raised if the matrix is not a square matrix.

	:rtype: float
") Determinant;
		Standard_Real Determinant();

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "Divides all the elements of a matrix by the value <right>. an exception is raised if <right> = 0.

	:param Right:
	:type Right: float
	:rtype: None
") Divide;
		void Divide(const Standard_Real Right);

		/****************** Divided ******************/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "Divides all the elements of a matrix by the value <right>. an exception is raised if <right> = 0.

	:param Right:
	:type Right: float
	:rtype: math_Matrix
") Divided;
		math_Matrix Divided(const Standard_Real Right);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all the elements of a matrix to initialvalue.

	:param InitialValue:
	:type InitialValue: float
	:rtype: None
") Init;
		void Init(const Standard_Real InitialValue);

		/****************** Initialized ******************/
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "Matrixes are copied through assignement. an exception is raised if the dimensions are differents.

	:param Other:
	:type Other: math_Matrix
	:rtype: math_Matrix
") Initialized;
		math_Matrix & Initialized(const math_Matrix & Other);

		/****************** Inverse ******************/
		%feature("compactdefaultargs") Inverse;
		%feature("autodoc", "Returns the inverse of a matrix. exception notsquare is raised if the matrix is not square. exception singularmatrix is raised if the matrix is singular.

	:rtype: math_Matrix
") Inverse;
		math_Matrix Inverse();

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Inverts a matrix using gauss algorithm. exception notsquare is raised if the matrix is not square. exception singularmatrix is raised if the matrix is singular.

	:rtype: None
") Invert;
		void Invert();

		/****************** LowerCol ******************/
		%feature("compactdefaultargs") LowerCol;
		%feature("autodoc", "Returns the value of the lower index of the column range of a matrix.

	:rtype: int
") LowerCol;
		Standard_Integer LowerCol();

		/****************** LowerRow ******************/
		%feature("compactdefaultargs") LowerRow;
		%feature("autodoc", "Returns the value of the lower index of the row range of a matrix.

	:rtype: int
") LowerRow;
		Standard_Integer LowerRow();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Multiplies all the elements of a matrix by the value <right>.

	:param Right:
	:type Right: float
	:rtype: math_Matrix
") Multiplied;
		math_Matrix Multiplied(const Standard_Real Right);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Returns the product of 2 matrices. an exception is raised if the dimensions are different.

	:param Right:
	:type Right: math_Matrix
	:rtype: math_Matrix
") Multiplied;
		math_Matrix Multiplied(const math_Matrix & Right);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Returns the product of a matrix by a vector. an exception is raised if the dimensions are different.

	:param Right:
	:type Right: math_Vector
	:rtype: math_Vector
") Multiplied;
		math_Vector Multiplied(const math_Vector & Right);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Sets this matrix to the product of the matrix left, and the matrix right. example math_matrix a (1, 3, 1, 3); math_matrix b (1, 3, 1, 3); // a = ... , b = ... math_matrix c (1, 3, 1, 3); c.multiply(a, b); exceptions standard_dimensionerror if matrices are of incompatible dimensions, i.e. if: - the number of columns of matrix left, or the number of rows of matrix tleft is not equal to the number of rows of matrix right, or - the number of rows of matrix left, or the number of columns of matrix tleft is not equal to the number of rows of this matrix, or - the number of columns of matrix right is not equal to the number of columns of this matrix.

	:param Right:
	:type Right: float
	:rtype: None
") Multiply;
		void Multiply(const Standard_Real Right);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Computes a matrix as the product of 2 vectors. an exception is raised if the dimensions are different. <self> = <left> * <right>.

	:param Left:
	:type Left: math_Vector
	:param Right:
	:type Right: math_Vector
	:rtype: None
") Multiply;
		void Multiply(const math_Vector & Left, const math_Vector & Right);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Computes a matrix as the product of 2 matrixes. an exception is raised if the dimensions are different.

	:param Left:
	:type Left: math_Matrix
	:param Right:
	:type Right: math_Matrix
	:rtype: None
") Multiply;
		void Multiply(const math_Matrix & Left, const math_Matrix & Right);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Returns the product of 2 matrices. an exception is raised if the dimensions are different.

	:param Right:
	:type Right: math_Matrix
	:rtype: None
") Multiply;
		void Multiply(const math_Matrix & Right);

		/****************** Opposite ******************/
		%feature("compactdefaultargs") Opposite;
		%feature("autodoc", "Returns the opposite of a matrix. an exception is raised if the dimensions are different.

	:rtype: math_Matrix
") Opposite;
		math_Matrix Opposite();

		/****************** Row ******************/
		%feature("compactdefaultargs") Row;
		%feature("autodoc", "Returns the row of index row of a matrix.

	:param Row:
	:type Row: int
	:rtype: math_Vector
") Row;
		math_Vector Row(const Standard_Integer Row);

		/****************** RowNumber ******************/
		%feature("compactdefaultargs") RowNumber;
		%feature("autodoc", "Returns the number of rows of this matrix. note that for a matrix a you always have the following relations: - a.rownumber() = a.upperrow() - a.lowerrow() + 1 - a.colnumber() = a.uppercol() - a.lowercol() + 1 - the length of a row of a is equal to the number of columns of a, - the length of a column of a is equal to the number of rows of a.returns the row range of a matrix.

	:rtype: int
") RowNumber;
		Standard_Integer RowNumber();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets the values of this matrix, - from index i1 to index i2 on the row dimension, and - from index j1 to index j2 on the column dimension, to those of matrix m. exceptions standard_dimensionerror if: - i1 is less than the index of the lower row bound of this matrix, or - i2 is greater than the index of the upper row bound of this matrix, or - j1 is less than the index of the lower column bound of this matrix, or - j2 is greater than the index of the upper column bound of this matrix, or - i2 - i1 + 1 is not equal to the number of rows of matrix m, or - j2 - j1 + 1 is not equal to the number of columns of matrix m.

	:param I1:
	:type I1: int
	:param I2:
	:type I2: int
	:param J1:
	:type J1: int
	:param J2:
	:type J2: int
	:param M:
	:type M: math_Matrix
	:rtype: None
") Set;
		void Set(const Standard_Integer I1, const Standard_Integer I2, const Standard_Integer J1, const Standard_Integer J2, const math_Matrix & M);

		/****************** SetCol ******************/
		%feature("compactdefaultargs") SetCol;
		%feature("autodoc", "Sets the column of index col of a matrix to the vector <v>. an exception is raised if the dimensions are different. an exception is raises if <col> is inferior to the lower column of the matrix or <col> is superior to the upper column.

	:param Col:
	:type Col: int
	:param V:
	:type V: math_Vector
	:rtype: None
") SetCol;
		void SetCol(const Standard_Integer Col, const math_Vector & V);

		/****************** SetDiag ******************/
		%feature("compactdefaultargs") SetDiag;
		%feature("autodoc", "Sets the diagonal of a matrix to the value <value>. an exception is raised if the matrix is not square.

	:param Value:
	:type Value: float
	:rtype: None
") SetDiag;
		void SetDiag(const Standard_Real Value);

		/****************** SetRow ******************/
		%feature("compactdefaultargs") SetRow;
		%feature("autodoc", "Sets the row of index row of a matrix to the vector <v>. an exception is raised if the dimensions are different. an exception is raises if <row> is inferior to the lower row of the matrix or <row> is superior to the upper row.

	:param Row:
	:type Row: int
	:param V:
	:type V: math_Vector
	:rtype: None
") SetRow;
		void SetRow(const Standard_Integer Row, const math_Vector & V);

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "Subtracts the matrix <right> from <self>. an exception is raised if the dimensions are different. warning in order to avoid time-consuming copying of matrices, it is preferable to use operator -= or the function subtract whenever possible.

	:param Right:
	:type Right: math_Matrix
	:rtype: None
") Subtract;
		void Subtract(const math_Matrix & Right);

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "Sets a matrix to the subtraction of the matrix <right> from the matrix <left>. an exception is raised if the dimensions are different.

	:param Left:
	:type Left: math_Matrix
	:param Right:
	:type Right: math_Matrix
	:rtype: None
") Subtract;
		void Subtract(const math_Matrix & Left, const math_Matrix & Right);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "Returns the result of the subtraction of <right> from <self>. an exception is raised if the dimensions are different.

	:param Right:
	:type Right: math_Matrix
	:rtype: math_Matrix
") Subtracted;
		math_Matrix Subtracted(const math_Matrix & Right);

		/****************** SwapCol ******************/
		%feature("compactdefaultargs") SwapCol;
		%feature("autodoc", "Swaps the columns of index <col1> and <col2>. an exception is raised if <col1> or <col2> is out of range.

	:param Col1:
	:type Col1: int
	:param Col2:
	:type Col2: int
	:rtype: None
") SwapCol;
		void SwapCol(const Standard_Integer Col1, const Standard_Integer Col2);

		/****************** SwapRow ******************/
		%feature("compactdefaultargs") SwapRow;
		%feature("autodoc", "Swaps the rows of index row1 and row2. an exception is raised if <row1> or <row2> is out of range.

	:param Row1:
	:type Row1: int
	:param Row2:
	:type Row2: int
	:rtype: None
") SwapRow;
		void SwapRow(const Standard_Integer Row1, const Standard_Integer Row2);

		/****************** TMultiplied ******************/
		%feature("compactdefaultargs") TMultiplied;
		%feature("autodoc", "Sets this matrix to the product of the transposed matrix tleft, and the matrix right. example math_matrix a (1, 3, 1, 3); math_matrix b (1, 3, 1, 3); // a = ... , b = ... math_matrix c (1, 3, 1, 3); c.multiply(a, b); exceptions standard_dimensionerror if matrices are of incompatible dimensions, i.e. if: - the number of columns of matrix left, or the number of rows of matrix tleft is not equal to the number of rows of matrix right, or - the number of rows of matrix left, or the number of columns of matrix tleft is not equal to the number of rows of this matrix, or - the number of columns of matrix right is not equal to the number of columns of this matrix.

	:param Right:
	:type Right: float
	:rtype: math_Matrix
") TMultiplied;
		math_Matrix TMultiplied(const Standard_Real Right);

		/****************** TMultiply ******************/
		%feature("compactdefaultargs") TMultiply;
		%feature("autodoc", "Returns the product of the transpose of a matrix with the matrix <right>. an exception is raised if the dimensions are different.

	:param Right:
	:type Right: math_Matrix
	:rtype: math_Matrix
") TMultiply;
		math_Matrix TMultiply(const math_Matrix & Right);

		/****************** TMultiply ******************/
		%feature("compactdefaultargs") TMultiply;
		%feature("autodoc", "Computes a matrix to the product of the transpose of the matrix <tleft> with the matrix <right>. an exception is raised if the dimensions are different.

	:param TLeft:
	:type TLeft: math_Matrix
	:param Right:
	:type Right: math_Matrix
	:rtype: None
") TMultiply;
		void TMultiply(const math_Matrix & TLeft, const math_Matrix & Right);

		/****************** Transpose ******************/
		%feature("compactdefaultargs") Transpose;
		%feature("autodoc", "Transposes a given matrix. an exception is raised if the matrix is not a square matrix.

	:rtype: None
") Transpose;
		void Transpose();

		/****************** Transposed ******************/
		%feature("compactdefaultargs") Transposed;
		%feature("autodoc", "Teturns the transposed of a matrix. an exception is raised if the matrix is not a square matrix.

	:rtype: math_Matrix
") Transposed;
		math_Matrix Transposed();

		/****************** UpperCol ******************/
		%feature("compactdefaultargs") UpperCol;
		%feature("autodoc", "Returns the value of the upper index of the column range of a matrix.

	:rtype: int
") UpperCol;
		Standard_Integer UpperCol();

		/****************** UpperRow ******************/
		%feature("compactdefaultargs") UpperRow;
		%feature("autodoc", "Returns the upper index of the row range of a matrix.

	:rtype: int
") UpperRow;
		Standard_Integer UpperRow();


        %feature("autodoc","1");
        %extend {
            Standard_Real GetValue(const Standard_Integer Row,const Standard_Integer Col) {
            return (Standard_Real) $self->Value(Row,Col);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetValue(const Standard_Integer Row,const Standard_Integer Col,Standard_Real value) {
            $self->Value(Row,Col)=value;
            }
        };
		/****************** math_Matrix ******************/
		%feature("compactdefaultargs") math_Matrix;
		%feature("autodoc", "Constructs a non-initialized matrix of range [lowerrow..upperrow, lowercol..uppercol] for the constructed matrix: - lowerrow and upperrow are the indexes of the lower and upper bounds of a row, and - lowercol and uppercol are the indexes of the lower and upper bounds of a column.

	:param LowerRow:
	:type LowerRow: int
	:param UpperRow:
	:type UpperRow: int
	:param LowerCol:
	:type LowerCol: int
	:param UpperCol:
	:type UpperCol: int
	:rtype: None
") math_Matrix;
		 math_Matrix(const Standard_Integer LowerRow, const Standard_Integer UpperRow, const Standard_Integer LowerCol, const Standard_Integer UpperCol);

		/****************** math_Matrix ******************/
		%feature("compactdefaultargs") math_Matrix;
		%feature("autodoc", "Constructs a non-initialized matrix of range [lowerrow..upperrow, lowercol..uppercol] whose values are all initialized with the value initialvalue.

	:param LowerRow:
	:type LowerRow: int
	:param UpperRow:
	:type UpperRow: int
	:param LowerCol:
	:type LowerCol: int
	:param UpperCol:
	:type UpperCol: int
	:param InitialValue:
	:type InitialValue: float
	:rtype: None
") math_Matrix;
		 math_Matrix(const Standard_Integer LowerRow, const Standard_Integer UpperRow, const Standard_Integer LowerCol, const Standard_Integer UpperCol, const Standard_Real InitialValue);

		/****************** math_Matrix ******************/
		%feature("compactdefaultargs") math_Matrix;
		%feature("autodoc", "Constructs a matrix of range [lowerrow..upperrow, lowercol..uppercol] sharing data with a 'c array' pointed by tab.

	:param Tab:
	:type Tab: Standard_Address
	:param LowerRow:
	:type LowerRow: int
	:param UpperRow:
	:type UpperRow: int
	:param LowerCol:
	:type LowerCol: int
	:param UpperCol:
	:type UpperCol: int
	:rtype: None
") math_Matrix;
		 math_Matrix(const Standard_Address Tab, const Standard_Integer LowerRow, const Standard_Integer UpperRow, const Standard_Integer LowerCol, const Standard_Integer UpperCol);

		/****************** math_Matrix ******************/
		%feature("compactdefaultargs") math_Matrix;
		%feature("autodoc", "Constructs a matrix for copy in initialization. an exception is raised if the matrixes have not the same dimensions.

	:param Other:
	:type Other: math_Matrix
	:rtype: None
") math_Matrix;
		 math_Matrix(const math_Matrix & Other);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Right:
	:type Right: float
	:rtype: math_Matrix
") operator *;
		math_Matrix operator *(const Standard_Real Right);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Right:
	:type Right: math_Matrix
	:rtype: math_Matrix
") operator *;
		math_Matrix operator *(const math_Matrix & Right);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Right:
	:type Right: math_Vector
	:rtype: math_Vector
") operator *;
		math_Vector operator *(const math_Vector & Right);


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

            %extend{
                void __imul_wrapper__(const math_Matrix other) {
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
		%feature("autodoc", "	:param Right:
	:type Right: math_Matrix
	:rtype: math_Matrix
") operator +;
		math_Matrix operator +(const math_Matrix & Right);


            %extend{
                void __iadd_wrapper__(const math_Matrix other) {
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
		%feature("autodoc", "	:param Right:
	:type Right: math_Matrix
	:rtype: math_Matrix
") operator -;
		math_Matrix operator -(const math_Matrix & Right);

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:rtype: math_Matrix
") operator -;
		math_Matrix operator -();


            %extend{
                void __isub_wrapper__(const math_Matrix other) {
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
		%feature("autodoc", "	:param Right:
	:type Right: float
	:rtype: math_Matrix
") operator /;
		math_Matrix operator /(const Standard_Real Right);


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


%extend math_Matrix {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class math_MultipleVarFunction *
*********************************/
%nodefaultctor math_MultipleVarFunction;
class math_MultipleVarFunction {
	public:
		/****************** GetStateNumber ******************/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return the state of the function corresponding to the latestt call of any methods associated to the function. this function is called by each of the algorithms described later which define the function integer algorithm::statenumber(). the algorithm has the responsibility to call this function when it has found a solution (i.e. a root or a minimum) and has to maintain the association between the solution found and this statenumber. byu default, this method returns 0 (which means for the algorithm: no state has been saved). it is the responsibility of the programmer to decide if he needs to save the current state of the function and to return an integer that allows retrieval of the state.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function.

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values of the functions <f> for the variable <x>. returns true if the computation was done successfully, otherwise false.

	:param X:
	:type X: math_Vector
	:param F:
	:type F: float
	:rtype: bool
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

};


%extend math_MultipleVarFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class math_NewtonFunctionRoot *
********************************/
class math_NewtonFunctionRoot {
	public:
		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the value of the derivative at the root. exception notdone is raised if the root was not found.

	:rtype: float
") Derivative;
		Standard_Real Derivative();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbIterations ******************/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Returns the number of iterations really done on the computation of the root. exception notdone is raised if the root was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Is used internally by the constructors.

	:param F:
	:type F: math_FunctionWithDerivative
	:param Guess:
	:type Guess: float
	:rtype: None
") Perform;
		void Perform(math_FunctionWithDerivative & F, const Standard_Real Guess);

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns the value of the root of function <f>. exception notdone is raised if the root was not found.

	:rtype: float
") Root;
		Standard_Real Root();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the value of the function at the root. exception notdone is raised if the root was not found.

	:rtype: float
") Value;
		Standard_Real Value();

		/****************** math_NewtonFunctionRoot ******************/
		%feature("compactdefaultargs") math_NewtonFunctionRoot;
		%feature("autodoc", "The newton method is done to find the root of the function f from the initial guess guess. the tolerance required on the root is given by tolerance. the solution is found when : abs(xi - xi-1) <= epsx and abs(f(xi))<= epsf the maximum number of iterations allowed is given by nbiterations.

	:param F:
	:type F: math_FunctionWithDerivative
	:param Guess:
	:type Guess: float
	:param EpsX:
	:type EpsX: float
	:param EpsF:
	:type EpsF: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:rtype: None
") math_NewtonFunctionRoot;
		 math_NewtonFunctionRoot(math_FunctionWithDerivative & F, const Standard_Real Guess, const Standard_Real EpsX, const Standard_Real EpsF, const Standard_Integer NbIterations = 100);

		/****************** math_NewtonFunctionRoot ******************/
		%feature("compactdefaultargs") math_NewtonFunctionRoot;
		%feature("autodoc", "The newton method is done to find the root of the function f from the initial guess guess. the solution must be inside the interval [a, b]. the tolerance required on the root is given by tolerance. the solution is found when : abs(xi - xi-1) <= epsx and abs(f(xi))<= epsf the maximum number of iterations allowed is given by nbiterations.

	:param F:
	:type F: math_FunctionWithDerivative
	:param Guess:
	:type Guess: float
	:param EpsX:
	:type EpsX: float
	:param EpsF:
	:type EpsF: float
	:param A:
	:type A: float
	:param B:
	:type B: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:rtype: None
") math_NewtonFunctionRoot;
		 math_NewtonFunctionRoot(math_FunctionWithDerivative & F, const Standard_Real Guess, const Standard_Real EpsX, const Standard_Real EpsF, const Standard_Real A, const Standard_Real B, const Standard_Integer NbIterations = 100);

		/****************** math_NewtonFunctionRoot ******************/
		%feature("compactdefaultargs") math_NewtonFunctionRoot;
		%feature("autodoc", "Is used in a sub-class to initialize correctly all the fields of this class.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:param EpsX:
	:type EpsX: float
	:param EpsF:
	:type EpsF: float
	:param NbIterations: default value is 100
	:type NbIterations: int
	:rtype: None
") math_NewtonFunctionRoot;
		 math_NewtonFunctionRoot(const Standard_Real A, const Standard_Real B, const Standard_Real EpsX, const Standard_Real EpsF, const Standard_Integer NbIterations = 100);

};


%extend math_NewtonFunctionRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class math_NewtonFunctionSetRoot *
***********************************/
class math_NewtonFunctionSetRoot {
	public:
		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Returns the matrix value of the derivative at the root. exception notdone is raised if the root was not found.

	:rtype: math_Matrix
") Derivative;
		const math_Matrix & Derivative();

		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Outputs the matrix value of the derivative at the root in der. exception notdone is raised if the root was not found. exception dimensionerror is raised if the range of der is not equal to the range of the startingpoint.

	:param Der:
	:type Der: math_Matrix
	:rtype: None
") Derivative;
		void Derivative(math_Matrix & Der);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** FunctionSetErrors ******************/
		%feature("compactdefaultargs") FunctionSetErrors;
		%feature("autodoc", "Returns the vector value of the error done on the functions at the root. exception notdone is raised if the root was not found.

	:rtype: math_Vector
") FunctionSetErrors;
		const math_Vector & FunctionSetErrors();

		/****************** FunctionSetErrors ******************/
		%feature("compactdefaultargs") FunctionSetErrors;
		%feature("autodoc", "Outputs the vector value of the error done on the functions at the root in err. exception notdone is raised if the root was not found. exception dimensionerror is raised if the range of err is not equal to the range of the startingpoint.

	:param Err:
	:type Err: math_Vector
	:rtype: None
") FunctionSetErrors;
		void FunctionSetErrors(math_Vector & Err);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsSolutionReached ******************/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "This method is called at the end of each iteration to check if the solution is found. vectors deltax, fvalues and jacobian matrix are consistent with the possible solution vector sol and can be inspected to decide whether the solution is reached or not.

	:param F:
	:type F: math_FunctionSetWithDerivatives
	:rtype: bool
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_FunctionSetWithDerivatives & F);

		/****************** NbIterations ******************/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Returns the number of iterations really done during the computation of the root. exception notdone is raised if the root was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The newton method is done to improve the root of the function from the initial guess point. the solution is found when: abs(xj - xj-1)(i) <= xtol(i) and abs(fi) <= ftol for all i;.

	:param theFunction:
	:type theFunction: math_FunctionSetWithDerivatives
	:param theStartingPoint:
	:type theStartingPoint: math_Vector
	:rtype: None
") Perform;
		void Perform(math_FunctionSetWithDerivatives & theFunction, const math_Vector & theStartingPoint);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "The newton method is done to improve the root of the function from the initial guess point. bounds may be given, to constrain the solution. the solution is found when: abs(xj - xj-1)(i) <= xtol(i) and abs(fi) <= ftol for all i;.

	:param theFunction:
	:type theFunction: math_FunctionSetWithDerivatives
	:param theStartingPoint:
	:type theStartingPoint: math_Vector
	:param theInfBound:
	:type theInfBound: math_Vector
	:param theSupBound:
	:type theSupBound: math_Vector
	:rtype: None
") Perform;
		void Perform(math_FunctionSetWithDerivatives & theFunction, const math_Vector & theStartingPoint, const math_Vector & theInfBound, const math_Vector & theSupBound);

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns the value of the root of function f. exceptions stdfail_notdone if the algorithm fails (and isdone returns false).

	:rtype: math_Vector
") Root;
		const math_Vector & Root();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Outputs the root vector in root. exception notdone is raised if the root was not found. exception dimensionerror is raised if the range of root is not equal to the range of the startingpoint.

	:param Root:
	:type Root: math_Vector
	:rtype: None
") Root;
		void Root(math_Vector & Root);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "Initializes the tolerance values for the unknowns.

	:param XTol:
	:type XTol: math_Vector
	:rtype: None
") SetTolerance;
		void SetTolerance(const math_Vector & XTol);

		/****************** math_NewtonFunctionSetRoot ******************/
		%feature("compactdefaultargs") math_NewtonFunctionSetRoot;
		%feature("autodoc", "Initialize correctly all the fields of this class. the range (1, f.nbvariables()) must be especially respected for all vectors and matrix declarations.

	:param theFunction:
	:type theFunction: math_FunctionSetWithDerivatives
	:param theXTolerance:
	:type theXTolerance: math_Vector
	:param theFTolerance:
	:type theFTolerance: float
	:param tehNbIterations: default value is 100
	:type tehNbIterations: int
	:rtype: None
") math_NewtonFunctionSetRoot;
		 math_NewtonFunctionSetRoot(math_FunctionSetWithDerivatives & theFunction, const math_Vector & theXTolerance, const Standard_Real theFTolerance, const Standard_Integer tehNbIterations = 100);

		/****************** math_NewtonFunctionSetRoot ******************/
		%feature("compactdefaultargs") math_NewtonFunctionSetRoot;
		%feature("autodoc", "This constructor should be used in a sub-class to initialize correctly all the fields of this class. the range (1, f.nbvariables()) must be especially respected for all vectors and matrix declarations. the method settolerance must be called before performing the algorithm.

	:param theFunction:
	:type theFunction: math_FunctionSetWithDerivatives
	:param theFTolerance:
	:type theFTolerance: float
	:param theNbIterations: default value is 100
	:type theNbIterations: int
	:rtype: None
") math_NewtonFunctionSetRoot;
		 math_NewtonFunctionSetRoot(math_FunctionSetWithDerivatives & theFunction, const Standard_Real theFTolerance, const Standard_Integer theNbIterations = 100);

};


%extend math_NewtonFunctionSetRoot {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class math_NewtonMinimum *
***************************/
class math_NewtonMinimum {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** GetStatus ******************/
		%feature("compactdefaultargs") GetStatus;
		%feature("autodoc", "Returns the status of computation. the exception notdone is raised if an error has occured.

	:rtype: math_Status
") GetStatus;
		math_Status GetStatus();

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Returns the gradient vector at the minimum. exception notdone is raised if an error has occured.the minimum was not found.

	:rtype: math_Vector
") Gradient;
		const math_Vector & Gradient();

		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Outputs the gradient vector at the minimum in grad. exception notdone is raised if the minimum was not found. exception dimensionerror is raised if the range of grad is not equal to the range of the startingpoint.

	:param Grad:
	:type Grad: math_Vector
	:rtype: None
") Gradient;
		void Gradient(math_Vector & Grad);

		/****************** IsConverged ******************/
		%feature("compactdefaultargs") IsConverged;
		%feature("autodoc", "This method is called at the end of each iteration to check the convergence: || xi+1 - xi || < tolerance or || f(xi+1) - f(xi)|| < tolerance * || f(xi) || it can be redefined in a sub-class to implement a specific test.

	:rtype: bool
") IsConverged;
		virtual Standard_Boolean IsConverged();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Tests if an error has occured.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location vector of the minimum. exception notdone is raised if an error has occured.

	:rtype: math_Vector
") Location;
		const math_Vector & Location();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Outputs the location vector of the minimum in loc. exception notdone is raised if an error has occured. exception dimensionerror is raised if the range of loc is not equal to the range of the startingpoint.

	:param Loc:
	:type Loc: math_Vector
	:rtype: None
") Location;
		void Location(math_Vector & Loc);

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Returns the value of the minimum. exception notdone is raised if the minimum was not found.

	:rtype: float
") Minimum;
		Standard_Real Minimum();

		/****************** NbIterations ******************/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Returns the number of iterations really done in the calculation of the minimum. the exception notdone is raised if an error has occured.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Search the solution.

	:param theFunction:
	:type theFunction: math_MultipleVarFunctionWithHessian
	:param theStartingPoint:
	:type theStartingPoint: math_Vector
	:rtype: None
") Perform;
		void Perform(math_MultipleVarFunctionWithHessian & theFunction, const math_Vector & theStartingPoint);

		/****************** SetBoundary ******************/
		%feature("compactdefaultargs") SetBoundary;
		%feature("autodoc", "Set boundaries.

	:param theLeftBorder:
	:type theLeftBorder: math_Vector
	:param theRightBorder:
	:type theRightBorder: math_Vector
	:rtype: None
") SetBoundary;
		void SetBoundary(const math_Vector & theLeftBorder, const math_Vector & theRightBorder);

		/****************** math_NewtonMinimum ******************/
		%feature("compactdefaultargs") math_NewtonMinimum;
		%feature("autodoc", "The tolerance required on the solution is given by tolerance. iteration are stopped if (!withsingularity) and h(f(xi)) is not definite positive (if the smaller eigenvalue of h < convexity) or isconverged() returns true for 2 successives iterations. warning: this constructor does not perform computation.

	:param theFunction:
	:type theFunction: math_MultipleVarFunctionWithHessian
	:param theTolerance: default value is Precision::Confusion()
	:type theTolerance: float
	:param theNbIterations: default value is 40
	:type theNbIterations: int
	:param theConvexity: default value is 1.0e-6
	:type theConvexity: float
	:param theWithSingularity: default value is Standard_True
	:type theWithSingularity: bool
	:rtype: None
") math_NewtonMinimum;
		 math_NewtonMinimum(const math_MultipleVarFunctionWithHessian & theFunction, const Standard_Real theTolerance = Precision::Confusion(), const Standard_Integer theNbIterations = 40, const Standard_Real theConvexity = 1.0e-6, const Standard_Boolean theWithSingularity = Standard_True);

};


%extend math_NewtonMinimum {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class math_PSO *
*****************/
class math_PSO {
	public:
		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Perform computations, particles array is constructed inside of this function.

	:param theSteps:
	:type theSteps: math_Vector
	:param theValue:
	:type theValue: float
	:param theOutPnt:
	:type theOutPnt: math_Vector
	:param theNbIter: default value is 100
	:type theNbIter: int
	:rtype: None
") Perform;
		void Perform(const math_Vector & theSteps, Standard_Real &OutValue, math_Vector & theOutPnt, const Standard_Integer theNbIter = 100);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Perform computations with given particles array.

	:param theParticles:
	:type theParticles: math_PSOParticlesPool
	:param theNbParticles:
	:type theNbParticles: int
	:param theValue:
	:type theValue: float
	:param theOutPnt:
	:type theOutPnt: math_Vector
	:param theNbIter: default value is 100
	:type theNbIter: int
	:rtype: None
") Perform;
		void Perform(math_PSOParticlesPool & theParticles, Standard_Integer theNbParticles, Standard_Real &OutValue, math_Vector & theOutPnt, const Standard_Integer theNbIter = 100);

		/****************** math_PSO ******************/
		%feature("compactdefaultargs") math_PSO;
		%feature("autodoc", "/** * constructor. * * @param thefunc defines the objective function. it should exist during all lifetime of class instance. * @param thelowborder defines lower border of search space. * @param theuppborder defines upper border of search space. * @param thesteps defines steps of regular grid, used for particle generation. this parameter used to define stop condition (terminalvelocity). * @param thenbparticles defines number of particles. * @param thenbiter defines maximum number of iterations. */.

	:param theFunc:
	:type theFunc: math_MultipleVarFunction *
	:param theLowBorder:
	:type theLowBorder: math_Vector
	:param theUppBorder:
	:type theUppBorder: math_Vector
	:param theSteps:
	:type theSteps: math_Vector
	:param theNbParticles: default value is 32
	:type theNbParticles: int
	:param theNbIter: default value is 100
	:type theNbIter: int
	:rtype: None
") math_PSO;
		 math_PSO(math_MultipleVarFunction * theFunc, const math_Vector & theLowBorder, const math_Vector & theUppBorder, const math_Vector & theSteps, const Standard_Integer theNbParticles = 32, const Standard_Integer theNbIter = 100);

};


%extend math_PSO {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class math_PSOParticlesPool *
******************************/
class math_PSOParticlesPool {
	public:
		/****************** GetBestParticle ******************/
		%feature("compactdefaultargs") GetBestParticle;
		%feature("autodoc", "	:rtype: PSO_Particle *
") GetBestParticle;
		PSO_Particle * GetBestParticle();

		/****************** GetParticle ******************/
		%feature("compactdefaultargs") GetParticle;
		%feature("autodoc", "	:param theIdx:
	:type theIdx: int
	:rtype: PSO_Particle *
") GetParticle;
		PSO_Particle * GetParticle(const Standard_Integer theIdx);

		/****************** GetWorstParticle ******************/
		%feature("compactdefaultargs") GetWorstParticle;
		%feature("autodoc", "	:rtype: PSO_Particle *
") GetWorstParticle;
		PSO_Particle * GetWorstParticle();

		/****************** math_PSOParticlesPool ******************/
		%feature("compactdefaultargs") math_PSOParticlesPool;
		%feature("autodoc", "	:param theParticlesCount:
	:type theParticlesCount: int
	:param theDimensionCount:
	:type theDimensionCount: int
	:rtype: None
") math_PSOParticlesPool;
		 math_PSOParticlesPool(const Standard_Integer theParticlesCount, const Standard_Integer theDimensionCount);

};


%extend math_PSOParticlesPool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class math_Powell *
********************/
class math_Powell {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** IsSolutionReached ******************/
		%feature("compactdefaultargs") IsSolutionReached;
		%feature("autodoc", "Solution f = fi is found when: 2.0 * abs(fi - fi-1) <= tolerance * (abs(fi) + abs(fi-1)) + zeps. the maximum number of iterations allowed is given by nbiterations.

	:param theFunction:
	:type theFunction: math_MultipleVarFunction
	:rtype: bool
") IsSolutionReached;
		virtual Standard_Boolean IsSolutionReached(math_MultipleVarFunction & theFunction);

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Returns the location vector of the minimum. exception notdone is raised if the minimum was not found.

	:rtype: math_Vector
") Location;
		const math_Vector & Location();

		/****************** Location ******************/
		%feature("compactdefaultargs") Location;
		%feature("autodoc", "Outputs the location vector of the minimum in loc. exception notdone is raised if the minimum was not found. exception dimensionerror is raised if the range of loc is not equal to the range of the startingpoint.

	:param Loc:
	:type Loc: math_Vector
	:rtype: None
") Location;
		void Location(math_Vector & Loc);

		/****************** Minimum ******************/
		%feature("compactdefaultargs") Minimum;
		%feature("autodoc", "Returns the value of the minimum. exception notdone is raised if the minimum was not found.

	:rtype: float
") Minimum;
		Standard_Real Minimum();

		/****************** NbIterations ******************/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Returns the number of iterations really done during the computation of the minimum. exception notdone is raised if the minimum was not found.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Computes powell minimization on the function f given thestartingpoint, and an initial matrix thestartingdirection whose columns contain the initial set of directions. the solution f = fi is found when: 2.0 * abs(fi - fi-1) =< tolerance * (abs(fi) + abs(fi-1) + zeps).

	:param theFunction:
	:type theFunction: math_MultipleVarFunction
	:param theStartingPoint:
	:type theStartingPoint: math_Vector
	:param theStartingDirections:
	:type theStartingDirections: math_Matrix
	:rtype: None
") Perform;
		void Perform(math_MultipleVarFunction & theFunction, const math_Vector & theStartingPoint, const math_Matrix & theStartingDirections);

		/****************** math_Powell ******************/
		%feature("compactdefaultargs") math_Powell;
		%feature("autodoc", "Constructor. initialize new entity.

	:param theFunction:
	:type theFunction: math_MultipleVarFunction
	:param theTolerance:
	:type theTolerance: float
	:param theNbIterations: default value is 200
	:type theNbIterations: int
	:param theZEPS: default value is 1.0e-12
	:type theZEPS: float
	:rtype: None
") math_Powell;
		 math_Powell(const math_MultipleVarFunction & theFunction, const Standard_Real theTolerance, const Standard_Integer theNbIterations = 200, const Standard_Real theZEPS = 1.0e-12);

};


%extend math_Powell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class math_SVD *
*****************/
class math_SVD {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** PseudoInverse ******************/
		%feature("compactdefaultargs") PseudoInverse;
		%feature("autodoc", "Computes the inverse inv of matrix a such as a * inverse = identity. exceptions stdfail_notdone if the algorithm fails (and isdone returns false). standard_dimensionerror if the ranges of inv are compatible with the ranges of a.

	:param Inv:
	:type Inv: math_Matrix
	:param Eps: default value is 1.0e-6
	:type Eps: float
	:rtype: None
") PseudoInverse;
		void PseudoInverse(math_Matrix & Inv, const Standard_Real Eps = 1.0e-6);

		/****************** Solve ******************/
		%feature("compactdefaultargs") Solve;
		%feature("autodoc", "Given the input vector b this routine solves the set of linear equations a . x = b. exception notdone is raised if the decomposition of a was not done successfully. exception dimensionerror is raised if the range of b is not equal to the rowrange of a. exception dimensionerror is raised if the range of x is not equal to the colrange of a.

	:param B:
	:type B: math_Vector
	:param X:
	:type X: math_Vector
	:param Eps: default value is 1.0e-6
	:type Eps: float
	:rtype: None
") Solve;
		void Solve(const math_Vector & B, math_Vector & X, const Standard_Real Eps = 1.0e-6);

		/****************** math_SVD ******************/
		%feature("compactdefaultargs") math_SVD;
		%feature("autodoc", "Given as input an n x m matrix a with n < m, n = m or n > m this constructor performs the singular value decomposition.

	:param A:
	:type A: math_Matrix
	:rtype: None
") math_SVD;
		 math_SVD(const math_Matrix & A);

};


%extend math_SVD {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class math_TrigonometricFunctionRoots *
****************************************/
class math_TrigonometricFunctionRoots {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** InfiniteRoots ******************/
		%feature("compactdefaultargs") InfiniteRoots;
		%feature("autodoc", "Returns true if there is an infinity of roots, otherwise returns false.

	:rtype: bool
") InfiniteRoots;
		Standard_Boolean InfiniteRoots();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbSolutions ******************/
		%feature("compactdefaultargs") NbSolutions;
		%feature("autodoc", "Returns the number of solutions found. an exception is raised if notdone. an exception is raised if there is an infinity of solutions.

	:rtype: int
") NbSolutions;
		Standard_Integer NbSolutions();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the solution of range index. an exception is raised if notdone. an exception is raised if index>nbsolutions. an exception is raised if there is an infinity of solutions.

	:param Index:
	:type Index: int
	:rtype: float
") Value;
		Standard_Real Value(const Standard_Integer Index);

		/****************** math_TrigonometricFunctionRoots ******************/
		%feature("compactdefaultargs") math_TrigonometricFunctionRoots;
		%feature("autodoc", "Given coefficients a, b, c, d , e, this constructor performs the resolution of the equation above. the solutions must be contained in [infbound, supbound]. infbound and supbound can be set by default to 0 and 2*pi.

	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:param D:
	:type D: float
	:param E:
	:type E: float
	:param InfBound:
	:type InfBound: float
	:param SupBound:
	:type SupBound: float
	:rtype: None
") math_TrigonometricFunctionRoots;
		 math_TrigonometricFunctionRoots(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D, const Standard_Real E, const Standard_Real InfBound, const Standard_Real SupBound);

		/****************** math_TrigonometricFunctionRoots ******************/
		%feature("compactdefaultargs") math_TrigonometricFunctionRoots;
		%feature("autodoc", "Given the two coefficients d and e, it performs the resolution of d*sin(x) + e = 0. the solutions must be contained in [infbound, supbound]. infbound and supbound can be set by default to 0 and 2*pi.

	:param D:
	:type D: float
	:param E:
	:type E: float
	:param InfBound:
	:type InfBound: float
	:param SupBound:
	:type SupBound: float
	:rtype: None
") math_TrigonometricFunctionRoots;
		 math_TrigonometricFunctionRoots(const Standard_Real D, const Standard_Real E, const Standard_Real InfBound, const Standard_Real SupBound);

		/****************** math_TrigonometricFunctionRoots ******************/
		%feature("compactdefaultargs") math_TrigonometricFunctionRoots;
		%feature("autodoc", "Given the three coefficients c, d and e, it performs the resolution of c*cos(x) + d*sin(x) + e = 0. the solutions must be contained in [infbound, supbound]. infbound and supbound can be set by default to 0 and 2*pi.

	:param C:
	:type C: float
	:param D:
	:type D: float
	:param E:
	:type E: float
	:param InfBound:
	:type InfBound: float
	:param SupBound:
	:type SupBound: float
	:rtype: None
") math_TrigonometricFunctionRoots;
		 math_TrigonometricFunctionRoots(const Standard_Real C, const Standard_Real D, const Standard_Real E, const Standard_Real InfBound, const Standard_Real SupBound);

};


%extend math_TrigonometricFunctionRoots {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class math_Uzawa *
*******************/
class math_Uzawa {
	public:
		/****************** Duale ******************/
		%feature("compactdefaultargs") Duale;
		%feature("autodoc", "Returns the duale variables v of the systeme.

	:param V:
	:type V: math_Vector
	:rtype: None
") Duale;
		void Duale(math_Vector & V);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Returns the difference between x solution and the startingpoint. an exception is raised if notdone.

	:rtype: math_Vector
") Error;
		const math_Vector & Error();

		/****************** InitialError ******************/
		%feature("compactdefaultargs") InitialError;
		%feature("autodoc", "Returns the initial error cont*startingpoint-secont. an exception is raised if notdone.

	:rtype: math_Vector
") InitialError;
		const math_Vector & InitialError();

		/****************** InverseCont ******************/
		%feature("compactdefaultargs") InverseCont;
		%feature("autodoc", "Returns the inverse matrix of (c * transposed(c)). this result is needed for the computation of the gradient when approximating a curve.

	:rtype: math_Matrix
") InverseCont;
		const math_Matrix & InverseCont();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Returns true if the computations are successful, otherwise returns false.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** NbIterations ******************/
		%feature("compactdefaultargs") NbIterations;
		%feature("autodoc", "Returns the number of iterations really done. an exception is raised if notdone.

	:rtype: int
") NbIterations;
		Standard_Integer NbIterations();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the vector solution of the system above. an exception is raised if notdone.

	:rtype: math_Vector
") Value;
		const math_Vector & Value();

		/****************** math_Uzawa ******************/
		%feature("compactdefaultargs") math_Uzawa;
		%feature("autodoc", "Given an input matrix cont, two input vectors secont and startingpoint, it solves cont*x = secont (only = equations) with a minimization of norme(x-x0). the maximun iterations number allowed is fixed to nbiterations. the tolerance epslic is fixed for the dual variable convergence. the tolerance epslix is used for the convergence of x. exception constuctionerror is raised if the line number of cont is different from the length of secont.

	:param Cont:
	:type Cont: math_Matrix
	:param Secont:
	:type Secont: math_Vector
	:param StartingPoint:
	:type StartingPoint: math_Vector
	:param EpsLix: default value is 1.0e-06
	:type EpsLix: float
	:param EpsLic: default value is 1.0e-06
	:type EpsLic: float
	:param NbIterations: default value is 500
	:type NbIterations: int
	:rtype: None
") math_Uzawa;
		 math_Uzawa(const math_Matrix & Cont, const math_Vector & Secont, const math_Vector & StartingPoint, const Standard_Real EpsLix = 1.0e-06, const Standard_Real EpsLic = 1.0e-06, const Standard_Integer NbIterations = 500);

		/****************** math_Uzawa ******************/
		%feature("compactdefaultargs") math_Uzawa;
		%feature("autodoc", "Given an input matrix cont, two input vectors secont and startingpoint, it solves cont*x = secont (the nce first equations are equal equations and the nci last equations are inequalities <) with a minimization of norme(x-x0). the maximun iterations number allowed is fixed to nbiterations. the tolerance epslic is fixed for the dual variable convergence. the tolerance epslix is used for the convergence of x. there are no conditions on nce and nci. exception constuctionerror is raised if the line number of cont is different from the length of secont and from nce + nci.

	:param Cont:
	:type Cont: math_Matrix
	:param Secont:
	:type Secont: math_Vector
	:param StartingPoint:
	:type StartingPoint: math_Vector
	:param Nci:
	:type Nci: int
	:param Nce:
	:type Nce: int
	:param EpsLix: default value is 1.0e-06
	:type EpsLix: float
	:param EpsLic: default value is 1.0e-06
	:type EpsLic: float
	:param NbIterations: default value is 500
	:type NbIterations: int
	:rtype: None
") math_Uzawa;
		 math_Uzawa(const math_Matrix & Cont, const math_Vector & Secont, const math_Vector & StartingPoint, const Standard_Integer Nci, const Standard_Integer Nce, const Standard_Real EpsLix = 1.0e-06, const Standard_Real EpsLic = 1.0e-06, const Standard_Integer NbIterations = 500);

};


%extend math_Uzawa {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class math_ValueAndWeight *
****************************/
class math_ValueAndWeight {
	public:
		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: float
") Value;
		Standard_Real Value();

		/****************** Weight ******************/
		%feature("compactdefaultargs") Weight;
		%feature("autodoc", "	:rtype: float
") Weight;
		Standard_Real Weight();

		/****************** math_ValueAndWeight ******************/
		%feature("compactdefaultargs") math_ValueAndWeight;
		%feature("autodoc", "	:rtype: None
") math_ValueAndWeight;
		 math_ValueAndWeight();

		/****************** math_ValueAndWeight ******************/
		%feature("compactdefaultargs") math_ValueAndWeight;
		%feature("autodoc", "	:param theValue:
	:type theValue: float
	:param theWeight:
	:type theWeight: float
	:rtype: None
") math_ValueAndWeight;
		 math_ValueAndWeight(Standard_Real theValue, Standard_Real theWeight);

};


%extend math_ValueAndWeight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class math_Vector *
********************/
class math_Vector {
	public:
		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Adds the vector 'theright' to a vector. an exception is raised if the vectors have not the same length. warning in order to avoid time-consuming copying of vectors, it is preferable to use operator += or the function add whenever possible.

	:param theRight:
	:type theRight: math_Vector
	:rtype: None
") Add;
		void Add(const math_Vector & theRight);

		/****************** Add ******************/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "Sets a vector to the sum of the vector 'theleft' and the vector 'theright'. an exception is raised if the lengths are different.

	:param theLeft:
	:type theLeft: math_Vector
	:param theRight:
	:type theRight: math_Vector
	:rtype: None
") Add;
		void Add(const math_Vector & theLeft, const math_Vector & theRight);

		/****************** Added ******************/
		%feature("compactdefaultargs") Added;
		%feature("autodoc", "Adds the vector theright to a vector. an exception is raised if the vectors have not the same length. an exception is raised if the lengths are not equal.

	:param theRight:
	:type theRight: math_Vector
	:rtype: math_Vector
") Added;
		math_Vector Added(const math_Vector & theRight);

		/****************** Divide ******************/
		%feature("compactdefaultargs") Divide;
		%feature("autodoc", "Divides a vector by the value 'theright'. an exception is raised if 'theright' = 0.

	:param theRight:
	:type theRight: float
	:rtype: None
") Divide;
		void Divide(const Standard_Real theRight);

		/****************** Divided ******************/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "Divides a vector by the value 'theright'. an exception is raised if 'theright' = 0.

	:param theRight:
	:type theRight: float
	:rtype: math_Vector
") Divided;
		math_Vector Divided(const Standard_Real theRight);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Init ******************/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "Initialize all the elements of a vector with 'theinitialvalue'.

	:param theInitialValue:
	:type theInitialValue: float
	:rtype: None
") Init;
		void Init(const Standard_Real theInitialValue);

		/****************** Initialized ******************/
		%feature("compactdefaultargs") Initialized;
		%feature("autodoc", "Initialises a vector by copying 'theother'. an exception is raised if the lengths are differents.

	:param theOther:
	:type theOther: math_Vector
	:rtype: math_Vector
") Initialized;
		math_Vector & Initialized(const math_Vector & theOther);

		/****************** Inverse ******************/
		%feature("compactdefaultargs") Inverse;
		%feature("autodoc", "Inverts this vector and creates a new vector.

	:rtype: math_Vector
") Inverse;
		math_Vector Inverse();

		/****************** Invert ******************/
		%feature("compactdefaultargs") Invert;
		%feature("autodoc", "Inverts this vector and assigns the result to this vector.

	:rtype: None
") Invert;
		void Invert();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "Returns the length of a vector.

	:rtype: int
") Length;
		Standard_Integer Length();

		/****************** Lower ******************/
		%feature("compactdefaultargs") Lower;
		%feature("autodoc", "Returns the value of the thelower index of a vector.

	:rtype: int
") Lower;
		Standard_Integer Lower();

		/****************** Max ******************/
		%feature("compactdefaultargs") Max;
		%feature("autodoc", "Returns the value of the 'index' of the maximum element of a vector.

	:rtype: int
") Max;
		Standard_Integer Max();

		/****************** Min ******************/
		%feature("compactdefaultargs") Min;
		%feature("autodoc", "Returns the value of the 'index' of the minimum element of a vector.

	:rtype: int
") Min;
		Standard_Integer Min();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Returns the product of a vector and a real value.

	:param theRight:
	:type theRight: float
	:rtype: math_Vector
") Multiplied;
		math_Vector Multiplied(const Standard_Real theRight);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Returns the inner product of 2 vectors. an exception is raised if the lengths are not equal.

	:param theRight:
	:type theRight: math_Vector
	:rtype: float
") Multiplied;
		Standard_Real Multiplied(const math_Vector & theRight);

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Returns the product of a vector by a matrix.

	:param theRight:
	:type theRight: math_Matrix
	:rtype: math_Vector
") Multiplied;
		math_Vector Multiplied(const math_Matrix & theRight);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Returns the product of a vector and a real value.

	:param theRight:
	:type theRight: float
	:rtype: None
") Multiply;
		void Multiply(const Standard_Real theRight);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Sets a vector to the product of the vector 'theleft' with the matrix 'theright'.

	:param theLeft:
	:type theLeft: math_Vector
	:param theRight:
	:type theRight: math_Matrix
	:rtype: None
") Multiply;
		void Multiply(const math_Vector & theLeft, const math_Matrix & theRight);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "//!sets a vector to the product of the matrix 'theleft' with the vector 'theright'.

	:param theLeft:
	:type theLeft: math_Matrix
	:param theRight:
	:type theRight: math_Vector
	:rtype: None
") Multiply;
		void Multiply(const math_Matrix & theLeft, const math_Vector & theRight);

		/****************** Multiply ******************/
		%feature("compactdefaultargs") Multiply;
		%feature("autodoc", "Returns the multiplication of a real by a vector. 'me' = 'theleft' * 'theright'.

	:param theLeft:
	:type theLeft: float
	:param theRight:
	:type theRight: math_Vector
	:rtype: None
") Multiply;
		void Multiply(const Standard_Real theLeft, const math_Vector & theRight);

		/****************** Norm ******************/
		%feature("compactdefaultargs") Norm;
		%feature("autodoc", "Returns the value or the square of the norm of this vector.

	:rtype: float
") Norm;
		Standard_Real Norm();

		/****************** Norm2 ******************/
		%feature("compactdefaultargs") Norm2;
		%feature("autodoc", "Returns the value of the square of the norm of a vector.

	:rtype: float
") Norm2;
		Standard_Real Norm2();

		/****************** Normalize ******************/
		%feature("compactdefaultargs") Normalize;
		%feature("autodoc", "Normalizes this vector (the norm of the result is equal to 1.0) and assigns the result to this vector exceptions standard_nullvalue if this vector is null (i.e. if its norm is less than or equal to standard_real::realepsilon().

	:rtype: None
") Normalize;
		void Normalize();

		/****************** Normalized ******************/
		%feature("compactdefaultargs") Normalized;
		%feature("autodoc", "Normalizes this vector (the norm of the result is equal to 1.0) and creates a new vector exceptions standard_nullvalue if this vector is null (i.e. if its norm is less than or equal to standard_real::realepsilon().

	:rtype: math_Vector
") Normalized;
		math_Vector Normalized();

		/****************** Opposite ******************/
		%feature("compactdefaultargs") Opposite;
		%feature("autodoc", "Returns the opposite of a vector.

	:rtype: math_Vector
") Opposite;
		math_Vector Opposite();

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Sets a vector from 'thei1' to 'thei2' to the vector 'thev'; an exception is raised if 'thei1' is less than 'lowerindex' or 'thei2' is greater than 'upperindex' or 'thei1' is greater than 'thei2'. an exception is raised if 'thei2-thei1+1' is different from the 'length' of 'thev'.

	:param theI1:
	:type theI1: int
	:param theI2:
	:type theI2: int
	:param theV:
	:type theV: math_Vector
	:rtype: None
") Set;
		void Set(const Standard_Integer theI1, const Standard_Integer theI2, const math_Vector & theV);

		/****************** Slice ******************/
		%feature("compactdefaultargs") Slice;
		%feature("autodoc", "//!creates a new vector by inverting the values of this vector between indexes 'thei1' and 'thei2'. if the values of this vector were (1., 2., 3., 4.,5., 6.), by slicing it between indexes 2 and 5 the values of the resulting vector are (1., 5., 4., 3., 2., 6.).

	:param theI1:
	:type theI1: int
	:param theI2:
	:type theI2: int
	:rtype: math_Vector
") Slice;
		math_Vector Slice(const Standard_Integer theI1, const Standard_Integer theI2);

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "Sets a vector to the subtraction of the vector theright from the vector theleft. an exception is raised if the vectors have not the same length. warning in order to avoid time-consuming copying of vectors, it is preferable to use operator -= or the function subtract whenever possible.

	:param theLeft:
	:type theLeft: math_Vector
	:param theRight:
	:type theRight: math_Vector
	:rtype: None
") Subtract;
		void Subtract(const math_Vector & theLeft, const math_Vector & theRight);

		/****************** Subtract ******************/
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "Returns the subtraction of 'theright' from 'me'. an exception is raised if the vectors have not the same length.

	:param theRight:
	:type theRight: math_Vector
	:rtype: None
") Subtract;
		void Subtract(const math_Vector & theRight);

		/****************** Subtracted ******************/
		%feature("compactdefaultargs") Subtracted;
		%feature("autodoc", "Returns the subtraction of 'theright' from 'me'. an exception is raised if the vectors have not the same length.

	:param theRight:
	:type theRight: math_Vector
	:rtype: math_Vector
") Subtracted;
		math_Vector Subtracted(const math_Vector & theRight);

		/****************** TMultiplied ******************/
		%feature("compactdefaultargs") TMultiplied;
		%feature("autodoc", "Returns the product of a vector and a real value.

	:param theRight:
	:type theRight: float
	:rtype: math_Vector
") TMultiplied;
		math_Vector TMultiplied(const Standard_Real theRight);

		/****************** TMultiply ******************/
		%feature("compactdefaultargs") TMultiply;
		%feature("autodoc", "Sets a vector to the product of the transpose of the matrix 'thetleft' by the vector 'theright'.

	:param theTLeft:
	:type theTLeft: math_Matrix
	:param theRight:
	:type theRight: math_Vector
	:rtype: None
") TMultiply;
		void TMultiply(const math_Matrix & theTLeft, const math_Vector & theRight);

		/****************** TMultiply ******************/
		%feature("compactdefaultargs") TMultiply;
		%feature("autodoc", "Sets a vector to the product of the vector 'theleft' by the transpose of the matrix 'thetright'.

	:param theLeft:
	:type theLeft: math_Vector
	:param theTRight:
	:type theTRight: math_Matrix
	:rtype: None
") TMultiply;
		void TMultiply(const math_Vector & theLeft, const math_Matrix & theTRight);

		/****************** Upper ******************/
		%feature("compactdefaultargs") Upper;
		%feature("autodoc", "Returns the value of the theupper index of a vector.

	:rtype: int
") Upper;
		Standard_Integer Upper();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Accesses the value of index 'thenum' of a vector.

	:param theNum:
	:type theNum: int
	:rtype: float
") Value;
		const Standard_Real & Value(const Standard_Integer theNum);


        %feature("autodoc","1");
        %extend {
            Standard_Real GetValue(const Standard_Integer theNum) {
            return (Standard_Real) $self->Value(theNum);
            }
        };
        %feature("autodoc","1");
        %extend {
            void SetValue(const Standard_Integer theNum,Standard_Real value) {
            $self->Value(theNum)=value;
            }
        };
		/****************** math_Vector ******************/
		%feature("compactdefaultargs") math_Vector;
		%feature("autodoc", "Contructs a non-initialized vector in the range [thelower..theupper] 'thelower' and 'theupper' are the indexes of the lower and upper bounds of the constructed vector.

	:param theLower:
	:type theLower: int
	:param theUpper:
	:type theUpper: int
	:rtype: None
") math_Vector;
		 math_Vector(const Standard_Integer theLower, const Standard_Integer theUpper);

		/****************** math_Vector ******************/
		%feature("compactdefaultargs") math_Vector;
		%feature("autodoc", "Contructs a vector in the range [thelower..theupper] whose values are all initialized with the value 'theinitialvalue'.

	:param theLower:
	:type theLower: int
	:param theUpper:
	:type theUpper: int
	:param theInitialValue:
	:type theInitialValue: float
	:rtype: None
") math_Vector;
		 math_Vector(const Standard_Integer theLower, const Standard_Integer theUpper, const Standard_Real theInitialValue);

		/****************** math_Vector ******************/
		%feature("compactdefaultargs") math_Vector;
		%feature("autodoc", "Constructs a vector in the range [thelower..theupper] with the 'c array' thetab.

	:param theTab:
	:type theTab: float *
	:param theLower:
	:type theLower: int
	:param theUpper:
	:type theUpper: int
	:rtype: None
") math_Vector;
		 math_Vector(const Standard_Real * theTab, const Standard_Integer theLower, const Standard_Integer theUpper);

		/****************** math_Vector ******************/
		%feature("compactdefaultargs") math_Vector;
		%feature("autodoc", "Constructor for converting gp_xy to math_vector.

	:param Other:
	:type Other: gp_XY
	:rtype: None
") math_Vector;
		 math_Vector(const gp_XY & Other);

		/****************** math_Vector ******************/
		%feature("compactdefaultargs") math_Vector;
		%feature("autodoc", "Constructor for converting gp_xyz to math_vector.

	:param Other:
	:type Other: gp_XYZ
	:rtype: None
") math_Vector;
		 math_Vector(const gp_XYZ & Other);

		/****************** math_Vector ******************/
		%feature("compactdefaultargs") math_Vector;
		%feature("autodoc", "Constructs a copy for initialization. an exception is raised if the lengths of the vectors are different.

	:param theOther:
	:type theOther: math_Vector
	:rtype: None
") math_Vector;
		 math_Vector(const math_Vector & theOther);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param theRight:
	:type theRight: float
	:rtype: math_Vector
") operator *;
		math_Vector operator *(const Standard_Real theRight);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param theRight:
	:type theRight: math_Vector
	:rtype: float
") operator *;
		Standard_Real operator *(const math_Vector & theRight);

		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param theRight:
	:type theRight: math_Matrix
	:rtype: math_Vector
") operator *;
		math_Vector operator *(const math_Matrix & theRight);


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
		%feature("autodoc", "	:param theRight:
	:type theRight: math_Vector
	:rtype: math_Vector
") operator +;
		math_Vector operator +(const math_Vector & theRight);


            %extend{
                void __iadd_wrapper__(const math_Vector other) {
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
		%feature("autodoc", "	:rtype: math_Vector
") operator -;
		math_Vector operator -();

		/****************** operator - ******************/
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:param theRight:
	:type theRight: math_Vector
	:rtype: math_Vector
") operator -;
		math_Vector operator -(const math_Vector & theRight);


            %extend{
                void __isub_wrapper__(const math_Vector other) {
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
		%feature("autodoc", "	:param theRight:
	:type theRight: float
	:rtype: math_Vector
") operator /;
		math_Vector operator /(const Standard_Real theRight);


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


%extend math_Vector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class math_FunctionSetWithDerivatives *
****************************************/
%nodefaultctor math_FunctionSetWithDerivatives;
class math_FunctionSetWithDerivatives : public math_FunctionSet {
	public:
		/****************** Derivatives ******************/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "Returns the values <d> of the derivatives for the variable <x>. returns true if the computation was done successfully, false otherwise.

	:param X:
	:type X: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool
") Derivatives;
		virtual Standard_Boolean Derivatives(const math_Vector & X, math_Matrix & D);

		/****************** NbEquations ******************/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Returns the number of equations of the function.

	:rtype: int
") NbEquations;
		virtual Standard_Integer NbEquations();

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function.

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values <f> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

	:param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:rtype: bool
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, math_Vector & F);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Returns the values <f> of the functions and the derivatives <d> for the variable <x>. returns true if the computation was done successfully, false otherwise.

	:param X:
	:type X: math_Vector
	:param F:
	:type F: math_Vector
	:param D:
	:type D: math_Matrix
	:rtype: bool
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend math_FunctionSetWithDerivatives {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class math_FunctionWithDerivative *
************************************/
%nodefaultctor math_FunctionWithDerivative;
class math_FunctionWithDerivative : public math_Function {
	public:
		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "Computes the derivative <d> of the function for the variable <x>. returns true if the calculation were successfully done, false otherwise.

	:param X:
	:type X: float
	:param D:
	:type D: float
	:rtype: bool
") Derivative;
		virtual Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the value <f>of the function for the variable <x>. returns true if the calculation were successfully done, false otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float
	:rtype: bool
") Value;
		virtual Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the value <f> and the derivative <d> of the function for the variable <x>. returns true if the calculation were successfully done, false otherwise.

	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: bool
") Values;
		virtual Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend math_FunctionWithDerivative {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************************
* class math_MultipleVarFunctionWithGradient *
*********************************************/
%nodefaultctor math_MultipleVarFunctionWithGradient;
class math_MultipleVarFunctionWithGradient : public math_MultipleVarFunction {
	public:
		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Computes the gradient <g> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

	:param X:
	:type X: math_Vector
	:param G:
	:type G: math_Vector
	:rtype: bool
") Gradient;
		virtual Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function.

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values of the functions <f> for the variable <x>. returns true if the computation was done successfully, false otherwise.

	:param X:
	:type X: math_Vector
	:param F:
	:type F: float
	:rtype: bool
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the value <f> and the gradient <g> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

	:param X:
	:type X: math_Vector
	:param F:
	:type F: float
	:param G:
	:type G: math_Vector
	:rtype: bool
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

};


%extend math_MultipleVarFunctionWithGradient {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class math_MultipleVarFunctionWithHessian *
********************************************/
%nodefaultctor math_MultipleVarFunctionWithHessian;
class math_MultipleVarFunctionWithHessian : public math_MultipleVarFunctionWithGradient {
	public:
		/****************** Gradient ******************/
		%feature("compactdefaultargs") Gradient;
		%feature("autodoc", "Computes the gradient <g> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

	:param X:
	:type X: math_Vector
	:param G:
	:type G: math_Vector
	:rtype: bool
") Gradient;
		virtual Standard_Boolean Gradient(const math_Vector & X, math_Vector & G);

		/****************** NbVariables ******************/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Returns the number of variables of the function.

	:rtype: int
") NbVariables;
		virtual Standard_Integer NbVariables();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Computes the values of the functions <f> for the variable <x>. returns true if the computation was done successfully, false otherwise.

	:param X:
	:type X: math_Vector
	:param F:
	:type F: float
	:rtype: bool
") Value;
		virtual Standard_Boolean Value(const math_Vector & X, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the value <f> and the gradient <g> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

	:param X:
	:type X: math_Vector
	:param F:
	:type F: float
	:param G:
	:type G: math_Vector
	:rtype: bool
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "Computes the value <f>, the gradient <g> and the hessian <h> of the functions for the variable <x>. returns true if the computation was done successfully, false otherwise.

	:param X:
	:type X: math_Vector
	:param F:
	:type F: float
	:param G:
	:type G: math_Vector
	:param H:
	:type H: math_Matrix
	:rtype: bool
") Values;
		virtual Standard_Boolean Values(const math_Vector & X, Standard_Real &OutValue, math_Vector & G, math_Matrix & H);

};


%extend math_MultipleVarFunctionWithHessian {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class math_TrigonometricEquationFunction *
*******************************************/
class math_TrigonometricEquationFunction : public math_FunctionWithDerivative {
	public:
		/****************** Derivative ******************/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	:param X:
	:type X: float
	:param D:
	:type D: float
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param X:
	:type X: float
	:param F:
	:type F: float
	:rtype: bool
") Value;
		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);

		/****************** Values ******************/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	:param X:
	:type X: float
	:param F:
	:type F: float
	:param D:
	:type D: float
	:rtype: bool
") Values;
		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);

		/****************** math_TrigonometricEquationFunction ******************/
		%feature("compactdefaultargs") math_TrigonometricEquationFunction;
		%feature("autodoc", "	:param A:
	:type A: float
	:param B:
	:type B: float
	:param C:
	:type C: float
	:param D:
	:type D: float
	:param E:
	:type E: float
	:rtype: None
") math_TrigonometricEquationFunction;
		 math_TrigonometricEquationFunction(const Standard_Real A, const Standard_Real B, const Standard_Real C, const Standard_Real D, const Standard_Real E);

};


%extend math_TrigonometricEquationFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
