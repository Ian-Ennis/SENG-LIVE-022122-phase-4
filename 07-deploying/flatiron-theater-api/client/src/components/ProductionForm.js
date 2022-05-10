import React, { useState} from 'react'

function ProductionForm({handlePost, errors}) {
  const [formData, setFormData] = useState({
    title:'',
    genre:'',
    budget:'',
    image:'',
    director:'',
    description:''
  })


  function onSubmit(e){
    e.preventDefault()
    const production = {
      title: formData.title,
      genre: formData.genre,
      budget: formData.budget,
      image: formData.image,
      director: formData.director,
      description: formData.description,
      ongoing:true
    }
    handlePost(production)
  }
    return (
      <div className="App">
        {errors?errors.map(e => <div>{e}</div>):null}
       <form onSubmit={onSubmit}>
       <label>
          Title
          <input type="text" value={formData.title} onChange={(e) => setFormData({...formData, title: e.target.value})} />
        </label>
        <br/>
        <label>
        Genre
          <input type="text" value={formData.genre} onChange={(e) => setFormData({...formData, genre: e.target.value})} />
        </label>
        <br/>
        <label>
        Budget
          <input type="number" value={formData.budget} onChange={(e) => setFormData({...formData, budget: e.target.value})} />
        </label>
        <br/>
        <label>
        Image
          <input type="text" value={formData.image} onChange={(e) => setFormData({...formData, image: e.target.value})} />
        </label>
        <br/>
        <label>
        Director
          <input type="text" value={formData.director} onChange={(e) => setFormData({...formData, director: e.target.value})} />
        </label>
        <br/>
        <label>
        Description
          <textarea type="text" rows="4" cols="50" value={formData.description} onChange={(e) => setFormData({...formData, description: e.target.value})} />
        </label>
        <br/>
        <input type="submit" value="Submit Production" />
       </form>
      </div>
    );
  }
  
  export default ProductionForm;