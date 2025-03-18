@EndUserText.label: 'Projection View Item'
//@AccessControl.authorizationCheck: #NOT_REQUIRED
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZRD_PV_ITEM
  as projection on ZI_001_I as Item
{
  key ItemregUuid,
      HeadregUuid,
      @Search.defaultSearchElement: true
      PositionNumber,
      @Search.defaultSearchElement: true
      ItemKeyname,
      ItemValue,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      Header : redirected to parent ZRD_PV_HEADER
}
