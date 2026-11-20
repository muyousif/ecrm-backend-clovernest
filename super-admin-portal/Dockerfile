# Super admin portal - Vite build served by nginx
FROM node:20-alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --no-audit --no-fund
COPY . .

# API base URL WITHOUT /api (the portal adds /api/... itself). Mark as "Build Variable" in Coolify.
ARG VITE_BACKEND_URL=https://clovernestapi.sourcelabs.ai
ENV VITE_BACKEND_URL=$VITE_BACKEND_URL
RUN npm run build

FROM nginx:1.27-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
