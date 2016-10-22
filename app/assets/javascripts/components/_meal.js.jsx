var Meal = React.createClass({
  getInitialState() {
    return { editable: false };
  },

  handleEdit() {
    if(this.state.editable) {
      var name = this.refs.name.value;
      var id = this.props.meal.id;
      var meal = {id: id, name: name};
      this.props.handleUpdate(meal);
    }

    this.setState({ editable: !this.state.editable })
  },

  render() {
    var name = this.state.editable ? <input type='text' ref='name' defaultValue={this.props.meal.name} /> : <h3>{this.props.meal.name}</h3>;

    return (
      <div>
        {name}
        <button onClick={this.props.handleDelete}> Delete </button>
        <button onClick={this.handleEdit}> {this.state.editable ? 'Submit' : 'Edit' } </button>
      </div>
    )
  }
});
