EnemySpawner = {}

function EnemySpawner:load()
    EnemySpawner.timeBetweenSpawns = 0.7
    EnemySpawner.timer = EnemySpawner.timeBetweenSpawns
end

function EnemySpawner:update(dt)
    if Gamemanager.gamestate == 2 then
        EnemySpawner.timer = EnemySpawner.timer - dt
        if EnemySpawner.timer <= 0 then
            Enemies:spawnEnemy()
            EnemySpawner.timer = EnemySpawner.timeBetweenSpawns
            EnemySpawner.timeBetweenSpawns = EnemySpawner.timeBetweenSpawns * 0.97
        end
    end
end

