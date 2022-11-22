@module("../../public/red-hand.png") external skipHand: string = "default"
@module("../../public/blue-hand.png") external ddabongHand: string = "default"
@module("../../public/kimbap.jpg") external kimbap: string = "default"

type dataType = {
  id: int,
  name: string,
  price: string,
  menu_type: string,
  created_at: string,
}

let data = [
  {id: 0, name: "김밥", price: "4000", menu_type: "한식", created_at: "2022-01-11"},
  {id: 1, name: "불고기", price: "12000", menu_type: "한식", created_at: "2022-11-10"},
  {id: 2, name: "김치", price: "12000", menu_type: "한식", created_at: "2022-11-10"},
  {id: 3, name: "밥", price: "12000", menu_type: "한식", created_at: "2022-11-10"},
  {id: 4, name: "햄버거", price: "12000", menu_type: "한식", created_at: "2022-11-10"},
]

module Window = {
  @scope("window") @val
  external alert: string => unit = "alert"
}

@react.component
let default = () => {
  let (count, setCount) = React.useState(_ => 0)

  let ddabongClickHandler = e => {
    e->ReactEvent.Synthetic.preventDefault
    Window.alert("맛점하세요 :)")
  }

  let skipClickHandler = e => {
    e->ReactEvent.Synthetic.preventDefault

    let length = data->Belt.Array.length
    let isLast = length === count + 1

    setCount(prev => {
      isLast ? 0 : prev + 1
    })

    if isLast {
      Window.alert("먹고 싶은 메뉴를 다시 돌려보세요 :(")
    }
  }

  <div className="w-100% h-screen flex flex-col items-center">
    <div className="w-80 h-5/6 bg-primary p-5 mt-8 rounded-lg">
      <h1 className="text-white text-2xl pb-2.5 font-bold"> {React.string(data[count].name)} </h1>
      <Next.Image src=kimbap objectFit=#cover width=283 height=183 alt="recommand menu" />
      <p className="text-gray pt-8 line-clamp-5"> {React.string(data[count].price ++ "원")} </p>
    </div>
    <div className="flex h-20">
      <button onClick=ddabongClickHandler>
        <Next.Image src=ddabongHand width=150 alt="good" />
      </button>
      <button onClick=skipClickHandler>
        <Next.Image src=skipHand width=150 alt="skip" />
      </button>
    </div>
  </div>
}
