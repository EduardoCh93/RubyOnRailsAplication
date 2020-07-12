# A Twitter clone

## Development

Instalar dependencias
```bash
$ bundle install
$ yarn install
```

Hacer las migraciones y crear data de ejemplo
```bash
$ rails db:migrate
$ rails db:seed
```

Luego iniciar el server
```bash
$ rails server
```

Debería iniciar en http://localhost:3000

## Test

Para correr todos los tests primero corremos las migraciones
```bash
$ rails db:migrate RAILS_ENV=test
```

Y luego los tests
```bash
$ rails test
```

