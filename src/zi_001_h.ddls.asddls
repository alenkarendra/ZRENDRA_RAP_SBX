@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Data Definition Root'
define root view entity ZI_001_H
  as select from ztrd_h_001
  composition [0..*] of ZI_001_I as Item
{
  key headreg_uuid          as HeadregUuid,
      registration_id       as RegistrationId,
      vendor_name           as VendorName,
      vendor_category       as VendorCategory,
      reg_date              as RegDate,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      last_changed_by       as LastChangedBy,
      last_changed_at       as LastChangedAt,
      local_last_changed_at as LocalLastChangedAt,
      status                as Status,
      Item // Make association public
}
