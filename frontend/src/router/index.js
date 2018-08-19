import Vue from 'vue'
import Router from 'vue-router'
import Welcome from '@/pages/Welcome/Welcome'
import SignUp from '@/pages/SignUp/SignUp'
import Articles from '@/pages/Articles/Articles'
import CreateArticle from '@/pages/CreateArticle/CreateArticle'
import Article from '@/pages/Article/Article'

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
      path: '/articles',
      name: 'Articles',
      component: Articles
    },
    {
      path: '/createArticle',
      name: 'createArticle',
      component: CreateArticle
    },
    {
      path: '/articles/:id',
      name: 'article',
      component: Article
    }
  ]
})
