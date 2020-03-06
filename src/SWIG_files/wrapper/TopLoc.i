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
%define TOPLOCDOCSTRING
"TopLoc module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_toploc.html"
%enddef
%module (package="OCC.Core", docstring=TOPLOCDOCSTRING) TopLoc


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
#include<TopLoc_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import gp.i
/* public enums */
/* end public enums declaration */

/* handles */
%wrap_handle(TopLoc_Datum3D)
%wrap_handle(TopLoc_SListNodeOfItemLocation)
/* end handles declaration */

/* templates */
%template(TopLoc_MapOfLocation) NCollection_Map<TopLoc_Location,TopLoc_MapLocationHasher>;
%template(TopLoc_IndexedMapOfLocation) NCollection_IndexedMap<TopLoc_Location,TopLoc_MapLocationHasher>;
%template(TopLoc_MapLocationHasher) NCollection_DefaultHasher<TopLoc_Location>;
/* end templates declaration */

/* typedefs */
typedef NCollection_Map<TopLoc_Location, TopLoc_MapLocationHasher> TopLoc_MapOfLocation;
typedef NCollection_Map<TopLoc_Location, TopLoc_MapLocationHasher>::Iterator TopLoc_MapIteratorOfMapOfLocation;
typedef NCollection_IndexedMap<TopLoc_Location, TopLoc_MapLocationHasher> TopLoc_IndexedMapOfLocation;
typedef NCollection_DefaultHasher<TopLoc_Location> TopLoc_MapLocationHasher;
/* end typedefs declaration */

/***********************
* class TopLoc_Datum3D *
***********************/
class TopLoc_Datum3D : public Standard_Transient {
	public:

            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };

        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
		/****************** TopLoc_Datum3D ******************/
		%feature("compactdefaultargs") TopLoc_Datum3D;
		%feature("autodoc", "Constructs a default datum3d.

	:rtype: None
") TopLoc_Datum3D;
		 TopLoc_Datum3D();

		/****************** TopLoc_Datum3D ******************/
		%feature("compactdefaultargs") TopLoc_Datum3D;
		%feature("autodoc", "Constructs a datum3d form a trsf from gp. an error is raised if the trsf is not a rigid transformation.

	:param T:
	:type T: gp_Trsf
	:rtype: None
") TopLoc_Datum3D;
		 TopLoc_Datum3D(const gp_Trsf & T);

		/****************** Transformation ******************/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Returns a gp_trsf which, when applied to this datum, produces the default datum.

	:rtype: gp_Trsf
") Transformation;
		const gp_Trsf Transformation();

};


%make_alias(TopLoc_Datum3D)

%extend TopLoc_Datum3D {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TopLoc_ItemLocation *
****************************/
class TopLoc_ItemLocation {
	public:

            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** TopLoc_ItemLocation ******************/
		%feature("compactdefaultargs") TopLoc_ItemLocation;
		%feature("autodoc", "Sets the elementary datum to <d> sets the exponent to <p>.

	:param D:
	:type D: TopLoc_Datum3D
	:param P:
	:type P: int
	:rtype: None
") TopLoc_ItemLocation;
		 TopLoc_ItemLocation(const opencascade::handle<TopLoc_Datum3D> & D, const Standard_Integer P);

};


%extend TopLoc_ItemLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TopLoc_Location *
************************/
class TopLoc_Location {
	public:
		/****************** Divided ******************/
		%feature("compactdefaultargs") Divided;
		%feature("autodoc", "Returns <self> / <other>.

	:param Other:
	:type Other: TopLoc_Location
	:rtype: TopLoc_Location
") Divided;
		TopLoc_Location Divided(const TopLoc_Location & Other);


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** FirstDatum ******************/
		%feature("compactdefaultargs") FirstDatum;
		%feature("autodoc", "Returns the first elementary datum of the location. use the nextlocation function recursively to access the other data comprising this location. exceptions standard_nosuchobject if this location is empty.

	:rtype: opencascade::handle<TopLoc_Datum3D>
") FirstDatum;
		const opencascade::handle<TopLoc_Datum3D> & FirstDatum();

		/****************** FirstPower ******************/
		%feature("compactdefaultargs") FirstPower;
		%feature("autodoc", "Returns the power elevation of the first elementary datum. exceptions standard_nosuchobject if this location is empty.

	:rtype: int
") FirstPower;
		Standard_Integer FirstPower();

		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Returns a hashed value for this local coordinate system. this value is used, with map tables, to store and retrieve the object easily, and is in the range [1, theupperbound]. @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int
") HashCode;
		Standard_Integer HashCode(Standard_Integer theUpperBound);

        %extend {
            Standard_Integer __hash__() {
            return $self->HashCode(2147483647);
            }
        };

		/****************** Identity ******************/
		%feature("compactdefaultargs") Identity;
		%feature("autodoc", "Resets this location to the identity transformation.

	:rtype: None
") Identity;
		void Identity();

		/****************** Inverted ******************/
		%feature("compactdefaultargs") Inverted;
		%feature("autodoc", "Returns the inverse of <self>. //! <self> * inverted() is an identity.

	:rtype: TopLoc_Location
") Inverted;
		TopLoc_Location Inverted();

		/****************** IsDifferent ******************/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "Returns true if this location and the location other do not have the same elementary data, i.e. do not contain the same series of toploc_datum3d and respective powers. this method is an alias for operator !=.

	:param Other:
	:type Other: TopLoc_Location
	:rtype: bool
") IsDifferent;
		Standard_Boolean IsDifferent(const TopLoc_Location & Other);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if this location and the location other have the same elementary data, i.e. contain the same series of toploc_datum3d and respective powers. this method is an alias for operator ==.

	:param Other:
	:type Other: TopLoc_Location
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual(const TopLoc_Location & Other);

		/****************** IsIdentity ******************/
		%feature("compactdefaultargs") IsIdentity;
		%feature("autodoc", "Returns true if this location is equal to the identity transformation.

	:rtype: bool
") IsIdentity;
		Standard_Boolean IsIdentity();

		/****************** Multiplied ******************/
		%feature("compactdefaultargs") Multiplied;
		%feature("autodoc", "Returns <self> * <other>, the elementary datums are concatenated.

	:param Other:
	:type Other: TopLoc_Location
	:rtype: TopLoc_Location
") Multiplied;
		TopLoc_Location Multiplied(const TopLoc_Location & Other);

		/****************** NextLocation ******************/
		%feature("compactdefaultargs") NextLocation;
		%feature("autodoc", "Returns a location representing <self> without the first datum. we have the relation : //! <self> = nextlocation() * firstdatum() ^ firstpower() exceptions standard_nosuchobject if this location is empty.

	:rtype: TopLoc_Location
") NextLocation;
		const TopLoc_Location & NextLocation();

		/****************** Powered ******************/
		%feature("compactdefaultargs") Powered;
		%feature("autodoc", "Returns me at the power <pwr>. if <pwr> is zero returns identity. <pwr> can be lower than zero (usual meaning for powers).

	:param pwr:
	:type pwr: int
	:rtype: TopLoc_Location
") Powered;
		TopLoc_Location Powered(const Standard_Integer pwr);

		/****************** Predivided ******************/
		%feature("compactdefaultargs") Predivided;
		%feature("autodoc", "Returns <other>.inverted() * <self>.

	:param Other:
	:type Other: TopLoc_Location
	:rtype: TopLoc_Location
") Predivided;
		TopLoc_Location Predivided(const TopLoc_Location & Other);


        %feature("autodoc", "1");
        %extend{
            std::string ShallowDumpToString() {
            std::stringstream s;
            self->ShallowDump(s);
            return s.str();}
        };
		/****************** TopLoc_Location ******************/
		%feature("compactdefaultargs") TopLoc_Location;
		%feature("autodoc", "Constructs an empty local coordinate system object. note: a location constructed from a default datum is said to be 'empty'.

	:rtype: None
") TopLoc_Location;
		 TopLoc_Location();

		/****************** TopLoc_Location ******************/
		%feature("compactdefaultargs") TopLoc_Location;
		%feature("autodoc", "Constructs the local coordinate system object defined by the transformation t. t invokes in turn, a toploc_datum3d object.

	:param T:
	:type T: gp_Trsf
	:rtype: None
") TopLoc_Location;
		 TopLoc_Location(const gp_Trsf & T);

		/****************** TopLoc_Location ******************/
		%feature("compactdefaultargs") TopLoc_Location;
		%feature("autodoc", "Constructs the local coordinate system object defined by the 3d datum d. exceptions standard_constructionerror if the transformation t does not represent a 3d coordinate system.

	:param D:
	:type D: TopLoc_Datum3D
	:rtype: None
") TopLoc_Location;
		 TopLoc_Location(const opencascade::handle<TopLoc_Datum3D> & D);

		/****************** Transformation ******************/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Returns the transformation associated to the coordinate system.

	:rtype: gp_Trsf
") Transformation;
		const gp_Trsf Transformation();


            %extend{
                bool __ne_wrapper__(const TopLoc_Location other) {
                if (*self!=other) return true;
                else return false;
                }
            }
            %pythoncode {
            def __ne__(self, right):
                try:
                    return self.__ne_wrapper__(right)
                except:
                    return True
            }
		/****************** operator * ******************/
		%feature("compactdefaultargs") operator *;
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_Location
	:rtype: TopLoc_Location
") operator *;
		TopLoc_Location operator *(const TopLoc_Location & Other);

		/****************** operator / ******************/
		%feature("compactdefaultargs") operator /;
		%feature("autodoc", "	:param Other:
	:type Other: TopLoc_Location
	:rtype: TopLoc_Location
") operator /;
		TopLoc_Location operator /(const TopLoc_Location & Other);


            %extend{
                bool __eq_wrapper__(const TopLoc_Location other) {
                if (*self==other) return true;
                else return false;
                }
            }
            %pythoncode {
            def __eq__(self, right):
                try:
                    return self.__eq_wrapper__(right)
                except:
                    return False
            }
};


%extend TopLoc_Location {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class TopLoc_SListNodeOfItemLocation *
***************************************/
class TopLoc_SListNodeOfItemLocation : public Standard_Transient {
	public:
		/****************** Tail ******************/
		%feature("compactdefaultargs") Tail;
		%feature("autodoc", "	:rtype: TopLoc_SListOfItemLocation
") Tail;
		TopLoc_SListOfItemLocation & Tail();

		/****************** TopLoc_SListNodeOfItemLocation ******************/
		%feature("compactdefaultargs") TopLoc_SListNodeOfItemLocation;
		%feature("autodoc", "	:param I:
	:type I: TopLoc_ItemLocation
	:param aTail:
	:type aTail: TopLoc_SListOfItemLocation
	:rtype: None
") TopLoc_SListNodeOfItemLocation;
		 TopLoc_SListNodeOfItemLocation(const TopLoc_ItemLocation & I, const TopLoc_SListOfItemLocation & aTail);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: TopLoc_ItemLocation
") Value;
		TopLoc_ItemLocation & Value();

};


%make_alias(TopLoc_SListNodeOfItemLocation)

%extend TopLoc_SListNodeOfItemLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class TopLoc_SListOfItemLocation *
***********************************/
class TopLoc_SListOfItemLocation {
	public:
		/****************** Assign ******************/
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "Sets a list from an other one. the lists are shared. the list itself is returned.

	:param Other:
	:type Other: TopLoc_SListOfItemLocation
	:rtype: TopLoc_SListOfItemLocation
") Assign;
		TopLoc_SListOfItemLocation & Assign(const TopLoc_SListOfItemLocation & Other);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Sets the list to be empty.

	:rtype: None
") Clear;
		void Clear();

		/****************** Construct ******************/
		%feature("compactdefaultargs") Construct;
		%feature("autodoc", "Replaces the list by a list with <anitem> as value and the list <self> as tail.

	:param anItem:
	:type anItem: TopLoc_ItemLocation
	:rtype: None
") Construct;
		void Construct(const TopLoc_ItemLocation & anItem);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returne true if this list is empty.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if the iterator has a current value. this is !isempty().

	:rtype: bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Moves the iterator to the next object in the list. if the iterator is empty it will stay empty. this is totail().

	:rtype: None
") Next;
		void Next();

		/****************** Tail ******************/
		%feature("compactdefaultargs") Tail;
		%feature("autodoc", "Returns the current tail of the list. on an empty list the tail is the list itself.

	:rtype: TopLoc_SListOfItemLocation
") Tail;
		const TopLoc_SListOfItemLocation & Tail();

		/****************** ToTail ******************/
		%feature("compactdefaultargs") ToTail;
		%feature("autodoc", "Replaces the list <self> by its tail.

	:rtype: None
") ToTail;
		void ToTail();

		/****************** TopLoc_SListOfItemLocation ******************/
		%feature("compactdefaultargs") TopLoc_SListOfItemLocation;
		%feature("autodoc", "Creates an empty list.

	:rtype: None
") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation();

		/****************** TopLoc_SListOfItemLocation ******************/
		%feature("compactdefaultargs") TopLoc_SListOfItemLocation;
		%feature("autodoc", "Creates a list with <anitem> as value and <atail> as tail.

	:param anItem:
	:type anItem: TopLoc_ItemLocation
	:param aTail:
	:type aTail: TopLoc_SListOfItemLocation
	:rtype: None
") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation(const TopLoc_ItemLocation & anItem, const TopLoc_SListOfItemLocation & aTail);

		/****************** TopLoc_SListOfItemLocation ******************/
		%feature("compactdefaultargs") TopLoc_SListOfItemLocation;
		%feature("autodoc", "Creates a list from an other one. the lists are shared.

	:param Other:
	:type Other: TopLoc_SListOfItemLocation
	:rtype: None
") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation(const TopLoc_SListOfItemLocation & Other);

		/****************** TopLoc_SListOfItemLocation ******************/
		%feature("compactdefaultargs") TopLoc_SListOfItemLocation;
		%feature("autodoc", "Move constructor.

	:param theOther:
	:type theOther: TopLoc_SListOfItemLocation
	:rtype: None
") TopLoc_SListOfItemLocation;
		 TopLoc_SListOfItemLocation(TopLoc_SListOfItemLocation & theOther);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current value of the list. an error is raised if the list is empty.

	:rtype: TopLoc_ItemLocation
") Value;
		const TopLoc_ItemLocation & Value();

};


%extend TopLoc_SListOfItemLocation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
