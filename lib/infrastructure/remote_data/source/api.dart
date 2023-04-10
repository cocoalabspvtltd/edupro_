class Api {
  static String registerWithEmailAndPassword = 'api/register';
  static String logInWithEmailAndPassword = 'api/user/login';
  static String eduproUserVerification = 'api/verification';

  static String getMyProfile = 'api/user/profile';
  static String editMyProfile = 'api/user/update_profile';
  static String updateDisplayPicture = 'api/user/update_profile_picture';
  //static String updateDisplayPicture = 'api/instructor/update_picture';

  static String changePassword = 'api/user/change_password';

  static String getMembershipDetails = 'api/user/membership';

  static String getMyCources = 'api/my_courses';
  static String getInstructorCources = 'api/course_list';
  static String getMyCourseVideos = 'api/classes';
  static String getCount = 'api/count_list';
  static String getQuestions = 'api/get_questions';
  static String askQuestion = 'api/ask_question';
  static String submitAnswer = 'api/submit_answer';
  static String getAnswers = 'api/get_answers';
  static String deleteAnswer = 'api/delete_answer';
  static String courseAnnouncements = 'api/course_announcement';

  static String getAdsList = 'api/ad_list';

  static String getCourseReport = 'api/my_courses/report';
  static String getCourseCategories = 'api/category';
  //static String getCoursesInCategory = 'api/courses';
  static String getCoursesInCategory = 'api/list_courses';

  static String getTrendingVideos = 'api/trending-videos';
  static String getTopVideos = 'api/top-videos';
  static String getLiveVideos = 'api/live-videos';

  static String getPaymentData = 'api/payment_order';
  static String postOaymentId = 'api/payment';

  ///////////////////////////////////////////////////INSTRUCTOR//////////////////////////////////////
  static String addCourses = "api/instructor/add_course";
}
