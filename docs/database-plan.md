# PitchLog Database Plan

## Purpose
Track my soccer matches, performances, and achievements across leagues
and seasons.

## Database
PostgreSQL, managed using pgAdmin.

## Sample Data
Use fictional match records during development.
Replace the sample labels with my actual information later.

### Leagues
- African Premier League
- Mexican League
- Seattle Somali Week

### Sample Season and Team Assignments
| League | Season | My team | Opponent |
|---|---|---|---|
| African Premier League | Season 1 | Arsenal | Chelsea |
| Mexican League | Season 1 | Liverpool | Manchester City |
| Seattle Somali Week | Season 1 | Manchester United | Tottenham Hotspur |

These team assignments are for testing only.

## Tables

### leagues
Stores the competitions.
- id: unique league identifier
- name: unique league name

### seasons
Stores seasons for each league.
- id: unique season identifier
- league_id: reference to leagues
- label: season name
- start_date: optional starting date
- end_date: optional ending date

### teams
Stores my teams and opponents.
- id: unique team identifier
- name: team name

### matches
Stores completed matches I played in.
- id: unique match identifier
- season_id: reference to seasons
- my_team_id: reference to teams
- opponent_team_id: reference to teams
- played_on: match date
- team_goals: my team's final score
- opponent_goals: the opponent's final score
- notes: optional match notes

### performances
Stores my performance in each match.
- id: unique performance identifier
- match_id: unique reference to matches
- goals: my goals
- assists: optional recorded assists
- minutes: optional minutes played
- position: optional playing position

### achievements
Stores trophies, awards, and placements.
- id: unique achievement identifier
- season_id: reference to seasons
- team_id: optional reference to teams
- name: achievement name
- type: team_trophy, individual_award, or placement
- awarded_on: optional award date
- notes: optional achievement notes

## Relationships
- One league has many seasons.
- One season has many matches.
- One season has many achievements.
- Each match has one personal performance.
- Each match references my team and an opponent.
- An achievement may reference a team.

## Statistics Rules
- Appearances: count completed matches with my performance.
- Goals: add recorded personal goals.
- Assists: add known assists and show recording coverage.
- Unknown assists remain empty, not zero.
- Hat-tricks: count matches with at least three personal goals.
- Wins, draws, and losses: calculate from the final scores.
- Trophies: count only achievements with type team_trophy.

## Validation Rules
- Scores, goals, assists, and minutes cannot be negative.
- My team and the opponent must be different.
- Each match can have only one personal performance.
- A season's end date cannot be before its start date.
- A season label must be unique within its league.

## Later Features
- Personal memories
- Milestone timeline