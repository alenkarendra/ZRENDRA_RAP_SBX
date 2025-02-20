@EndUserText.label: 'Projection View Header'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZRD_PV_HEADER
  provider contract transactional_query
  as projection on ZI_001_H as Header
{
  key HeadregUuid,
      RegistrationId,
      VendorName,
      VendorCategory,
      RegDate,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      Status,
      /* Associations */
      Item : redirected to composition child ZRD_PV_ITEM
}
