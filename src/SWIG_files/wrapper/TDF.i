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
%define TDFDOCSTRING
"TDF module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_tdf.html"
%enddef
%module (package="OCC.Core", docstring=TDFDOCSTRING) TDF


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
#include<TDF_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TColStd_module.hxx>
#include<TDataStd_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
%import TColStd.i
/* public enums */
enum  {
	TDF_LabelNodeImportMsk = ( int ) 0x80000000,
	TDF_LabelNodeAttModMsk = 1073741824,
	TDF_LabelNodeMayModMsk = 536870912,
	TDF_LabelNodeFlagsMsk = ( TDF_LabelNodeImportMsk | TDF_LabelNodeAttModMsk | TDF_LabelNodeMayModMsk ),
};

/* end public enums declaration */

/* handles */
%wrap_handle(TDF_Attribute)
%wrap_handle(TDF_AttributeDelta)
%wrap_handle(TDF_Data)
%wrap_handle(TDF_DataSet)
%wrap_handle(TDF_Delta)
%wrap_handle(TDF_RelocationTable)
%wrap_handle(TDF_DeltaOnAddition)
%wrap_handle(TDF_DeltaOnForget)
%wrap_handle(TDF_DeltaOnModification)
%wrap_handle(TDF_DeltaOnRemoval)
%wrap_handle(TDF_DeltaOnResume)
%wrap_handle(TDF_Reference)
%wrap_handle(TDF_TagSource)
%wrap_handle(TDF_DefaultDeltaOnModification)
%wrap_handle(TDF_DefaultDeltaOnRemoval)
%wrap_handle(TDF_HAttributeArray1)
/* end handles declaration */

/* templates */
%template(TDF_AttributeList) NCollection_List<opencascade::handle<TDF_Attribute>>;
%template(TDF_ListIteratorOfAttributeList) NCollection_TListIterator<opencascade::handle<TDF_Attribute>>;
%template(TDF_GUIDProgIDMap) NCollection_DoubleMap<Standard_GUID,TCollection_ExtendedString,Standard_GUID,TCollection_ExtendedString>;
%template(TDF_AttributeArray1) NCollection_Array1<opencascade::handle<TDF_Attribute>>;

%extend NCollection_Array1<opencascade::handle<TDF_Attribute>> {
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
%template(TDF_AttributeMap) NCollection_Map<opencascade::handle<TDF_Attribute>,TColStd_MapTransientHasher>;
%template(TDF_IDList) NCollection_List<Standard_GUID>;
%template(TDF_ListIteratorOfIDList) NCollection_TListIterator<Standard_GUID>;
%template(TDF_LabelSequence) NCollection_Sequence<TDF_Label>;
%template(TDF_AttributeDeltaList) NCollection_List<opencascade::handle<TDF_AttributeDelta>>;
%template(TDF_ListIteratorOfAttributeDeltaList) NCollection_TListIterator<opencascade::handle<TDF_AttributeDelta>>;
%template(TDF_LabelDoubleMap) NCollection_DoubleMap<TDF_Label,TDF_Label,TDF_LabelMapHasher,TDF_LabelMapHasher>;
%template(TDF_HAllocator) opencascade::handle<NCollection_BaseAllocator>;
%template(TDF_LabelMap) NCollection_Map<TDF_Label,TDF_LabelMapHasher>;
%template(TDF_AttributeIndexedMap) NCollection_IndexedMap<opencascade::handle<TDF_Attribute>,TColStd_MapTransientHasher>;
%template(TDF_AttributeDoubleMap) NCollection_DoubleMap<opencascade::handle<TDF_Attribute>,opencascade::handle<TDF_Attribute>,TColStd_MapTransientHasher,TColStd_MapTransientHasher>;
%template(TDF_AttributeDataMap) NCollection_DataMap<opencascade::handle<TDF_Attribute>,opencascade::handle<TDF_Attribute>,TColStd_MapTransientHasher>;
%template(TDF_IDMap) NCollection_Map<Standard_GUID,Standard_GUID>;
%template(TDF_LabelDataMap) NCollection_DataMap<TDF_Label,TDF_Label,TDF_LabelMapHasher>;
%template(TDF_DeltaList) NCollection_List<opencascade::handle<TDF_Delta>>;
%template(TDF_ListIteratorOfDeltaList) NCollection_TListIterator<opencascade::handle<TDF_Delta>>;
%template(TDF_LabelIndexedMap) NCollection_IndexedMap<TDF_Label,TDF_LabelMapHasher>;
%template(TDF_LabelIntegerMap) NCollection_DataMap<TDF_Label,Standard_Integer,TDF_LabelMapHasher>;
%template(TDF_LabelList) NCollection_List<TDF_Label>;
%template(TDF_ListIteratorOfLabelList) NCollection_TListIterator<TDF_Label>;
%template(TDF_AttributeSequence) NCollection_Sequence<opencascade::handle<TDF_Attribute>>;
/* end templates declaration */

/* typedefs */
typedef NCollection_List<opencascade::handle<TDF_Attribute>> TDF_AttributeList;
typedef NCollection_List<opencascade::handle<TDF_Attribute>>::Iterator TDF_ListIteratorOfAttributeList;
typedef NCollection_DoubleMap<Standard_GUID, TCollection_ExtendedString, Standard_GUID, TCollection_ExtendedString> TDF_GUIDProgIDMap;
typedef NCollection_DoubleMap<Standard_GUID, TCollection_ExtendedString, Standard_GUID, TCollection_ExtendedString>::Iterator TDF_DoubleMapIteratorOfGUIDProgIDMap;
typedef NCollection_Array1<opencascade::handle<TDF_Attribute>> TDF_AttributeArray1;
typedef NCollection_Map<opencascade::handle<TDF_Attribute>, TColStd_MapTransientHasher> TDF_AttributeMap;
typedef NCollection_Map<opencascade::handle<TDF_Attribute>, TColStd_MapTransientHasher>::Iterator TDF_MapIteratorOfAttributeMap;
typedef NCollection_List<Standard_GUID> TDF_IDList;
typedef NCollection_List<Standard_GUID>::Iterator TDF_ListIteratorOfIDList;
typedef NCollection_Sequence<TDF_Label> TDF_LabelSequence;
typedef NCollection_List<opencascade::handle<TDF_AttributeDelta>> TDF_AttributeDeltaList;
typedef NCollection_List<opencascade::handle<TDF_AttributeDelta>>::Iterator TDF_ListIteratorOfAttributeDeltaList;
typedef NCollection_DoubleMap<TDF_Label, TDF_Label, TDF_LabelMapHasher, TDF_LabelMapHasher> TDF_LabelDoubleMap;
typedef NCollection_DoubleMap<TDF_Label, TDF_Label, TDF_LabelMapHasher, TDF_LabelMapHasher>::Iterator TDF_DoubleMapIteratorOfLabelDoubleMap;
typedef TDF_LabelNode * TDF_LabelNodePtr;
typedef opencascade::handle<NCollection_BaseAllocator> TDF_HAllocator;
typedef NCollection_Map<TDF_Label, TDF_LabelMapHasher> TDF_LabelMap;
typedef NCollection_Map<TDF_Label, TDF_LabelMapHasher>::Iterator TDF_MapIteratorOfLabelMap;
typedef NCollection_IndexedMap<opencascade::handle<TDF_Attribute>, TColStd_MapTransientHasher> TDF_AttributeIndexedMap;
typedef NCollection_DoubleMap<opencascade::handle<TDF_Attribute>, opencascade::handle<TDF_Attribute>, TColStd_MapTransientHasher, TColStd_MapTransientHasher> TDF_AttributeDoubleMap;
typedef NCollection_DoubleMap<opencascade::handle<TDF_Attribute>, opencascade::handle<TDF_Attribute>, TColStd_MapTransientHasher, TColStd_MapTransientHasher>::Iterator TDF_DoubleMapIteratorOfAttributeDoubleMap;
typedef NCollection_DataMap<opencascade::handle<TDF_Attribute>, opencascade::handle<TDF_Attribute>, TColStd_MapTransientHasher> TDF_AttributeDataMap;
typedef NCollection_DataMap<opencascade::handle<TDF_Attribute>, opencascade::handle<TDF_Attribute>, TColStd_MapTransientHasher>::Iterator TDF_DataMapIteratorOfAttributeDataMap;
typedef NCollection_Map<Standard_GUID, Standard_GUID> TDF_IDMap;
typedef NCollection_Map<Standard_GUID, Standard_GUID>::Iterator TDF_MapIteratorOfIDMap;
typedef NCollection_DataMap<TDF_Label, TDF_Label, TDF_LabelMapHasher> TDF_LabelDataMap;
typedef NCollection_DataMap<TDF_Label, TDF_Label, TDF_LabelMapHasher>::Iterator TDF_DataMapIteratorOfLabelDataMap;
typedef NCollection_List<opencascade::handle<TDF_Delta>> TDF_DeltaList;
typedef NCollection_List<opencascade::handle<TDF_Delta>>::Iterator TDF_ListIteratorOfDeltaList;
typedef NCollection_IndexedMap<TDF_Label, TDF_LabelMapHasher> TDF_LabelIndexedMap;
typedef NCollection_DataMap<TDF_Label, Standard_Integer, TDF_LabelMapHasher> TDF_LabelIntegerMap;
typedef NCollection_DataMap<TDF_Label, Standard_Integer, TDF_LabelMapHasher>::Iterator TDF_DataMapIteratorOfLabelIntegerMap;
typedef NCollection_List<TDF_Label> TDF_LabelList;
typedef NCollection_List<TDF_Label>::Iterator TDF_ListIteratorOfLabelList;
typedef NCollection_Sequence<opencascade::handle<TDF_Attribute>> TDF_AttributeSequence;
/* end typedefs declaration */

/************
* class TDF *
************/
%rename(tdf) TDF;
class TDF {
	public:
		/****************** AddLinkGUIDToProgID ******************/
		%feature("compactdefaultargs") AddLinkGUIDToProgID;
		%feature("autodoc", "Sets link between guid and progid in hidden datamap.

	:param ID:
	:type ID: Standard_GUID
	:param ProgID:
	:type ProgID: TCollection_ExtendedString
	:rtype: None
") AddLinkGUIDToProgID;
		static void AddLinkGUIDToProgID(const Standard_GUID & ID, const TCollection_ExtendedString & ProgID);

		/****************** GUIDFromProgID ******************/
		%feature("compactdefaultargs") GUIDFromProgID;
		%feature("autodoc", "Returns true if there is guid for given <progid> then guid is returned in <id>.

	:param ProgID:
	:type ProgID: TCollection_ExtendedString
	:param ID:
	:type ID: Standard_GUID
	:rtype: bool
") GUIDFromProgID;
		static Standard_Boolean GUIDFromProgID(const TCollection_ExtendedString & ProgID, Standard_GUID & ID);

		/****************** LowestID ******************/
		%feature("compactdefaultargs") LowestID;
		%feature("autodoc", "Returns id '00000000-0000-0000-0000-000000000000', sometimes used as null id.

	:rtype: Standard_GUID
") LowestID;
		static const Standard_GUID & LowestID();

		/****************** ProgIDFromGUID ******************/
		%feature("compactdefaultargs") ProgIDFromGUID;
		%feature("autodoc", "Returns true if there is progid for given <id> then progid is returned in <progid>.

	:param ID:
	:type ID: Standard_GUID
	:param ProgID:
	:type ProgID: TCollection_ExtendedString
	:rtype: bool
") ProgIDFromGUID;
		static Standard_Boolean ProgIDFromGUID(const Standard_GUID & ID, TCollection_ExtendedString & ProgID);

		/****************** UppestID ******************/
		%feature("compactdefaultargs") UppestID;
		%feature("autodoc", "Returns id 'ffffffff-ffff-ffff-ffff-ffffffffffff'.

	:rtype: Standard_GUID
") UppestID;
		static const Standard_GUID & UppestID();

};


%extend TDF {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDF_Attribute *
**********************/
%nodefaultctor TDF_Attribute;
class TDF_Attribute : public Standard_Transient {
	public:
		/****************** AddAttribute ******************/
		%feature("compactdefaultargs") AddAttribute;
		%feature("autodoc", "Adds an attribute <other> to the label of <self>.raises if there is already one of the same guid fhan <other>.

	:param other:
	:type other: TDF_Attribute
	:rtype: None
") AddAttribute;
		void AddAttribute(const opencascade::handle<TDF_Attribute> & other);

		/****************** AfterAddition ******************/
		%feature("compactdefaultargs") AfterAddition;
		%feature("autodoc", "Something to do after adding an attribute to a label.

	:rtype: None
") AfterAddition;
		virtual void AfterAddition();

		/****************** AfterResume ******************/
		%feature("compactdefaultargs") AfterResume;
		%feature("autodoc", "Something to do after resuming an attribute from a label.

	:rtype: None
") AfterResume;
		virtual void AfterResume();

		/****************** AfterRetrieval ******************/
		%feature("compactdefaultargs") AfterRetrieval;
		%feature("autodoc", "Something to do after creation of an attribute by persistent-transient translation. the returned status says if afterundo has been performed (true) or if this callback must be called once again further (false). if <forceit> is set to true, the method must perform and return true. does nothing by default and returns true.

	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") AfterRetrieval;
		virtual Standard_Boolean AfterRetrieval(const Standard_Boolean forceIt = Standard_False);

		/****************** AfterUndo ******************/
		%feature("compactdefaultargs") AfterUndo;
		%feature("autodoc", "Something to do after applying <anattdelta>. the returned status says if afterundo has been performed (true) or if this callback must be called once again further (false). if <forceit> is set to true, the method must perform and return true. does nothing by default and returns true.

	:param anAttDelta:
	:type anAttDelta: TDF_AttributeDelta
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") AfterUndo;
		virtual Standard_Boolean AfterUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****************** Backup ******************/
		%feature("compactdefaultargs") Backup;
		%feature("autodoc", "Backups the attribute. the backuped attribute is flagged 'backuped' and not 'valid'. //! the method does nothing: //! 1) if the attribute transaction number is equal to the current transaction number (the attribute has already been backuped). //! 2) if the attribute is not attached to a label.

	:rtype: None
") Backup;
		void Backup();

		/****************** BackupCopy ******************/
		%feature("compactdefaultargs") BackupCopy;
		%feature("autodoc", "Copies the attribute contents into a new other attribute. it is used by backup().

	:rtype: opencascade::handle<TDF_Attribute>
") BackupCopy;
		virtual opencascade::handle<TDF_Attribute> BackupCopy();

		/****************** BeforeCommitTransaction ******************/
		%feature("compactdefaultargs") BeforeCommitTransaction;
		%feature("autodoc", "A callback. by default does nothing. it is called by tdf_data::committransaction() method.

	:rtype: None
") BeforeCommitTransaction;
		virtual void BeforeCommitTransaction();

		/****************** BeforeForget ******************/
		%feature("compactdefaultargs") BeforeForget;
		%feature("autodoc", "Something to do before forgetting an attribute to a label.

	:rtype: None
") BeforeForget;
		virtual void BeforeForget();

		/****************** BeforeRemoval ******************/
		%feature("compactdefaultargs") BeforeRemoval;
		%feature("autodoc", "Something to do before removing an attribute from a label.

	:rtype: None
") BeforeRemoval;
		virtual void BeforeRemoval();

		/****************** BeforeUndo ******************/
		%feature("compactdefaultargs") BeforeUndo;
		%feature("autodoc", "Something to do before applying <anattdelta>. the returned status says if afterundo has been performed (true) or if this callback must be called once again further (false). if <forceit> is set to true, the method must perform and return true. does nothing by default and returns true.

	:param anAttDelta:
	:type anAttDelta: TDF_AttributeDelta
	:param forceIt: default value is Standard_False
	:type forceIt: bool
	:rtype: bool
") BeforeUndo;
		virtual Standard_Boolean BeforeUndo(const opencascade::handle<TDF_AttributeDelta> & anAttDelta, const Standard_Boolean forceIt = Standard_False);

		/****************** DeltaOnAddition ******************/
		%feature("compactdefaultargs") DeltaOnAddition;
		%feature("autodoc", "Makes an attributedelta because <self> appeared. the only known use of a redefinition of this method is to return a null handle (no delta).

	:rtype: opencascade::handle<TDF_DeltaOnAddition>
") DeltaOnAddition;
		virtual opencascade::handle<TDF_DeltaOnAddition> DeltaOnAddition();

		/****************** DeltaOnForget ******************/
		%feature("compactdefaultargs") DeltaOnForget;
		%feature("autodoc", "Makes an attributedelta because <self> has been forgotten.

	:rtype: opencascade::handle<TDF_DeltaOnForget>
") DeltaOnForget;
		virtual opencascade::handle<TDF_DeltaOnForget> DeltaOnForget();

		/****************** DeltaOnModification ******************/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "Makes a deltaonmodification between <self> and <anoldattribute.

	:param anOldAttribute:
	:type anOldAttribute: TDF_Attribute
	:rtype: opencascade::handle<TDF_DeltaOnModification>
") DeltaOnModification;
		virtual opencascade::handle<TDF_DeltaOnModification> DeltaOnModification(const opencascade::handle<TDF_Attribute> & anOldAttribute);

		/****************** DeltaOnModification ******************/
		%feature("compactdefaultargs") DeltaOnModification;
		%feature("autodoc", "Applies a deltaonmodification to <self>.

	:param aDelta:
	:type aDelta: TDF_DeltaOnModification
	:rtype: None
") DeltaOnModification;
		virtual void DeltaOnModification(const opencascade::handle<TDF_DeltaOnModification> & aDelta);

		/****************** DeltaOnRemoval ******************/
		%feature("compactdefaultargs") DeltaOnRemoval;
		%feature("autodoc", "Makes a deltaonremoval on <self> because <self> has disappeared from the ds.

	:rtype: opencascade::handle<TDF_DeltaOnRemoval>
") DeltaOnRemoval;
		virtual opencascade::handle<TDF_DeltaOnRemoval> DeltaOnRemoval();

		/****************** DeltaOnResume ******************/
		%feature("compactdefaultargs") DeltaOnResume;
		%feature("autodoc", "Makes an attributedelta because <self> has been resumed.

	:rtype: opencascade::handle<TDF_DeltaOnResume>
") DeltaOnResume;
		virtual opencascade::handle<TDF_DeltaOnResume> DeltaOnResume();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** ExtendedDump ******************/
		%feature("compactdefaultargs") ExtendedDump;
		%feature("autodoc", "Dumps the attribute content on <astream>, using <amap> like this: if an attribute is not in the map, first put add it to the map and then dump it. use the map rank instead of dumping each attribute field.

	:param anOS:
	:type anOS: Standard_OStream
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:param aMap:
	:type aMap: TDF_AttributeIndexedMap
	:rtype: None
") ExtendedDump;
		virtual void ExtendedDump(Standard_OStream & anOS, const TDF_IDFilter & aFilter, TDF_AttributeIndexedMap & aMap);

		/****************** FindAttribute ******************/
		%feature("compactdefaultargs") FindAttribute;
		%feature("autodoc", "Finds an associated attribute of <self>, according to <anid>. the returned <anattribute> is a valid one. the method returns true if found, false otherwise. a removed attribute cannot be found using this method.

	:param anID:
	:type anID: Standard_GUID
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: bool
") FindAttribute;
		Standard_Boolean FindAttribute(const Standard_GUID & anID, opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** Forget ******************/
		%feature("compactdefaultargs") Forget;
		%feature("autodoc", "Forgets the attribute. <atransaction> is the current transaction in which the forget is done. a forgotten attribute is also flagged not 'valid'. //! a forgotten attribute is invisible. set also the 'valid' status to false. obvioulsy, df cannot empty an attribute (this has a semantic signification), but can remove it from the structure. so, a forgotten attribute is not an empty one, but a soon dead one. //! should be private.

	:param aTransaction:
	:type aTransaction: int
	:rtype: None
") Forget;
		void Forget(const Standard_Integer aTransaction);

		/****************** ForgetAllAttributes ******************/
		%feature("compactdefaultargs") ForgetAllAttributes;
		%feature("autodoc", "Forgets all the attributes attached to the label of <self>. does it on the sub-labels if <clearchildren> is set to true. of course, this method is compatible with transaction & delta mecanisms. be carefull that if <self> will have a null label after this call.

	:param clearChildren: default value is Standard_True
	:type clearChildren: bool
	:rtype: None
") ForgetAllAttributes;
		void ForgetAllAttributes(const Standard_Boolean clearChildren = Standard_True);

		/****************** ForgetAttribute ******************/
		%feature("compactdefaultargs") ForgetAttribute;
		%feature("autodoc", "Forgets the attribute of guid <aguid> associated to the label of <self>. be carefull that if <self> is the attribute of <guid>, <self> will have a null label after this call. if the attribute doesn't exist returns false. otherwise returns true.

	:param aguid:
	:type aguid: Standard_GUID
	:rtype: bool
") ForgetAttribute;
		Standard_Boolean ForgetAttribute(const Standard_GUID & aguid);

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of the attribute.

	:rtype: Standard_GUID
") ID;
		virtual const Standard_GUID & ID();

		/****************** IsAttribute ******************/
		%feature("compactdefaultargs") IsAttribute;
		%feature("autodoc", "Returns true if it exists an associated attribute of <self> with <anid> as id.

	:param anID:
	:type anID: Standard_GUID
	:rtype: bool
") IsAttribute;
		Standard_Boolean IsAttribute(const Standard_GUID & anID);

		/****************** IsBackuped ******************/
		%feature("compactdefaultargs") IsBackuped;
		%feature("autodoc", "Returns true if the attribute backup status is set. this status is set/unset by the backup() method.

	:rtype: bool
") IsBackuped;
		Standard_Boolean IsBackuped();

		/****************** IsForgotten ******************/
		%feature("compactdefaultargs") IsForgotten;
		%feature("autodoc", "Returns true if the attribute forgotten status is set. //! shortcut methods concerning associated attributes =================================================.

	:rtype: bool
") IsForgotten;
		Standard_Boolean IsForgotten();

		/****************** IsNew ******************/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "Returns true if the attribute has no backup.

	:rtype: bool
") IsNew;
		Standard_Boolean IsNew();

		/****************** IsValid ******************/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Returns true if the attribute is valid; i.e. not a backuped or removed one.

	:rtype: bool
") IsValid;
		Standard_Boolean IsValid();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label to which the attribute is attached. if the label is not included in a df, the label is null. see label. warning if the label is not included in a data framework, it is null. this function should not be redefined inline.

	:rtype: TDF_Label
") Label;
		const TDF_Label Label();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "Returns an new empty attribute from the good end type. it is used by the copy algorithm.

	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		virtual opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "This method is different from the 'copy' one, because it is used when copying an attribute from a source structure into a target structure. this method may paste the contents of <self> into <intoattribute>. //! the given pasted attribute can be full or empty of its contents. but don't make a new! just set the contents! //! it is possible to use <arelocationtable> to get/set the relocation value of a source attribute.

	:param intoAttribute:
	:type intoAttribute: TDF_Attribute
	:param aRelocationTable:
	:type aRelocationTable: TDF_RelocationTable
	:rtype: None
") Paste;
		virtual void Paste(const opencascade::handle<TDF_Attribute> & intoAttribute, const opencascade::handle<TDF_RelocationTable> & aRelocationTable);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "Adds the first level referenced attributes and labels to <adataset>. //! for this, use the addlabel or addattribute of dataset. //! if there is none, do not implement the method.

	:param aDataSet:
	:type aDataSet: TDF_DataSet
	:rtype: None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "Restores the backuped contents from <anattribute> into this one. it is used when aborting a transaction.

	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: None
") Restore;
		virtual void Restore(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets specific id of the attribute (supports several attributes of one type at the same label feature).

	:param &:
	:type &: Standard_GUID
	:rtype: None
") SetID;
		virtual void SetID(const Standard_GUID &);

		/****************** SetID ******************/
		%feature("compactdefaultargs") SetID;
		%feature("autodoc", "Sets default id defined in nested class (to be used for attributes having user id feature).

	:rtype: None
") SetID;
		virtual void SetID();

		/****************** Transaction ******************/
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "Returns the transaction index in which the attribute has been created or modified.

	:rtype: int
") Transaction;
		Standard_Integer Transaction();

		/****************** UntilTransaction ******************/
		%feature("compactdefaultargs") UntilTransaction;
		%feature("autodoc", "Returns the upper transaction index until which the attribute is/was valid. this number may vary. a removed attribute validity range is reduced to its transaction index.

	:rtype: int
") UntilTransaction;
		Standard_Integer UntilTransaction();

};


%make_alias(TDF_Attribute)

%extend TDF_Attribute {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TDF_AttributeDelta *
***************************/
%nodefaultctor TDF_AttributeDelta;
class TDF_AttributeDelta : public Standard_Transient {
	public:
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

	:rtype: None
") Apply;
		virtual void Apply();

		/****************** Attribute ******************/
		%feature("compactdefaultargs") Attribute;
		%feature("autodoc", "Returns the reference attribute.

	:rtype: opencascade::handle<TDF_Attribute>
") Attribute;
		opencascade::handle<TDF_Attribute> Attribute();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "Returns the id of the attribute concerned by <self>.

	:rtype: Standard_GUID
") ID;
		Standard_GUID ID();

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label concerned by <self>.

	:rtype: TDF_Label
") Label;
		TDF_Label Label();

};


%make_alias(TDF_AttributeDelta)

%extend TDF_AttributeDelta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class TDF_AttributeIterator *
******************************/
class TDF_AttributeIterator {
	public:
		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aLabel:
	:type aLabel: TDF_Label
	:param withoutForgotten: default value is Standard_True
	:type withoutForgotten: bool
	:rtype: None
") Initialize;
		void Initialize(const TDF_Label & aLabel, const Standard_Boolean withoutForgotten = Standard_True);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	:rtype: bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	:rtype: None
") Next;
		void Next();

		/****************** PtrValue ******************/
		%feature("compactdefaultargs") PtrValue;
		%feature("autodoc", "Provides an access to the internal pointer of the current attribute. the method has better performance as not-creating handle.

	:rtype: TDF_Attribute *
") PtrValue;
		const TDF_Attribute * PtrValue();

		/****************** TDF_AttributeIterator ******************/
		%feature("compactdefaultargs") TDF_AttributeIterator;
		%feature("autodoc", "	:rtype: None
") TDF_AttributeIterator;
		 TDF_AttributeIterator();

		/****************** TDF_AttributeIterator ******************/
		%feature("compactdefaultargs") TDF_AttributeIterator;
		%feature("autodoc", "	:param aLabel:
	:type aLabel: TDF_Label
	:param withoutForgotten: default value is Standard_True
	:type withoutForgotten: bool
	:rtype: None
") TDF_AttributeIterator;
		 TDF_AttributeIterator(const TDF_Label & aLabel, const Standard_Boolean withoutForgotten = Standard_True);

		/****************** TDF_AttributeIterator ******************/
		%feature("compactdefaultargs") TDF_AttributeIterator;
		%feature("autodoc", "	:param aLabelNode:
	:type aLabelNode: TDF_LabelNodePtr
	:param withoutForgotten: default value is Standard_True
	:type withoutForgotten: bool
	:rtype: None
") TDF_AttributeIterator;
		 TDF_AttributeIterator(const TDF_LabelNodePtr aLabelNode, const Standard_Boolean withoutForgotten = Standard_True);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") Value;
		opencascade::handle<TDF_Attribute> Value();

};


%extend TDF_AttributeIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TDF_ChildIDIterator *
****************************/
class TDF_ChildIDIterator {
	public:
		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the iteration on the children of the given label. if <alllevels> option is set to true, it explores not only the first, but all the sub label levels.

	:param aLabel:
	:type aLabel: TDF_Label
	:param anID:
	:type anID: Standard_GUID
	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: None
") Initialize;
		void Initialize(const TDF_Label & aLabel, const Standard_GUID & anID, const Standard_Boolean allLevels = Standard_False);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if there is a current item in the iteration.

	:rtype: bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Move to the next item.

	:rtype: None
") Next;
		void Next();

		/****************** NextBrother ******************/
		%feature("compactdefaultargs") NextBrother;
		%feature("autodoc", "Move to the next brother. if there is none, go up etc. this method is interesting only with 'alllevels' behavior, because it avoids to explore the current label children.

	:rtype: None
") NextBrother;
		void NextBrother();

		/****************** TDF_ChildIDIterator ******************/
		%feature("compactdefaultargs") TDF_ChildIDIterator;
		%feature("autodoc", "Creates an empty iterator.

	:rtype: None
") TDF_ChildIDIterator;
		 TDF_ChildIDIterator();

		/****************** TDF_ChildIDIterator ******************/
		%feature("compactdefaultargs") TDF_ChildIDIterator;
		%feature("autodoc", "Iterates on the children of the given label. if <alllevels> option is set to true, it explores not only the first, but all the sub label levels.

	:param aLabel:
	:type aLabel: TDF_Label
	:param anID:
	:type anID: Standard_GUID
	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: None
") TDF_ChildIDIterator;
		 TDF_ChildIDIterator(const TDF_Label & aLabel, const Standard_GUID & anID, const Standard_Boolean allLevels = Standard_False);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current item; a null handle if there is none.

	:rtype: opencascade::handle<TDF_Attribute>
") Value;
		opencascade::handle<TDF_Attribute> Value();

};


%extend TDF_ChildIDIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDF_ChildIterator *
**************************/
class TDF_ChildIterator {
	public:
		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Initializes the iteration on the children of the given label. if <alllevels> option is set to true, it explores not only the first, but all the sub label levels. if alllevels is false, only the first level of child labels is explored. in the example below, the label is iterated using initialize, more and next and its child labels dumped using tdf_tool::entry. example void dumpchildren(const tdf_label& alabel) { tdf_childiterator it; tcollection_asciistring es; for (it.initialize(alabel,standard_true); it.more(); it.next()){ tdf_tool::entry(it.value(),es); std::cout << as.tocstring() << std::endl; } }.

	:param aLabel:
	:type aLabel: TDF_Label
	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: None
") Initialize;
		void Initialize(const TDF_Label & aLabel, const Standard_Boolean allLevels = Standard_False);

		/****************** More ******************/
		%feature("compactdefaultargs") More;
		%feature("autodoc", "Returns true if a current label is found in the iteration process.

	:rtype: bool
") More;
		Standard_Boolean More();

		/****************** Next ******************/
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "Move the current iteration to the next item.

	:rtype: None
") Next;
		void Next();

		/****************** NextBrother ******************/
		%feature("compactdefaultargs") NextBrother;
		%feature("autodoc", "Moves this iteration to the next brother label. a brother label is one with the same father as an initial label. use this function when the non-empty constructor or initialize has alllevels set to true. the result is that the iteration does not explore the children of the current label. this method is interesting only with 'alllevels' behavior, because it avoids to explore the current label children.

	:rtype: None
") NextBrother;
		void NextBrother();

		/****************** TDF_ChildIterator ******************/
		%feature("compactdefaultargs") TDF_ChildIterator;
		%feature("autodoc", "Creates an empty iterator object to explore the children of a label.

	:rtype: None
") TDF_ChildIterator;
		 TDF_ChildIterator();

		/****************** TDF_ChildIterator ******************/
		%feature("compactdefaultargs") TDF_ChildIterator;
		%feature("autodoc", "Constructs the iterator object defined by the label alabel. iterates on the children of the given label. if <alllevels> option is set to true, it explores not only the first, but all the sub label levels.

	:param aLabel:
	:type aLabel: TDF_Label
	:param allLevels: default value is Standard_False
	:type allLevels: bool
	:rtype: None
") TDF_ChildIterator;
		 TDF_ChildIterator(const TDF_Label & aLabel, const Standard_Boolean allLevels = Standard_False);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Returns the current label; or, if there is none, a null label.

	:rtype: TDF_Label
") Value;
		const TDF_Label Value();

};


%extend TDF_ChildIterator {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TDF_ClosureMode *
************************/
class TDF_ClosureMode {
	public:
		/****************** Descendants ******************/
		%feature("compactdefaultargs") Descendants;
		%feature("autodoc", "Sets the mode 'descendants' to <astatus>. //! 'descendants' mode means we add to the data set the children labels of each user given label. we do not do that with the labels found applying uptofirstlevel option.

	:param aStatus:
	:type aStatus: bool
	:rtype: None
") Descendants;
		void Descendants(const Standard_Boolean aStatus);

		/****************** Descendants ******************/
		%feature("compactdefaultargs") Descendants;
		%feature("autodoc", "Returns true if the mode 'descendants' is set.

	:rtype: bool
") Descendants;
		Standard_Boolean Descendants();

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "Sets the mode 'references' to <astatus>. //! 'references' mode means we add to the data set the descendants of an attribute, by calling the attribute method descendants().

	:param aStatus:
	:type aStatus: bool
	:rtype: None
") References;
		void References(const Standard_Boolean aStatus);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "Returns true if the mode 'references' is set.

	:rtype: bool
") References;
		Standard_Boolean References();

		/****************** TDF_ClosureMode ******************/
		%feature("compactdefaultargs") TDF_ClosureMode;
		%feature("autodoc", "Creates an objet with all modes set to <amode>.

	:param aMode: default value is Standard_True
	:type aMode: bool
	:rtype: None
") TDF_ClosureMode;
		 TDF_ClosureMode(const Standard_Boolean aMode = Standard_True);

};


%extend TDF_ClosureMode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TDF_ClosureTool *
************************/
class TDF_ClosureTool {
	public:
		/****************** Closure ******************/
		%feature("compactdefaultargs") Closure;
		%feature("autodoc", "Builds the transitive closure of label and attribute sets into <adataset>.

	:param aDataSet:
	:type aDataSet: TDF_DataSet
	:rtype: None
") Closure;
		static void Closure(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** Closure ******************/
		%feature("compactdefaultargs") Closure;
		%feature("autodoc", "Builds the transitive closure of label and attribute sets into <adataset>. uses <afilter> to determine if an attribute has to be taken in account or not. uses <amode> for various way of closing.

	:param aDataSet:
	:type aDataSet: TDF_DataSet
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:param aMode:
	:type aMode: TDF_ClosureMode
	:rtype: None
") Closure;
		static void Closure(const opencascade::handle<TDF_DataSet> & aDataSet, const TDF_IDFilter & aFilter, const TDF_ClosureMode & aMode);

		/****************** Closure ******************/
		%feature("compactdefaultargs") Closure;
		%feature("autodoc", "Builds the transitive closure of <alabel>.

	:param aLabel:
	:type aLabel: TDF_Label
	:param aLabMap:
	:type aLabMap: TDF_LabelMap
	:param anAttMap:
	:type anAttMap: TDF_AttributeMap
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:param aMode:
	:type aMode: TDF_ClosureMode
	:rtype: None
") Closure;
		static void Closure(const TDF_Label & aLabel, TDF_LabelMap & aLabMap, TDF_AttributeMap & anAttMap, const TDF_IDFilter & aFilter, const TDF_ClosureMode & aMode);

};


%extend TDF_ClosureTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TDF_ComparisonTool *
***************************/
class TDF_ComparisonTool {
	public:
		/****************** Compare ******************/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "Compares <asourcedataset> with <atargetdataset>, updating <arelocationtable> with labels and attributes found in both sets.

	:param aSourceDataSet:
	:type aSourceDataSet: TDF_DataSet
	:param aTargetDataSet:
	:type aTargetDataSet: TDF_DataSet
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:param aRelocationTable:
	:type aRelocationTable: TDF_RelocationTable
	:rtype: None
") Compare;
		static void Compare(const opencascade::handle<TDF_DataSet> & aSourceDataSet, const opencascade::handle<TDF_DataSet> & aTargetDataSet, const TDF_IDFilter & aFilter, const opencascade::handle<TDF_RelocationTable> & aRelocationTable);

		/****************** Cut ******************/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "Removes attributes from <adataset>.

	:param aDataSet:
	:type aDataSet: TDF_DataSet
	:rtype: None
") Cut;
		static void Cut(const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** IsSelfContained ******************/
		%feature("compactdefaultargs") IsSelfContained;
		%feature("autodoc", "Returns true if all the labels of <adataset> are descendant of <alabel>.

	:param aLabel:
	:type aLabel: TDF_Label
	:param aDataSet:
	:type aDataSet: TDF_DataSet
	:rtype: bool
") IsSelfContained;
		static Standard_Boolean IsSelfContained(const TDF_Label & aLabel, const opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** SourceUnbound ******************/
		%feature("compactdefaultargs") SourceUnbound;
		%feature("autodoc", "Finds from <arefdataset> all the keys not bound into <arelocationtable> and put them into <adiffdataset>. returns true if the difference contains at least one key. (a key is a source object). //! <anoption> may take the following values: 1 : labels treatment only; 2 : attributes treatment only (default value); 3 : both labels & attributes treatment.

	:param aRefDataSet:
	:type aRefDataSet: TDF_DataSet
	:param aRelocationTable:
	:type aRelocationTable: TDF_RelocationTable
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:param aDiffDataSet:
	:type aDiffDataSet: TDF_DataSet
	:param anOption: default value is 2
	:type anOption: int
	:rtype: bool
") SourceUnbound;
		static Standard_Boolean SourceUnbound(const opencascade::handle<TDF_DataSet> & aRefDataSet, const opencascade::handle<TDF_RelocationTable> & aRelocationTable, const TDF_IDFilter & aFilter, const opencascade::handle<TDF_DataSet> & aDiffDataSet, const Standard_Integer anOption = 2);

		/****************** TargetUnbound ******************/
		%feature("compactdefaultargs") TargetUnbound;
		%feature("autodoc", "Substracts from <arefdataset> all the items bound into <arelocationtable>. the result is put into <adiffdataset>. returns true if the difference contains at least one item. (an item is a target object). //! <anoption> may take the following values: 1 : labels treatment only; 2 : attributes treatment only(default value); 3 : both labels & attributes treatment.

	:param aRefDataSet:
	:type aRefDataSet: TDF_DataSet
	:param aRelocationTable:
	:type aRelocationTable: TDF_RelocationTable
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:param aDiffDataSet:
	:type aDiffDataSet: TDF_DataSet
	:param anOption: default value is 2
	:type anOption: int
	:rtype: bool
") TargetUnbound;
		static Standard_Boolean TargetUnbound(const opencascade::handle<TDF_DataSet> & aRefDataSet, const opencascade::handle<TDF_RelocationTable> & aRelocationTable, const TDF_IDFilter & aFilter, const opencascade::handle<TDF_DataSet> & aDiffDataSet, const Standard_Integer anOption = 2);

};


%extend TDF_ComparisonTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDF_CopyLabel *
**********************/
class TDF_CopyLabel {
	public:
		/****************** ExternalReferences ******************/
		%feature("compactdefaultargs") ExternalReferences;
		%feature("autodoc", "Check external references and if exist fills the aexternals map.

	:param Lab:
	:type Lab: TDF_Label
	:param aExternals:
	:type aExternals: TDF_AttributeMap
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:rtype: bool
") ExternalReferences;
		static Standard_Boolean ExternalReferences(const TDF_Label & Lab, TDF_AttributeMap & aExternals, const TDF_IDFilter & aFilter);

		/****************** ExternalReferences ******************/
		%feature("compactdefaultargs") ExternalReferences;
		%feature("autodoc", "Check external references and if exist fills the aexternals map.

	:param aRefLab:
	:type aRefLab: TDF_Label
	:param Lab:
	:type Lab: TDF_Label
	:param aExternals:
	:type aExternals: TDF_AttributeMap
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:param aDataSet:
	:type aDataSet: TDF_DataSet
	:rtype: None
") ExternalReferences;
		static void ExternalReferences(const TDF_Label & aRefLab, const TDF_Label & Lab, TDF_AttributeMap & aExternals, const TDF_IDFilter & aFilter, opencascade::handle<TDF_DataSet> & aDataSet);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone();

		/****************** Load ******************/
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "Loads src and tgt labels.

	:param aSource:
	:type aSource: TDF_Label
	:param aTarget:
	:type aTarget: TDF_Label
	:rtype: None
") Load;
		void Load(const TDF_Label & aSource, const TDF_Label & aTarget);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Performs algorithm of selfcontained copy.

	:rtype: None
") Perform;
		void Perform();

		/****************** RelocationTable ******************/
		%feature("compactdefaultargs") RelocationTable;
		%feature("autodoc", "Returns relocation table.

	:rtype: opencascade::handle<TDF_RelocationTable>
") RelocationTable;
		const opencascade::handle<TDF_RelocationTable> & RelocationTable();

		/****************** TDF_CopyLabel ******************/
		%feature("compactdefaultargs") TDF_CopyLabel;
		%feature("autodoc", "Empty constructor.

	:rtype: None
") TDF_CopyLabel;
		 TDF_CopyLabel();

		/****************** TDF_CopyLabel ******************/
		%feature("compactdefaultargs") TDF_CopyLabel;
		%feature("autodoc", "Copytool.

	:param aSource:
	:type aSource: TDF_Label
	:param aTarget:
	:type aTarget: TDF_Label
	:rtype: None
") TDF_CopyLabel;
		 TDF_CopyLabel(const TDF_Label & aSource, const TDF_Label & aTarget);

		/****************** UseFilter ******************/
		%feature("compactdefaultargs") UseFilter;
		%feature("autodoc", "Sets filter.

	:param aFilter:
	:type aFilter: TDF_IDFilter
	:rtype: None
") UseFilter;
		void UseFilter(const TDF_IDFilter & aFilter);

};


%extend TDF_CopyLabel {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TDF_CopyTool *
*********************/
class TDF_CopyTool {
	public:
		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Copy <asourcedataset> with using and updating <arelocationtable>. this method ignores target attributes privilege over source ones.

	:param aSourceDataSet:
	:type aSourceDataSet: TDF_DataSet
	:param aRelocationTable:
	:type aRelocationTable: TDF_RelocationTable
	:rtype: None
") Copy;
		static void Copy(const opencascade::handle<TDF_DataSet> & aSourceDataSet, const opencascade::handle<TDF_RelocationTable> & aRelocationTable);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Copy <asourcedataset> using and updating <arelocationtable>. use <aprivilegefilter> to give a list of ids for which the target attribute prevails over the source one.

	:param aSourceDataSet:
	:type aSourceDataSet: TDF_DataSet
	:param aRelocationTable:
	:type aRelocationTable: TDF_RelocationTable
	:param aPrivilegeFilter:
	:type aPrivilegeFilter: TDF_IDFilter
	:rtype: None
") Copy;
		static void Copy(const opencascade::handle<TDF_DataSet> & aSourceDataSet, const opencascade::handle<TDF_RelocationTable> & aRelocationTable, const TDF_IDFilter & aPrivilegeFilter);

		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Copy <asourcedataset> using and updating <arelocationtable>. use <aprivilegefilter> to give a list of ids for which the target attribute prevails over the source one. if <setselfcontained> is set to true, every tdf_reference will be replaced by the referenced structure according to <areffilter>. //! nb: <areffilter> is used only if <setselfcontained> is true. internal root label copy recursive method.

	:param aSourceDataSet:
	:type aSourceDataSet: TDF_DataSet
	:param aRelocationTable:
	:type aRelocationTable: TDF_RelocationTable
	:param aPrivilegeFilter:
	:type aPrivilegeFilter: TDF_IDFilter
	:param aRefFilter:
	:type aRefFilter: TDF_IDFilter
	:param setSelfContained:
	:type setSelfContained: bool
	:rtype: None
") Copy;
		static void Copy(const opencascade::handle<TDF_DataSet> & aSourceDataSet, const opencascade::handle<TDF_RelocationTable> & aRelocationTable, const TDF_IDFilter & aPrivilegeFilter, const TDF_IDFilter & aRefFilter, const Standard_Boolean setSelfContained);

};


%extend TDF_CopyTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class TDF_Data *
*****************/
class TDF_Data : public Standard_Transient {
	public:
		/****************** AllowModification ******************/
		%feature("compactdefaultargs") AllowModification;
		%feature("autodoc", "Sets modification mode.

	:param isAllowed:
	:type isAllowed: bool
	:rtype: None
") AllowModification;
		void AllowModification(const Standard_Boolean isAllowed);

		/****************** Destroy ******************/
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsApplicable ******************/
		%feature("compactdefaultargs") IsApplicable;
		%feature("autodoc", "Returns true if <adelta> is applicable here and now.

	:param aDelta:
	:type aDelta: TDF_Delta
	:rtype: bool
") IsApplicable;
		Standard_Boolean IsApplicable(const opencascade::handle<TDF_Delta> & aDelta);

		/****************** IsModificationAllowed ******************/
		%feature("compactdefaultargs") IsModificationAllowed;
		%feature("autodoc", "Returns modification mode.

	:rtype: bool
") IsModificationAllowed;
		Standard_Boolean IsModificationAllowed();

		/****************** LabelNodeAllocator ******************/
		%feature("compactdefaultargs") LabelNodeAllocator;
		%feature("autodoc", "Returns tdf_hallocator, which is an incremental allocator used by tdf_labelnode. this allocator is used to manage tdf_labelnode objects, but it can also be used for allocating memory to application-specific data (be careful because this allocator does not release the memory). the benefits of this allocation scheme are noticeable when dealing with large ocaf documents, due to: 1. very quick allocation of objects (memory heap is not used, the algorithm that replaces it is very simple). 2. very quick destruction of objects (memory is released not by destructors of tdf_labelnode, but rather by the destructor of tdf_data). 3. tdf_labelnode objects do not fragmentize the memory; they are kept compactly in a number of arrays of 16k each. 4. swapping is reduced on large data, because each document now occupies a smaller number of memory pages.

	:rtype: TDF_HAllocator
") LabelNodeAllocator;
		const TDF_HAllocator & LabelNodeAllocator();

		/****************** NotUndoMode ******************/
		%feature("compactdefaultargs") NotUndoMode;
		%feature("autodoc", "Returns the undo mode status.

	:rtype: bool
") NotUndoMode;
		Standard_Boolean NotUndoMode();

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns the root label of the data structure.

	:rtype: TDF_Label
") Root;
		const TDF_Label Root();

		/****************** TDF_Data ******************/
		%feature("compactdefaultargs") TDF_Data;
		%feature("autodoc", "A new and empty data structure.

	:rtype: None
") TDF_Data;
		 TDF_Data();

		/****************** Time ******************/
		%feature("compactdefaultargs") Time;
		%feature("autodoc", "Returns the current tick. it is incremented each commit.

	:rtype: int
") Time;
		Standard_Integer Time();

		/****************** Transaction ******************/
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "Returns the current transaction number.

	:rtype: int
") Transaction;
		Standard_Integer Transaction();

		/****************** Undo ******************/
		%feature("compactdefaultargs") Undo;
		%feature("autodoc", "Apply <adelta> to undo a set of attribute modifications. //! optionnal <withdelta> set to true indiquates a delta set must be generated. (see above).

	:param aDelta:
	:type aDelta: TDF_Delta
	:param withDelta: default value is Standard_False
	:type withDelta: bool
	:rtype: opencascade::handle<TDF_Delta>
") Undo;
		opencascade::handle<TDF_Delta> Undo(const opencascade::handle<TDF_Delta> & aDelta, const Standard_Boolean withDelta = Standard_False);

};


%make_alias(TDF_Data)

%extend TDF_Data {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************
* class TDF_DataSet *
********************/
class TDF_DataSet : public Standard_Transient {
	public:
		/****************** AddAttribute ******************/
		%feature("compactdefaultargs") AddAttribute;
		%feature("autodoc", "Adds <anattribute> into the current data set.

	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: None
") AddAttribute;
		void AddAttribute(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** AddLabel ******************/
		%feature("compactdefaultargs") AddLabel;
		%feature("autodoc", "Adds <alabel> in the current data set.

	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: None
") AddLabel;
		void AddLabel(const TDF_Label & aLabel);

		/****************** AddRoot ******************/
		%feature("compactdefaultargs") AddRoot;
		%feature("autodoc", "Adds a root label to <myrootlabels>.

	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: None
") AddRoot;
		void AddRoot(const TDF_Label & aLabel);

		/****************** Attributes ******************/
		%feature("compactdefaultargs") Attributes;
		%feature("autodoc", "Returns the map of attributes in the current data set. this map can be used directly, or updated.

	:rtype: TDF_AttributeMap
") Attributes;
		TDF_AttributeMap & Attributes();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears all information.

	:rtype: None
") Clear;
		void Clear();

		/****************** ContainsAttribute ******************/
		%feature("compactdefaultargs") ContainsAttribute;
		%feature("autodoc", "Returns true if <anattribute> is in the data set.

	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: bool
") ContainsAttribute;
		Standard_Boolean ContainsAttribute(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** ContainsLabel ******************/
		%feature("compactdefaultargs") ContainsLabel;
		%feature("autodoc", "Returns true if the label <alabel> is in the data set.

	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: bool
") ContainsLabel;
		Standard_Boolean ContainsLabel(const TDF_Label & aLabel);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if there is at least one label or one attribute.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Labels ******************/
		%feature("compactdefaultargs") Labels;
		%feature("autodoc", "Returns the map of labels in this data set. this map can be used directly, or updated.

	:rtype: TDF_LabelMap
") Labels;
		TDF_LabelMap & Labels();

		/****************** Roots ******************/
		%feature("compactdefaultargs") Roots;
		%feature("autodoc", "Returns <myrootlabels> to be used or updated.

	:rtype: TDF_LabelList
") Roots;
		TDF_LabelList & Roots();

		/****************** TDF_DataSet ******************/
		%feature("compactdefaultargs") TDF_DataSet;
		%feature("autodoc", "Creates an empty dataset object.

	:rtype: None
") TDF_DataSet;
		 TDF_DataSet();

};


%make_alias(TDF_DataSet)

%extend TDF_DataSet {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class TDF_Delta *
******************/
class TDF_Delta : public Standard_Transient {
	public:
		/****************** AttributeDeltas ******************/
		%feature("compactdefaultargs") AttributeDeltas;
		%feature("autodoc", "Returns the field <myattdeltalist>.

	:rtype: TDF_AttributeDeltaList
") AttributeDeltas;
		const TDF_AttributeDeltaList & AttributeDeltas();

		/****************** BeginTime ******************/
		%feature("compactdefaultargs") BeginTime;
		%feature("autodoc", "Returns the field <mybegintime>.

	:rtype: int
") BeginTime;
		Standard_Integer BeginTime();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** EndTime ******************/
		%feature("compactdefaultargs") EndTime;
		%feature("autodoc", "Returns the field <myendtime>.

	:rtype: int
") EndTime;
		Standard_Integer EndTime();

		/****************** IsApplicable ******************/
		%feature("compactdefaultargs") IsApplicable;
		%feature("autodoc", "Returns true if the undo action of <self> is applicable at <acurrenttime>.

	:param aCurrentTime:
	:type aCurrentTime: int
	:rtype: bool
") IsApplicable;
		Standard_Boolean IsApplicable(const Standard_Integer aCurrentTime);

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Returns true if there is nothing to undo.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** Labels ******************/
		%feature("compactdefaultargs") Labels;
		%feature("autodoc", "Adds in <alabellist> the labels of the attribute deltas. caution: <alabellist> is not cleared before use.

	:param aLabelList:
	:type aLabelList: TDF_LabelList
	:rtype: None
") Labels;
		void Labels(TDF_LabelList & aLabelList);

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns a name associated with this delta.

	:rtype: TCollection_ExtendedString
") Name;
		TCollection_ExtendedString Name();

		/****************** SetName ******************/
		%feature("compactdefaultargs") SetName;
		%feature("autodoc", "Associates a name <thename> with this delta.

	:param theName:
	:type theName: TCollection_ExtendedString
	:rtype: None
") SetName;
		void SetName(const TCollection_ExtendedString & theName);

		/****************** TDF_Delta ******************/
		%feature("compactdefaultargs") TDF_Delta;
		%feature("autodoc", "Creates a delta.

	:rtype: None
") TDF_Delta;
		 TDF_Delta();

};


%make_alias(TDF_Delta)

%extend TDF_Delta {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************
* class TDF_IDFilter *
*********************/
class TDF_IDFilter {
	public:
		/****************** Copy ******************/
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "Copies into <self> the contents of <fromfilter>. <self> is cleared before copy.

	:param fromFilter:
	:type fromFilter: TDF_IDFilter
	:rtype: None
") Copy;
		void Copy(const TDF_IDFilter & fromFilter);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** IDList ******************/
		%feature("compactdefaultargs") IDList;
		%feature("autodoc", "Copies the list of id to be kept or ignored in <anidlist>. <anidlist> is cleared before use.

	:param anIDList:
	:type anIDList: TDF_IDList
	:rtype: None
") IDList;
		void IDList(TDF_IDList & anIDList);

		/****************** Ignore ******************/
		%feature("compactdefaultargs") Ignore;
		%feature("autodoc", "An attribute with <anid> as id is to be ignored and the filter will answer false to the question iskept(<anid>).

	:param anID:
	:type anID: Standard_GUID
	:rtype: None
") Ignore;
		void Ignore(const Standard_GUID & anID);

		/****************** Ignore ******************/
		%feature("compactdefaultargs") Ignore;
		%feature("autodoc", "Attributes with id owned by <anidlist> are to be ignored and the filter will answer false to the question iskept(<anid>) with id from <anidlist>.

	:param anIDList:
	:type anIDList: TDF_IDList
	:rtype: None
") Ignore;
		void Ignore(const TDF_IDList & anIDList);

		/****************** IgnoreAll ******************/
		%feature("compactdefaultargs") IgnoreAll;
		%feature("autodoc", "The list of id is cleared and the filter mode is set to ignore mode if <keep> is true; false otherwise.

	:param ignore:
	:type ignore: bool
	:rtype: None
") IgnoreAll;
		void IgnoreAll(const Standard_Boolean ignore);

		/****************** IgnoreAll ******************/
		%feature("compactdefaultargs") IgnoreAll;
		%feature("autodoc", "Returns true is the mode is set to 'ignore all but...'.

	:rtype: bool
") IgnoreAll;
		Standard_Boolean IgnoreAll();

		/****************** IsIgnored ******************/
		%feature("compactdefaultargs") IsIgnored;
		%feature("autodoc", "Returns true if the id is to be ignored.

	:param anID:
	:type anID: Standard_GUID
	:rtype: bool
") IsIgnored;
		Standard_Boolean IsIgnored(const Standard_GUID & anID);

		/****************** IsIgnored ******************/
		%feature("compactdefaultargs") IsIgnored;
		%feature("autodoc", "Returns true if the attribute is to be ignored.

	:param anAtt:
	:type anAtt: TDF_Attribute
	:rtype: bool
") IsIgnored;
		Standard_Boolean IsIgnored(const opencascade::handle<TDF_Attribute> & anAtt);

		/****************** IsKept ******************/
		%feature("compactdefaultargs") IsKept;
		%feature("autodoc", "Returns true if the id is to be kept.

	:param anID:
	:type anID: Standard_GUID
	:rtype: bool
") IsKept;
		Standard_Boolean IsKept(const Standard_GUID & anID);

		/****************** IsKept ******************/
		%feature("compactdefaultargs") IsKept;
		%feature("autodoc", "Returns true if the attribute is to be kept.

	:param anAtt:
	:type anAtt: TDF_Attribute
	:rtype: bool
") IsKept;
		Standard_Boolean IsKept(const opencascade::handle<TDF_Attribute> & anAtt);

		/****************** Keep ******************/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "An attribute with <anid> as id is to be kept and the filter will answer true to the question iskept(<anid>).

	:param anID:
	:type anID: Standard_GUID
	:rtype: None
") Keep;
		void Keep(const Standard_GUID & anID);

		/****************** Keep ******************/
		%feature("compactdefaultargs") Keep;
		%feature("autodoc", "Attributes with id owned by <anidlist> are to be kept and the filter will answer true to the question iskept(<anid>) with id from <anidlist>.

	:param anIDList:
	:type anIDList: TDF_IDList
	:rtype: None
") Keep;
		void Keep(const TDF_IDList & anIDList);

		/****************** TDF_IDFilter ******************/
		%feature("compactdefaultargs") TDF_IDFilter;
		%feature("autodoc", "Creates an id/attribute filter based on an id list. the default mode is 'ignore all but...'. //! this filter has 2 working mode: keep and ignore. //! ignore/exclusive mode: all ids are ignored except these set to be kept, using keep(). of course, it is possible set an kept id to be ignored using ignore(). //! keep/inclusive mode: all ids are kept except these set to be ignored, using ignore(). of course, it is possible set an ignored id to be kept using keep().

	:param ignoreMode: default value is Standard_True
	:type ignoreMode: bool
	:rtype: None
") TDF_IDFilter;
		 TDF_IDFilter(const Standard_Boolean ignoreMode = Standard_True);

};


%extend TDF_IDFilter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class TDF_Label *
******************/
class TDF_Label {
	public:
		/****************** AddAttribute ******************/
		%feature("compactdefaultargs") AddAttribute;
		%feature("autodoc", "Adds an attribute to the current label. raises if there is already one.

	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:param append: default value is Standard_True
	:type append: bool
	:rtype: None
") AddAttribute;
		void AddAttribute(const opencascade::handle<TDF_Attribute> & anAttribute, const Standard_Boolean append = Standard_True);

		/****************** AttributesModified ******************/
		%feature("compactdefaultargs") AttributesModified;
		%feature("autodoc", "Returns true if <self> owns attributes not yet available in transaction 0. it means at least one attribute is new, modified or deleted.

	:rtype: bool
") AttributesModified;
		Standard_Boolean AttributesModified();

		/****************** Data ******************/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Returns the data owning <self>.

	:rtype: opencascade::handle<TDF_Data>
") Data;
		opencascade::handle<TDF_Data> Data();

		/****************** Depth ******************/
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "Returns the depth of the label in the data framework. this corresponds to the number of fathers which this label has, and is used in determining whether a label is root, null or equivalent to another label. exceptions: standard_nullobject if this label is null. this is because a null object can have no depth.

	:rtype: int
") Depth;
		Standard_Integer Depth();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };

        %feature("autodoc", "1");
        %extend{
            std::string EntryDumpToString() {
            std::stringstream s;
            self->EntryDump(s);
            return s.str();}
        };
		/****************** ExtendedDump ******************/
		%feature("compactdefaultargs") ExtendedDump;
		%feature("autodoc", "Dumps the label on <astream> and its attributes rank in <amap> if their ids are kept by <idfilter>.

	:param anOS:
	:type anOS: Standard_OStream
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:param aMap:
	:type aMap: TDF_AttributeIndexedMap
	:rtype: None
") ExtendedDump;
		void ExtendedDump(Standard_OStream & anOS, const TDF_IDFilter & aFilter, TDF_AttributeIndexedMap & aMap);

		/****************** Father ******************/
		%feature("compactdefaultargs") Father;
		%feature("autodoc", "Returns the label father. this label may be null if the label is root.

	:rtype: TDF_Label
") Father;
		const TDF_Label Father();

		/****************** FindAttribute ******************/
		%feature("compactdefaultargs") FindAttribute;
		%feature("autodoc", "Finds an attribute of the current label, according to <anid>. if anattribute is not a valid one, false is returned. //! the method returns true if found, false otherwise. //! a removed attribute cannot be found.

	:param anID:
	:type anID: Standard_GUID
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: bool
") FindAttribute;
		Standard_Boolean FindAttribute(const Standard_GUID & anID, opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** FindAttribute ******************/
		%feature("compactdefaultargs") FindAttribute;
		%feature("autodoc", "Finds an attribute of the current label, according to <anid> and <atransaction>. this attribute has/had to be a valid one for the given transaction index . so, this attribute is not necessary a valid one. //! the method returns true if found, false otherwise. //! a removed attribute cannot be found nor a backuped attribute of a removed one.

	:param anID:
	:type anID: Standard_GUID
	:param aTransaction:
	:type aTransaction: int
	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: bool
") FindAttribute;
		Standard_Boolean FindAttribute(const Standard_GUID & anID, const Standard_Integer aTransaction, opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** FindChild ******************/
		%feature("compactdefaultargs") FindChild;
		%feature("autodoc", "Finds a child label having <atag> as tag. creates the tag atag identifies the label which will be the parent. if create is true and no child label is found, a new one is created. example: //creating a label with tag 10 at root tdf_label lab1 = adf->root().findchild(10); //creating labels 7 and 2 on label 10 tdf_label lab2 = lab1.findchild(7); tdf_label lab3 = lab1.findchild(2);.

	:param aTag:
	:type aTag: int
	:param create: default value is Standard_True
	:type create: bool
	:rtype: TDF_Label
") FindChild;
		TDF_Label FindChild(const Standard_Integer aTag, const Standard_Boolean create = Standard_True);

		/****************** ForgetAllAttributes ******************/
		%feature("compactdefaultargs") ForgetAllAttributes;
		%feature("autodoc", "Forgets all the attributes. does it on also on the sub-labels if <clearchildren> is set to true. of course, this method is compatible with transaction & delta mecanisms.

	:param clearChildren: default value is Standard_True
	:type clearChildren: bool
	:rtype: None
") ForgetAllAttributes;
		void ForgetAllAttributes(const Standard_Boolean clearChildren = Standard_True);

		/****************** ForgetAttribute ******************/
		%feature("compactdefaultargs") ForgetAttribute;
		%feature("autodoc", "Forgets an attribute from the current label, setting its forgotten status true and its valid status false. raises if the attribute is not in the structure.

	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: None
") ForgetAttribute;
		void ForgetAttribute(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** ForgetAttribute ******************/
		%feature("compactdefaultargs") ForgetAttribute;
		%feature("autodoc", "Forgets the attribute of guid <aguid> from the current label . if the attribute doesn't exist returns false. otherwise returns true.

	:param aguid:
	:type aguid: Standard_GUID
	:rtype: bool
") ForgetAttribute;
		Standard_Boolean ForgetAttribute(const Standard_GUID & aguid);

		/****************** HasAttribute ******************/
		%feature("compactdefaultargs") HasAttribute;
		%feature("autodoc", "Returns true if this label has at least one attribute.

	:rtype: bool
") HasAttribute;
		Standard_Boolean HasAttribute();

		/****************** HasChild ******************/
		%feature("compactdefaultargs") HasChild;
		%feature("autodoc", "Returns true if this label has at least one child.

	:rtype: bool
") HasChild;
		Standard_Boolean HasChild();

		/****************** HasGreaterNode ******************/
		%feature("compactdefaultargs") HasGreaterNode;
		%feature("autodoc", "Returns true if node address of <self> is greater than <otherlabel> one. used to quickly sort labels (not on entry criterion). //! -c++: inline.

	:param otherLabel:
	:type otherLabel: TDF_Label
	:rtype: bool
") HasGreaterNode;
		Standard_Boolean HasGreaterNode(const TDF_Label & otherLabel);

		/****************** HasLowerNode ******************/
		%feature("compactdefaultargs") HasLowerNode;
		%feature("autodoc", "Returns true if node address of <self> is lower than <otherlabel> one. used to quickly sort labels (not on entry criterion). //! -c++: inline.

	:param otherLabel:
	:type otherLabel: TDF_Label
	:rtype: bool
") HasLowerNode;
		Standard_Boolean HasLowerNode(const TDF_Label & otherLabel);

		/****************** Imported ******************/
		%feature("compactdefaultargs") Imported;
		%feature("autodoc", "Sets or unsets <self> and all its descendants as imported label, according to <astatus>.

	:param aStatus:
	:type aStatus: bool
	:rtype: None
") Imported;
		void Imported(const Standard_Boolean aStatus);

		/****************** IsAttribute ******************/
		%feature("compactdefaultargs") IsAttribute;
		%feature("autodoc", "Returns true if <self> owns an attribute with <anid> as id.

	:param anID:
	:type anID: Standard_GUID
	:rtype: bool
") IsAttribute;
		Standard_Boolean IsAttribute(const Standard_GUID & anID);

		/****************** IsDescendant ******************/
		%feature("compactdefaultargs") IsDescendant;
		%feature("autodoc", "Returns true if <self> is a descendant of <alabel>. attention: every label is its own descendant.

	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: bool
") IsDescendant;
		Standard_Boolean IsDescendant(const TDF_Label & aLabel);

		/****************** IsDifferent ******************/
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: bool
") IsDifferent;
		Standard_Boolean IsDifferent(const TDF_Label & aLabel);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true if the <alabel> is equal to me (same labelnode*).

	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual(const TDF_Label & aLabel);

		/****************** IsImported ******************/
		%feature("compactdefaultargs") IsImported;
		%feature("autodoc", "Returns true if the <alabel> is imported.

	:rtype: bool
") IsImported;
		Standard_Boolean IsImported();

		/****************** IsNull ******************/
		%feature("compactdefaultargs") IsNull;
		%feature("autodoc", "Returns true if the <alabel> is null, i.e. it has not been included in the data framework.

	:rtype: bool
") IsNull;
		Standard_Boolean IsNull();

		/****************** IsRoot ******************/
		%feature("compactdefaultargs") IsRoot;
		%feature("autodoc", "	:rtype: bool
") IsRoot;
		Standard_Boolean IsRoot();

		/****************** MayBeModified ******************/
		%feature("compactdefaultargs") MayBeModified;
		%feature("autodoc", "Returns true if <self> or a descendant of <self> owns attributes not yet available in transaction 0. it means at least one of their attributes is new, modified or deleted.

	:rtype: bool
") MayBeModified;
		Standard_Boolean MayBeModified();

		/****************** NbAttributes ******************/
		%feature("compactdefaultargs") NbAttributes;
		%feature("autodoc", "Returns the number of attributes.

	:rtype: int
") NbAttributes;
		Standard_Integer NbAttributes();

		/****************** NbChildren ******************/
		%feature("compactdefaultargs") NbChildren;
		%feature("autodoc", "Returns the number of children.

	:rtype: int
") NbChildren;
		Standard_Integer NbChildren();

		/****************** NewChild ******************/
		%feature("compactdefaultargs") NewChild;
		%feature("autodoc", "Create a new child label of me using autoamtic delivery tags provided by tagsource.

	:rtype: TDF_Label
") NewChild;
		TDF_Label NewChild();

		/****************** Nullify ******************/
		%feature("compactdefaultargs") Nullify;
		%feature("autodoc", "Nullifies the label.

	:rtype: None
") Nullify;
		void Nullify();

		/****************** ResumeAttribute ******************/
		%feature("compactdefaultargs") ResumeAttribute;
		%feature("autodoc", "Undo forget action, setting its forgotten status false and its valid status true. raises if the attribute is not in the structure.

	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: None
") ResumeAttribute;
		void ResumeAttribute(const opencascade::handle<TDF_Attribute> & anAttribute);

		/****************** Root ******************/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Returns the root label root of the data structure. this has a depth of 0. exceptions: standard_nullobject if this label is null. this is because a null object can have no depth.

	:rtype: TDF_Label
") Root;
		const TDF_Label Root();

		/****************** TDF_Label ******************/
		%feature("compactdefaultargs") TDF_Label;
		%feature("autodoc", "Constructs an empty label object.

	:rtype: None
") TDF_Label;
		 TDF_Label();

		/****************** Tag ******************/
		%feature("compactdefaultargs") Tag;
		%feature("autodoc", "Returns the tag of the label. this is the integer assigned randomly to a label in a data framework. this integer is used to identify this label in an entry.

	:rtype: int
") Tag;
		Standard_Integer Tag();

		/****************** Transaction ******************/
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "Returns the current transaction index.

	:rtype: int
") Transaction;
		Standard_Integer Transaction();


            %extend{
                bool __ne_wrapper__(const TDF_Label other) {
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

            %extend{
                bool __eq_wrapper__(const TDF_Label other) {
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
%feature("autodoc", "Returns the label name") GetLabelName;
		%extend{
			std::string GetLabelName() {
			std::string txt;
			Handle(TDataStd_Name) name;
			if (!self->IsNull() && self->FindAttribute(TDataStd_Name::GetID(),name)) {
			TCollection_ExtendedString extstr = name->Get();
			char* str = new char[extstr.LengthOfCString()+1];
			extstr.ToUTF8CString(str);
			txt = str;
			delete[] str;}
			return txt;}
		};
};


%extend TDF_Label {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TDF_LabelMapHasher *
***************************/
class TDF_LabelMapHasher {
	public:
		/****************** HashCode ******************/
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "Computes a hash code for the given label, in the range [1, theupperbound] @param thelabel the label which hash code is to be computed @param theupperbound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theupperbound].

	:param theLabel:
	:type theLabel: TDF_Label
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode(const TDF_Label & theLabel, const Standard_Integer theUpperBound);

		/****************** IsEqual ******************/
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "Returns true when the two keys are the same. two same keys must have the same hashcode, the contrary is not necessary.

	:param aLab1:
	:type aLab1: TDF_Label
	:param aLab2:
	:type aLab2: TDF_Label
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual(const TDF_Label & aLab1, const TDF_Label & aLab2);

};


%extend TDF_LabelMapHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDF_LabelNode *
**********************/
/****************************
* class TDF_RelocationTable *
****************************/
class TDF_RelocationTable : public Standard_Transient {
	public:
		/****************** AfterRelocate ******************/
		%feature("compactdefaultargs") AfterRelocate;
		%feature("autodoc", "	:param afterRelocate:
	:type afterRelocate: bool
	:rtype: None
") AfterRelocate;
		void AfterRelocate(const Standard_Boolean afterRelocate);

		/****************** AfterRelocate ******************/
		%feature("compactdefaultargs") AfterRelocate;
		%feature("autodoc", "Returns <myafterrelocate>.

	:rtype: bool
") AfterRelocate;
		Standard_Boolean AfterRelocate();

		/****************** AttributeTable ******************/
		%feature("compactdefaultargs") AttributeTable;
		%feature("autodoc", "Returns <myattributetable> to be used or updated.

	:rtype: TDF_AttributeDataMap
") AttributeTable;
		TDF_AttributeDataMap & AttributeTable();

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Clears the relocation dictionnary, but lets the self relocation flag to its current value.

	:rtype: None
") Clear;
		void Clear();

		/****************** Dump ******************/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Dumps the relocation table.

	:param dumpLabels:
	:type dumpLabels: bool
	:param dumpAttributes:
	:type dumpAttributes: bool
	:param dumpTransients:
	:type dumpTransients: bool
	:param anOS:
	:type anOS: Standard_OStream
	:rtype: Standard_OStream
") Dump;
		Standard_OStream & Dump(const Standard_Boolean dumpLabels, const Standard_Boolean dumpAttributes, const Standard_Boolean dumpTransients, Standard_OStream & anOS);

		/****************** HasRelocation ******************/
		%feature("compactdefaultargs") HasRelocation;
		%feature("autodoc", "Finds the relocation value of <asourcelabel> and returns it into <atargetlabel>. //! (see above selfrelocate method for more explanation about the method behavior).

	:param aSourceLabel:
	:type aSourceLabel: TDF_Label
	:param aTargetLabel:
	:type aTargetLabel: TDF_Label
	:rtype: bool
") HasRelocation;
		Standard_Boolean HasRelocation(const TDF_Label & aSourceLabel, TDF_Label & aTargetLabel);

		/****************** HasRelocation ******************/
		%feature("compactdefaultargs") HasRelocation;
		%feature("autodoc", "Finds the relocation value of <asourceattribute> and returns it into <atargetattribute>. //! (see above selfrelocate method for more explanation about the method behavior).

	:param aSourceAttribute:
	:type aSourceAttribute: TDF_Attribute
	:param aTargetAttribute:
	:type aTargetAttribute: TDF_Attribute
	:rtype: bool
") HasRelocation;
		Standard_Boolean HasRelocation(const opencascade::handle<TDF_Attribute> & aSourceAttribute, opencascade::handle<TDF_Attribute> & aTargetAttribute);

		/****************** HasTransientRelocation ******************/
		%feature("compactdefaultargs") HasTransientRelocation;
		%feature("autodoc", "Finds the relocation value of <asourcetransient> and returns it into <atargettransient>. //! (see above selfrelocate method for more explanation about the method behavior).

	:param aSourceTransient:
	:type aSourceTransient: Standard_Transient
	:param aTargetTransient:
	:type aTargetTransient: Standard_Transient
	:rtype: bool
") HasTransientRelocation;
		Standard_Boolean HasTransientRelocation(const opencascade::handle<Standard_Transient> & aSourceTransient, opencascade::handle<Standard_Transient> & aTargetTransient);

		/****************** LabelTable ******************/
		%feature("compactdefaultargs") LabelTable;
		%feature("autodoc", "Returns <mylabeltable> to be used or updated.

	:rtype: TDF_LabelDataMap
") LabelTable;
		TDF_LabelDataMap & LabelTable();

		/****************** SelfRelocate ******************/
		%feature("compactdefaultargs") SelfRelocate;
		%feature("autodoc", "Sets <myselfrelocate> to <selfrelocate>. //! this flag affects the hasrelocation method behavior like this: //! <myselfrelocate> == false: //! if no relocation object is found in the map, a null object is returned //! <myselfrelocate> == true: //! if no relocation object is found in the map, the method assumes the source object is relocation value; so the source object is returned as target object.

	:param selfRelocate:
	:type selfRelocate: bool
	:rtype: None
") SelfRelocate;
		void SelfRelocate(const Standard_Boolean selfRelocate);

		/****************** SelfRelocate ******************/
		%feature("compactdefaultargs") SelfRelocate;
		%feature("autodoc", "Returns <myselfrelocate>.

	:rtype: bool
") SelfRelocate;
		Standard_Boolean SelfRelocate();

		/****************** SetRelocation ******************/
		%feature("compactdefaultargs") SetRelocation;
		%feature("autodoc", "Sets the relocation value of <asourcelabel> to <atargetlabel>.

	:param aSourceLabel:
	:type aSourceLabel: TDF_Label
	:param aTargetLabel:
	:type aTargetLabel: TDF_Label
	:rtype: None
") SetRelocation;
		void SetRelocation(const TDF_Label & aSourceLabel, const TDF_Label & aTargetLabel);

		/****************** SetRelocation ******************/
		%feature("compactdefaultargs") SetRelocation;
		%feature("autodoc", "Sets the relocation value of <asourceattribute> to <atargetattribute>.

	:param aSourceAttribute:
	:type aSourceAttribute: TDF_Attribute
	:param aTargetAttribute:
	:type aTargetAttribute: TDF_Attribute
	:rtype: None
") SetRelocation;
		void SetRelocation(const opencascade::handle<TDF_Attribute> & aSourceAttribute, const opencascade::handle<TDF_Attribute> & aTargetAttribute);

		/****************** SetTransientRelocation ******************/
		%feature("compactdefaultargs") SetTransientRelocation;
		%feature("autodoc", "Sets the relocation value of <asourcetransient> to <atargettransient>.

	:param aSourceTransient:
	:type aSourceTransient: Standard_Transient
	:param aTargetTransient:
	:type aTargetTransient: Standard_Transient
	:rtype: None
") SetTransientRelocation;
		void SetTransientRelocation(const opencascade::handle<Standard_Transient> & aSourceTransient, const opencascade::handle<Standard_Transient> & aTargetTransient);

		/****************** TDF_RelocationTable ******************/
		%feature("compactdefaultargs") TDF_RelocationTable;
		%feature("autodoc", "Creates an relocation table. <selfrelocate> says if a value without explicit relocation is its own relocation.

	:param selfRelocate: default value is Standard_False
	:type selfRelocate: bool
	:rtype: None
") TDF_RelocationTable;
		 TDF_RelocationTable(const Standard_Boolean selfRelocate = Standard_False);

		/****************** TargetAttributeMap ******************/
		%feature("compactdefaultargs") TargetAttributeMap;
		%feature("autodoc", "Fills <anattributemap> with target relocation attributes. <anattributemap> is not cleared before use.

	:param anAttributeMap:
	:type anAttributeMap: TDF_AttributeMap
	:rtype: None
") TargetAttributeMap;
		void TargetAttributeMap(TDF_AttributeMap & anAttributeMap);

		/****************** TargetLabelMap ******************/
		%feature("compactdefaultargs") TargetLabelMap;
		%feature("autodoc", "Fills <alabelmap> with target relocation labels. <alabelmap> is not cleared before use.

	:param aLabelMap:
	:type aLabelMap: TDF_LabelMap
	:rtype: None
") TargetLabelMap;
		void TargetLabelMap(TDF_LabelMap & aLabelMap);

		/****************** TransientTable ******************/
		%feature("compactdefaultargs") TransientTable;
		%feature("autodoc", "Returns <mytransienttable> to be used or updated.

	:rtype: TColStd_IndexedDataMapOfTransientTransient
") TransientTable;
		TColStd_IndexedDataMapOfTransientTransient & TransientTable();

};


%make_alias(TDF_RelocationTable)

%extend TDF_RelocationTable {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************
* class TDF_Tool *
*****************/
class TDF_Tool {
	public:
		/****************** CountLabels ******************/
		%feature("compactdefaultargs") CountLabels;
		%feature("autodoc", "Adds the labels of <alabellist> to <alabelmap> if they are unbound, or increases their reference counters. at the end of the process, <alabellist> contains only the added labels.

	:param aLabelList:
	:type aLabelList: TDF_LabelList
	:param aLabelMap:
	:type aLabelMap: TDF_LabelIntegerMap
	:rtype: None
") CountLabels;
		static void CountLabels(TDF_LabelList & aLabelList, TDF_LabelIntegerMap & aLabelMap);

		/****************** DeductLabels ******************/
		%feature("compactdefaultargs") DeductLabels;
		%feature("autodoc", "Decreases the reference counters of the labels of <alabellist> to <alabelmap>, and removes labels with null counter. at the end of the process, <alabellist> contains only the suppressed labels.

	:param aLabelList:
	:type aLabelList: TDF_LabelList
	:param aLabelMap:
	:type aLabelMap: TDF_LabelIntegerMap
	:rtype: None
") DeductLabels;
		static void DeductLabels(TDF_LabelList & aLabelList, TDF_LabelIntegerMap & aLabelMap);

		/****************** DeepDump ******************/
		%feature("compactdefaultargs") DeepDump;
		%feature("autodoc", "Dumps <adf> and its labels and their attributes.

	:param anOS:
	:type anOS: Standard_OStream
	:param aDF:
	:type aDF: TDF_Data
	:rtype: None
") DeepDump;
		static void DeepDump(Standard_OStream & anOS, const opencascade::handle<TDF_Data> & aDF);

		/****************** DeepDump ******************/
		%feature("compactdefaultargs") DeepDump;
		%feature("autodoc", "Dumps <alabel>, its chilren and their attributes.

	:param anOS:
	:type anOS: Standard_OStream
	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: None
") DeepDump;
		static void DeepDump(Standard_OStream & anOS, const TDF_Label & aLabel);

		/****************** Entry ******************/
		%feature("compactdefaultargs") Entry;
		%feature("autodoc", "Returns the entry for the label alabel in the form of the ascii character string anentry containing the tag list for alabel.

	:param aLabel:
	:type aLabel: TDF_Label
	:param anEntry:
	:type anEntry: TCollection_AsciiString
	:rtype: None
") Entry;
		static void Entry(const TDF_Label & aLabel, TCollection_AsciiString & anEntry);

		/****************** ExtendedDeepDump ******************/
		%feature("compactdefaultargs") ExtendedDeepDump;
		%feature("autodoc", "Dumps <adf> and its labels and their attributes, if their ids are kept by <afilter>. dumps also the attributes content.

	:param anOS:
	:type anOS: Standard_OStream
	:param aDF:
	:type aDF: TDF_Data
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:rtype: None
") ExtendedDeepDump;
		static void ExtendedDeepDump(Standard_OStream & anOS, const opencascade::handle<TDF_Data> & aDF, const TDF_IDFilter & aFilter);

		/****************** ExtendedDeepDump ******************/
		%feature("compactdefaultargs") ExtendedDeepDump;
		%feature("autodoc", "Dumps <alabel>, its chilren and their attributes, if their ids are kept by <afilter>. dumps also the attributes content.

	:param anOS:
	:type anOS: Standard_OStream
	:param aLabel:
	:type aLabel: TDF_Label
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:rtype: None
") ExtendedDeepDump;
		static void ExtendedDeepDump(Standard_OStream & anOS, const TDF_Label & aLabel, const TDF_IDFilter & aFilter);

		/****************** IsSelfContained ******************/
		%feature("compactdefaultargs") IsSelfContained;
		%feature("autodoc", "Returns true if <alabel> and its descendants reference only attributes or labels attached to themselves.

	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: bool
") IsSelfContained;
		static Standard_Boolean IsSelfContained(const TDF_Label & aLabel);

		/****************** IsSelfContained ******************/
		%feature("compactdefaultargs") IsSelfContained;
		%feature("autodoc", "Returns true if <alabel> and its descendants reference only attributes or labels attached to themselves and kept by <afilter>.

	:param aLabel:
	:type aLabel: TDF_Label
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:rtype: bool
") IsSelfContained;
		static Standard_Boolean IsSelfContained(const TDF_Label & aLabel, const TDF_IDFilter & aFilter);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label expressed by <anentry>; creates the label if it does not exist and if <create> is true.

	:param aDF:
	:type aDF: TDF_Data
	:param anEntry:
	:type anEntry: TCollection_AsciiString
	:param aLabel:
	:type aLabel: TDF_Label
	:param create: default value is Standard_False
	:type create: bool
	:rtype: None
") Label;
		static void Label(const opencascade::handle<TDF_Data> & aDF, const TCollection_AsciiString & anEntry, TDF_Label & aLabel, const Standard_Boolean create = Standard_False);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label expressed by <anentry>; creates the label if it does not exist and if <create> is true.

	:param aDF:
	:type aDF: TDF_Data
	:param anEntry:
	:type anEntry: char *
	:param aLabel:
	:type aLabel: TDF_Label
	:param create: default value is Standard_False
	:type create: bool
	:rtype: None
") Label;
		static void Label(const opencascade::handle<TDF_Data> & aDF, const char * anEntry, TDF_Label & aLabel, const Standard_Boolean create = Standard_False);

		/****************** Label ******************/
		%feature("compactdefaultargs") Label;
		%feature("autodoc", "Returns the label expressed by <anentry>; creates the label if it does not exist and if <create> is true.

	:param aDF:
	:type aDF: TDF_Data
	:param aTagList:
	:type aTagList: TColStd_ListOfInteger
	:param aLabel:
	:type aLabel: TDF_Label
	:param create: default value is Standard_False
	:type create: bool
	:rtype: None
") Label;
		static void Label(const opencascade::handle<TDF_Data> & aDF, const TColStd_ListOfInteger & aTagList, TDF_Label & aLabel, const Standard_Boolean create = Standard_False);

		/****************** NbAttributes ******************/
		%feature("compactdefaultargs") NbAttributes;
		%feature("autodoc", "Returns the total number of attributes attached to the labels dependent on the label alabel. the attributes of alabel are also included in this figure. this information is useful in setting the size of an array.

	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: int
") NbAttributes;
		static Standard_Integer NbAttributes(const TDF_Label & aLabel);

		/****************** NbAttributes ******************/
		%feature("compactdefaultargs") NbAttributes;
		%feature("autodoc", "Returns the number of attributes of the tree, selected by a<filter>, including those of <alabel>.

	:param aLabel:
	:type aLabel: TDF_Label
	:param aFilter:
	:type aFilter: TDF_IDFilter
	:rtype: int
") NbAttributes;
		static Standard_Integer NbAttributes(const TDF_Label & aLabel, const TDF_IDFilter & aFilter);

		/****************** NbLabels ******************/
		%feature("compactdefaultargs") NbLabels;
		%feature("autodoc", "Returns the number of labels of the tree, including <alabel>. alabel is also included in this figure. this information is useful in setting the size of an array.

	:param aLabel:
	:type aLabel: TDF_Label
	:rtype: int
") NbLabels;
		static Standard_Integer NbLabels(const TDF_Label & aLabel);

		/****************** OutReferences ******************/
		%feature("compactdefaultargs") OutReferences;
		%feature("autodoc", "Returns in <atts> the referenced attributes. caution: <atts> is not cleared before use!.

	:param aLabel:
	:type aLabel: TDF_Label
	:param atts:
	:type atts: TDF_AttributeMap
	:rtype: None
") OutReferences;
		static void OutReferences(const TDF_Label & aLabel, TDF_AttributeMap & atts);

		/****************** OutReferences ******************/
		%feature("compactdefaultargs") OutReferences;
		%feature("autodoc", "Returns in <atts> the referenced attributes and kept by <afilterforreferences>. it considers only the referers kept by <afilterforreferers>. caution: <atts> is not cleared before use!.

	:param aLabel:
	:type aLabel: TDF_Label
	:param aFilterForReferers:
	:type aFilterForReferers: TDF_IDFilter
	:param aFilterForReferences:
	:type aFilterForReferences: TDF_IDFilter
	:param atts:
	:type atts: TDF_AttributeMap
	:rtype: None
") OutReferences;
		static void OutReferences(const TDF_Label & aLabel, const TDF_IDFilter & aFilterForReferers, const TDF_IDFilter & aFilterForReferences, TDF_AttributeMap & atts);

		/****************** OutReferers ******************/
		%feature("compactdefaultargs") OutReferers;
		%feature("autodoc", "Returns in <theatts> the attributes having out references. //! caution: <theatts> is not cleared before use!.

	:param theLabel:
	:type theLabel: TDF_Label
	:param theAtts:
	:type theAtts: TDF_AttributeMap
	:rtype: None
") OutReferers;
		static void OutReferers(const TDF_Label & theLabel, TDF_AttributeMap & theAtts);

		/****************** OutReferers ******************/
		%feature("compactdefaultargs") OutReferers;
		%feature("autodoc", "Returns in <atts> the attributes having out references and kept by <afilterforreferers>. it considers only the references kept by <afilterforreferences>. caution: <atts> is not cleared before use!.

	:param aLabel:
	:type aLabel: TDF_Label
	:param aFilterForReferers:
	:type aFilterForReferers: TDF_IDFilter
	:param aFilterForReferences:
	:type aFilterForReferences: TDF_IDFilter
	:param atts:
	:type atts: TDF_AttributeMap
	:rtype: None
") OutReferers;
		static void OutReferers(const TDF_Label & aLabel, const TDF_IDFilter & aFilterForReferers, const TDF_IDFilter & aFilterForReferences, TDF_AttributeMap & atts);

		/****************** RelocateLabel ******************/
		%feature("compactdefaultargs") RelocateLabel;
		%feature("autodoc", "Returns the label having the same sub-entry as <alabel> but located as descendant as <toroot> instead of <fromroot>. //! exemple : //! alabel = 0:3:24:7:2:7 fromroot = 0:3:24 toroot = 0:5 returned label = 0:5:7:2:7.

	:param aSourceLabel:
	:type aSourceLabel: TDF_Label
	:param fromRoot:
	:type fromRoot: TDF_Label
	:param toRoot:
	:type toRoot: TDF_Label
	:param aTargetLabel:
	:type aTargetLabel: TDF_Label
	:param create: default value is Standard_False
	:type create: bool
	:rtype: None
") RelocateLabel;
		static void RelocateLabel(const TDF_Label & aSourceLabel, const TDF_Label & fromRoot, const TDF_Label & toRoot, TDF_Label & aTargetLabel, const Standard_Boolean create = Standard_False);

		/****************** TagList ******************/
		%feature("compactdefaultargs") TagList;
		%feature("autodoc", "Returns the entry of <alabel> as list of integers in <ataglist>.

	:param aLabel:
	:type aLabel: TDF_Label
	:param aTagList:
	:type aTagList: TColStd_ListOfInteger
	:rtype: None
") TagList;
		static void TagList(const TDF_Label & aLabel, TColStd_ListOfInteger & aTagList);

		/****************** TagList ******************/
		%feature("compactdefaultargs") TagList;
		%feature("autodoc", "Returns the entry expressed by <anentry> as list of integers in <ataglist>.

	:param anEntry:
	:type anEntry: TCollection_AsciiString
	:param aTagList:
	:type aTagList: TColStd_ListOfInteger
	:rtype: None
") TagList;
		static void TagList(const TCollection_AsciiString & anEntry, TColStd_ListOfInteger & aTagList);

};


%extend TDF_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class TDF_Transaction *
************************/
class TDF_Transaction {
	public:
		/****************** Abort ******************/
		%feature("compactdefaultargs") Abort;
		%feature("autodoc", "Aborts the transactions until and including the current opened one.

	:rtype: None
") Abort;
		void Abort();

		/****************** Commit ******************/
		%feature("compactdefaultargs") Commit;
		%feature("autodoc", "Commits the transactions until and including the current opened one.

	:param withDelta: default value is Standard_False
	:type withDelta: bool
	:rtype: opencascade::handle<TDF_Delta>
") Commit;
		opencascade::handle<TDF_Delta> Commit(const Standard_Boolean withDelta = Standard_False);

		/****************** Data ******************/
		%feature("compactdefaultargs") Data;
		%feature("autodoc", "Returns the data from tdf.

	:rtype: opencascade::handle<TDF_Data>
") Data;
		opencascade::handle<TDF_Data> Data();

		/****************** Initialize ******************/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "Aborts all the transactions on <mydf> and sets <adf> to build a transaction context on <adf>, ready to be opened.

	:param aDF:
	:type aDF: TDF_Data
	:rtype: None
") Initialize;
		void Initialize(const opencascade::handle<TDF_Data> & aDF);

		/****************** IsOpen ******************/
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "Returns true if the transaction is open.

	:rtype: bool
") IsOpen;
		Standard_Boolean IsOpen();

		/****************** Name ******************/
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "Returns the transaction name.

	:rtype: TCollection_AsciiString
") Name;
		const TCollection_AsciiString & Name();

		/****************** Open ******************/
		%feature("compactdefaultargs") Open;
		%feature("autodoc", "If not yet done, opens a new transaction on <mydf>. returns the index of the just opened transaction. //! it raises domainerror if the transaction is already open, and nullobject if there is no current data framework.

	:rtype: int
") Open;
		Standard_Integer Open();

		/****************** TDF_Transaction ******************/
		%feature("compactdefaultargs") TDF_Transaction;
		%feature("autodoc", "Creates an empty transaction context, unable to be opened.

	:param aName: default value is ""
	:type aName: TCollection_AsciiString
	:rtype: None
") TDF_Transaction;
		 TDF_Transaction(const TCollection_AsciiString & aName = "");

		/****************** TDF_Transaction ******************/
		%feature("compactdefaultargs") TDF_Transaction;
		%feature("autodoc", "Creates a transaction context on <adf>, ready to be opened.

	:param aDF:
	:type aDF: TDF_Data
	:param aName: default value is ""
	:type aName: TCollection_AsciiString
	:rtype: None
") TDF_Transaction;
		 TDF_Transaction(const opencascade::handle<TDF_Data> & aDF, const TCollection_AsciiString & aName = "");

		/****************** Transaction ******************/
		%feature("compactdefaultargs") Transaction;
		%feature("autodoc", "Returns the number of the transaction opened by <self>.

	:rtype: int
") Transaction;
		Standard_Integer Transaction();

};


%extend TDF_Transaction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class TDF_DeltaOnAddition *
****************************/
class TDF_DeltaOnAddition : public TDF_AttributeDelta {
	public:
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

	:rtype: None
") Apply;
		void Apply();

		/****************** TDF_DeltaOnAddition ******************/
		%feature("compactdefaultargs") TDF_DeltaOnAddition;
		%feature("autodoc", "Creates a tdf_deltaonaddition.

	:param anAtt:
	:type anAtt: TDF_Attribute
	:rtype: None
") TDF_DeltaOnAddition;
		 TDF_DeltaOnAddition(const opencascade::handle<TDF_Attribute> & anAtt);

};


%make_alias(TDF_DeltaOnAddition)

%extend TDF_DeltaOnAddition {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDF_DeltaOnForget *
**************************/
class TDF_DeltaOnForget : public TDF_AttributeDelta {
	public:
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

	:rtype: None
") Apply;
		void Apply();

		/****************** TDF_DeltaOnForget ******************/
		%feature("compactdefaultargs") TDF_DeltaOnForget;
		%feature("autodoc", "Creates a tdf_deltaonforget.

	:param anAtt:
	:type anAtt: TDF_Attribute
	:rtype: None
") TDF_DeltaOnForget;
		 TDF_DeltaOnForget(const opencascade::handle<TDF_Attribute> & anAtt);

};


%make_alias(TDF_DeltaOnForget)

%extend TDF_DeltaOnForget {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class TDF_DeltaOnModification *
********************************/
%nodefaultctor TDF_DeltaOnModification;
class TDF_DeltaOnModification : public TDF_AttributeDelta {
	public:
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

	:rtype: None
") Apply;
		virtual void Apply();

};


%make_alias(TDF_DeltaOnModification)

%extend TDF_DeltaOnModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class TDF_DeltaOnRemoval *
***************************/
%nodefaultctor TDF_DeltaOnRemoval;
class TDF_DeltaOnRemoval : public TDF_AttributeDelta {
	public:
};


%make_alias(TDF_DeltaOnRemoval)

%extend TDF_DeltaOnRemoval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class TDF_DeltaOnResume *
**************************/
class TDF_DeltaOnResume : public TDF_AttributeDelta {
	public:
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

	:rtype: None
") Apply;
		void Apply();

		/****************** TDF_DeltaOnResume ******************/
		%feature("compactdefaultargs") TDF_DeltaOnResume;
		%feature("autodoc", "Creates a tdf_deltaonresume.

	:param anAtt:
	:type anAtt: TDF_Attribute
	:rtype: None
") TDF_DeltaOnResume;
		 TDF_DeltaOnResume(const opencascade::handle<TDF_Attribute> & anAtt);

};


%make_alias(TDF_DeltaOnResume)

%extend TDF_DeltaOnResume {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDF_Reference *
**********************/
class TDF_Reference : public TDF_Attribute {
	public:

        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: TDF_Label
") Get;
		TDF_Label Get();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** References ******************/
		%feature("compactdefaultargs") References;
		%feature("autodoc", "	:param DS:
	:type DS: TDF_DataSet
	:rtype: None
") References;
		virtual void References(const opencascade::handle<TDF_DataSet> & DS);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param With:
	:type With: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & With);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param I:
	:type I: TDF_Label
	:param Origin:
	:type Origin: TDF_Label
	:rtype: opencascade::handle<TDF_Reference>
") Set;
		static opencascade::handle<TDF_Reference> Set(const TDF_Label & I, const TDF_Label & Origin);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	:param Origin:
	:type Origin: TDF_Label
	:rtype: None
") Set;
		void Set(const TDF_Label & Origin);

		/****************** TDF_Reference ******************/
		%feature("compactdefaultargs") TDF_Reference;
		%feature("autodoc", "	:rtype: None
") TDF_Reference;
		 TDF_Reference();

};


%make_alias(TDF_Reference)

%extend TDF_Reference {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class TDF_TagSource *
**********************/
class TDF_TagSource : public TDF_Attribute {
	public:
		/****************** Get ******************/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	:rtype: int
") Get;
		Standard_Integer Get();

		/****************** GetID ******************/
		%feature("compactdefaultargs") GetID;
		%feature("autodoc", "Class methods =============.

	:rtype: Standard_GUID
") GetID;
		static const Standard_GUID & GetID();

		/****************** ID ******************/
		%feature("compactdefaultargs") ID;
		%feature("autodoc", "	:rtype: Standard_GUID
") ID;
		const Standard_GUID & ID();

		/****************** NewChild ******************/
		%feature("compactdefaultargs") NewChild;
		%feature("autodoc", "Find (or create) a tagsource attribute located at <l> and make a new child label. tagsource methods =================.

	:param L:
	:type L: TDF_Label
	:rtype: TDF_Label
") NewChild;
		static TDF_Label NewChild(const TDF_Label & L);

		/****************** NewChild ******************/
		%feature("compactdefaultargs") NewChild;
		%feature("autodoc", "	:rtype: TDF_Label
") NewChild;
		TDF_Label NewChild();

		/****************** NewEmpty ******************/
		%feature("compactdefaultargs") NewEmpty;
		%feature("autodoc", "	:rtype: opencascade::handle<TDF_Attribute>
") NewEmpty;
		opencascade::handle<TDF_Attribute> NewEmpty();

		/****************** NewTag ******************/
		%feature("compactdefaultargs") NewTag;
		%feature("autodoc", "	:rtype: int
") NewTag;
		Standard_Integer NewTag();

		/****************** Paste ******************/
		%feature("compactdefaultargs") Paste;
		%feature("autodoc", "	:param Into:
	:type Into: TDF_Attribute
	:param RT:
	:type RT: TDF_RelocationTable
	:rtype: None
") Paste;
		void Paste(const opencascade::handle<TDF_Attribute> & Into, const opencascade::handle<TDF_RelocationTable> & RT);

		/****************** Restore ******************/
		%feature("compactdefaultargs") Restore;
		%feature("autodoc", "	:param with:
	:type with: TDF_Attribute
	:rtype: None
") Restore;
		void Restore(const opencascade::handle<TDF_Attribute> & with);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Find, or create, a tagsource attribute. the tagsource attribute is returned.

	:param label:
	:type label: TDF_Label
	:rtype: opencascade::handle<TDF_TagSource>
") Set;
		static opencascade::handle<TDF_TagSource> Set(const TDF_Label & label);

		/****************** Set ******************/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "Tdf_attribute methods =====================.

	:param T:
	:type T: int
	:rtype: None
") Set;
		void Set(const Standard_Integer T);

		/****************** TDF_TagSource ******************/
		%feature("compactdefaultargs") TDF_TagSource;
		%feature("autodoc", "	:rtype: None
") TDF_TagSource;
		 TDF_TagSource();

};


%make_alias(TDF_TagSource)

%extend TDF_TagSource {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class TDF_DefaultDeltaOnModification *
***************************************/
class TDF_DefaultDeltaOnModification : public TDF_DeltaOnModification {
	public:
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

	:rtype: None
") Apply;
		virtual void Apply();

		/****************** TDF_DefaultDeltaOnModification ******************/
		%feature("compactdefaultargs") TDF_DefaultDeltaOnModification;
		%feature("autodoc", "Creates a tdf_defaultdeltaonmodification. <anattribute> must be the backup copy.

	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: None
") TDF_DefaultDeltaOnModification;
		 TDF_DefaultDeltaOnModification(const opencascade::handle<TDF_Attribute> & anAttribute);

};


%make_alias(TDF_DefaultDeltaOnModification)

%extend TDF_DefaultDeltaOnModification {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class TDF_DefaultDeltaOnRemoval *
**********************************/
class TDF_DefaultDeltaOnRemoval : public TDF_DeltaOnRemoval {
	public:
		/****************** Apply ******************/
		%feature("compactdefaultargs") Apply;
		%feature("autodoc", "Applies the delta to the attribute.

	:rtype: None
") Apply;
		virtual void Apply();

		/****************** TDF_DefaultDeltaOnRemoval ******************/
		%feature("compactdefaultargs") TDF_DefaultDeltaOnRemoval;
		%feature("autodoc", "Creates a tdf_defaultdeltaonremoval.

	:param anAttribute:
	:type anAttribute: TDF_Attribute
	:rtype: None
") TDF_DefaultDeltaOnRemoval;
		 TDF_DefaultDeltaOnRemoval(const opencascade::handle<TDF_Attribute> & anAttribute);

};


%make_alias(TDF_DefaultDeltaOnRemoval)

%extend TDF_DefaultDeltaOnRemoval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class TDF_HAttributeArray1 : public  TDF_AttributeArray1, public Standard_Transient {
  public:
    TDF_HAttributeArray1(const Standard_Integer theLower, const Standard_Integer theUpper);
    TDF_HAttributeArray1(const Standard_Integer theLower, const Standard_Integer theUpper, const  TDF_AttributeArray1::value_type& theValue);
    TDF_HAttributeArray1(const  TDF_AttributeArray1& theOther);
    const  TDF_AttributeArray1& Array1();
     TDF_AttributeArray1& ChangeArray1();
};
%make_alias(TDF_HAttributeArray1)


/* harray2 classes */
/* hsequence classes */
