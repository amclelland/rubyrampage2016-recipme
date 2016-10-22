var Body = React.createClass({
  getInitialState() {
    return { meals: [] }
  },

  componentDidMount() {
    $.getJSON('/api/meals.json', (response) => { this.setState({ meals: response }) });
  },

  handleDelete(id) {
    $.ajax({
      url: `/api/meals/${id}`,
      type: 'DELETE',
      success:() => {
       this.removeMealClient(id);
      }
    });
  },

  removeMealClient(id) {
    var newMeals = this.state.meals.filter((meal) => {
      return meal.id != id;
    });

    this.setState({ meals: newMeals });
  },

  handleUpdate(meal) {
    $.ajax({
      url: `/api/meals/${meal.id}`,
      type: 'PUT',
      data: { meal: meal },
      success: () => {
        this.updateMeals(meal);
      }
    }
  )},

  updateMeals(meal) {
    var meals = this.state.meals.filter((i) => { return i.id != meal.id });
    meals.push(meal);

    this.setState({meals: meals });
  },

  handleSubmit(meal) {
    var newState = this.state.meals.concat(meal);
    this.setState({ meals: newState })
  },

  render() {
    return (
      <div>
        <NewMeal handleSubmit={this.handleSubmit}/>
        <AllMeals meals={this.state.meals} handleDelete={this.handleDelete} onUpdate={this.handleUpdate}/>
      </div>
    )
  }
});
