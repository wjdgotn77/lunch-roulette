/** @type {import('tailwindcss').Config} */

const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: ["./src/*.res", "./src/**/*.res"],
  plugins: [require("@tailwindcss/line-clamp")],
  theme: {
    extend: {
      width: {
        375: "375px",
      },
      colors: {
        black: "#00000",
        white: "#FFFFFF",
        primary: "#C7B9FF",
        secondary: "#0AA95E",
        gray: "#667080",
        gray2: "#313136",
      },
      fontSize: {
        title: "48px",
        subtitle: "24px",
        description: "16px",
      },
    },
  },
};
