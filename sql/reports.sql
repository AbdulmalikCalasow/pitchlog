-- Career statistics.
SELECT * FROM career_stats;

-- Team trophies only.
SELECT COUNT(*) AS trophies
FROM achievements
WHERE type = 'team_trophy';