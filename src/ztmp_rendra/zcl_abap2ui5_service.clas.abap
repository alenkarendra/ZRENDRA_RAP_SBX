CLASS zcl_abap2ui5_service DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
    INTERFACES if_http_extension.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_abap2ui5_service IMPLEMENTATION.

  METHOD if_http_extension~handle_request.
    z2ui5_cl_http_handler=>run( server ).
  ENDMETHOD.

  METHOD if_http_service_extension~handle_request.
*    z2ui5_cl_http_handler=>run( server ).
     z2ui5_cl_http_handler=>run( req = request res = response ).
  ENDMETHOD.

ENDCLASS.
