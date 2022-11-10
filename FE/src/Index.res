@module("../public/MainHeaderImg.svg") external mainHeaderImg: string = "default"
@module("../public/MainBottomBtnImg.png") external mainBottomBtnImg: string = "default"

module Image = {
  @module("next/image") @react.component
  external make: (~src: string, ~width: int, ~height: int) => React.element = "default"
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
    <Image src=mainHeaderImg width=276 height=255 />
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
        <button type_="submit">
          <Image src=mainBottomBtnImg width=219 height=219 />
        </button>
      </form>
    </div>
  </div>
}
