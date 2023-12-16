const { merge } = require("webpack-merge");
const common = require("./webpack.common.js");
const { NoEmitOnErrorsPlugin } = require("webpack");

module.exports = merge(common, {
    mode: "development",

    devtool: "source-map",

    watchOptions: {
        aggregateTimeout: 600,
        ignored: ["node_modules/**"],
    },

    devServer: {
        hot: true,
        allowedHosts: ['localhost:3000']
    },

    plugins: [new NoEmitOnErrorsPlugin()],
});
