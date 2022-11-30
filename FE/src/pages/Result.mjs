// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Caml_array from "rescript/lib/es6/caml_array.js";
import $$Image from "next/image";
import KimbapJpg from "../../public/kimbap.jpg";
import RedHandPng from "../../public/red-hand.png";
import BlueHandPng from "../../public/blue-hand.png";

var skipHand = RedHandPng;

var ddabongHand = BlueHandPng;

var kimbap = KimbapJpg;

var data = [
  {
    id: 0,
    name: "김밥",
    price: "4000",
    menu_type: "한식",
    created_at: "2022-01-11"
  },
  {
    id: 1,
    name: "불고기",
    price: "12000",
    menu_type: "한식",
    created_at: "2022-11-10"
  },
  {
    id: 2,
    name: "김치",
    price: "12000",
    menu_type: "한식",
    created_at: "2022-11-10"
  },
  {
    id: 3,
    name: "밥",
    price: "12000",
    menu_type: "한식",
    created_at: "2022-11-10"
  },
  {
    id: 4,
    name: "햄버거",
    price: "12000",
    menu_type: "한식",
    created_at: "2022-11-10"
  }
];

var $$Window = {};

function Result$default(Props) {
  var match = React.useState(function () {
        return 0;
      });
  var setCount = match[1];
  var count = match[0];
  var ddabongClickHandler = function (e) {
    e.preventDefault();
    window.alert("맛점하세요 :)");
  };
  var skipClickHandler = function (e) {
    e.preventDefault();
    var length = data.length;
    var isLast = length === (count + 1 | 0);
    Curry._1(setCount, (function (prev) {
            if (isLast) {
              return 0;
            } else {
              return prev + 1 | 0;
            }
          }));
    if (isLast) {
      window.alert("먹고 싶은 메뉴를 다시 돌려보세요 :(");
      return ;
    }
    
  };
  return React.createElement("div", {
              className: "w-100% h-screen flex flex-col items-center"
            }, React.createElement("div", {
                  className: "w-80 h-5/6 bg-primary p-5 mt-8 rounded-lg"
                }, React.createElement("h1", {
                      className: "text-white text-2xl pb-2.5 font-bold"
                    }, Caml_array.get(data, count).name), React.createElement($$Image, {
                      alt: "recommand menu",
                      height: 183,
                      objectFit: "cover",
                      src: kimbap,
                      width: 283
                    }), React.createElement("p", {
                      className: "text-gray pt-8 line-clamp-5"
                    }, Caml_array.get(data, count).price + "원")), React.createElement("div", {
                  className: "flex h-20"
                }, React.createElement("button", {
                      onClick: ddabongClickHandler
                    }, React.createElement($$Image, {
                          alt: "good",
                          src: ddabongHand,
                          width: 150
                        })), React.createElement("button", {
                      onClick: skipClickHandler
                    }, React.createElement($$Image, {
                          alt: "skip",
                          src: skipHand,
                          width: 150
                        }))));
}

var $$default = Result$default;

export {
  skipHand ,
  ddabongHand ,
  kimbap ,
  data ,
  $$Window ,
  $$default ,
  $$default as default,
}
/* skipHand Not a pure module */
