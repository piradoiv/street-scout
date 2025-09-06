# Street Scout - iOS Mobile App Development Instructions

Street Scout is a free iOS companion app for urban mappers and explorers, built using the [Xojo](https://www.xojo.com) IDE. The app helps users create geolocated surveying tasks with photo attachments and notes for mapping projects like OpenStreetMap contributions.

**Always reference these instructions first** and fallback to search or bash commands only when you encounter unexpected information that does not match the info here.

## Repository Structure

```
/home/runner/work/street-scout/street-scout/
├── .github/                    # GitHub configuration
│   └── FUNDING.yml            # Sponsorship configuration
├── .gitignore                 # Git ignore patterns for Xojo builds
├── README.md                  # Main project documentation
├── App Store/                 # App Store submission assets
├── Icon/                      # iOS app icon resources
├── docs/                      # Jekyll documentation website
│   ├── _config.yml           # Jekyll site configuration
│   ├── Gemfile               # Ruby gem dependencies
│   ├── index.md              # Homepage content
│   ├── privacy.md            # Privacy policy
│   └── support.md            # Support information
└── src/                       # Main Xojo application source code
    ├── StreetScout.xojo_project  # Main Xojo project file
    ├── App.xojo_code          # Application entry point
    ├── MainScreen.xojo_code   # Primary app screen
    ├── Model/                 # Data models (SurveyTask, TaskRepository)
    ├── Colors/                # UI color definitions
    └── [Various other .xojo_code files] # UI screens and components
```

## Working Effectively

### Prerequisites and Environment Setup

**CRITICAL LIMITATION**: The main iOS app **CANNOT** be built in standard development environments because it requires:
- Xojo IDE (commercial software, license required)
- macOS with Xcode for iOS development
- iOS development certificates and provisioning profiles

**What you CAN do**:
- Work with the Jekyll documentation website
- Review and modify source code files
- Update documentation and project assets

### Documentation Website (Jekyll)

The `docs/` directory contains a Jekyll-powered website that can be built and served:

#### Setup Documentation Environment:
```bash
cd /home/runner/work/street-scout/street-scout/docs
sudo gem install bundler
sudo bundle install  # Takes ~30 seconds. NEVER CANCEL.
```

#### Build Documentation Site:
```bash
cd /home/runner/work/street-scout/street-scout/docs
bundle exec jekyll build  # Takes ~0.6 seconds. Fast operation.
```

#### Serve Documentation Site Locally:
```bash
cd /home/runner/work/street-scout/street-scout/docs
bundle exec jekyll serve --port 4000 --host 0.0.0.0  # Starts immediately, runs until stopped
```
Site will be available at `http://localhost:4000/`

**Note**: Jekyll build shows deprecation warnings for SASS color functions. These are harmless warnings from the minima theme and do not affect functionality.

### Validation Scenarios

#### Documentation Website Validation:
1. **Build Test**: Run `bundle exec jekyll build` - should complete in under 1 second with no errors
2. **Serve Test**: Run `bundle exec jekyll serve` - should start server on port 4000
3. **Content Test**: Visit `http://localhost:4000/` - should show Street Scout homepage with app screenshots
4. **Page Test**: Navigate to `/privacy` and `/support` pages - should load without errors

## Project Understanding

### What Street Scout Does:
- iOS app for creating geolocated surveying tasks
- Capture photos and notes for urban mapping projects
- Separate photo storage (not added to device Photo Library)
- Designed for OpenStreetMap contributors and urban explorers
- Targets iOS 15.0+ devices

### Technology Stack:
- **Main App**: Xojo (cross-platform IDE) targeting iOS
- **Documentation**: Jekyll static site generator with Ruby
- **UI**: Native iOS controls via Xojo's iOS framework
- **Data**: Local storage on device (no cloud sync)

### Key Source Code Components:
- `App.xojo_code`: Application entry point and configuration
- `MainScreen.xojo_code`: Primary user interface
- `SurveyTaskScreen.xojo_code`: Task creation and editing
- `Model/SurveyTask.xojo_code`: Core data model
- `Model/TaskRepository.xojo_code`: Data persistence layer

### Build Configuration:
- iOS Bundle ID: `es.rcruz.streetscout`
- Minimum iOS Version: 15.0
- App Store Distribution: Configured (requires Xojo license)
- Capabilities: Location services, camera access

## Important Limitations

### Cannot Be Done Without Proper Tools:
- **Building the iOS app**: Requires Xojo IDE (commercial license)
- **Running the app**: Requires iOS device or simulator on macOS
- **App Store deployment**: Requires Apple Developer account and Xojo license
- **Testing app functionality**: Cannot be validated without iOS environment

### Can Be Done:
- **Modify source code**: All .xojo_code files are text-based and editable
- **Update documentation**: Jekyll site fully functional
- **Review project structure**: All files accessible for inspection
- **Update assets**: App Store screenshots, icons, and other resources

## Development Workflow

### For Documentation Changes:
1. Navigate to `docs/` directory
2. Edit markdown files (`index.md`, `privacy.md`, `support.md`)
3. Test changes: `bundle exec jekyll serve`
4. Validate all pages load correctly
5. Build final site: `bundle exec jekyll build`

### For Source Code Changes:
1. **IMPORTANT**: Changes cannot be tested without Xojo IDE
2. Edit `.xojo_code` files as needed (they are text-based)
3. Ensure changes follow existing code patterns
4. Document any architectural changes in commit messages

### Common File Locations:
- **App configuration**: `src/StreetScout.xojo_project`
- **Main UI logic**: `src/MainScreen.xojo_code`
- **Data models**: `src/Model/`
- **UI screens**: Various `*Screen.xojo_code` files
- **Website content**: `docs/*.md` files

## Timing Expectations

- **Bundle install**: ~30 seconds (includes native gem compilation)
- **Jekyll build**: ~0.6 seconds (very fast)
- **Jekyll serve startup**: ~1 second to start serving
- **Repository exploration**: Immediate (small codebase)

All Jekyll operations are fast - **NEVER CANCEL** any bundle install operations as they may be installing native extensions.

## Validation Checklist

After making any changes:

### Documentation Changes:
- [ ] Run `bundle exec jekyll build` successfully
- [ ] Run `bundle exec jekyll serve` and verify site loads
- [ ] Check all modified pages render correctly
- [ ] Verify no broken links or missing assets

### Source Code Changes:
- [ ] Verify .xojo_code files have valid syntax (text-based)
- [ ] Ensure project structure remains intact
- [ ] Document limitations of testing without Xojo IDE
- [ ] Note any requirements for future validation with proper tools

## Notes for Developers

- This is a **completed, published iOS app** available on the App Store
- The codebase is well-structured with clear separation of concerns
- Documentation website provides user-facing information
- Source code is readable but requires Xojo IDE for compilation and testing
- Focus on documentation improvements and code review rather than functional testing
- Always document when changes cannot be fully validated due to tool limitations
