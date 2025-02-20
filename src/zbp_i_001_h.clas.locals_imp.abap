CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF reg_status,
        new      TYPE c LENGTH 1 VALUE 'N',
        approved TYPE c LENGTH 1 VALUE 'A',
        rejected TYPE c LENGTH 1 VALUE 'R',
      END OF reg_status.


    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Header RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Header RESULT result.

    METHODS acceptTravel FOR MODIFY
      IMPORTING keys FOR ACTION Header~acceptTravel RESULT result.

    METHODS rejectTravel FOR MODIFY
      IMPORTING keys FOR ACTION Header~rejectTravel RESULT result.
    METHODS setStatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Header~setStatus.

    METHODS setRegistrationId FOR DETERMINE ON SAVE
      IMPORTING keys FOR Header~setRegistrationId.

ENDCLASS.

CLASS lhc_Header IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD acceptTravel.
  ENDMETHOD.

  METHOD rejectTravel.
  ENDMETHOD.

  METHOD setStatus.

    READ ENTITIES OF zi_001_h IN LOCAL MODE
    ENTITY Header
    FIELDS ( status ) WITH CORRESPONDING #( keys )
    RESULT DATA(headers).

    DELETE headers WHERE status IS NOT INITIAL.
    CHECK headers IS NOT INITIAL.

    MODIFY ENTITIES OF zi_001_h IN LOCAL MODE
    ENTITY Header
    UPDATE
    FIELDS ( Status )
    WITH VALUE #( FOR header IN headers
    ( %tky = header-%tky
    Status = reg_status-new ) ).


  ENDMETHOD.

  METHOD setRegistrationId.
  ENDMETHOD.

ENDCLASS.
