var AllMeals = React.createClass({
  handleDelete(id) {
    this.props.handleDelete(id);
  },

  onUpdate(meal) {
    this.props.onUpdate(meal);
  },

  render() {
    var meals= this.props.meals.map((meal) => {
      return (
        <div key={meal.id}>
          <Meal meal={meal}
            handleDelete={this.handleDelete.bind(this, meal.id)}
            handleUpdate={this.onUpdate}/>
        </div>
      )
    });

    return(
      <div>
        {meals}
      </div>
    )
  }
});
