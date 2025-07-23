const express = require('express');
const http = require('http');
const socketio = require('socket.io');
const mongoose = require("mongoose");
const Room = require('./models/room');
const app = express();
const PORT = process.env.PORT || 3001;
const DB = "mongodb+srv://abdulhadi4it:Qwen.1234@cluster0.6oxg9q5.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
mongoose.connect(DB).then(() => console.log('MongoDB connected')).catch(err => console.error('MongoDB connection error:', err));

var server = http.createServer(app);
var io = socketio(server);

io.on('connection', (socket) => {
    console.log('New client connected');
    socket.on('createRoom', async ({ nickname }) => {
        console.log('createRoom event received with nickName:', nickname);
        let room = new Room();
        let player = {
            nickname: nickname,
            socketId: socket.id,
            playerType: 'X',
        };
        room.players.push(player);
        room.turn = player;
        room = await room.save();
        const roomId = room._id.toString();
        socket.join(roomId);
        io.to(roomId).emit('roomCreated', room);
        console.log(`Room created with ID: ${roomId}`);
    });
    socket.on('disconnect', () => {
        console.log('Client disconnected');
    });
    socket.on('joinRoom', async ({ roomId, nickname }) => {
        console.log('joinRoom event received with roomId:', roomId, 'and nickname:', nickname);
        try {
            if (!roomId.match(/^[0-9a-fA-F]{24}$/)) {
                socket.emit('error', 'Invalid room ID format');
                return;
            }
            let room = await Room.findById(roomId);
            if (room.isJoin) {
                let player = {
                    nickname: nickname,
                    socketId: socket.id,
                    playerType: 'O',
                };
                room.players.push(player);
                room.isJoin = false;
                room = await room.save();
                socket.join(roomId);
                io.to(roomId).emit('roomJoined', room);
                io.to(roomId).emit('updatePlayersData', room.players);
                console.log(`Player ${nickname} joined room with ID: ${roomId}`);
            } else {
                socket.emit('error', 'Room is not joinable');

                return;
            }
        } catch (e) {

        }
    });
});

app.use(express.json());

server.listen(PORT, '0.0.0.0', () => console.log('server started on, ', PORT));