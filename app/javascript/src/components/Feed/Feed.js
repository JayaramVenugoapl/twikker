import React, { Component } from "react";
import TweetBox from "./TweetBox/TweetBox";
import Post from "./Post/Post";
import FlipMove from "react-flip-move";

let classes = require("./Feed.module.scss");

export default class Feed extends Component {
  render() {
    return (
      <div className={classes.feed}>
        <div className={classes.feed_header}>
          <h2>Home</h2>
        </div>

        <TweetBox />

        <FlipMove>
          {Array(8)
            .fill()
            .map((_, i) => (
              <Post
                key={i}
                displayName={"Jayaram"}
                username={"Jayaram1"}
                verified={true}
                text="License: Trial; Language: Publisher: Adobe; OS: Windows 10 / 8 / 7 ... Adobe Illustrator CC is a trial vector design software app filed under "
                image="https://images.unsplash.com/photo-1554221475-4dc6adc7dc7e"
                avatar="https://images.unsplash.com/photo-1554221475-4dc6adc7dc7e?fit=crop&w=100&q=60"
              />
            ))}
        </FlipMove>
      </div>
    );
  }
}
