# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased] - yyyy-mm-dd

### Added

### Changed

### Deprecated

### Removed

### Fixed

### Security

## [1.6.4] - 2021-06-18

## Added
- [Response Body Properties](https://github.com/72pulses/apidoco/pull/118)

## [1.6.3] - 2021-06-02

### Changed

- [Bump mimemagic to 0.3.10](https://github.com/72pulses/apidoco/pull/109)

## [1.6.2] - 2020-11-18

### Added
- [UI V2](https://github.com/72pulses/apidoco/pull/99)

### Changed
- [upgrading bootsrap to 4.5](https://github.com/72pulses/apidoco/pull/97)
- [Angularjs upgrade - 1.8.x](https://github.com/72pulses/apidoco/pull/100)

## [1.6.1] - 2020-08-19

### Added
 - [Test coverage for sorting fix](https://github.com/72pulses/apidoco/commit/ad291ceadcb5bc1f2cf481bcf0277a915ee9cebf)

### Removed
 - [Removed circle ci config in favor of github action](https://github.com/72pulses/apidoco/commit/e433056658605ebf9c2325c3d483beaa4b9f5a7b)

### Fixed
 - Better error handling when parsing files [#91](https://github.com/72pulses/apidoco/pull/91)
 - Update genrator to use the `base_path` config [#92](https://github.com/72pulses/apidoco/pull/92)

### Security
 - Bump rack from 2.2.2 to 2.2.3 [#83](https://github.com/72pulses/apidoco/pull/83)

## [1.6.0] - 2020-07-10

### Added
 - Using app name as the sidebar title https://github.com/72pulses/apidoco/pull/80
 - Adding built-with https://github.com/72pulses/apidoco/pull/81
 - Added more test coverage https://github.com/72pulses/apidoco/pull/85
 - Added Github Action: Test Coverage https://github.com/72pulses/apidoco/pull/89

### Changed
 - (Breaking Change) Setting rails 5 as min requirement. Make sure your rails app version is >= 5.0.0 https://github.com/72pulses/apidoco/pull/78
 - Improved gitignore - fixed untracked files https://github.com/72pulses/apidoco/pull/79

## [1.5.6] - 2020-06-10

### Changed
- Bump websocket-extensions https://github.com/72pulses/apidoco/pull/75
- Bump puma https://github.com/72pulses/apidoco/pull/71

### Fixed
- AssetNotPrecompiled bug for rails 6 https://github.com/72pulses/apidoco/pull/76

## [1.5.5] - 2020-06-04

### Added
- Added auto-generated CircleCI 2.0 config file https://github.com/72pulses/apidoco/pull/56

### Changed
- Bumped dependent gems - Capybara, Nokogiri, Puma, Rack and Loofah
- Using apparition instead of webkit https://github.com/72pulses/apidoco/pull/55

### Fixed
- Fix forced reference to api path https://github.com/72pulses/apidoco/pull/69
- updating gemspec to fix build warnings, update ruby https://github.com/72pulses/apidoco/pull/70

## [1.5.4] - 2019-07-23

### Added
- CHANGELOG.md https://github.com/72pulses/apidoco/pull/53

### Changed
- Sort sub-directories alphabetically https://github.com/72pulses/apidoco/pull/47

### Fixed
- Show in a line 'request' and 'response' https://github.com/72pulses/apidoco/pull/52
