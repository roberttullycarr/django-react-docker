import logo from './logo.svg';
import './App.css';
import {useState, useEffect} from 'react';

function App() {
  const [data, setData] = useState(null);
  const url = 'http://188.166.84.114/backend/todos/';

  console.log('data :>> ', data);
  console.log('url :>> ', url);

  // useEffect(() => {
  //   fetch(url)
  //     .then(res => res.json())
  //     .then(responseData => setData(responseData));
  // }, [])


  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        {/* <h1>An Awesome Blog </h1> */}
        <h3>On Django, React, Postgres, and Docker </h3>

        {
          data && data.map((todo) => (
            <div style={{display: "flex", gap: "1em"}}>
              <span>{todo.id}</span>
              <span>{todo.description}</span>
            </div>
          ))
        }
      </header>
    </div>
  );
}

export default App;