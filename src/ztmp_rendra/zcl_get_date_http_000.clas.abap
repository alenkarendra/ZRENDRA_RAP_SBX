CLASS zcl_get_date_http_000 DEFINITION
  PUBLIC



  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_http_service_extension .
  PROTECTED SECTION.
    METHODS: get_html RETURNING VALUE(ui_html) TYPE string
                      RAISING
                        cx_abap_context_info_error.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_get_date_http_000 IMPLEMENTATION.


  METHOD if_http_service_extension~handle_request.


    TRY.
        response->set_text( get_html(  ) ).
      CATCH cx_web_message_error cx_abap_context_info_error.
        "handle exception
    ENDTRY.


  ENDMETHOD.


  METHOD get_html.
    DATA(user_formatted_name) = cl_abap_context_info=>get_user_formatted_name( ).
    DATA(system_date) = cl_abap_context_info=>get_system_date( ).

    ui_html =  |<html> \n| &&
    |<body> \n| &&
    |<title>General Information</title> \n| &&
    |<p style="color:DodgerBlue;"> Hello Gaess, { user_formatted_name } </p> \n | &&
    |<p> Today, the date is:  { system_date }| &&
    |<p> | &&
    |</body> \n| &&
    |</html> | .
  ENDMETHOD.

ENDCLASS.
