import React from 'react';

class Main extends React.Component
{
  render()
  {
    const items = [
      { name: '王', color: 'black', maingroup: '巨人' },
      { name: '長嶋', color: 'blue', maingroup: '巨人' },
      { name: '野村', color: 'orange', maingroup: '南海' },
      { name: '落合', color: 'green', maingroup: 'ロッテ' },
      { name: '山本浩', color: 'red', maingroup: '広島' },
      { name: '張本', color: 'black', maingroup: '東映' },
      { name: '谷澤', color: 'blue', maingroup: '中日' },
    ];

    const Member = ( { name, color, maingroup } ) => (
      <div>
        <p style={{ color }}>・選手名： {name}(主な球団:{maingroup})</p>
      </div>
    );

    return (
      <div className='main-wrapper'>
        <div className='main'>
          <p>球史に残る偉大なバッターリスト</p>
          {items.map( ( item ) => (
            <Member name={item.name} color={item.color} maingroup={item.maingroup} />
          ) )}
        </div>
      </div>
    );
  }
}

export default Main;