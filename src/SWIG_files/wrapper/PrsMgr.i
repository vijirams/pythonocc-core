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
%define PRSMGRDOCSTRING
"PrsMgr module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_prsmgr.html"
%enddef
%module (package="OCC.Core", docstring=PRSMGRDOCSTRING) PrsMgr


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
#include<PrsMgr_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Prs3d_module.hxx>
#include<Graphic3d_module.hxx>
#include<Bnd_module.hxx>
#include<Quantity_module.hxx>
#include<Geom_module.hxx>
#include<Aspect_module.hxx>
#include<gp_module.hxx>
#include<TColStd_module.hxx>
#include<V3d_module.hxx>
#include<gp_module.hxx>
#include<HLRAlgo_module.hxx>
#include<TopoDS_module.hxx>
#include<Aspect_module.hxx>
#include<Visual3d_module.hxx>
#include<TShort_module.hxx>
#include<Message_module.hxx>
#include<Bnd_module.hxx>
#include<TopTools_module.hxx>
#include<TColQuantity_module.hxx>
#include<Poly_module.hxx>
#include<TopLoc_module.hxx>
#include<Quantity_module.hxx>
#include<BVH_module.hxx>
#include<SelectMgr_module.hxx>
#include<Select3D_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Prs3d.i
%import Graphic3d.i
%import Bnd.i
%import Quantity.i
%import Geom.i
%import Aspect.i
%import gp.i
%import TColStd.i
%import V3d.i
/* public enums */
enum PrsMgr_TypeOfPresentation3d {
	PrsMgr_TOP_AllView = 0,
	PrsMgr_TOP_ProjectorDependant = 1,
};

/* end public enums declaration */

/* handles */
%wrap_handle(PrsMgr_PresentableObject)
%wrap_handle(PrsMgr_Presentation)
%wrap_handle(PrsMgr_PresentationManager)
/* end handles declaration */

/* templates */
%template(PrsMgr_ListOfPresentableObjects) NCollection_List<opencascade::handle<PrsMgr_PresentableObject>>;
%template(PrsMgr_ListOfPresentableObjectsIter) NCollection_TListIterator<PrsMgr_ListOfPresentableObjects>;
%template(PrsMgr_ListOfPresentations) NCollection_List<opencascade::handle<Prs3d_Presentation>>;
%template(PrsMgr_Presentations) NCollection_Sequence<opencascade::handle<PrsMgr_Presentation>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List<opencascade::handle<PrsMgr_PresentableObject>> PrsMgr_ListOfPresentableObjects;
typedef NCollection_List<opencascade::handle<PrsMgr_PresentableObject>>::Iterator PrsMgr_ListOfPresentableObjectsIter;
typedef PrsMgr_Presentation PrsMgr_Presentation3d;
typedef Handle_PrsMgr_Presentation Handle_PrsMgr_Presentation3d;
typedef PrsMgr_PresentationManager PrsMgr_PresentationManager3d;
typedef Handle_PrsMgr_PresentationManager Handle_PrsMgr_PresentationManager3d;
typedef NCollection_List<opencascade::handle<Prs3d_Presentation>> PrsMgr_ListOfPresentations;
typedef NCollection_Sequence<opencascade::handle<PrsMgr_Presentation>> PrsMgr_Presentations;
typedef Graphic3d_Structure Prs3d_Presentation;
/* end typedefs declaration */

/*********************************
* class PrsMgr_PresentableObject *
*********************************/
%nodefaultctor PrsMgr_PresentableObject;
%ignore PrsMgr_PresentableObject::~PrsMgr_PresentableObject();
class PrsMgr_PresentableObject : public Standard_Transient {
	public:
		/****************** AcceptDisplayMode ******************/
		%feature("compactdefaultargs") AcceptDisplayMode;
		%feature("autodoc", "Returns true if the class of objects accepts specified display mode index. the interactive context can have a default mode of representation for the set of interactive objects. this mode may not be accepted by a given class of objects. consequently, this virtual method allowing us to get information about the class in question must be implemented. at least one display mode index should be accepted by this method. although subclass can leave default implementation, it is highly desired defining exact list of supported modes instead, which is usually an enumeration for one object or objects class sharing similar list of display modes.

	:param theMode:
	:type theMode: int
	:rtype: bool
") AcceptDisplayMode;
		virtual Standard_Boolean AcceptDisplayMode(const Standard_Integer theMode);

		/****************** AddChild ******************/
		%feature("compactdefaultargs") AddChild;
		%feature("autodoc", "Makes theobject child of current object in scene hierarchy.

	:param theObject:
	:type theObject: PrsMgr_PresentableObject
	:rtype: None
") AddChild;
		virtual void AddChild(const opencascade::handle<PrsMgr_PresentableObject> & theObject);

		/****************** AddChildWithCurrentTransformation ******************/
		%feature("compactdefaultargs") AddChildWithCurrentTransformation;
		%feature("autodoc", "Makes theobject child of current object in scene hierarchy with keeping the current global transformation so the object keeps the same position/orientation in the global cs.

	:param theObject:
	:type theObject: PrsMgr_PresentableObject
	:rtype: None
") AddChildWithCurrentTransformation;
		void AddChildWithCurrentTransformation(const opencascade::handle<PrsMgr_PresentableObject> & theObject);

		/****************** AddClipPlane ******************/
		%feature("compactdefaultargs") AddClipPlane;
		%feature("autodoc", "Adds clip plane for graphical clipping for all display mode presentations. the composition of clip planes truncates the rendering space to convex volume. please be aware that number of supported clip plane is limited. the planes which exceed the limit are ignored. besides of this, some planes can be already set in view where the object is shown: the number of these planes should be subtracted from limit to predict the maximum possible number of object clipping planes. @param theplane [in] the clip plane to be appended to map of clip planes.

	:param thePlane:
	:type thePlane: Graphic3d_ClipPlane
	:rtype: None
") AddClipPlane;
		virtual void AddClipPlane(const opencascade::handle<Graphic3d_ClipPlane> & thePlane);

		/****************** Attributes ******************/
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "Returns the attributes settings.

	:rtype: opencascade::handle<Prs3d_Drawer>
") Attributes;
		const opencascade::handle<Prs3d_Drawer> & Attributes();

		/****************** BoundingBox ******************/
		%feature("compactdefaultargs") BoundingBox;
		%feature("autodoc", "Returns bounding box of object correspondingly to its current display mode. this method requires presentation to be already computed, since it relies on bounding box of presentation structures, which are supposed to be same/close amongst different display modes of this object.

	:param theBndBox:
	:type theBndBox: Bnd_Box
	:rtype: None
") BoundingBox;
		virtual void BoundingBox(Bnd_Box & theBndBox);

		/****************** Children ******************/
		%feature("compactdefaultargs") Children;
		%feature("autodoc", "Returns children of the current object.

	:rtype: PrsMgr_ListOfPresentableObjects
") Children;
		const PrsMgr_ListOfPresentableObjects & Children();

		/****************** ClipPlanes ******************/
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "Get clip planes. returns set of previously added clip planes for all display mode presentations.

	:rtype: opencascade::handle<Graphic3d_SequenceOfHClipPlane>
") ClipPlanes;
		const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & ClipPlanes();

		/****************** Color ******************/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Returns the color setting of the interactive object.

	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None
") Color;
		virtual void Color(Quantity_Color & theColor);

		/****************** CombinedParentTransformation ******************/
		%feature("compactdefaultargs") CombinedParentTransformation;
		%feature("autodoc", "Return combined parent transformation.

	:rtype: opencascade::handle<Geom_Transformation>
") CombinedParentTransformation;
		const opencascade::handle<Geom_Transformation> & CombinedParentTransformation();

		/****************** CurrentFacingModel ******************/
		%feature("compactdefaultargs") CurrentFacingModel;
		%feature("autodoc", "Returns the current facing model which is in effect.

	:rtype: Aspect_TypeOfFacingModel
") CurrentFacingModel;
		Aspect_TypeOfFacingModel CurrentFacingModel();

		/****************** DefaultDisplayMode ******************/
		%feature("compactdefaultargs") DefaultDisplayMode;
		%feature("autodoc", "Returns the default display mode.

	:rtype: int
") DefaultDisplayMode;
		virtual Standard_Integer DefaultDisplayMode();

		/****************** DisplayMode ******************/
		%feature("compactdefaultargs") DisplayMode;
		%feature("autodoc", "Returns the display mode setting of the interactive object. the range of supported display mode indexes should be specified within object definition and filtered by accepdisplaymode(). @sa acceptdisplaymode().

	:rtype: int
") DisplayMode;
		Standard_Integer DisplayMode();


            %feature("autodoc", "1");
            %extend{
                std::string DumpJsonToString(int depth=-1) {
                std::stringstream s;
                self->DumpJson(s, depth);
                return s.str();}
            };
		/****************** DynamicHilightAttributes ******************/
		%feature("compactdefaultargs") DynamicHilightAttributes;
		%feature("autodoc", "Returns the hilight attributes settings. when not null, overrides both prs3d_typeofhighlight_localdynamic and prs3d_typeofhighlight_dynamic defined within ais_interactivecontext.

	:rtype: opencascade::handle<Prs3d_Drawer>
") DynamicHilightAttributes;
		const opencascade::handle<Prs3d_Drawer> & DynamicHilightAttributes();

		/****************** GetTransformPersistenceMode ******************/
		%feature("compactdefaultargs") GetTransformPersistenceMode;
		%feature("autodoc", "Gets transform persistence mode for this object.

	:rtype: Graphic3d_TransModeFlags
") GetTransformPersistenceMode;
		Graphic3d_TransModeFlags GetTransformPersistenceMode();

		/****************** GetTransformPersistencePoint ******************/
		%feature("compactdefaultargs") GetTransformPersistencePoint;
		%feature("autodoc", "Gets point of transform persistence for this object.

	:rtype: gp_Pnt
") GetTransformPersistencePoint;
		gp_Pnt GetTransformPersistencePoint();

		/****************** HasColor ******************/
		%feature("compactdefaultargs") HasColor;
		%feature("autodoc", "Returns true if the interactive object has color.

	:rtype: bool
") HasColor;
		Standard_Boolean HasColor();

		/****************** HasDisplayMode ******************/
		%feature("compactdefaultargs") HasDisplayMode;
		%feature("autodoc", "Returns true if the interactive object has display mode setting overriding global setting (within interactive context).

	:rtype: bool
") HasDisplayMode;
		Standard_Boolean HasDisplayMode();

		/****************** HasHilightMode ******************/
		%feature("compactdefaultargs") HasHilightMode;
		%feature("autodoc", "Returns true if the interactive object is in highlight mode.

	:rtype: bool
") HasHilightMode;
		Standard_Boolean HasHilightMode();

		/****************** HasMaterial ******************/
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "Returns true if the interactive object has a setting for material.

	:rtype: bool
") HasMaterial;
		Standard_Boolean HasMaterial();

		/****************** HasOwnPresentations ******************/
		%feature("compactdefaultargs") HasOwnPresentations;
		%feature("autodoc", "Returns true if object should have own presentations.

	:rtype: bool
") HasOwnPresentations;
		Standard_Boolean HasOwnPresentations();

		/****************** HasPolygonOffsets ******************/
		%feature("compactdefaultargs") HasPolygonOffsets;
		%feature("autodoc", "Returns standard_true if <mydrawer> has non-null shading aspect.

	:rtype: bool
") HasPolygonOffsets;
		virtual Standard_Boolean HasPolygonOffsets();

		/****************** HasTransformation ******************/
		%feature("compactdefaultargs") HasTransformation;
		%feature("autodoc", "Returns true if object has a transformation that is different from the identity.

	:rtype: bool
") HasTransformation;
		Standard_Boolean HasTransformation();

		/****************** HasWidth ******************/
		%feature("compactdefaultargs") HasWidth;
		%feature("autodoc", "Returns true if the interactive object has width.

	:rtype: bool
") HasWidth;
		Standard_Boolean HasWidth();

		/****************** HilightAttributes ******************/
		%feature("compactdefaultargs") HilightAttributes;
		%feature("autodoc", "Returns the hilight attributes settings. when not null, overrides both prs3d_typeofhighlight_localselected and prs3d_typeofhighlight_selected defined within ais_interactivecontext.

	:rtype: opencascade::handle<Prs3d_Drawer>
") HilightAttributes;
		const opencascade::handle<Prs3d_Drawer> & HilightAttributes();

		/****************** HilightMode ******************/
		%feature("compactdefaultargs") HilightMode;
		%feature("autodoc", "Returns highlight display mode. this is obsolete method for backward compatibility - use ::hilightattributes() and ::dynamichilightattributes() instead.

	:rtype: int
") HilightMode;
		Standard_Integer HilightMode();

		/****************** InversedTransformation ******************/
		%feature("compactdefaultargs") InversedTransformation;
		%feature("autodoc", "Return inversed transformation.

	:rtype: gp_GTrsf
") InversedTransformation;
		const gp_GTrsf InversedTransformation();

		/****************** IsInfinite ******************/
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "Returns true if the interactive object is infinite; false by default. this flag affects various operations operating on bounding box of graphic presentations of this object. for instance, infinite objects are not taken in account for view fitall. this does not necessarily means that object is actually infinite, auxiliary objects might be also marked with this flag to achieve desired behavior.

	:rtype: bool
") IsInfinite;
		Standard_Boolean IsInfinite();

		/****************** IsMutable ******************/
		%feature("compactdefaultargs") IsMutable;
		%feature("autodoc", "Returns true if object has mutable nature (content or location are be changed regularly). mutable object will be managed in different way than static onces (another optimizations).

	:rtype: bool
") IsMutable;
		Standard_Boolean IsMutable();

		/****************** IsTransparent ******************/
		%feature("compactdefaultargs") IsTransparent;
		%feature("autodoc", "Returns true if there is a transparency setting.

	:rtype: bool
") IsTransparent;
		Standard_Boolean IsTransparent();

		/****************** LocalTransformation ******************/
		%feature("compactdefaultargs") LocalTransformation;
		%feature("autodoc", "Return the local transformation. note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.

	:rtype: gp_Trsf
") LocalTransformation;
		const gp_Trsf LocalTransformation();

		/****************** LocalTransformationGeom ******************/
		%feature("compactdefaultargs") LocalTransformationGeom;
		%feature("autodoc", "Return the local transformation. note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.

	:rtype: opencascade::handle<Geom_Transformation>
") LocalTransformationGeom;
		const opencascade::handle<Geom_Transformation> & LocalTransformationGeom();

		/****************** Material ******************/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Returns the current material setting as enumeration value.

	:rtype: Graphic3d_NameOfMaterial
") Material;
		virtual Graphic3d_NameOfMaterial Material();

		/****************** Parent ******************/
		%feature("compactdefaultargs") Parent;
		%feature("autodoc", "Returns parent of current object in scene hierarchy.

	:rtype: PrsMgr_PresentableObject *
") Parent;
		PrsMgr_PresentableObject * Parent();

		/****************** PolygonOffsets ******************/
		%feature("compactdefaultargs") PolygonOffsets;
		%feature("autodoc", "Retrieves current polygon offsets settings from <mydrawer>.

	:param aMode:
	:type aMode: int
	:param aFactor:
	:type aFactor: Standard_ShortReal
	:param aUnits:
	:type aUnits: Standard_ShortReal
	:rtype: None
") PolygonOffsets;
		virtual void PolygonOffsets(Standard_Integer &OutValue, Standard_ShortReal & aFactor, Standard_ShortReal & aUnits);

		/****************** Presentations ******************/
		%feature("compactdefaultargs") Presentations;
		%feature("autodoc", "Return presentations.

	:rtype: PrsMgr_Presentations
") Presentations;
		PrsMgr_Presentations & Presentations();

		/****************** RemoveChild ******************/
		%feature("compactdefaultargs") RemoveChild;
		%feature("autodoc", "Removes theobject from children of current object in scene hierarchy.

	:param theObject:
	:type theObject: PrsMgr_PresentableObject
	:rtype: None
") RemoveChild;
		virtual void RemoveChild(const opencascade::handle<PrsMgr_PresentableObject> & theObject);

		/****************** RemoveChildWithRestoreTransformation ******************/
		%feature("compactdefaultargs") RemoveChildWithRestoreTransformation;
		%feature("autodoc", "Removes theobject from children of current object in scene hierarchy with keeping the current global transformation. so the object keeps the same position/orientation in the global cs.

	:param theObject:
	:type theObject: PrsMgr_PresentableObject
	:rtype: None
") RemoveChildWithRestoreTransformation;
		void RemoveChildWithRestoreTransformation(const opencascade::handle<PrsMgr_PresentableObject> & theObject);

		/****************** RemoveClipPlane ******************/
		%feature("compactdefaultargs") RemoveClipPlane;
		%feature("autodoc", "Removes previously added clip plane. @param theplane [in] the clip plane to be removed from map of clip planes.

	:param thePlane:
	:type thePlane: Graphic3d_ClipPlane
	:rtype: None
") RemoveClipPlane;
		virtual void RemoveClipPlane(const opencascade::handle<Graphic3d_ClipPlane> & thePlane);

		/****************** ResetTransformation ******************/
		%feature("compactdefaultargs") ResetTransformation;
		%feature("autodoc", "Resets local transformation to identity.

	:rtype: None
") ResetTransformation;
		virtual void ResetTransformation();

		/****************** SetAttributes ******************/
		%feature("compactdefaultargs") SetAttributes;
		%feature("autodoc", "Initializes the drawing tool thedrawer.

	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: None
") SetAttributes;
		virtual void SetAttributes(const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** SetClipPlanes ******************/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "Set clip planes for graphical clipping for all display mode presentations. the composition of clip planes truncates the rendering space to convex volume. please be aware that number of supported clip plane is limited. the planes which exceed the limit are ignored. besides of this, some planes can be already set in view where the object is shown: the number of these planes should be subtracted from limit to predict the maximum possible number of object clipping planes.

	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane
	:rtype: None
") SetClipPlanes;
		virtual void SetClipPlanes(const opencascade::handle<Graphic3d_SequenceOfHClipPlane> & thePlanes);

		/****************** SetClipPlanes ******************/
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane
	:rtype: None
") SetClipPlanes;
		void SetClipPlanes(const Graphic3d_SequenceOfHClipPlane & thePlanes);

		/****************** SetColor ******************/
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "Only the interactive object knowns which drawer attribute is affected by the color, if any (ex: for a wire,it's the wireaspect field of the drawer, but for a vertex, only the point aspect field is affected by the color). warning : do not forget to set the corresponding fields here (hasowncolor and mydrawer->setcolor()).

	:param theColor:
	:type theColor: Quantity_Color
	:rtype: None
") SetColor;
		virtual void SetColor(const Quantity_Color & theColor);

		/****************** SetCurrentFacingModel ******************/
		%feature("compactdefaultargs") SetCurrentFacingModel;
		%feature("autodoc", "Change the current facing model apply on polygons for setcolor(), settransparency(), setmaterial() methods default facing model is aspect_tofm_two_side. this mean that attributes is applying both on the front and back face.

	:param theModel: default value is Aspect_TOFM_BOTH_SIDE
	:type theModel: Aspect_TypeOfFacingModel
	:rtype: None
") SetCurrentFacingModel;
		void SetCurrentFacingModel(const Aspect_TypeOfFacingModel theModel = Aspect_TOFM_BOTH_SIDE);

		/****************** SetDisplayMode ******************/
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "Sets the display mode for the interactive object. an object can have its own temporary display mode, which is different from that proposed by the interactive context. @sa acceptdisplaymode().

	:param theMode:
	:type theMode: int
	:rtype: None
") SetDisplayMode;
		void SetDisplayMode(const Standard_Integer theMode);

		/****************** SetDynamicHilightAttributes ******************/
		%feature("compactdefaultargs") SetDynamicHilightAttributes;
		%feature("autodoc", "Initializes the dynamic hilight drawing tool.

	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: None
") SetDynamicHilightAttributes;
		virtual void SetDynamicHilightAttributes(const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** SetHilightAttributes ******************/
		%feature("compactdefaultargs") SetHilightAttributes;
		%feature("autodoc", "Initializes the hilight drawing tool thedrawer.

	:param theDrawer:
	:type theDrawer: Prs3d_Drawer
	:rtype: None
") SetHilightAttributes;
		virtual void SetHilightAttributes(const opencascade::handle<Prs3d_Drawer> & theDrawer);

		/****************** SetHilightMode ******************/
		%feature("compactdefaultargs") SetHilightMode;
		%feature("autodoc", "Sets highlight display mode. this is obsolete method for backward compatibility - use ::hilightattributes() and ::dynamichilightattributes() instead.

	:param theMode:
	:type theMode: int
	:rtype: None
") SetHilightMode;
		void SetHilightMode(const Standard_Integer theMode);

		/****************** SetInfiniteState ******************/
		%feature("compactdefaultargs") SetInfiniteState;
		%feature("autodoc", "Sets if object should be considered as infinite.

	:param theFlag: default value is Standard_True
	:type theFlag: bool
	:rtype: None
") SetInfiniteState;
		void SetInfiniteState(const Standard_Boolean theFlag = Standard_True);

		/****************** SetIsoOnTriangulation ******************/
		%feature("compactdefaultargs") SetIsoOnTriangulation;
		%feature("autodoc", "Enables or disables on-triangulation build of isolines according to the flag given.

	:param theIsEnabled:
	:type theIsEnabled: bool
	:rtype: None
") SetIsoOnTriangulation;
		void SetIsoOnTriangulation(const Standard_Boolean theIsEnabled);

		/****************** SetLocalTransformation ******************/
		%feature("compactdefaultargs") SetLocalTransformation;
		%feature("autodoc", "Sets local transformation to thetransformation. note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.

	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: None
") SetLocalTransformation;
		void SetLocalTransformation(const gp_Trsf & theTrsf);

		/****************** SetLocalTransformation ******************/
		%feature("compactdefaultargs") SetLocalTransformation;
		%feature("autodoc", "Sets local transformation to thetransformation. note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.

	:param theTrsf:
	:type theTrsf: Geom_Transformation
	:rtype: None
") SetLocalTransformation;
		void SetLocalTransformation(const opencascade::handle<Geom_Transformation> & theTrsf);

		/****************** SetMaterial ******************/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "Sets the material amat defining this display attribute for the interactive object. material aspect determines shading aspect, color and transparency of visible entities.

	:param aName:
	:type aName: Graphic3d_MaterialAspect
	:rtype: None
") SetMaterial;
		virtual void SetMaterial(const Graphic3d_MaterialAspect & aName);

		/****************** SetMutable ******************/
		%feature("compactdefaultargs") SetMutable;
		%feature("autodoc", "Sets if the object has mutable nature (content or location will be changed regularly). this method should be called before object displaying to take effect.

	:param theIsMutable:
	:type theIsMutable: bool
	:rtype: None
") SetMutable;
		virtual void SetMutable(const Standard_Boolean theIsMutable);

		/****************** SetPolygonOffsets ******************/
		%feature("compactdefaultargs") SetPolygonOffsets;
		%feature("autodoc", "Sets up polygon offsets for this object. @sa graphic3d_aspects::setpolygonoffsets().

	:param aMode:
	:type aMode: int
	:param aFactor: default value is 1.0
	:type aFactor: Standard_ShortReal
	:param aUnits: default value is 0.0
	:type aUnits: Standard_ShortReal
	:rtype: None
") SetPolygonOffsets;
		virtual void SetPolygonOffsets(const Standard_Integer aMode, const Standard_ShortReal aFactor = 1.0, const Standard_ShortReal aUnits = 0.0);

		/****************** SetPropagateVisualState ******************/
		%feature("compactdefaultargs") SetPropagateVisualState;
		%feature("autodoc", "Change the value of the flag 'propagate visual state'.

	:param theFlag:
	:type theFlag: bool
	:rtype: None
") SetPropagateVisualState;
		void SetPropagateVisualState(const Standard_Boolean theFlag);

		/****************** SetToUpdate ******************/
		%feature("compactdefaultargs") SetToUpdate;
		%feature("autodoc", "Flags presentation to be updated; updatepresentations() will recompute these presentations. @param themode presentation (display mode) to invalidate, or -1 to invalidate them all.

	:param theMode:
	:type theMode: int
	:rtype: None
") SetToUpdate;
		void SetToUpdate(Standard_Integer theMode);

		/****************** SetToUpdate ******************/
		%feature("compactdefaultargs") SetToUpdate;
		%feature("autodoc", "Flags all the presentations to be updated.

	:rtype: None
") SetToUpdate;
		void SetToUpdate();

		/****************** SetTransformPersistence ******************/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "Sets up transform persistence defining a special local coordinate system where this object should be located. note that management of transform persistence object is more expensive than of the normal one, because it requires its position being recomputed basing on camera position within each draw call / traverse. @sa graphic3d_transformpers class description.

	:param theTrsfPers:
	:type theTrsfPers: Graphic3d_TransformPers
	:rtype: None
") SetTransformPersistence;
		virtual void SetTransformPersistence(const opencascade::handle<Graphic3d_TransformPers> & theTrsfPers);

		/****************** SetTransformPersistence ******************/
		%feature("compactdefaultargs") SetTransformPersistence;
		%feature("autodoc", "Sets up transform persistence mode for this object. this function used to lock in object position, rotation and / or zooming relative to camera position. object will be drawn in the origin setted by thepoint parameter (except graphic3d_tmf_triedronpers flag - see description later). themode should be: - graphic3d_tmf_none - no persistence attributes (reset); - graphic3d_tmf_zoompers - object doesn't resize; - graphic3d_tmf_rotatepers - object doesn't rotate; - graphic3d_tmf_zoomrotatepers - object doesn't resize and rotate; - graphic3d_tmf_rotatepers - object doesn't rotate; - graphic3d_tmf_triedronpers - object behaves like trihedron. if graphic3d_tmf_triedronpers or graphic3d_tmf_2d persistence mode selected thepoint coordinates x and y means: - x = 0.0, y = 0.0 - center of view window; - x > 0.0, y > 0.0 - right upper corner of view window; - x > 0.0, y < 0.0 - right lower corner of view window; - x < 0.0, y > 0.0 - left upper corner of view window; - x < 0.0, y < 0.0 - left lower corner of view window. and z coordinate defines the gap from border of view window (except center position).

	:param theMode:
	:type theMode: Graphic3d_TransModeFlags
	:param thePoint: default value is gp_Pnt(0.0,0.0,0.0)
	:type thePoint: gp_Pnt
	:rtype: None
") SetTransformPersistence;
		void SetTransformPersistence(const Graphic3d_TransModeFlags theMode, const gp_Pnt & thePoint = gp_Pnt(0.0,0.0,0.0));

		/****************** SetTransparency ******************/
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "Attributes a setting avalue for transparency. the transparency value should be between 0.0 and 1.0. at 0.0 an object will be totally opaque, and at 1.0, fully transparent. warning at a value of 1.0, there may be nothing visible.

	:param aValue: default value is 0.6
	:type aValue: float
	:rtype: None
") SetTransparency;
		virtual void SetTransparency(const Standard_Real aValue = 0.6);

		/****************** SetTypeOfPresentation ******************/
		%feature("compactdefaultargs") SetTypeOfPresentation;
		%feature("autodoc", "Set type of presentation.

	:param theType:
	:type theType: PrsMgr_TypeOfPresentation3d
	:rtype: None
") SetTypeOfPresentation;
		void SetTypeOfPresentation(const PrsMgr_TypeOfPresentation3d theType);

		/****************** SetWidth ******************/
		%feature("compactdefaultargs") SetWidth;
		%feature("autodoc", "Allows you to provide the setting avalue for width. only the interactive object knows which drawer attribute is affected by the width setting.

	:param theWidth:
	:type theWidth: float
	:rtype: None
") SetWidth;
		virtual void SetWidth(const Standard_Real theWidth);

		/****************** SetZLayer ******************/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "Set z layer id and update all presentations of the presentable object. the layers mechanism allows drawing objects in higher layers in overlay of objects in lower layers.

	:param theLayerId:
	:type theLayerId: int
	:rtype: None
") SetZLayer;
		virtual void SetZLayer(int theLayerId);

		/****************** SynchronizeAspects ******************/
		%feature("compactdefaultargs") SynchronizeAspects;
		%feature("autodoc", "Synchronize presentation aspects after their modification. //! this method should be called after modifying primitive aspect properties (material, texture, shader) so that modifications will take effect on already computed presentation groups (thus avoiding re-displaying the object).

	:rtype: None
") SynchronizeAspects;
		void SynchronizeAspects();

		/****************** ToBeUpdated ******************/
		%feature("compactdefaultargs") ToBeUpdated;
		%feature("autodoc", "Returns true if any active presentation has invalidation flag. @param thetoincludehidden when true, also checks hidden presentations.

	:param theToIncludeHidden: default value is Standard_False
	:type theToIncludeHidden: bool
	:rtype: bool
") ToBeUpdated;
		Standard_Boolean ToBeUpdated(Standard_Boolean theToIncludeHidden = Standard_False);

		/****************** ToBeUpdated ******************/
		%feature("compactdefaultargs") ToBeUpdated;
		%feature("autodoc", "Gives the list of modes which are flagged 'to be updated'.

	:param ListOfMode:
	:type ListOfMode: TColStd_ListOfInteger
	:rtype: None
") ToBeUpdated;
		void ToBeUpdated(TColStd_ListOfInteger & ListOfMode);

		/****************** ToPropagateVisualState ******************/
		%feature("compactdefaultargs") ToPropagateVisualState;
		%feature("autodoc", "Get value of the flag 'propagate visual state' it means that the display/erase/color visual state is propagated automatically to all children; by default, the flag is true .

	:rtype: bool
") ToPropagateVisualState;
		Standard_Boolean ToPropagateVisualState();

		/****************** TransformPersistence ******************/
		%feature("compactdefaultargs") TransformPersistence;
		%feature("autodoc", "Returns transformation persistence defining a special local coordinate system where this presentable object is located or null handle if not defined. position of the object having transformation persistence is mutable and depends on camera position. the same applies to a bounding box of the object. @sa graphic3d_transformpers class description.

	:rtype: opencascade::handle<Graphic3d_TransformPers>
") TransformPersistence;
		const opencascade::handle<Graphic3d_TransformPers> & TransformPersistence();

		/****************** Transformation ******************/
		%feature("compactdefaultargs") Transformation;
		%feature("autodoc", "Return the transformation taking into account transformation of parent object(s). note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.

	:rtype: gp_Trsf
") Transformation;
		const gp_Trsf Transformation();

		/****************** TransformationGeom ******************/
		%feature("compactdefaultargs") TransformationGeom;
		%feature("autodoc", "Return the transformation taking into account transformation of parent object(s). note that the local transformation of the object having transformation persistence is applied within local coordinate system defined by this persistence.

	:rtype: opencascade::handle<Geom_Transformation>
") TransformationGeom;
		const opencascade::handle<Geom_Transformation> & TransformationGeom();

		/****************** Transparency ******************/
		%feature("compactdefaultargs") Transparency;
		%feature("autodoc", "Returns the transparency setting. this will be between 0.0 and 1.0. at 0.0 an object will be totally opaque, and at 1.0, fully transparent.

	:rtype: float
") Transparency;
		virtual Standard_Real Transparency();

		/****************** TypeOfPresentation3d ******************/
		%feature("compactdefaultargs") TypeOfPresentation3d;
		%feature("autodoc", "Returns information on whether the object accepts display in hlr mode or not.

	:rtype: PrsMgr_TypeOfPresentation3d
") TypeOfPresentation3d;
		PrsMgr_TypeOfPresentation3d TypeOfPresentation3d();

		/****************** UnsetAttributes ******************/
		%feature("compactdefaultargs") UnsetAttributes;
		%feature("autodoc", "Clears settings provided by the drawing tool adrawer.

	:rtype: None
") UnsetAttributes;
		virtual void UnsetAttributes();

		/****************** UnsetColor ******************/
		%feature("compactdefaultargs") UnsetColor;
		%feature("autodoc", "Removes color settings. only the interactive object knows which drawer attribute is affected by the color setting. for a wire, for example, wire aspect is the attribute affected. for a vertex, however, only point aspect is affected by the color setting.

	:rtype: None
") UnsetColor;
		virtual void UnsetColor();

		/****************** UnsetDisplayMode ******************/
		%feature("compactdefaultargs") UnsetDisplayMode;
		%feature("autodoc", "Removes display mode settings from the interactive object.

	:rtype: None
") UnsetDisplayMode;
		void UnsetDisplayMode();

		/****************** UnsetHilightAttributes ******************/
		%feature("compactdefaultargs") UnsetHilightAttributes;
		%feature("autodoc", "Clears settings provided by the hilight drawing tool thedrawer.

	:rtype: None
") UnsetHilightAttributes;
		virtual void UnsetHilightAttributes();

		/****************** UnsetHilightMode ******************/
		%feature("compactdefaultargs") UnsetHilightMode;
		%feature("autodoc", "Unsets highlight display mode.

	:rtype: None
") UnsetHilightMode;
		void UnsetHilightMode();

		/****************** UnsetMaterial ******************/
		%feature("compactdefaultargs") UnsetMaterial;
		%feature("autodoc", "Removes the setting for material.

	:rtype: None
") UnsetMaterial;
		virtual void UnsetMaterial();

		/****************** UnsetTransparency ******************/
		%feature("compactdefaultargs") UnsetTransparency;
		%feature("autodoc", "Removes the transparency setting. the object is opaque by default.

	:rtype: None
") UnsetTransparency;
		virtual void UnsetTransparency();

		/****************** UnsetWidth ******************/
		%feature("compactdefaultargs") UnsetWidth;
		%feature("autodoc", "Reset width to default value.

	:rtype: None
") UnsetWidth;
		virtual void UnsetWidth();

		/****************** UpdateTransformation ******************/
		%feature("compactdefaultargs") UpdateTransformation;
		%feature("autodoc", "Updates final transformation (parent + local) of presentable object and its presentations.

	:rtype: None
") UpdateTransformation;
		virtual void UpdateTransformation();

		/****************** Width ******************/
		%feature("compactdefaultargs") Width;
		%feature("autodoc", "Returns the width setting of the interactive object.

	:rtype: float
") Width;
		Standard_Real Width();

		/****************** ZLayer ******************/
		%feature("compactdefaultargs") ZLayer;
		%feature("autodoc", "Get id of z layer for main presentation.

	:rtype: Graphic3d_ZLayerId
") ZLayer;
		Graphic3d_ZLayerId ZLayer();

};


%make_alias(PrsMgr_PresentableObject)

%extend PrsMgr_PresentableObject {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class PrsMgr_Presentation *
****************************/
%nodefaultctor PrsMgr_Presentation;
class PrsMgr_Presentation : public Graphic3d_Structure {
	public:
		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Removes the whole content of the presentation. does not remove the other connected presentations.

	:param theWithDestruction: default value is Standard_True
	:type theWithDestruction: bool
	:rtype: None
") Clear;
		virtual void Clear(const Standard_Boolean theWithDestruction = Standard_True);

		/****************** Compute ******************/
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "Compute structure using presentation manager.

	:rtype: None
") Compute;
		virtual void Compute();

		/****************** Display ******************/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Display structure.

	:rtype: None
") Display;
		virtual void Display();

		/****************** Erase ******************/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Remove structure.

	:rtype: None
") Erase;
		virtual void Erase();

		/****************** Highlight ******************/
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "Highlight structure.

	:param theStyle:
	:type theStyle: Prs3d_Drawer
	:rtype: None
") Highlight;
		void Highlight(const opencascade::handle<Prs3d_Drawer> & theStyle);

		/****************** IsDisplayed ******************/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "Return true if structure has been displayed and in no hidden state.

	:rtype: bool
") IsDisplayed;
		virtual Standard_Boolean IsDisplayed();

		/****************** Mode ******************/
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "Return display mode index.

	:rtype: int
") Mode;
		Standard_Integer Mode();

		/****************** MustBeUpdated ******************/
		%feature("compactdefaultargs") MustBeUpdated;
		%feature("autodoc", "	:rtype: bool
") MustBeUpdated;
		Standard_Boolean MustBeUpdated();

		/****************** Presentation ******************/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "	:rtype: Prs3d_Presentation *
") Presentation;
		Prs3d_Presentation * Presentation();

		/****************** PresentationManager ******************/
		%feature("compactdefaultargs") PresentationManager;
		%feature("autodoc", "Returns the presentationmanager in which the presentation has been created.

	:rtype: opencascade::handle<PrsMgr_PresentationManager>
") PresentationManager;
		const opencascade::handle<PrsMgr_PresentationManager> & PresentationManager();

		/****************** SetUpdateStatus ******************/
		%feature("compactdefaultargs") SetUpdateStatus;
		%feature("autodoc", "	:param theUpdateStatus:
	:type theUpdateStatus: bool
	:rtype: None
") SetUpdateStatus;
		void SetUpdateStatus(const Standard_Boolean theUpdateStatus);

		/****************** Unhighlight ******************/
		%feature("compactdefaultargs") Unhighlight;
		%feature("autodoc", "Unhighlight structure.

	:rtype: None
") Unhighlight;
		void Unhighlight();

};


%make_alias(PrsMgr_Presentation)

%extend PrsMgr_Presentation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************************
* class PrsMgr_PresentationManager *
***********************************/
class PrsMgr_PresentationManager : public Standard_Transient {
	public:
		/****************** AddToImmediateList ******************/
		%feature("compactdefaultargs") AddToImmediateList;
		%feature("autodoc", "Stores theprs in the transient list of presentations to be displayed in immediate mode. will be taken in account in endimmediatedraw method.

	:param thePrs:
	:type thePrs: Prs3d_Presentation
	:rtype: None
") AddToImmediateList;
		void AddToImmediateList(const opencascade::handle<Prs3d_Presentation> & thePrs);

		/****************** BeginImmediateDraw ******************/
		%feature("compactdefaultargs") BeginImmediateDraw;
		%feature("autodoc", "Resets the transient list of presentations previously displayed in immediate mode and begins accumulation of new list by following addtoimmediatelist()/color()/highlight() calls.

	:rtype: None
") BeginImmediateDraw;
		void BeginImmediateDraw();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the presentation of the presentable object theprsobject in this framework with the display mode themode.

	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") Clear;
		virtual void Clear(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****************** ClearImmediateDraw ******************/
		%feature("compactdefaultargs") ClearImmediateDraw;
		%feature("autodoc", "Resets the transient list of presentations previously displayed in immediate mode.

	:rtype: None
") ClearImmediateDraw;
		void ClearImmediateDraw();

		/****************** Color ******************/
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "Highlights the graphic object theprsobject in the color thecolor. theprsobject has the display mode themode; this has the default value of 0, that is, the wireframe display mode.

	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theStyle:
	:type theStyle: Prs3d_Drawer
	:param theMode: default value is 0
	:type theMode: int
	:param theSelObj: default value is NULL
	:type theSelObj: PrsMgr_PresentableObject
	:param theImmediateStructLayerId: default value is Graphic3d_ZLayerId_Topmost
	:type theImmediateStructLayerId: int
	:rtype: None
") Color;
		void Color(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const opencascade::handle<Prs3d_Drawer> & theStyle, const Standard_Integer theMode = 0, const opencascade::handle<PrsMgr_PresentableObject> & theSelObj = NULL, int theImmediateStructLayerId = Graphic3d_ZLayerId_Topmost);

		/****************** Connect ******************/
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theOtherObject:
	:type theOtherObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:param theOtherMode: default value is 0
	:type theOtherMode: int
	:rtype: None
") Connect;
		void Connect(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const opencascade::handle<PrsMgr_PresentableObject> & theOtherObject, const Standard_Integer theMode = 0, const Standard_Integer theOtherMode = 0);

		/****************** Display ******************/
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "Displays the presentation of the object in the given presentation manager with the given mode. the mode should be enumerated by the object which inherits presentableobject.

	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") Display;
		void Display(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****************** DisplayPriority ******************/
		%feature("compactdefaultargs") DisplayPriority;
		%feature("autodoc", "Returns the display priority of the presentable object theprsobject in this framework with the display mode themode.

	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode:
	:type theMode: int
	:rtype: int
") DisplayPriority;
		Standard_Integer DisplayPriority(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode);

		/****************** EndImmediateDraw ******************/
		%feature("compactdefaultargs") EndImmediateDraw;
		%feature("autodoc", "Allows rapid drawing of the each view in theviewer by avoiding an update of the whole background.

	:param theViewer:
	:type theViewer: V3d_Viewer
	:rtype: None
") EndImmediateDraw;
		void EndImmediateDraw(const opencascade::handle<V3d_Viewer> & theViewer);

		/****************** Erase ******************/
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "Erases the presentation of the object in the given presentation manager with the given mode. if @themode is -1, then erases all presentations of the object.

	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") Erase;
		void Erase(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****************** GetZLayer ******************/
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "Get z layer id assigned to all presentations of the object. method returns -1 value if object has no presentations and is impossible to get layer index.

	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:rtype: Graphic3d_ZLayerId
") GetZLayer;
		Graphic3d_ZLayerId GetZLayer(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject);

		/****************** HasPresentation ******************/
		%feature("compactdefaultargs") HasPresentation;
		%feature("autodoc", "Returns true if there is a presentation of the presentable object theprsobject in this framework, theprsobject having the display mode themode.

	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool
") HasPresentation;
		Standard_Boolean HasPresentation(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****************** IsDisplayed ******************/
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****************** IsHighlighted ******************/
		%feature("compactdefaultargs") IsHighlighted;
		%feature("autodoc", "Returns true if the presentation of the presentable object theprsobject in this framework with the display mode themode is highlighted.

	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool
") IsHighlighted;
		Standard_Boolean IsHighlighted(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****************** IsImmediateModeOn ******************/
		%feature("compactdefaultargs") IsImmediateModeOn;
		%feature("autodoc", "Returns true if presentation manager is accumulating transient list of presentations to be displayed in immediate mode.

	:rtype: bool
") IsImmediateModeOn;
		Standard_Boolean IsImmediateModeOn();

		/****************** Presentation ******************/
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "Returns the presentation presentation of the presentable object theprsobject in this framework. when thetocreate is true - automatically creates presentation for specified mode when not exist. optional argument theselobj specifies parent decomposed object to inherit its view affinity.

	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:param theToCreate: default value is Standard_False
	:type theToCreate: bool
	:param theSelObj: default value is NULL
	:type theSelObj: PrsMgr_PresentableObject
	:rtype: opencascade::handle<PrsMgr_Presentation>
") Presentation;
		opencascade::handle<PrsMgr_Presentation> Presentation(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0, const Standard_Boolean theToCreate = Standard_False, const opencascade::handle<PrsMgr_PresentableObject> & theSelObj = NULL);

		/****************** PrsMgr_PresentationManager ******************/
		%feature("compactdefaultargs") PrsMgr_PresentationManager;
		%feature("autodoc", "Creates a framework to manage displays and graphic entities with the 3d view thestructuremanager.

	:param theStructureManager:
	:type theStructureManager: Graphic3d_StructureManager
	:rtype: None
") PrsMgr_PresentationManager;
		 PrsMgr_PresentationManager(const opencascade::handle<Graphic3d_StructureManager> & theStructureManager);

		/****************** RedrawImmediate ******************/
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "Clears and redisplays immediate structures of the viewer taking into account its affinity.

	:param theViewer:
	:type theViewer: V3d_Viewer
	:rtype: None
") RedrawImmediate;
		void RedrawImmediate(const opencascade::handle<V3d_Viewer> & theViewer);

		/****************** SetDisplayPriority ******************/
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "Sets the display priority thenewprior of the presentable object theprsobject in this framework with the display mode themode.

	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode:
	:type theMode: int
	:param theNewPrior:
	:type theNewPrior: int
	:rtype: None
") SetDisplayPriority;
		void SetDisplayPriority(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode, const Standard_Integer theNewPrior);

		/****************** SetVisibility ******************/
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "Sets the visibility of presentable object.

	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode:
	:type theMode: int
	:param theValue:
	:type theValue: bool
	:rtype: None
") SetVisibility;
		void SetVisibility(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode, const Standard_Boolean theValue);

		/****************** SetZLayer ******************/
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "Set z layer id for all presentations of the object.

	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theLayerId:
	:type theLayerId: int
	:rtype: None
") SetZLayer;
		void SetZLayer(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, int theLayerId);

		/****************** StructureManager ******************/
		%feature("compactdefaultargs") StructureManager;
		%feature("autodoc", "Returns the structure manager.

	:rtype: opencascade::handle<Graphic3d_StructureManager>
") StructureManager;
		const opencascade::handle<Graphic3d_StructureManager> & StructureManager();

		/****************** Transform ******************/
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "Sets the transformation thetransformation for the presentable object theprsobject. theprsobject has the display mode themode; this has the default value of 0, that is, the wireframe display mode.

	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theTransformation:
	:type theTransformation: Geom_Transformation
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") Transform;
		void Transform(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const opencascade::handle<Geom_Transformation> & theTransformation, const Standard_Integer theMode = 0);

		/****************** Unhighlight ******************/
		%feature("compactdefaultargs") Unhighlight;
		%feature("autodoc", "Removes highlighting from the presentation of the presentable object.

	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:rtype: None
") Unhighlight;
		void Unhighlight(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject);

		/****************** Unhighlight ******************/
		%feature("compactdefaultargs") Unhighlight;
		%feature("autodoc", "	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode:
	:type theMode: int
	:rtype: None
") Unhighlight;
		void Unhighlight(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode);

		/****************** Update ******************/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "Updates the presentation of the presentable object theprsobject in this framework with the display mode themode.

	:param thePrsObject:
	:type thePrsObject: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") Update;
		void Update(const opencascade::handle<PrsMgr_PresentableObject> & thePrsObject, const Standard_Integer theMode = 0);

		/****************** UpdateHighlightTrsf ******************/
		%feature("compactdefaultargs") UpdateHighlightTrsf;
		%feature("autodoc", "Allows to apply location transformation to shadow highlight presentation immediately. @param theobj defines the base object, it local transformation will be applied to corresponding highlight structure @param themode defines display mode of the base object @param theselobj defines the object produced after decomposition of the base object for local selection.

	:param theViewer:
	:type theViewer: V3d_Viewer
	:param theObj:
	:type theObj: PrsMgr_PresentableObject
	:param theMode: default value is 0
	:type theMode: int
	:param theSelObj: default value is NULL
	:type theSelObj: PrsMgr_PresentableObject
	:rtype: None
") UpdateHighlightTrsf;
		void UpdateHighlightTrsf(const opencascade::handle<V3d_Viewer> & theViewer, const opencascade::handle<PrsMgr_PresentableObject> & theObj, const Standard_Integer theMode = 0, const opencascade::handle<PrsMgr_PresentableObject> & theSelObj = NULL);

};


%make_alias(PrsMgr_PresentationManager)

%extend PrsMgr_PresentationManager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
