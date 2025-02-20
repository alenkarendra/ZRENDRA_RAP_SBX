@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Item CDS'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_001_I
  as select from ztrd_i_001
  association to parent ZI_001_H as Header on $projection.HeadregUuid = Header.HeadregUuid
{
  key itemreg_uuid          as ItemregUuid,
      headreg_uuid          as HeadregUuid,
      position_number       as PositionNumber,
      item_keyname          as ItemKeyname,
      item_value            as ItemValue,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      last_changed_by       as LastChangedBy,
      last_changed_at       as LastChangedAt,
      local_last_changed_at as LocalLastChangedAt,
      Header // Make association public
}
