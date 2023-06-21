meta:
  id: classic_uo_web_identity
  encoding: UTF-8
  endian: be
seq:
  - id: packet_id
    contents: [0xA4]
    doc: |
      Existing packet id 0xA4 used by SystemInfo
  - id: client_type
    type: strz
    size: 7
    doc: |
      Client type, for CUO Web this is always the string "CUOWEB".
      However this is left open for other clients who might implement a similar packet.
  - id: timestamp
    type: u4
    doc: |
      Unix timestamp when the identity packet was created, these packets should be considered short-lived.
  - id: secret
    type: strz
    doc: |
      Secret pre-shared key known only by ClassicUO's Game Proxy and the Shard
  - id: user_id
    type: strz
    doc: |
      ClassicUO Web's unique userId
  - id: connecting_ip
    type: strz
    doc: |
      The user's real connecting IP address as seen by the Game Proxy.
  - id: external_auth_provider
    type: strz
    doc: |
      External authentication provider (if any), e.g. Discord.
  - id: external_auth_username
    type: strz
    doc: |
      External authentication username (if any), e.g. blank#9244
  - id: external_auth_id
    type: strz
    doc: |
      External authentication Id (if any), e.g. for discord 91796932124495872
  - id: role
    type: strz
    doc: |
      User Role as defined by ClassicUO Web, currently one of user, admin, shard-owner
  - id: unused
    size: 47
    doc: |
      Unused remaining packet section of the SystemInfo packet
