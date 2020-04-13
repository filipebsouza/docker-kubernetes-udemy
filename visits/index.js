const express = require('express');
const redis = require('redis');
const process = require('process');

const app = express();
const client = redis.createClient({
    host: 'redis-server', // Nome do serviço no docker-compose já basta para ser acessado, 
                        // se fosse fora ia ter q colocar a URL
    port: 6379 // Porta padrão
});

client.set('visits', 0);

app.get('/', (req, res) => {
    process.exit(1);
    client.get('visits', (err, visits) => {
        res.send(`Number of visits is ${visits}`);
        client.set('visits', parseInt(visits) + 1);
    });
});

app.listen(8081, () => {
    console.log('Lintening on port 8081');
});