<link rel="import" type="template" href="@/templates/html-head.html" />
<link rel="import" type="component" href="@/components/panel-layout.html" />
<link rel="import" type="component" href="@/components/code-snippet.html" />
<link rel="import" type="component" href="@/components/code-preview.html" />
<link rel="import" type="component" href="@/components/window-app.html" />
<link rel="import" type="component" href="@/components/tweet-box.html" />
<style>
  .section-hero {
    background-color: var(--bg-first);
    padding: 40px 0;
    text-align: center;
    width: 100%;
  }
  .section-hero img {
    height: 100px;
  }
  .section-hero h1 {
    font-size: 40px;
  }
  .section-hero p {
    font-size: 30px;
    padding: 30px 0;
  }
  .section-sample {
    margin: auto;
    max-width: 960px;
    padding: 0 20px;
  }
  .section-sample p {
    padding: 20px;
    text-align: center;
  }

  .section-bullets {
    background-color: var(--bg-first);
    margin: auto;
    padding: 40px 20px;
    text-align: center;
  }
  .section-bullets ul {
    align-items: center;
    display: flex;
    justify-content: center;
    list-style: none;
    padding: 0;
    text-align: center;
  }
  .section-bullets li {
    width: calc(33.33%-20px);
    margin: 10px;
    max-width: 300px;
  }
  .section-bullets li h3 {
    margin-bottom: 20px;
    text-transform: uppercase;
  }
  .section-bullets li p {
    font-size: 16px;
    line-height: 26px;
  }

  .section-interactive {
    margin: auto;
    max-width: 960px;
    padding: 40px 20px;
  }
  .section-interactive h3 {
    margin-top: 40px;
    margin-bottom: 20px;
    text-align: center;
    text-transform: uppercase;
  }
  .section-interactive p {
    font-size: 16px;
    line-height: 26px;
    margin-bottom: 20px;
    text-align: center;
  }

  .section-servers {
    background-color: #CCCCCC;
    margin: auto;
    padding: 40px 20px;
    text-align: center;
  }
  .section-servers h3 {
    color: #242424;
    font-size: 30px;
    text-transform: uppercase;
  }
  .section-servers div {
    align-items: center;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin: 40px auto 0;
    max-width: 960px;
  }
  .section-servers a {
    display: block;
    flex-basis: 33%;
    margin-bottom: 20px;
  }
  .section-servers img {
    height: 60px;
  }

  .section-testimonials {
    background-color: var(--bg-first);
    margin: auto;
    padding: 40px 20px;
  }
  .section-testimonials h3 {
    font-size: 26px;
    text-align: center;
  }
  .section-testimonials > section {
    display: flex;
    flex-wrap: wrap;
  }
  .section-testimonials tweet-box {
    flex-basis: 33%;
  }

  .section-action {
    margin: auto;
    padding: 40px 20px;
    text-align: center;
  }
  .section-action h3 {
    font-size: 26px;
    margin-bottom: 20px;
  }

  @media (max-width: 960px) {
    .section-testimonials tweet-box {
      flex-basis: 50%;
    }
  }

  @media (max-width: 767px) {
    .section-bullets ul {
      display: block;
    }
    .section-bullets li {
      margin: 10px auto 40px;
    }
    .section-servers div {
      display: block;
    }
    .section-testimonials tweet-box {
      flex-basis: 100%;
    }
  }
</style>
<script>
  //This is ran on both the server and the browser
  //There is no signal, children prop here because 
  //this is not a component.
  //
  //We also need to becareful with importing browser 
  //scripts here. You should do that in the <head>
  //instead.
  import '@shoelace-style/shoelace/dist/components/button/button';
  import snippets from '@/modules/snippets/home';
  const url = '/';
  const title = 'Ink - The reactive web component template engine.';
  const description = 'Ink is a template engine hat generates web components and support reactivity.';
  const show = (e) => {
    e.detail.target.classList.remove('loading');
  };
</script>
<html>
  <html-head />
  <body class="dark">
    <panel-layout mount=show class="loading" {url} head>
      <section class="section-hero">
        <img src="/ink/ink-icon.png" alt="Ink Logo" />
        <h1>Ink</h1>
        <p>The reactive web component template engine.</p>
        <sl-button variant="primary" size="large" style="margin-right:10px;" href="/ink/docs/get-started">
          Get Started
        </sl-button>
        <sl-button variant="success" size="large" href="/ink/docs">
          Read the Docs
        </sl-button>
      </section>
      <section class="section-sample">
        <p>
          Ink is a modern HTML markup language and a server first 
          template engine with a built-in parser/compiler that 
          generates web components and supports reactivity.
        </p>
        <window-app title="Basic Example">
          <div class="snippet-preview">
            <code-snippet>{snippets.basic}</code-snippet>
            <code-preview>
              <div>
                <h1>Hello world!</h1>
              </div>
            </code-preview>
          </div>
        </window-app>
      </section>
      <section class="section-bullets">
        <ul>
          <li>
            <h3>Expressive Markup</h3>
            <p>
              Any data type as attributes. Easily express logic with 
              markup directives like if, each, and try catch. 
            </p>
          </li>
          <li>
            <h3>Reactive Signals</h3>
            <p>
              Easily transition from backend logic to reactive states.
              No Hydration and no memoization needed.
            </p>
          </li>
          <li>
            <h3>Bare Metal</h3>
            <p>
              Work with the DOM directly. Import any web components 
              from any source. Works with Lit, HTMX.
            </p>
          </li>
        </ul>
      </section>
      <section class="section-interactive">
        <h3>Server Setup</h3>
        <p>
          Ink can be used with popular server 
          frameworks in just a few lines of code.
        </p>
        <window-app title="Server Example">
          <code-snippet lang="javascript">{snippets.server}</code-snippet>
        </window-app>

        <h3>Props</h3>
        <p>Import your component props and use immediately</p>
        <window-app title="Props Example">
          <div class="snippet-preview">
            <code-snippet>{snippets.props}</code-snippet>
            <code-preview>
              <div>
                <h1>Hello world!</h1>
              </div>
            </code-preview>
          </div>
        </window-app>

        <h3>Reactive Signals</h3>
        <p>Use signals to manage state changes and re-renders.</p>
        <window-app title="Signal Example">
          <div class="snippet-preview">
            <code-snippet>{snippets.signal}</code-snippet>
            <code-preview>
              <div>
                <h1>Hello world!</h1>
              </div>
            </code-preview>
          </div>
        </window-app>

        <h3>Components and Templates</h3>
        <p>Import components and templates for reusability.</p>
        <window-app title="Import Example">
          <div class="snippet-preview">
            <code-snippet>{snippets.imports}</code-snippet>
            <code-snippet>{snippets.heading}</code-snippet>
          </div>
        </window-app>

        <h3>Conditionals and Iterations</h3>
        <p>
          Case for conditions and iterations in an expressive way.
        </p>
        <window-app title="Conditional + Iteration Example">
          <div class="snippet-preview">
            <code-snippet>{snippets.conditional}</code-snippet>
            <code-snippet>{snippets.each}</code-snippet>
          </div>
        </window-app>
      </section>
      <section class="section-servers">
        <h3>Works With Popular Server Frameworks</h3>
        <div>
          <a href="https://expressjs.com/" target="_blank">
            <img src="https://upload.wikimedia.org/wikipedia/commons/6/64/Expressjs.png" alt="Express" />
          </a>
          <a href="https://fastify.dev/" target="_blank">
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/0a/Fastify_logo.svg" alt="Fastify" />
          </a>
          <a href="https://hapi.dev/" target="_blank">
            <img src="https://raw.githubusercontent.com/hapijs/assets/master/images/hapi.png" alt="Hapi" />
          </a>
          <a href="https://koajs.com/" target="_blank">
            <img src="https://cdn.icon-icons.com/icons2/2699/PNG/512/koajs_logo_icon_168379.png" alt="Koa" />
          </a>
          <a href="https://nestjs.com/" target="_blank">
            <img src="https://cdn.icon-icons.com/icons2/2699/PNG/512/nestjs_logo_icon_169927.png" alt="NestJS" />
          </a>
          <a href="http://restify.com/" target="_blank">
            <img src="https://raw.githubusercontent.com/restify/node-restify/gh-images/logo/png/restify_logo_black_transp_288x288.png?raw=true" alt="Restify" />
          </a>
        </div>
      </section>
      <section class="section-testimonials">
        <h3>Ink Loves Developers!</h3>
        <section>
          <tweet-box name="Joff Tiquez" handle="@jrtiquez" href="https://twitter.com/jrtiquez" src="https://github.com/jofftiquez.png">
            <p>
              Im a vue developer. No need for this. OSSPH does not support this project.
            </p>
          </tweet-box>
          <tweet-box name="Primeagen" handle="@theprimeagen" href="https://twitter.com/ThePrimeagen" src="https://pbs.twimg.com/profile_images/1759330620160049152/2i_wkOoK_400x400.jpg">
            <p>Ink? Never heard of it...<br />"The Name..."</p>
          </tweet-box>
          <tweet-box name="Kristian Quirapas" handle="@YourCompanyCTO" href="https://twitter.com/YourCompanyCTO" src="https://avatars.githubusercontent.com/u/85150796?v=4">
            <p>
              Ink is good news for Node developers. I'm a rust developer so it don't matter to me.
            </p>
          </tweet-box>
          <tweet-box name="Drizzle Team" handle="@drizzle.team" href="https://twitter.com/DrizzleORM" src="https://pbs.twimg.com/profile_images/1767809210060877824/mAtEmNk0_400x400.jpg">
            <p>
              Ink copied this section from us. We are the original.
            </p>
          </tweet-box>
          <tweet-box name="Chris B" handle="@cblanquera" href="https://twitter.com/cblanquera" src="https://avatars.githubusercontent.com/u/120378?v=4">
            <p>
              After creating the Ink project, I am really excited to get back to ReactJS.
            </p>
          </tweet-box>
          <tweet-box name="Theo" handle="@t3dotgg" href="https://twitter.com/t3dotgg" src="https://yt3.googleusercontent.com/4NapxEtLcHQ6wN2zA_DMmkOk47RFb_gy6sjSmUZGg_ARHjlIUjFsrNFddrcKMkTYpBNxCp3J=s160-c-k-c0x00ffffff-no-rj">
            <p>
              Ink? no thanks. Keep your stack front end. App router for life.
            </p>
          </tweet-box>
        </section>
      </section>
      <section class="section-action">
        <h3>What are you waiting for?</h3>
        <sl-button variant="primary" size="large" style="margin-right:10px;" href="/ink/docs/get-started">
          Get Started
        </sl-button>
        <sl-button variant="success" size="large" href="/ink/docs">
          Read the Docs
        </sl-button>
      </section>
    </panel-layout>
  </body>
</html>