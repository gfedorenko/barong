new pca.Address(
  [
    { element: 'profile_address', mode: pca.fieldMode.SEARCH },
    { element: 'profile_city', field: 'City', mode: pca.fieldMode.POPULATE },
    { element: 'profile_postcode', field: 'PostalCode', mode: pca.fieldMode.POPULATE },
  ],
  {
    setCountryByIP: true,
    bar: {},
    showCountry: true,
    showLogo: true,
    logoLink: false
  }
)
