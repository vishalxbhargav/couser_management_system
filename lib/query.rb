=begin
    1. List all individuals how sign up
    User.all

    2.find the total number of courses available
    Course.all

    3.List out all individual enrolled in specific course
    course=Course.find(1)
    course.users

    4.Fetch the  name of all course in which individual enrolled
    user=User.find(2);
    user.courses.select()

    5.count how many people enrolled in each course
    Enrollment.group(:course).count

    6.Identify the course  with the most enrollments
    Enrollment.group(:course).count.max

    7.List all enrollments where the status is marked  as completed
    Enrollment.where(status: :completed)

    8.Fetch details of individual who enrolled within 7 days
    using scope: ->,{where('created_at >= ?',7.days.ago)}

    9.Fetch all the courses which created last month
    using scope: ->,{where('created_at >= ?',1.month.ago.beginning_of_month).where('created_at <= ?',1.month.ago.end_of_month)}

    10.Retrieve the names and enrollment dates of  all individuals of specific course
    course=Course.find(1)
    course.enrollments.select('enrollments.created_at As enrolled_date,users.username')

    11.Find the names of individuals who not enrolled in any course
    User.left_outer_joins(:enrollments).where(enrollments:{id:nil})

    12.Update the enrollment status of a specific individual to status "completed"
    e=Enrollment(1)
    e.completed

    13.Remove specific enrollment form the system
    e=Enrollment(1)
    e.destroy

    14.Retrieve all the course with their count of enrollment
    Enrollment.group(:course).count

    15.Identify individual who are enrolled in more then three course
    Enrollment.joins(:user).group('users.id').having('COUNT(enrollments.course_id)>3').select(users.username,COUNT(enrollment.course_id) As course_count)

    16.Find Course who have fewer then five enrollments
    Enrollment.joins(:course).group('courses.id').having('COUNT(enrollments.user_id)<?',5).select('courses.course_name,COUNT(enrollments.user_id) AS Enrollment_count)

    17.List out all individual who enrolled multiple course
    Enrollment.joins(:user).group('users.id').having('COUNT(enrollments.course_id)>1').select('users.username,users.id')

    18.Fetch the latest enrollment for each individuals


    19.Retrieve all the courses sorted by the number of enrollments
    Course.joins(:enrollments).group('courses.id').select('courses.id,courses.course_name,COUNT(enrollments.course_id) AS total_enrollment).order('total_enrollment DESC')

    20.Find the average number of of enrollment per course
    Enrollment.group(:course_id).count.values.sum/Course.all.count

    21.Fetch the total number of enrollment on platform
    Enrollment.all.count

    22.Retrieve the details of individual  who has been enrolled longest in specific course
    course=Course.find(3)
    course.enrollment.order(created_at: :desc).limit(1)

    23.Find all enrollments where the status is "dropped"
    Enrollment.where(status: :dropped)

    24.Identify the course that no one enrolled
    Course.left_outer_joins(:enrollments).where(enrollments:{id:nil})

    25.Find out top 5 individual with most enrollments
    User.joins(:enrollments).group('users.id').select('users.id,users.username,COUNT(enrollments.user_id) AS total_enrollment').order('total_enrollment DESC')

    26.Retrieve the latest created course
    Course.order(created_at: :desc).first

    27.Find the individual with the highest number of completed enrollments
    User.joins(:enrollments).where(enrollments:{status: 3}).group(:users).count.max

    28.Fetch all courses and include the names of individuals enrolled in each course
    -------

    29.List all enrollment for individual who signed up last month
    ---------------

    30.Identify all individual who  currently enrolled at least one course
    User.joins(:enrollments).group('users.id').select('users.username,COUNT(enrollments.id) AS enrolled').having('COUNT(enrollments.id)>1')

    31.Retrieve the name of the all courses where enrollment is open
    Course.active

    32.Count how many individuals have completed at least one course.
    User.joins(:enrollments).where(enrollments:{status: 3}).group(:users).count.values.sum

    33.Retrieve the total number of enrollments for a specific individual.
    user=User.find(1)
    user.courses.count

    34.Find individuals who enrolled in a specific course on a specific date.
    User.joins(:enrollments).where(enrollments:{created_at: (1.day.ago.beginning_of_day)..(1.day.ago.end_of_day)})

    35.Update the name of a specific course.
    course=Course.find(2)
    course.course_name="updated course name"

    36.Delete a specific course from the system.
    course=Course.find(1)
    course.destroy

    37.Retrieve all courses along with the average duration of enrollments.
    -----

    38.Fetch the details of enrollments that were updated in the last 24 hours.
    Enrollment.where(updated_at:(24.hour.ago)..(Time.now))

    39.Identify individuals who have dropped out of multiple courses.
    User.joins(:enrollments).where(enrollments:{status:2})

    40.Retrieve the count of courses where enrollment is marked as "active."
    Course.joins(:enrollments).where(enrollments:{status: 0}).count

    41.List all courses sorted alphabetically by name.
    Course.all.order(:course_name)

    42.Find the total number of individuals who signed up on the platform.
    User.all.count

    43.Retrieve the most popular course based on enrollment numbers.
    User.joins(:enrollments).group('users.id).select('users,COUNT(enrollments.user_id) AS count).order('count DESC').first

    44.Fetch all courses where the average enrollment duration exceeds a given value.
    -----------

    45.Identify individuals who enrolled in courses but never completed any.
    User.joins(:enrollments).where.not(enrollments: {status: 3})

    46.Retrieve all enrollments sorted by enrollment date in descending order.
    Enrollment.all.order(created_at: :desc)

    47.Count the number of enrollments where the status is "active."
    Enrollment.where.not(status: 0)

    48.Find individuals who have not updated their enrollment status in over a month.

    49.Retrieve the list of all courses, including the total duration of all enrollments.


    50.Fetch the oldest enrollment record for each course.


=end
