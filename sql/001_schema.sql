-- Store the soccer leagues.
CREATE TABLE leagues (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);
-- Store seasons for each league.
CREATE TABLE seasons (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    league_id INTEGER NOT NULL REFERENCES leagues(id),
    label VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,

    -- Prevent duplicate seasons within a league.
    UNIQUE (league_id, label),

    -- Keep the dates in the correct order.
    CHECK (end_date >= start_date)
);
-- Store my teams and opponents.
CREATE TABLE teams (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
-- Store completed matches I played in.
CREATE TABLE matches (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    season_id INTEGER NOT NULL REFERENCES seasons(id),
    my_team_id INTEGER NOT NULL REFERENCES teams(id),
    opponent_team_id INTEGER NOT NULL REFERENCES teams(id),
    played_on DATE NOT NULL,
    team_goals INTEGER NOT NULL CHECK (team_goals >= 0),
    opponent_goals INTEGER NOT NULL CHECK (opponent_goals >= 0),
    notes TEXT,

    -- Prevent a team from playing itself.
    CHECK (my_team_id <> opponent_team_id)
);
-- Store my personal statistics for each match.
CREATE TABLE performances (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    match_id INTEGER NOT NULL UNIQUE REFERENCES matches(id),
    goals INTEGER NOT NULL CHECK (goals >= 0),
    assists INTEGER CHECK (assists >= 0),
    minutes INTEGER CHECK (minutes >= 0),
    position VARCHAR(50)
);

-- Store trophies, awards, and placements.
CREATE TABLE achievements (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    season_id INTEGER NOT NULL REFERENCES seasons(id),
    team_id INTEGER REFERENCES teams(id),
    name VARCHAR(150) NOT NULL,
    type VARCHAR(30) NOT NULL,
    awarded_on DATE,
    notes TEXT,

    -- Allow only the three achievement types.
    CHECK (type IN (
        'team_trophy',
        'individual_award',
        'placement'
    ))
);