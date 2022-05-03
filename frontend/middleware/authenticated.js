// 未ログインユーザーはログインページへリダイレクト
export default function ({ store, redirect }) {
  if (!store.getters['auth/isAuthenticated']) {
    return redirect('/auth/signin')
  }
}
