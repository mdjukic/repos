export const environment = {
  production: false,
  apiUrl: "https://api.deloitteretailanalytics.deloittecloud.co.uk/api/",
  endpoint: 'http://localhost:5000',
  oidc: {
    clientId: "0oabdm86tepYaefOJ0h7",
    scope: "openid profile email",
    recieveOidcToken: true,
    useSessionStorage: true,
    issuer: "https://dev-317618.oktapreview.com",
    tokenName: "id_token"
  }  
};