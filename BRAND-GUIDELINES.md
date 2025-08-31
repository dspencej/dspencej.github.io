# QwertyBits Brand Guidelines & Compliance

This document defines the brand standards for QwertyBits and explains how our CI workflows enforce them.

## Brand Identity

### Color Palette
Use only these approved CSS variables from `assets/css/brand.css`:

**Primary Colors:**
- `--primary-blue: #2980b9` - Main brand color
- `--primary-dark: #1e3a8a` - Dark accent
- `--primary-light: #3b82f6` - Light accent

**Secondary Colors:**
- `--secondary-green: #16a085` - Tech/code accent
- `--secondary-orange: #e67e22` - Highlights
- `--secondary-purple: #8e44ad` - Creative accent

**Text Colors:**
- `--dark-text: #1a1a1a` - **Primary text** (WCAG AAA compliant)
- `--medium-text: #4a4a4a` - **Avoid for main content** (contrast issues)
- `--light-text: #6b7280` - **Muted text only** (footer, secondary info)

### Typography
- **Primary Font**: Inter (Google Fonts)
- **Monospace Font**: JetBrains Mono
- **CSS Variables**: `--font-family-sans`, `--font-family-mono`

### Components
- **Logo**: QB monogram in `logo-icon` class
- **Navigation**: `.nav` class with hover effects
- **Badges**: Color-coded topic indicators

## Compliance Rules (Enforced by CI)

### ❌ VIOLATIONS THAT FAIL CI

1. **Hardcoded Colors**
   ```css
   /* ❌ WRONG */
   color: #2980b9;
   
   /* ✅ CORRECT */
   color: var(--primary-blue);
   ```

2. **Medium-text on Light Backgrounds**
   ```css
   /* ❌ WRONG - Poor contrast */
   color: var(--medium-text);
   
   /* ✅ CORRECT - Good contrast */
   color: var(--dark-text);
   ```

3. **Missing brand.css**
   ```html
   <!-- ❌ WRONG - No brand CSS -->
   <link rel="stylesheet" href="style.css">
   
   <!-- ✅ CORRECT - Includes brand system -->
   <link rel="stylesheet" href="/assets/css/brand.css">
   ```

4. **Hardcoded Fonts**
   ```css
   /* ❌ WRONG */
   font-family: Arial, sans-serif;
   
   /* ✅ CORRECT */
   font-family: var(--font-family-sans);
   ```

### ⚠️ WARNINGS (Non-blocking)

1. **Pixel Units**: Consider using `rem` instead of `px`
2. **Missing Focus Styles**: Add `:focus` states for accessibility
3. **Inconsistent Components**: Maintain navigation structure

## CI Workflows

### Brand Compliance Enforcement
**File**: `.github/workflows/brand-consistency.yml`
**Triggers**: Push, PR, Manual
**Checks**:
- Color variable usage
- Typography consistency  
- CSS integration
- Component structure
- Contrast compliance

### Accessibility Compliance
**File**: `.github/workflows/accessibility-compliance.yml`
**Triggers**: Push, PR, Manual
**Checks**:
- Color contrast ratios
- Semantic HTML structure
- Keyboard navigation
- Responsive design

## Development Workflow

1. **Before Coding**: Review these guidelines
2. **During Development**: Use only approved variables
3. **Before Committing**: Test locally with `jekyll serve`
4. **CI Validation**: Workflows automatically check compliance
5. **Fix Violations**: Address any CI failures before merge

## Quick Reference

### Approved Color Usage
```css
/* Text Colors */
color: var(--dark-text);     /* Main content */
color: var(--light-text);    /* Muted content */

/* Brand Colors */
color: var(--primary-blue);    /* Links, accents */
color: var(--primary-dark);    /* Headings */
color: var(--secondary-green); /* Code, tech */

/* Backgrounds */
background: var(--background);     /* White */
background: var(--background-alt); /* Light gray */
```

### Typography Stack
```css
font-family: var(--font-family-sans); /* Inter */
font-family: var(--font-family-mono); /* JetBrains Mono */
```

## Enforcement Level

**CI BLOCKING**: Brand violations **will fail** your pull request
**REQUIRED**: All HTML files **must** include `brand.css`
**MANDATORY**: Use CSS variables for **all** colors and fonts

This ensures consistent, accessible, professional branding across the entire QwertyBits site.