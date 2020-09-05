Like = React.createClass({

  getInitialState: function(){
      return {
          counts: 0,         //いいねの合計数
          is_liked: false    //いいねされているかどうかの状態
      };
  },

  ajaxMain: function(){
      console.log("hello world!");
  }

  render( function(){
      return(
        <button onClick={this.ajaxMain}>いいね!</button>
      );
  });
});Like = React.createClass({

  getInitialState: function(){
      return {
          counts: 0,         //いいねの合計数
          is_liked: false    //いいねされているかどうかの状態
      };
  },

  ajaxMain: function(){
      console.log("hello world!");
  }

  render: function(){
      return(
        <button onClick={this.ajaxMain}>いいね!</button>
      );
  }
});