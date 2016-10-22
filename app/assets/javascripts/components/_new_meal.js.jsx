var NewMeal= React.createClass({
  handleClick() {
    var name = this.refs.name.value;

    console.log('The name value is ' + name);
    $.ajax({
      url: '/api/meals',
      type: 'POST',
      data: { meal: { name: name } },
      success: (meal) => {
        this.props.handleSubmit(meal);
      }
    });
  },

  render() {
    return (
      <div>
        <input ref='name' placeholder='Enter the name of the meal' />
        <button onClick={this.handleClick}>Submit</button>
      </div>
    )
  }
});
