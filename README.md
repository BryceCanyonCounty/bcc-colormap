# bcc-colormap

Configurable RedM map region colors for BCC servers.

The wanted region hashes are based on Femga's RDR3 discoveries list:
https://github.com/femga/rdr3_discoveries/tree/master/graphics/minimap/wanted_regions

## Installation

1. Place this resource in `[BCC]/bcc-colormap`.
2. Make sure `oxmysql`, `bcc-utils`, and `feather-menu` are installed and started before this resource.
3. Give admins permission to use restricted commands:

```cfg
add_ace group.admin command allow
```

4. Add this after the dependencies in `server.cfg`:

```cfg
ensure bcc-colormap
```

## Admin Menu

Use `/colormap` in-game to open the admin menu.

Admins can:

- Browse zones by category: states, districts, cities, towns, outlines, bounty regions, camps/landmarks, Guarma, and other.
- Enable or hide any configured zone.
- Change a zone color.
- Reset all zones back to the defaults from `shared/config.lua`.

Changes are saved to the `bcc_colormap_zones` database table. When a zone is changed, all clients clear their old map colors first, then apply the updated colors.

## Configuration

Edit `shared/config.lua`.

Each entry in `Config.Zones` supports:

```lua
{ Hash = 0x0079B7EE, Color = 'BLIP_MODIFIER_MP_COLOR_8', Name = 'REGION_HRT_VALENTINE' }
```

Active zones from the old `RL_MapColor` config are enabled by default. The old commented zones are kept in the config with `Enabled = false`, so you can enable them later without looking up hashes again.

The first time the resource starts, it seeds `bcc_colormap_zones` from `Config.Zones`. After that, saved database values are loaded into memory on resource start and reused without reseeding. The database is written only when an admin saves a zone change or uses `Reset Defaults`.

Zone categories are inferred from each zone name and saved to the database. Existing installs get the category column automatically.

`Config.ReapplyInterval` controls how often the client reapplies the colors. Set it to `0` to apply once only.
