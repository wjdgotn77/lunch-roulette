type pageProps

module PageComponent = {
  type t = React.component<pageProps>
}

type props = {
  @as("Component")
  component: PageComponent.t,
  pageProps: pageProps,
}

let default = (props: props): React.element => {
  let {component, pageProps} = props

  let content = React.createElement(component, pageProps)

    <div>
      <h1 className="font-bold text-red-500" > {React.string("런치런치")} </h1>
      <div className="italic font-bold text-orange-300"> content </div>
    </div>
}