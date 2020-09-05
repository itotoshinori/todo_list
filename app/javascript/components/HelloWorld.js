import React from "react"
import PropTypes from "prop-types"
import * as FooBar from "./FooBar"
var today = new Date();
var todayDay = today.getMonth() + 1
var dayOfWeek = today.getDay() ;
var dayOfWeekStr = [ "日", "月", "火", "水", "木", "金", "土" ][dayOfWeek] ;
class HelloWorld extends React.Component {
    constructor( props )
  {
    super( props );
    this.state = { isPubleshed: true }
    this.state = { count: 0 }
    this.statePrice = { price: 3280 }
  }

  render () {
    let thisday = today.getFullYear() + "年" + todayDay   + "月"+ today.getDate()  + "日"
    return (
      <React.Fragment>
        
        本日は{ thisday }({dayOfWeekStr})です
        
      </React.Fragment>
      
    );
  }
}

HelloWorld.propTypes = {
  greeting: PropTypes.string
};
export default HelloWorld
