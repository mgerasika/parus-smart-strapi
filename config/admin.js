module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', 'acf3b40c696224a61babfad5cd3b58df'),
  },
});
