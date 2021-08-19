import {BrowserRouter as Router, Route, Link} from 'react-router-dom';

import logo from './logo.svg';
import './App.css';
import OtherPage from "./OtherPage";
import Fib from "./Fib";

function App() {
  return (
      <Router>
        <div className="App">
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
            <h1>Fib calculator v2</h1>
            <p>
              Scroll down ----->
            </p>
            <Link to="/">Home</Link>
            <Link to="/otherpage">Other page</Link>
          </header>
            <br />
          <Route exact path="/" component={Fib} />
          <Route path="/otherpage" component={OtherPage} />
        </div>
      </Router>
  );
}

export default App;
