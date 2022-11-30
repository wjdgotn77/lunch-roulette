/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  swcMinify: true,
  pageExtensions: ["jsx", "js"],
  // images: {
  //   remotePatterns: [
  //     {
  //       protocol: "https",
  //       hostname: "",
  //       port: "",
  //       pathname: "",
  //     },
  //   ],
  // },
};

module.exports = nextConfig;
