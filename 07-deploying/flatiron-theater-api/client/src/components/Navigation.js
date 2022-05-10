import {Link} from "react-router-dom";

function Navigation({cart, setIsAuthenticated, setUser, user}) {
    console.log(user)
    const logout = () => {
        fetch('/logout',{
            method:'DELETE'
        })
        .then(()=>{
            setIsAuthenticated(false)
            setUser(null)
        })
    }
    return (
        <> 
   
         <h1>Flatiron Theater Company</h1>
         <div>
            <button onClick={logout}>Logout</button>
           <h1><Link to="/"> Home</Link></h1>
           {user&&user.admin?<h1><Link to="/productions/new">New Production</Link></h1>:null}

         </div>

        </>
    )
}

export default Navigation;