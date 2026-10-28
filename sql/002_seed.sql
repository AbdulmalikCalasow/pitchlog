-- Add the three soccer leagues.
INSERT INTO leagues (name)
VALUES
    ('African Premier League'),
    ('Mexican League'),
    ('Seattle Somali Week');

-- Add a starting season for each league.
INSERT INTO seasons (league_id, label)
VALUES
    (1, 'Season 1'),
    (2, 'Season 1'),
    (3, 'Season 1');

-- Add sample teams for testing.
INSERT INTO teams (name)
VALUES
    ('Arsenal'),
    ('Chelsea'),
    ('Liverpool'),
    ('Manchester City'),
    ('Manchester United'),
    ('Tottenham Hotspur');

-- Add a fictional match and its personal statistics.
WITH new_match AS (
    INSERT INTO matches (
        season_id,
        my_team_id,
        opponent_team_id,
        played_on,
        team_goals,
        opponent_goals,
        notes
    )
    VALUES (
        (
            SELECT seasons.id
            FROM seasons
            JOIN leagues ON seasons.league_id = leagues.id
            WHERE leagues.name = 'African Premier League'
              AND seasons.label = 'Season 1'
        ),
        (SELECT id FROM teams WHERE name = 'Arsenal'),
        (SELECT id FROM teams WHERE name = 'Chelsea'),
        '2026-10-01',
        4,
        2,
        'Fictional match for testing.'
    )
    RETURNING id
)
INSERT INTO performances (
    match_id,
    goals,
    assists,
    minutes,
    position
)
SELECT
    id,
    3,
    1,
    90,
    'Forward'
FROM new_match;