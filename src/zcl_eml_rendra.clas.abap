CLASS zcl_eml_rendra DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_eml_rendra IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*    DATA: lt_header TYPE TABLE OF ztrd_h_001.
*    DATA: lt_items TYPE TABLE OF ztrd_I_001.
*
*    APPEND VALUE #( registration_id = '80009' vendor_name = 'PT MNC'
*                  vendor_category = 'Supplier'   ) TO lt_header.
*
*    INSERT Ztrd_h_001 FROM TABLE lt_header.
*
*    APPEND VALUE #( position_number = '10'
*    item_keyname = 'address'
*    item_value = 'Jl. H.Crespo No.99 Arg' ) TO lt_items.
*
*    APPEND VALUE #( position_number = '20'
*    item_keyname = 'mobile'
*    item_value = '088899997777' ) TO lt_items.
*
*    INSERT Ztrd_i_001 FROM TABLE lt_items.
*
*    out->write( 'Create Success' ).


    " ===== CREATE =====
    DATA: lt_header TYPE TABLE FOR CREATE zi_001_h,
          ls_header TYPE STRUCTURE FOR CREATE zi_001_h,
          lt_items  TYPE TABLE FOR CREATE zi_001_h\Item,
          ls_items  TYPE STRUCTURE FOR CREATE zi_001_h\Item.

    DATA(cid) = 'test_cid_01'.
    ls_header = VALUE #( %cid = cid
                          registrationid = '80012'
                          vendorname = 'PT ABADA'
                          vendorcategory = 'Supplier' ).
    APPEND ls_header TO lt_header.

    ls_items = VALUE #( %cid_ref = cid
     %target = VALUE #( ( %cid = |ItemCID_a3|
                          positionnumber = '10'
                          itemkeyname = 'address'
                          itemvalue = 'Surabaya Jl. Merapi 2 Blok.FS No.124 ' )

                        ( %cid = |ItemCID_a4|
                          positionnumber = '20'
                          itemkeyname = 'mobile'
                          itemvalue = '0813290261239' ) ) ).

    APPEND ls_items TO lt_items.

        MODIFY ENTITIES OF zi_001_h
    ENTITY Header
        CREATE FIELDS ( RegistrationId VendorName VendorCategory )
        WITH lt_header
    CREATE BY \Item
        FIELDS ( PositionNumber ItemKeyname ItemValue )
        WITH lt_items
    MAPPED DATA(mapped_create)
    FAILED DATA(failed_create)
    REPORTED DATA(reported_create).

    out->write( mapped_create-Header ).

    COMMIT ENTITIES
    RESPONSE OF zi_001_h
    FAILED DATA(failed_commit)
    REPORTED DATA(reported_commit).

    out->write( 'Create Success' ).

    " ===== MODIFY =====
*    MODIFY ENTITIES OF zi_001_h
*      ENTITY header
*        UPDATE
*          SET FIELDS WITH VALUE
*            #( ( HeadregUuid = '6B8011C4C4711EDFBBD2214EF9B7AE23'
*                 VendorName = 'PT MNC' ) )
*
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    " step 6b - Commit Entities
*    COMMIT ENTITIES
*      RESPONSE OF zi_001_h
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Update done' ).
*    out->write( reported_commit ).
*    out->write( failed_commit ).


    " ===== MODIFY Delete =====
*    MODIFY ENTITIES OF zi_001_h
*      ENTITY header
*        DELETE FROM
*          VALUE
*            #( ( HeadregUuid = '6B8011C4C4711EDFBBD2214EF9B7AE23' ) )
*
*     FAILED DATA(failed)
*     REPORTED DATA(reported).
*
*    COMMIT ENTITIES
*      RESPONSE OF zi_001_h
*      FAILED     DATA(failed_commit)
*      REPORTED   DATA(reported_commit).
*
*    out->write( 'Delete done' ).

  ENDMETHOD.
ENDCLASS.
