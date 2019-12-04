module.exports = {

    secret: 'wfoED5fYqH0AHuk3xPZ0oF9xTh6a406c',
    port: 3000,
    defaults: {
        limit: 10,
        filter: 'timestamp'
    },
    mongodb: {
        host: 'mongodb://mongo:27017/docker-node-mongo'
    },
    sendgrid: {
        user: 'apikey',
        pass: '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'
    },
    tokenExpiry: 3600,
    adminKey: '8JadZIptT2ysZPKQUAdBWw.lwewT8M4'
    //adminExpiry:3600*24*365*10

};