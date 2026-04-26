# RobotAPI Testing Framework

A robust API automation framework built using **Robot Framework** and **RequestsLibrary**. This project is designed for end-to-end API testing with reusable components, modular structure, and CI/CD integration support.

---

## 📌 Features

* REST API Testing using Robot Framework
* Reusable keywords (modular design)
* Supports GET, POST, PUT, PATCH, DELETE methods
* JSON data-driven testing
* SSL warning handling
* CI/CD ready (GitHub Actions support)
* Easy-to-maintain project structure

---

## 🏗️ Project Structure

```
RobotAPITesting/
│
├── .github/
│   └── workflows/
│       └── robot-test.yml        # CI/CD pipeline
│
├── Data/
│   ├── json_data.py             # Custom Python data utilities
│   └── testdata.json           # Test data file
│
├── Resources/
│   ├── api_keywords.robot      # API-related reusable keywords
│   └── common_keywords.robot   # Common reusable utilities
│
├── Tests/
│   ├── GetMethod.robot
│   ├── PostMethod.robot
│   ├── PutMethod.robot
│   ├── PatchMethod.robot
│   ├── DeleteMethod.robot
│   └── E2EAPITesting.robot     # End-to-End test scenario
│
├── results/
│   ├── log.html
│   ├── report.html
│   └── output.xml
│
└── README.md
```

---

## Prerequisites

Make sure you have the following installed:

* Python 3.x
* Robot Framework
* RequestsLibrary

### Install dependencies:

```bash
pip install robotframework
pip install robotframework-requests
```

---

## How to Run Tests

Run all test cases:

```bash
robot Tests/
```

Run a specific test file:

```bash
robot Tests/E2EAPITesting.robot
```

---

## Base URL

This project uses:

```
https://jsonplaceholder.typicode.com/
```

You can update it in:

```
*** Variables ***
${base_url}
```

---

## Example Test Flow

* Disable SSL warnings
* Set API headers
* Loop through test data
* Send API requests (POST/GET/etc.)
* Validate response

---

## Reusable Keywords

### `common_keywords.robot`

* Launch URL
* Disable SSL warnings

### `api_keywords.robot`

* API Headers setup
* HTTP methods (GET, POST, PUT, DELETE, PATCH)

---

## Reports

After execution, reports are generated in the `results/` folder:

* `report.html` → Summary report
* `log.html` → Detailed logs
* `output.xml` → Raw execution data

---

## CI/CD Integration

GitHub Actions workflow is available:

```
.github/workflows/robot-test.yml
```

This allows:

* Automated test execution
* Continuous integration
* Easy scaling

---

## Best Practices Used

* Modular keyword-driven design
* Data-driven testing
* Clean folder structure
* Reusability of code
* Separation of concerns

---

## Future Enhancements

* Add authentication (OAuth/JWT)
* Add schema validation
* Integrate Allure reports
* Add environment configuration support

---

## Author

**Chetan Kumar**

---

## License

This project is open-source and free to use.
