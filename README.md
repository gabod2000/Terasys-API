# **Readme**

### **Introduction**

Backend API to take in data from IoT devices and serve it to clients via REST endpoints.
Devices need to be registered before they can send data to API.

**API has been updated to accept only HTTPS requests.**

### **REST API**

REST API documentation can be found [here](https://documenter.getpostman.com/view/1909663/6fVW5LF?0=o&1=n&2=b&3=o&4=a&5=r&6=d&7=i&8=n&9=g&10=c&11=o&12=m&13=p&14=l&15=e&16=t&17=e&version=latest)

### **Socket.io**

Connection to socket.io is done at [https://www.terasyshub.io/](https://www.terasyshub.io/)

#### Listen Events

To obtain data from socket.io, you must set it to listen to the type of data you want returned. In this case either `temperature` or `humidity` as these are the only ones we have implemented so far.

To get get data from the API, there are two methods:

#### Polling at intervals

Using this method, it is possible to manually set an interval in the frontend at which to poll the API for data.
To do so, emit the event `getData` to socket.io. The data to provide is as follows:

```JSON
{
  "mac" : "00:0a:95:9d:68:16",
  "type" : "temperature",
  "last" : 1487868693,
  "token" : {{authtoken}}
}
```

`mac` is the mac address of the device to get data for

`type` is the type of data to be returned

`last` optional field. Determines up to what time to pull results from. Leave blank to return latest datapoint.

Data is returned as it would be from the REST endpoint.

#### Registering to database updates

This method returns data to the `temperature` and `humdity` events as soon as data is saved in the database.

To be updated whenever data for a device is saved in the DB, simply send the mac address of the device to the `register` listener like so:

```JS
socket.emit('register', {device:'00:0a:95:9d:68:16', token:'{{authtoken}}'});
```

To stop listening for updates for a device, simply `unregister` from the device:

```JS
socket.emit('unregister', '00:0a:95:9d:68:16');
```

## Webhook Api documentation

#### There are four endpoints that recieves a post request in this sprint namely:

- **/api/webhook-obd2**: this endpoint recieves a **post** request from the webhook and persist the data in a mongo db there after sending a response status of **200** back to the webhook

- **/api/events/message**: this is the endpoint to retrieves all messages events (from most recent to oldest) relating to a particular account's asset and returns an array of message events along with pagination meta data.
  the endpoint recieves 4 input posts.

  (1) **AccountName (compulsory)**: this is the name of the account as registered by the webhook services provider in which it message events is required.

  (2) **limit(optional)**: the number of most recent events required.

  (3) **offset(optional)**: the number of data to skip when querying.

  (4) **asset(compulsory)**: serial number of the asset which event is required

- **/api/events/track**: this is the endpoint to retrieves all track events (from most recent to oldest) relating to a particular account's asset and returns an array of presence events along with pagination meta data.
  the endpoint recieves 4 input posts.

  (1) **AccountName (compulsory)**: this is the name of the account as registered by the webhook services provider in which it track events is required.

  (2) **limit(optional)**: the number of most recent events required.

  (3) **offset(optional)**: the number of data to skip when querying.

  (4) **asset(compulsory)**: serial number of the asset which event is required

- **/api/events/presence**: this is the endpoint to retrieves all presence events (from most recent to oldest) relating to a particular account's asset and returns an array of presence events along with pagination meta data.
  the endpoint recieves 4 input posts.

  (1) **AccountName (compulsory)**: this is the name of the account as registered by the webhook services provider in which it track events is required.

  (2) **limit(optional)**: the number of most recent events required.

  (3) **offset(optional)**: the number of data to skip when querying.

  (4) **asset(compulsory)**: serial number of the asset which event is required

## Run the API as a docker container

A docker stack for production env

## dependencies

Ensure these are installed before going further:

- docker@\^18.05.0-ce
- docker-compose@^1.21.2

## production

### 0. setup

    create config.js file and populate appropriately using the configsample.js file

### 1. run

- `docker-compose up -d`
  You can begin editing code on your host machine, changes will be detected and all relevant processes restarted or live-reloaded inside their containers.

### 2. inspect

- `docker-compose ps` (print status)
- `docker-compose logs service-name(e.g api or mongo)` (attaches to logs of one or more services)

### 3. run

go to your /etc/hosts and map your ip to api.terasys.com
`127.0.0.1 app.terasys.com` to view it on your browser.
