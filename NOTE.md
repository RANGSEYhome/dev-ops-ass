# MY PERSONAL NOTE

## Error
Some errors in given repository (forked fronten and backend)
- Fixed by Mr. LONG Ratha
    - In auth.controller.ts (backend/src/module/auth/auth.controller.ts)
    - In next.confix.js
    - In registration.vue (frontend/components/forms/registration.vue) > axios api link
- Fixed by Mr. DAO Vitou
    - In registration.vue (frontend/components/forms/registration.vue) > passwordConfirmation
### Backend
#### In auth.controller.ts (backend/src/module/auth/auth.controller.ts)
Add Public decorator in Register user to allow access to this endpoint without authentication
```sh
@Public()
```
### Frontend
#### In next.confix.js
Add code below:
```sh
server: {
    host: '0.0.0.0', // Default: localhost
    port: 3000,      // Default port
  },
```
#### In registration.vue (frontend/components/forms/registration.vue)
##### Change
```sh
await this.$axios.$post("/api/v1/user/register"
```
##### To
```sh
await this.$axios.$post("/api/v1/auth/register"
```
##### And change
```sh
confirmPassword
```
##### To
```sh
passwordConfirmation
```