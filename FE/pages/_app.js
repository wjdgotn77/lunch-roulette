import "../styles/global.css";
import ResApp from "../src/App.mjs";

import Head from "next/head";

export default function App(props) {
  return (
    <>
      <Head>
        {/* Viewport는 _app.js에 선언되어야 한다 - by Next (https://nextjs.org/docs/messages/no-document-viewport-meta) */}
        <meta
          name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0"
        />
      </Head>
      <ResApp {...props} />
    </>
  );
}
