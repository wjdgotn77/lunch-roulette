@module("../../public/loading-burger.png") external burgerImage: string = "default"

module Image = {
  @module("next/image") @react.component
  external make: (
    ~alt: string=?,
    ~className: string=?,
    ~height: int=?,
    ~layout: [#fixed | #intrinsic | #responsive | #fill]=?,
    ~loading: [
      | #"lazy"
      | #eager
    ]=?,
    ~objectFit: [
      | #fill
      | #contain
      | #cover
      | #none
      | #"scale-down"
    ]=?,
    ~objectPosition: string=?,
    ~quality: float=?,
    ~sizes: string=?,
    ~src: string,
    ~unoptimized: bool=?,
    ~width: int=?,
  ) => React.element = "default"
}

@react.component
let default = () => {
  <div className="w-100% h-screen flex flex-col items-center bg-gray2">
    <h1 className="loading-stroke pt-24 text-5xl text-primary whitespace-pre-wrap font-bold">
      {React.string("점심 메뉴\n찾는 중 ...")}
    </h1>
    <Image src=burgerImage width=214 height=214 className="pt-36" alt="loading..."/>
  </div>
}
