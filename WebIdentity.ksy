meta:
  id: classic_uo_web_identity
  encoding: UTF-8
  endian: be
seq:
  - id: packet_id
    type: u1
    doc: Packet Id
  - id: client_type
    type: strz
    size: 7
    doc: Packet Id
  - id: timestamp
    type: u4
    doc: Unix timestamp
  - id: secret
    type: strz
    doc: Secret key
  - id: user_id
    type: strz
    doc: User ID
  - id: connecting_ip
    type: strz
    doc: Connecting IP address
  - id: external_auth_provider
    type: strz
    doc: External Authentication Provider
  - id: external_auth_username
    type: strz
    doc: External Authentication Username
  - id: external_auth_id
    type: strz
    doc: External Authentication ID
  - id: role
    type: strz
    doc: User Role
