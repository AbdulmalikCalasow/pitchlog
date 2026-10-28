-- Save the career statistics query as a reusable view.
CREATE OR REPLACE VIEW career_stats AS
SELECT
    COUNT(*) AS appearances,
    COALESCE(SUM(performances.goals), 0) AS goals,
    COALESCE(SUM(performances.assists), 0) AS known_assists,
    COUNT(performances.assists) AS matches_with_assists,
    COUNT(*) FILTER (
        WHERE performances.goals >= 3
    ) AS hat_tricks,
    COUNT(*) FILTER (
        WHERE matches.team_goals > matches.opponent_goals
    ) AS wins,
    COUNT(*) FILTER (
        WHERE matches.team_goals = matches.opponent_goals
    ) AS draws,
    COUNT(*) FILTER (
        WHERE matches.team_goals < matches.opponent_goals
    ) AS losses
FROM matches
JOIN performances ON performances.match_id = matches.id;