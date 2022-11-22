module Error = {
  @module("next/error") @react.component
  external make: (~statusCode: int, ~children: React.element) => React.element = "default"
}

// https://nextjs.org/docs/api-reference/next/image
module Image = {
  type loaderOptions = {
    src: string,
    width: float,
    quality: float,
  }
  @module("next/image") @react.component
  external make: (
    ~alt: string=?,
    ~blurDataURL: string=?,
    ~placeholder: [#blur | #empty]=?,
    ~className: string=?,
    ~height: int=?,
    ~layout: [#fixed | #intrinsic | #responsive | #fill]=?,
    ~loader: loaderOptions => string=?,
    ~loading: [
      | #"lazy"
      | #eager
    ]=?,
    ~priority: bool=?,
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

module Link = {
  @module("next/link") @react.component
  external make: (
    ~_as: string=?,
    ~children: React.element,
    ~className: option<string>=?,
    ~href: string,
    ~passHref: option<bool>=?,
    ~prefetch: bool=?,
    ~replace: option<bool>=?,
    ~shallow: option<bool>=?,
  ) => React.element = "default"
}
