import firebase from "firebase/compat/app";
const firebaseConfig = {
  apiKey: "AIzaSyAe-e63EOLAUsRR4BhhuirbqUgsv29RCaI",
  authDomain: "recordmed-a7c06.firebaseapp.com",
  databaseURL: "https://recordmed-a7c06-default-rtdb.firebaseio.com",
  projectId: "recordmed-a7c06",
  storageBucket: "recordmed-a7c06.appspot.com",
  messagingSenderId: "778946389532",
  appId: "1:778946389532:web:f33b6b48ec54cd19c721d9",
  measurementId: "G-F4S5ZSWH47"
};
firebase.initializeApp(firebaseConfig);

const auth = firebase.auth()
const provider = new firebase.auth.EmailAuthProvider();

const user = firebase.auth().currentUser;

export {provider, auth, user}