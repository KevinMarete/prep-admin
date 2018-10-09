module.exports = {
    entry: './resources/js/app.js',
    output: {
      path: __dirname + '/public/js',
      filename: 'bundle.js'
    },
    module: {
      rules: [
        {
        test: /\.css$/,
        loaders: [
          'style-loader',
          'css-loader',
        ]
      },
      {
        test: /\.(png|svg|jpg|gif)$/,
        loaders:
          'file-loader'
        ,
        options:{
          publicPath:'js/images/'
        }
      },
      {
        test: /\.(scss|sass)$/,
        loaders: [
          'style-loader',
          'css-loader',
          'sass-loader',
        ]
      },
      {
        test: /\.(woff|woff2|eot|ttf|otf)$/,
        loaders:
          'file-loader',
        options:{
          outputPath:'/fonts'
        }
      }
      ]
    }
  }
