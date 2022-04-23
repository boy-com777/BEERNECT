import createPersistedState from 'vuex-persistedstate'

export default ({ store }) => {
  window.onNuxtReady(() => {
    createPersistedState({
      key: 'sessionBeernect',
      storage: window.sessionStorage,
    })(store)
  })
}
