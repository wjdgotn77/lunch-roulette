@module("../public/MainHeaderImg.svg") external mainHeaderImg: string = "default"
@module("../public/MainBottomBtnImg.png") external mainBottomBtnImg: string = "default"

// 1. Response 를 module 로 정의
module Response = {
  type t<'data>
  @send external json: t<'data> => Promise.t<'data> = "json"
}

// 2. Test 라는 fetch 로직을 수행하는 모듈을 생성.
module Test = {
  // 2 - 1. fetch 받아오는 data 의 타입을 정의하고 전역에서? 사용되는 fetch("string") 의 형태를 만들어주는듯..?
  type t = {id: int, name: string, year: string, color: string}
  @val @scope("globalThis")
  external fetch: string => Promise.t<Response.t<{"data": Js.Nullable.t<array<t>>}>> = "fetch"

  // 2 - 2. 실제 data fetching 로직은 아래.
  // 원래 쓰던 fetch 와 동일하게 api를 호출하고 Promise를 반환.
  // 아마도 rescript는 undefined가 없기 때문에 switch 문으로 data가 있을 때는 data를 없을 때는 데이터가 빈 array를 넘겨주도록 하는듯.
  // resolve일 때와 error일 때를 getTest 안에 작성.
  let getTest = () => {
    open Promise
    fetch("https://reqres.in/api/products")
    ->then(res => {
      res->Response.json
    })
    ->then(data => {
      // 위 api 주소에서 불러오는 데이터 구조는 아래처럼 data 로 depth 가 하나 더 있음.
      // 이것 때문에 우리가 예시로 긁어와서 썼을 때 data 구조가 다르니까... 안돌아간다고 생각하게 된듯..합니다..
      // 그래서 ["data"] key 를 사용하는데 .. 음 이건 패트릭이 api 어케 넘겨주느냐에 따라 다른듯 ㅠ
      // 그런데 여기서 어떻게 ["data"] key를 사용하지 않고 우리가 원하는 구조로 받을 수 있을지는 더 봐야알 수 있을 것 같습니다.
      //{"page":1,"per_page":6,"total":12,"total_pages":2,
      //"data":[{"id":1,"name":"cerulean","year":2000,"color":"#98B2D1","pantone_value":"15-4020"}],
      //"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}
      let ret = switch Js.Nullable.toOption(data["data"]) {
      | Some(data) => data
      | None => []
      }
      Ok(ret)->resolve
    })
    ->catch(e => {
      let msg = switch e {
      | JsError(err) =>
        switch Js.Exn.message(err) {
        | Some(msg) => msg
        | None => ""
        }
      | _ => "Unexpected error occurred"
      }
      Error(msg)->resolve
    })
  }
}

// 없으면 에러남. 위에 catch 일 때 발생하는 것일듯..? 몰라요 ㅠ... 더 찾아보겠습니다..
exception FailedRequest(string)

// 3. 실제 데이터 페칭을 해서 log에 찍어주는 로직은 아래.
// Test module 내에 만들어둔 getTest를 호출해서 사용.
// 깊은 이해는 ... 조금 나중으로 미룰게요 .. 일단 돌아간다 ..
let _ = {
  open Promise
  Test.getTest()
  ->Promise.then(result => {
    switch result {
    | Ok(products) =>
      Belt.Array.forEach(products, p => {
        Js.log(`${Belt.Int.toString(p.id)}, ${p.name}, ${p.year}, ${p.color} `)
      })
    | Error(msg) => Js.log("Could not query products: " ++ msg)
    }->resolve
  })
  ->catch(e => {
    switch e {
    | FailedRequest(msg) => Js.log("Operation failed! " ++ msg)
    | _ => Js.log("Unknown error")
    }
    resolve()
  })
}

type values = {
  place: string,
  category: string,
}

let initialState: values = {
  place: "",
  category: "",
}

type actions = UpdatePlaceValue(string) | UpdateCategoryValue(string)

let reducer = (state, action) => {
  switch action {
  | UpdatePlaceValue(newValue) => {
      ...state,
      place: newValue,
    }
  | UpdateCategoryValue(newValue) => {
      ...state,
      category: newValue,
    }
  }
}

@react.component
let default = () => {
  let (state, dispatch) = React.useReducer(reducer, initialState)

  let handleChange = e => {
    let newValue = ReactEvent.Form.target(e)["value"]
    let name = ReactEvent.Form.target(e)["name"]

    if name === "place" {
      newValue->UpdatePlaceValue->dispatch
    } else {
      newValue->UpdateCategoryValue->dispatch
    }
  }

  let handleSubmit = e => {
    e->ReactEvent.Synthetic.preventDefault
    Js.log(state)
  }

  <div className="bg-primary h-screen flex flex-col justify-center items-center">
    <Next.Image src=mainHeaderImg width=276 height=255 alt="main header img" />
    <div className="flex justify-center">
      <form className="flex flex-col w-64" onSubmit=handleSubmit>
        <label className="text-base pb-1"> {"어디서 드시나요"->React.string} </label>
        <select
          className="mb-8 h-12 rounded-md pl-2.5"
          name="place"
          value={state.place}
          required={true}
          onChange=handleChange>
          <option value=""> {"장소 선택하기"->React.string} </option>
          <option value="배달"> {"배달"->React.string} </option>
          <option value="외식"> {"외식"->React.string} </option>
        </select>
        <label className="text-base pb-1"> {"음식분류"->React.string} </label>
        <select
          className="mb-8 h-12 rounded-md pl-2.5"
          name="category"
          value={state.category}
          required={true}
          onChange=handleChange>
          <option value=""> {"음식종류 선택하기"->React.string} </option>
          <option value="한식"> {"한식"->React.string} </option>
          <option value="중식"> {"중식"->React.string} </option>
          <option value="일식"> {"일식"->React.string} </option>
          <option value="양식"> {"양식"->React.string} </option>
          <option value="샐러드"> {"샐러드"->React.string} </option>
        </select>
        <div />
        <button className="flex justify-center" type_="submit">
          <Next.Image src=mainBottomBtnImg width=219 height=219 alt="main button" />
        </button>
      </form>
    </div>
  </div>
}
