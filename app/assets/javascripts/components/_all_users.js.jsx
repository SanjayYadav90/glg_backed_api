class UsersList extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      users: []
    };
  }
  componentDidMount(){
    fetch('/api/v1/users.json')
      .then((response) => {return response.json()})
      .then((data) => {this.setState({ users: data }) });
  }

  render(){

    var users = this.state.users.map((user) => {
      return(
       <div key={user.id}>
        <h1>{user.first_name}</h1>
        <p>{user.last_name}</p>
       </div>
      )
     })

  return(
    <div>
      {users}
    </div>
    )
  }
}