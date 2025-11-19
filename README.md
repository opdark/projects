# 📊 Opdark Project Timeline Dashboard

An interactive, visual dashboard for tracking multiple projects, their timelines, and milestones. Built with vanilla JavaScript and Chart.js for a clean, dependency-free experience.

## 🌐 Live Demo
**[View Live Dashboard →](https://opdark.github.io/projects/)**

![Project Dashboard](https://img.shields.io/badge/status-active-success)
![License](https://img.shields.io/badge/license-MIT-blue)
[![Live Demo](https://img.shields.io/badge/demo-live-brightgreen)](https://opdark.github.io/projects/)

## ✨ Features

- **Interactive Gantt Chart** - Visual timeline of all projects
- **Clickable Projects** - Click any project to view detailed information
- **Milestone Tracking** - Track key dates and deliverables
- **Progress Indicators** - Visual progress bars for each project
- **Responsive Design** - Works seamlessly on desktop and mobile
- **Category Organization** - Projects grouped by type (Software, Agriculture, Investment)
- **Real-time Stats** - Dashboard overview with project statistics

## 🚀 Quick Start

### Option 1: Direct Use (Recommended)

Simply open `index.html` in your web browser. No server or installation required!

```bash
# Clone the repository
git clone https://github.com/opdark/projects.git
cd projects

# Open in your default browser
open index.html  # macOS
xdg-open index.html  # Linux
start index.html  # Windows
```

### Option 2: With Local Server (For JSON Editing)

If you want to edit the `projects-data.json` file and use the dynamic version:

```bash
# Run the Python server
python3 run_server.py

# Or use Python's built-in server
python3 -m http.server 8000
```

Then navigate to `http://localhost:8000/project-timeline-interactive.html`

## 📁 File Structure

```
projects/
├── index.html                          # Standalone version (data embedded)
├── project-timeline-interactive.html   # JSON-based version
├── projects-data.json                  # Project data (easy to edit)
├── run_server.py                       # Simple Python web server
└── README.md                           # This file
```

## 🎯 Usage

### Viewing Projects

1. **Dashboard View**: See all projects at a glance on the Gantt chart
2. **Click Any Project**: Click on project bars or legend items for details
3. **View Milestones**: Each project modal shows all milestones with dates and status

### Editing Project Data

To add or modify projects, edit `projects-data.json`:

```json
{
  "projects": [
    {
      "id": "unique-id",
      "name": "Project Name",
      "description": "Project description",
      "start": "2025-11-01",
      "end": "2025-12-31",
      "color": "#FF6B6B",
      "category": "Category Name",
      "milestones": [
        {
          "id": "milestone-id",
          "date": "2025-11-15",
          "title": "Milestone Title",
          "description": "Milestone description",
          "type": "major|financial|recurring|research",
          "status": "pending|in-progress|completed"
        }
      ]
    }
  ]
}
```

### Color Codes

Projects use distinct colors for easy identification:
- 🔴 RentRight App: `#FF6B6B`
- 🔵 Crypto App: `#4ECDC4`
- 🟢 Opdark Website: `#45B7D1`
- 🟡 Property Management: `#96CEB4`
- 🟠 Poultry App: `#FFEAA7`
- ⚪ Poultry Farm: `#DFE6E9`
- 🟣 Cow Farm: `#A29BFE`
- 🔴 Togo Land: `#FD79A8`
- 🟡 Togo Farming: `#FDCB6E`

## 🛠️ Technical Details

### Technologies Used

- **Chart.js** - For interactive Gantt charts
- **Luxon** - Date/time handling
- **Vanilla JavaScript** - No framework dependencies
- **CSS Grid & Flexbox** - Responsive layouts
- **HTML5** - Semantic markup

### Browser Support

- ✅ Chrome/Edge (latest)
- ✅ Firefox (latest)
- ✅ Safari (latest)
- ✅ Mobile browsers

## 📱 Screenshots

### Main Dashboard
The main view shows all projects on a timeline with color-coded bars.

### Project Details Modal
Click any project to see:
- Full description
- Start and end dates
- Project duration
- Current status
- Progress indicator
- Complete milestone list with dates and descriptions

## 🎨 Customization

### Changing Colors

Edit the `color` property in `projects-data.json` to any hex color:

```json
"color": "#YOUR_COLOR_HERE"
```

### Adding Categories

Categories are automatically detected from your projects. Simply use consistent category names:

```json
"category": "Your Category Name"
```

## 🌐 GitHub Pages Deployment

✅ **Already Deployed!** The dashboard is live at: **https://opdark.github.io/projects/**

This repository is configured for automatic GitHub Pages deployment:

1. ✅ Repository Settings → Pages section configured
2. ✅ Deploying from "main" branch "/" (root) folder
3. ✅ Site is live and auto-updates on pushes to main
4. 🚀 **[Access the live dashboard here →](https://opdark.github.io/projects/)**

## 📝 License

MIT License - feel free to use and modify as needed.

## 👨‍💻 Author

**Opdark Tech**
- GitHub: [@opdark](https://github.com/opdark)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## 📊 Current Projects

This dashboard currently tracks 9 projects across 3 categories:
- **Software Development** (5 projects)
- **Agriculture** (3 projects)
- **Investment** (1 project)

Total timeline: November 2025 - September 2026

---

**Note**: For the best experience, ensure both `project-timeline-interactive.html` and `projects-data.json` are in the same directory when using the interactive version.
