import Vue from 'vue'
import Router from 'vue-router'
import Welcome from '@/pages/Welcome/Welcome'
import SignUp from '@/pages/SignUp/SignUp'
import ArticleIndex from '@/pages/ArticleIndex/ArticleIndex'
import CreateArticle from '@/pages/CreateArticle/CreateArticle'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Welcome',
      component: Welcome
    },
    {
      path: '/signUp',
      name: 'SignUp',
      component: SignUp
    },
    {
      path: '/articleIndex',
      name: 'ArticleIndex',
      component: ArticleIndex
    },
    {
      path: '/createArticle',
      name: 'createArticle',
      component: CreateArticle
    }
  ]
})
