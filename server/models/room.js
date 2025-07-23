const mongoose = require("mongoose");
const playersSchema = require("./players");

const roomSchema = new mongoose.Schema({
    occupancy:{
        type: Number,
        default: 2,
    },
    maxRounds:{
        type: Number,
        default: 5,
    },
    currentRound:{
        required: true,
        type: Number,
        default: 1,
    },
    players: [
      playersSchema
    ],
    isJoin:{
        type: Boolean,
        default: true,
    },
    turn:playersSchema,
    turnIndex:{
        type: Number,
        default: 0,
    },
});
const roomModel = mongoose.model('Room', roomSchema);
module.exports = roomModel;
