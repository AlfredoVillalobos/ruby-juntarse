// import React from 'react';

// class App extends React.Component {
//   render (){
//     return (
//       <div>
//         hola
//       </div>
//     )
//   }
// }
// export default App;

// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';
import Navigation from './components/Navigation/Navigation'

const Hello = props => (
  <div>Hello {props.name}!</div>
)


Hello.defaultProps = {
  name: 'David'
}

Hello.propTypes = {
  name: PropTypes.string
}

document.addEventListener('DOMContentLoaded', () => {


  const node = document.getElementById('sports');
  const dataSports = JSON.parse(node.getAttribute('data-sports'));
  const dataLogoImagePath = node.getAttribute('data-logo-image-path');
  const dataEditProfilePagesPath = node.getAttribute('data-edit-profile-pages-path');

  //console.log(dataLogoImagePath);

  ReactDOM.render(
    <Navigation 
      logo_image_path={dataLogoImagePath}
      edit_profile_pages_path={dataEditProfilePagesPath}
    />,
    document.body.appendChild(document.createElement('div'))
  )
})
