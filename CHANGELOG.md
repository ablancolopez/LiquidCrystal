# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

# ## [1.2.0](https://github.com/ablancolopez/LiquidCrystal/tree/1.2.0)
### Changed
- Time rendered as individual digits with fixed slot positions for Casio LCD aesthetic
- Blinking colon every 2 seconds
- Resize launcher icon

### Removed
- Temperature display and all associated code
- Settings/toggle system — all elements now always shown
- Dead `TIME` code from `Field` module (unused after `TimeDisplay`)

# ## [1.1.0](https://github.com/ablancolopez/LiquidCrystal/tree/1.1.0)
### Added
- Battery (configurable)
- Date (configurable)
- Day of week (configurable)
- Temperature (configurable, off by default)

# ## [1.0.0](https://github.com/ablancolopez/LiquidCrystal/tree/1.0.0)
### Added
- Initial release