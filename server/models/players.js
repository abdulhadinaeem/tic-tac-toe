const mongoose = require("mongoose");

const playersSchema = new mongoose.Schema({
    nickname:{
        type: String,
        required: true,
    },
    socketId:{
        type: String,
     
    },
    points:{
        type: Number,
        default: 0,
    },
    playerType:{
        type: String,
        required: true,
        enum: ['X', 'O'],
        default: 'X',
    },
});

module.exports = playersSchema;