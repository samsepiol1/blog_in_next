import App from 'next/app'
import { ThemeProvider, createGlobalStyle } from 'styled-components'

const theme = {
  colors: {
    primary: 'royalblue',
  },
}

const GlobalStyle = createGlobalStyle`
  :root {
    --primary: royalblue;
  }
  * {
    font-family: sans-serif;
    color: #333;
    box-sizing: border-box;
  }
  
  html,
  body {
    margin: 0;
    padding: 0;
  }
  body {
    padding-left: 16px;
    padding-right: 16px;
    max-width: 700px;
    margin: auto;
    background:black;

  }
  img{
    max-width:1100px;
    max-height:600px;
    width: auto;
    height: auto;
    display:block;
  }
  h1,
  h2,
  h3,
  h4,
  h5,
  a {
    color: var(--primary);
  }
  button,
  a {
    transition: opacity .3s;
    &:focus,
    &:hover {
      opacity: .5;
    }
  }
  .postsContainer {
  }
  .postsContainer__post {
    a {
      font-weight: bold;
      text-decoration: none;
    }
  }
  .headerContainer {
    display: flex;
    align-items: center;
    padding-top: 16px;
    padding-bottom: 16px;
    margin-bottom: 32px;
  }
    h1 {
      margin:0;
    }
  }
`;

export default class MyApp extends App {
  render() {
    const { Component, pageProps } = this.props
    return (
      <ThemeProvider theme={theme}>
        <GlobalStyle />
        <Component {...pageProps} />
      </ThemeProvider>
    )
  }
}
