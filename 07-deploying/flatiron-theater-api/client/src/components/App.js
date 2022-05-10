import { Route, Switch } from "react-router-dom";

import {useEffect, useState} from 'react'
import ProductionContainer from './ProductionContainer'
import ProductionForm from './ProductionForm'
import Navigation from './Navigation'
import ProductionDetail from './ProductionDetail'
import Auth from './Auth'
import Login from './LogIn'

function App() {
  const [productions, setProductions] = useState([])
  const [errors, setErrors] = useState(false)
  const [cart, setCart] = useState([])

  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [user, setUser] = useState(null);

  useEffect(() => {
    fetch('/authorized_user')
    .then((res) => {
      if (res.ok) {
        res.json()
        .then((user) => {
          setIsAuthenticated(true);
          setUser(user);
        });
      }
    });

    fetch('/productions')
    .then(res => res.json())
    .then(setProductions);

  },[]);

  function handlePost(obj){
      fetch('/productions',{
        method:'POST',
        headers: {'Content-Type': 'application/json'},
        body:JSON.stringify(obj)
      })
      .then(res => res.json())
      .then(data => {
        if(data.errors){
          setErrors(data.errors)
        } else {
          setProductions([...productions,data])
        }
      })
  }

  // Reroute user to <Login /> Component if not authenticated
  if (!isAuthenticated) return <Login error={'please login'} setIsAuthenticated={setIsAuthenticated} setUser={setUser} />;

  return (
    <>
    <Navigation cart={cart} setIsAuthenticated={setIsAuthenticated} setUser={setUser} user={user}/>
    <Switch>
    <Route exact path="/">
      <ProductionContainer productions={productions}/>
    </Route>
    <Route exact path="/productions/new">
      <ProductionForm handlePost={handlePost} errors={errors} />
    </Route>
    <Route exact path="/productions/:id">
        <ProductionDetail cart={cart} setCart={setCart}/>
    </Route>
    <Route path="/sign_up">
          <Auth />
    </Route>
    <Route path="/login">
          <Login />
    </Route>
    </Switch>
    </>
  );
}

export default App;
