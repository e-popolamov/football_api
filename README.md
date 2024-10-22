## Docker Compose

### Services:
- Backend
- DB
- Redis
- Sidekiq

## Setup
* ```docker-compose up -d --build ```
* ```docker-compose run backend rails db:create```
* ```docker-compose run backend rails db:migrate```
* ```docker-compose run backend rails db:seed```

**To fill game statistic run**:
```UpdateEmptyScoreWorker.perform_async```

or for one:

```UpdateScoreWorker.perform_async(1) #Game.id```

##### **PORT: 3001**

Postman collections and environment variables are in the /postman folder

Github Actions: Rubocop and Rspec. Brakeman turned off