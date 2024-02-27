# LazyCup

SPA application expanding skills in creating reusable components, passing props, and effective state management. Additionally, it emphasizes the importance of writing unit tests and creating snapshots.

## Installation

1. Clone the repository `git clone https://github.com/GabrielaGodek/LazyCup.git` and change directory `cd lazycup`
2. Copy data from `.env.example` to your `.env` file
3. Run `docker compose up -d`
4. Open app with `http://localhost:5173/`

## Structure

- [**backend**](backend)
  - [**server**](backend/server)
    - [**controllers**](backend/server/controllers)
    - [**db**](backend/server/db)
- [**frontend**](frontend)
  - [**src**](frontend/src)
    - [**assets**](frontend/src/assets)
    - [**components**](frontend/src/components)
    - [**composables**](frontend/src/composables)
    - [**router**](frontend/src/router)
    - [**stores**](frontend/src/stores)
    - [**utils**](frontend/src/utils)
    - [**views**](frontend/src/views)

## Dependencies

- Vite: `^4.3.5`
- Vue.js: `^3.3.4`
- Vue Router: `^4.2.2`
- Pinia: `^2.0.36`
- Vuetify: `^3.5.6`
- Tailwindcss: `^3.4.1`
- TypeScript: `^5.2.2`
- Express: `^4.18.2`
- Mysql2: `^3.9.1`

## API Endpoints

| HTTP | Endpoints            | Action                                  |
| ---- | -------------------- | --------------------------------------- |
| GET  | /api/v1/products     | To retrieve all available products      |
| GET  | /api/v1/products/:id | To retrieve details of a single product |

## Preview

### Authors

Gabriela Godek
