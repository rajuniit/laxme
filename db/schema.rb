# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "additional_exam_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.integer "batch_id"
    t.string  "exam_type"
    t.boolean "is_published",     default: false
    t.boolean "result_published", default: false
    t.string  "students_list"
    t.date    "exam_date"
  end

  create_table "additional_exam_scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "student_id"
    t.integer  "additional_exam_id"
    t.decimal  "marks",              precision: 7, scale: 2
    t.integer  "grading_level_id"
    t.string   "remarks"
    t.boolean  "is_failed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "additional_exams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "additional_exam_group_id"
    t.integer  "subject_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "maximum_marks"
    t.integer  "minimum_marks"
    t.integer  "grading_level_id"
    t.integer  "weightage",                default: 0
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "additional_field_options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "additional_field_id"
    t.string   "field_option"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "additional_fields", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.boolean "status"
    t.boolean "is_mandatory", default: false
    t.string  "input_type"
    t.integer "priority"
  end

  create_table "apply_leaves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "employee_id"
    t.integer "employee_leave_types_id"
    t.boolean "is_half_day"
    t.date    "start_date"
    t.date    "end_date"
    t.string  "reason"
    t.boolean "approved",                default: false
    t.boolean "viewed_by_manager",       default: false
    t.string  "manager_remark"
  end

  create_table "archived_employee_additional_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "employee_id"
    t.integer "additional_field_id"
    t.string  "additional_info"
  end

  create_table "archived_employee_bank_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "employee_id"
    t.integer "bank_field_id"
    t.string  "bank_info"
  end

  create_table "archived_employee_salary_structures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "employee_id"
    t.integer "payroll_category_id"
    t.string  "amount"
  end

  create_table "archived_employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "employee_category_id"
    t.string   "employee_number"
    t.date     "joining_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "job_title"
    t.integer  "employee_position_id"
    t.integer  "employee_department_id"
    t.integer  "reporting_manager_id"
    t.integer  "employee_grade_id"
    t.string   "qualification"
    t.text     "experience_detail",      limit: 65535
    t.integer  "experience_year"
    t.integer  "experience_month"
    t.boolean  "status"
    t.string   "status_description"
    t.date     "date_of_birth"
    t.string   "marital_status"
    t.integer  "children_count"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "husband_name"
    t.string   "blood_group"
    t.integer  "nationality_id"
    t.string   "home_address_line1"
    t.string   "home_address_line2"
    t.string   "home_city"
    t.string   "home_state"
    t.integer  "home_country_id"
    t.string   "home_pin_code"
    t.string   "office_address_line1"
    t.string   "office_address_line2"
    t.string   "office_city"
    t.string   "office_state"
    t.integer  "office_country_id"
    t.string   "office_pin_code"
    t.string   "office_phone1"
    t.string   "office_phone2"
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.string   "email"
    t.string   "fax"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.binary   "photo_data",             limit: 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "photo_file_size"
    t.string   "former_id"
  end

  create_table "archived_exam_scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "student_id"
    t.integer  "exam_id"
    t.decimal  "marks",            precision: 7, scale: 2
    t.integer  "grading_level_id"
    t.string   "remarks"
    t.boolean  "is_failed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["student_id", "exam_id"], name: "index_archived_exam_scores_on_student_id_and_exam_id", using: :btree
  end

  create_table "archived_guardians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "ward_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "relation"
    t.string   "email"
    t.string   "office_phone1"
    t.string   "office_phone2"
    t.string   "mobile_phone"
    t.string   "office_address_line1"
    t.string   "office_address_line2"
    t.string   "city"
    t.string   "state"
    t.integer  "country_id"
    t.date     "dob"
    t.string   "occupation"
    t.string   "income"
    t.string   "education"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "archived_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "admission_no"
    t.string   "class_roll_no"
    t.date     "admission_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "batch_id"
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "blood_group"
    t.string   "birth_place"
    t.integer  "nationality_id"
    t.string   "language"
    t.string   "religion"
    t.integer  "student_category_id"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "pin_code"
    t.integer  "country_id"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "email"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.binary   "photo_data",           limit: 16777215
    t.string   "status_description"
    t.boolean  "is_active",                             default: true
    t.boolean  "is_deleted",                            default: false
    t.integer  "immediate_contact_id"
    t.boolean  "is_sms_enabled",                        default: true
    t.string   "former_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "photo_file_size"
  end

  create_table "assessment_scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "student_id"
    t.integer  "grade_points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exam_id"
    t.integer  "batch_id"
    t.integer  "descriptive_indicator_id"
    t.index ["student_id", "batch_id", "descriptive_indicator_id", "exam_id"], name: "score_index", using: :btree
  end

  create_table "assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "title"
    t.text     "description", limit: 65535
    t.integer  "amount"
    t.boolean  "is_inactive",               default: false
    t.boolean  "is_deleted",                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attendances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "student_id"
    t.integer "period_table_entry_id"
    t.boolean "forenoon",              default: false
    t.boolean "afternoon",             default: false
    t.string  "reason"
    t.date    "month_date"
    t.integer "batch_id"
    t.index ["month_date", "batch_id"], name: "index_attendances_on_month_date_and_batch_id", using: :btree
    t.index ["student_id", "batch_id"], name: "index_attendances_on_student_id_and_batch_id", using: :btree
  end

  create_table "bank_fields", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.boolean "status"
  end

  create_table "batch_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "event_id"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id"], name: "index_batch_events_on_batch_id", using: :btree
  end

  create_table "batch_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "course_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "batch_students", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "student_id"
    t.integer "batch_id"
    t.index ["batch_id", "student_id"], name: "index_batch_students_on_batch_id_and_student_id", using: :btree
  end

  create_table "batches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "is_active",   default: true
    t.boolean  "is_deleted",  default: false
    t.string   "employee_id"
    t.index ["is_deleted", "is_active", "course_id", "name"], name: "index_batches_on_is_deleted_and_is_active_and_course_id_and_name", using: :btree
  end

  create_table "cce_exam_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cce_grade_sets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cce_grades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.float    "grade_point",      limit: 24
    t.integer  "cce_grade_set_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cce_grade_set_id"], name: "index_cce_grades_on_cce_grade_set_id", using: :btree
  end

  create_table "cce_reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "observable_id"
    t.string   "observable_type"
    t.integer  "student_id"
    t.integer  "batch_id"
    t.string   "grade_string"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exam_id"
    t.index ["observable_id", "student_id", "batch_id", "exam_id", "observable_type"], name: "cce_report_join_index", using: :btree
  end

  create_table "cce_weightages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "weightage"
    t.string   "criteria_type"
    t.integer  "cce_exam_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cce_weightages_courses", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "cce_weightage_id"
    t.integer "course_id"
    t.index ["cce_weightage_id"], name: "index_cce_weightages_courses_on_cce_weightage_id", using: :btree
    t.index ["course_id", "cce_weightage_id"], name: "index_for_join_table_cce_weightage_courses", using: :btree
    t.index ["course_id"], name: "index_cce_weightages_courses_on_course_id", using: :btree
  end

  create_table "class_designations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                                null: false
    t.decimal  "cgpa",       precision: 15, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "marks",      precision: 15, scale: 2
    t.integer  "course_id"
  end

  create_table "class_timings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "batch_id"
    t.string  "name"
    t.time    "start_time"
    t.time    "end_time"
    t.boolean "is_break"
    t.boolean "is_deleted", default: false
    t.index ["batch_id", "start_time", "end_time"], name: "index_class_timings_on_batch_id_and_start_time_and_end_time", using: :btree
  end

  create_table "configurations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "config_key"
    t.string "config_value"
    t.index ["config_key"], name: "index_configurations_on_config_key", length: {"config_key"=>10}, using: :btree
    t.index ["config_value"], name: "index_configurations_on_config_value", length: {"config_value"=>10}, using: :btree
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "course_name"
    t.string   "code"
    t.string   "section_name"
    t.boolean  "is_deleted",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "grading_type"
    t.index ["grading_type"], name: "index_courses_on_grading_type", using: :btree
  end

  create_table "courses_observation_groups", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "course_id"
    t.integer "observation_group_id"
    t.index ["course_id"], name: "index_courses_observation_groups_on_course_id", using: :btree
    t.index ["observation_group_id"], name: "index_courses_observation_groups_on_observation_group_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "priority",                 default: 0
    t.integer  "attempts",                 default: 0
    t.text     "handler",    limit: 65535
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["locked_by"], name: "index_delayed_jobs_on_locked_by", using: :btree
  end

  create_table "descriptive_indicators", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "describable_id"
    t.string   "describable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sort_order"
    t.index ["describable_id", "describable_type", "sort_order"], name: "describable_index", using: :btree
  end

  create_table "elective_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.integer  "batch_id"
    t.boolean  "is_deleted", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "electives", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "elective_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_additional_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "employee_id"
    t.integer "additional_field_id"
    t.string  "additional_info"
  end

  create_table "employee_attendances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.date    "attendance_date"
    t.integer "employee_id"
    t.integer "employee_leave_type_id"
    t.string  "reason"
    t.boolean "is_half_day"
  end

  create_table "employee_bank_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "employee_id"
    t.integer "bank_field_id"
    t.string  "bank_info"
  end

  create_table "employee_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.string  "prefix"
    t.boolean "status"
  end

  create_table "employee_department_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "event_id"
    t.integer  "employee_department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "code"
    t.string  "name"
    t.boolean "status"
  end

  create_table "employee_grades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.integer "priority"
    t.boolean "status"
    t.integer "max_hours_day"
    t.integer "max_hours_week"
  end

  create_table "employee_leave_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.string  "code"
    t.boolean "status"
    t.string  "max_leave_count"
    t.boolean "carry_forward",   default: false, null: false
  end

  create_table "employee_leaves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "employee_id"
    t.integer  "employee_leave_type_id"
    t.decimal  "leave_count",            precision: 5, scale: 1, default: "0.0"
    t.decimal  "leave_taken",            precision: 5, scale: 1, default: "0.0"
    t.date     "reset_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employee_positions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.integer "employee_category_id"
    t.boolean "status"
  end

  create_table "employee_salary_structures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "employee_id"
    t.integer "payroll_category_id"
    t.string  "amount"
  end

  create_table "employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "employee_category_id"
    t.string   "employee_number"
    t.date     "joining_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "job_title"
    t.integer  "employee_position_id"
    t.integer  "employee_department_id"
    t.integer  "reporting_manager_id"
    t.integer  "employee_grade_id"
    t.string   "qualification"
    t.text     "experience_detail",      limit: 65535
    t.integer  "experience_year"
    t.integer  "experience_month"
    t.boolean  "status"
    t.string   "status_description"
    t.date     "date_of_birth"
    t.string   "marital_status"
    t.integer  "children_count"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "husband_name"
    t.string   "blood_group"
    t.integer  "nationality_id"
    t.string   "home_address_line1"
    t.string   "home_address_line2"
    t.string   "home_city"
    t.string   "home_state"
    t.integer  "home_country_id"
    t.string   "home_pin_code"
    t.string   "office_address_line1"
    t.string   "office_address_line2"
    t.string   "office_city"
    t.string   "office_state"
    t.integer  "office_country_id"
    t.string   "office_pin_code"
    t.string   "office_phone1"
    t.string   "office_phone2"
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.string   "email"
    t.string   "fax"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.binary   "photo_data",             limit: 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "photo_file_size"
    t.integer  "user_id"
    t.index ["employee_number"], name: "index_employees_on_employee_number", length: {"employee_number"=>10}, using: :btree
  end

  create_table "employees_subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "employee_id"
    t.integer "subject_id"
    t.index ["subject_id"], name: "index_employees_subjects_on_subject_id", using: :btree
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "is_common",   default: false
    t.boolean  "is_holiday",  default: false
    t.boolean  "is_exam",     default: false
    t.boolean  "is_due",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "origin_id"
    t.string   "origin_type"
    t.index ["is_common", "is_holiday", "is_exam"], name: "index_events_on_is_common_and_is_holiday_and_is_exam", using: :btree
  end

  create_table "exam_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.integer "batch_id"
    t.string  "exam_type"
    t.boolean "is_published",         default: false
    t.boolean "result_published",     default: false
    t.date    "exam_date"
    t.boolean "is_final_exam",        default: false, null: false
    t.integer "cce_exam_category_id"
  end

  create_table "exam_scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "student_id"
    t.integer  "exam_id"
    t.decimal  "marks",            precision: 7, scale: 2
    t.integer  "grading_level_id"
    t.string   "remarks"
    t.boolean  "is_failed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["student_id", "exam_id"], name: "index_exam_scores_on_student_id_and_exam_id", using: :btree
  end

  create_table "exams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "exam_group_id"
    t.integer  "subject_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.decimal  "maximum_marks",    precision: 10, scale: 2
    t.decimal  "minimum_marks",    precision: 10, scale: 2
    t.integer  "grading_level_id"
    t.integer  "weightage",                                 default: 0
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["exam_group_id", "subject_id"], name: "index_exams_on_exam_group_id_and_subject_id", using: :btree
  end

  create_table "fa_criterias", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "fa_name"
    t.string   "desc"
    t.integer  "fa_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sort_order"
    t.boolean  "is_deleted",  default: false
    t.index ["fa_group_id"], name: "index_fa_criterias_on_fa_group_id", using: :btree
  end

  create_table "fa_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.text     "desc",                 limit: 65535
    t.integer  "cce_exam_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cce_grade_set_id"
    t.float    "max_marks",            limit: 24,    default: 100.0
    t.boolean  "is_deleted",                         default: false
  end

  create_table "fa_groups_subjects", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "subject_id"
    t.integer "fa_group_id"
    t.index ["fa_group_id", "subject_id"], name: "score_index", using: :btree
    t.index ["fa_group_id"], name: "index_fa_groups_subjects_on_fa_group_id", using: :btree
    t.index ["subject_id"], name: "index_fa_groups_subjects_on_subject_id", using: :btree
  end

  create_table "fee_collection_discounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "receiver_id"
    t.integer  "finance_fee_collection_id"
    t.decimal  "discount",                  precision: 15, scale: 2
    t.boolean  "is_amount",                                          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fee_collection_particulars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.text     "description",               limit: 65535
    t.decimal  "amount",                                  precision: 12, scale: 2
    t.integer  "finance_fee_collection_id"
    t.integer  "student_category_id"
    t.string   "admission_no"
    t.integer  "student_id"
    t.boolean  "is_deleted",                                                       default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fee_discounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "type"
    t.string  "name"
    t.integer "receiver_id"
    t.integer "finance_fee_category_id"
    t.decimal "discount",                precision: 15, scale: 2
    t.boolean "is_amount",                                        default: false
  end

  create_table "finance_donations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "donor"
    t.string   "description"
    t.decimal  "amount",           precision: 15, scale: 2
    t.integer  "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "transaction_date"
  end

  create_table "finance_fee_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.integer  "batch_id"
    t.boolean  "is_deleted",                default: false, null: false
    t.boolean  "is_master",                 default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "finance_fee_collections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.date    "start_date"
    t.date    "end_date"
    t.date    "due_date"
    t.integer "fee_category_id"
    t.integer "batch_id"
    t.boolean "is_deleted",      default: false, null: false
    t.index ["fee_category_id"], name: "index_finance_fee_collections_on_fee_category_id", using: :btree
  end

  create_table "finance_fee_particulars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.text     "description",             limit: 65535
    t.decimal  "amount",                                precision: 15, scale: 2
    t.integer  "finance_fee_category_id"
    t.integer  "student_category_id"
    t.string   "admission_no"
    t.integer  "student_id"
    t.boolean  "is_deleted",                                                     default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "finance_fee_structure_elements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.decimal "amount",              precision: 15, scale: 2
    t.string  "label"
    t.integer "batch_id"
    t.integer "student_category_id"
    t.integer "student_id"
    t.integer "parent_id"
    t.integer "fee_collection_id"
    t.boolean "deleted",                                      default: false
  end

  create_table "finance_fees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "fee_collection_id"
    t.string  "transaction_id"
    t.integer "student_id"
    t.boolean "is_paid",           default: false
    t.index ["fee_collection_id", "student_id"], name: "index_finance_fees_on_fee_collection_id_and_student_id", using: :btree
  end

  create_table "finance_transaction_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.string  "description"
    t.boolean "is_income"
    t.boolean "deleted",     default: false, null: false
  end

  create_table "finance_transaction_triggers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "finance_category_id"
    t.decimal "percentage",          precision: 8, scale: 2
    t.string  "title"
    t.string  "description"
  end

  create_table "finance_transactions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "title"
    t.string   "description"
    t.decimal  "amount",                precision: 15, scale: 2
    t.boolean  "fine_included",                                  default: false
    t.integer  "category_id"
    t.integer  "student_id"
    t.integer  "finance_fees_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "transaction_date"
    t.decimal  "fine_amount",           precision: 10, scale: 2, default: "0.0"
    t.integer  "master_transaction_id",                          default: 0
    t.integer  "finance_id"
    t.string   "finance_type"
    t.integer  "payee_id"
    t.string   "payee_type"
    t.string   "receipt_no"
    t.string   "voucher_no"
  end

  create_table "grading_levels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.integer  "batch_id"
    t.integer  "min_score"
    t.integer  "order"
    t.boolean  "is_deleted",                             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "credit_points", precision: 15, scale: 2
    t.string   "description"
    t.index ["batch_id", "is_deleted"], name: "index_grading_levels_on_batch_id_and_is_deleted", using: :btree
  end

  create_table "grouped_batches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "batch_group_id"
    t.integer  "batch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_group_id"], name: "index_grouped_batches_on_batch_group_id", using: :btree
  end

  create_table "grouped_exam_reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "batch_id"
    t.integer  "student_id"
    t.integer  "exam_group_id"
    t.decimal  "marks",         precision: 15, scale: 2
    t.string   "score_type"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["batch_id", "student_id", "score_type"], name: "by_batch_student_and_score_type", using: :btree
  end

  create_table "grouped_exams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "exam_group_id"
    t.integer "batch_id"
    t.decimal "weightage",     precision: 15, scale: 2
    t.index ["batch_id", "exam_group_id"], name: "index_grouped_exams_on_batch_id_and_exam_group_id", using: :btree
    t.index ["batch_id"], name: "index_grouped_exams_on_batch_id", using: :btree
  end

  create_table "guardians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "ward_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "relation"
    t.string   "email"
    t.string   "office_phone1"
    t.string   "office_phone2"
    t.string   "mobile_phone"
    t.string   "office_address_line1"
    t.string   "office_address_line2"
    t.string   "city"
    t.string   "state"
    t.integer  "country_id"
    t.date     "dob"
    t.string   "occupation"
    t.string   "income"
    t.string   "education"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "individual_payslip_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "employee_id"
    t.date    "salary_date"
    t.string  "name"
    t.string  "amount"
    t.boolean "is_deduction"
    t.boolean "include_every_month"
  end

  create_table "liabilities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "title"
    t.text     "description", limit: 65535
    t.integer  "amount"
    t.boolean  "is_solved",                 default: false
    t.boolean  "is_deleted",                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "monthly_payslips", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.date    "salary_date"
    t.integer "employee_id"
    t.integer "payroll_category_id"
    t.string  "amount"
    t.boolean "is_approved",         default: false, null: false
    t.integer "approver_id"
    t.boolean "is_rejected",         default: false, null: false
    t.integer "rejector_id"
    t.string  "reason"
    t.string  "remark"
  end

  create_table "news", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "title"
    t.text     "content",    limit: 65535
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "content",     limit: 65535
    t.integer  "news_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_approved",               default: false
  end

  create_table "observation_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "header_name"
    t.string   "desc"
    t.string   "cce_grade_set_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "observation_kind"
    t.float    "max_marks",        limit: 24
    t.boolean  "is_deleted",                  default: false
  end

  create_table "observations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "desc"
    t.boolean  "is_active"
    t.integer  "observation_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sort_order"
    t.index ["observation_group_id"], name: "index_observations_on_observation_group_id", using: :btree
  end

  create_table "payroll_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.float   "percentage",          limit: 24
    t.integer "payroll_category_id"
    t.boolean "is_deduction"
    t.boolean "status"
  end

  create_table "period_entries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.date    "month_date"
    t.integer "batch_id"
    t.integer "subject_id"
    t.integer "class_timing_id"
    t.integer "employee_id"
    t.index ["month_date", "batch_id"], name: "index_period_entries_on_month_date_and_batch_id", using: :btree
  end

  create_table "previous_exam_scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "student_id"
    t.integer  "exam_id"
    t.decimal  "marks",            precision: 7, scale: 2
    t.integer  "grading_level_id"
    t.string   "remarks"
    t.boolean  "is_failed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["student_id", "exam_id"], name: "index_previous_exam_scores_on_student_id_and_exam_id", using: :btree
  end

  create_table "privilege_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name_tag"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "privileges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description",      limit: 65535
    t.integer  "privilege_tag_id"
    t.integer  "priority"
  end

  create_table "privileges_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "user_id"
    t.integer "privilege_id"
    t.index ["user_id"], name: "index_privileges_users_on_user_id", using: :btree
  end

  create_table "ranking_levels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",                                                        null: false
    t.decimal  "gpa",                precision: 15, scale: 2
    t.decimal  "marks",              precision: 15, scale: 2
    t.integer  "subject_count"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "full_course",                                 default: false
    t.integer  "course_id"
    t.string   "subject_limit_type"
    t.string   "marks_limit_type"
  end

  create_table "reminders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "sender"
    t.integer  "recipient"
    t.string   "subject"
    t.text     "body",                    limit: 65535
    t.boolean  "is_read",                               default: false
    t.boolean  "is_deleted_by_sender",                  default: false
    t.boolean  "is_deleted_by_recipient",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["recipient"], name: "index_reminders_on_recipient", using: :btree
  end

  create_table "school_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "school_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.string   "logo_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sms_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "mobile"
    t.string   "gateway_response"
    t.string   "sms_message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sms_messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sms_settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "settings_key"
    t.boolean "is_enabled",   default: false
  end

  create_table "student_additional_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "student_id"
    t.integer "additional_field_id"
    t.string  "additional_info"
  end

  create_table "student_additional_field_options", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "student_additional_field_id"
    t.string   "field_option"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_additional_fields", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.boolean "status"
    t.boolean "is_mandatory", default: false
    t.string  "input_type"
    t.integer "priority"
  end

  create_table "student_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.boolean "is_deleted", default: false, null: false
  end

  create_table "student_previous_datas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "student_id"
    t.string  "institution"
    t.string  "year"
    t.string  "course"
    t.string  "total_mark"
  end

  create_table "student_previous_subject_marks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "student_id"
    t.string  "subject"
    t.string  "mark"
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "admission_no"
    t.string   "class_roll_no"
    t.date     "admission_date"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "batch_id"
    t.date     "date_of_birth"
    t.string   "gender"
    t.string   "blood_group"
    t.string   "birth_place"
    t.integer  "nationality_id"
    t.string   "language"
    t.string   "religion"
    t.integer  "student_category_id"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "pin_code"
    t.integer  "country_id"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "email"
    t.integer  "immediate_contact_id"
    t.boolean  "is_sms_enabled",                        default: true
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.binary   "photo_data",           limit: 16777215
    t.string   "status_description"
    t.boolean  "is_active",                             default: true
    t.boolean  "is_deleted",                            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "has_paid_fees",                         default: false
    t.integer  "photo_file_size"
    t.integer  "user_id"
    t.index ["admission_no"], name: "index_students_on_admission_no", length: {"admission_no"=>10}, using: :btree
    t.index ["batch_id"], name: "index_students_on_batch_id", using: :btree
    t.index ["first_name", "middle_name", "last_name"], name: "index_students_on_first_name_and_middle_name_and_last_name", length: {"first_name"=>10, "middle_name"=>10, "last_name"=>10}, using: :btree
  end

  create_table "students_subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "student_id"
    t.integer "subject_id"
    t.integer "batch_id"
    t.index ["student_id", "subject_id"], name: "index_students_subjects_on_student_id_and_subject_id", using: :btree
  end

  create_table "subject_amounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "course_id"
    t.decimal  "amount",     precision: 10
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subject_leaves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "student_id"
    t.date     "month_date"
    t.integer  "subject_id"
    t.integer  "employee_id"
    t.integer  "class_timing_id"
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "batch_id"
    t.index ["month_date", "subject_id", "batch_id"], name: "index_subject_leaves_on_month_date_and_subject_id_and_batch_id", using: :btree
    t.index ["student_id", "batch_id"], name: "index_subject_leaves_on_student_id_and_batch_id", using: :btree
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "batch_id"
    t.boolean  "no_exams",                                    default: false
    t.integer  "max_weekly_classes"
    t.integer  "elective_group_id"
    t.boolean  "is_deleted",                                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "credit_hours",       precision: 15, scale: 2
    t.boolean  "prefer_consecutive",                          default: false
    t.decimal  "amount",             precision: 15, scale: 2
    t.index ["batch_id", "elective_group_id", "is_deleted"], name: "index_subjects_on_batch_id_and_elective_group_id_and_is_deleted", using: :btree
  end

  create_table "time_zones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name"
    t.string   "code"
    t.string   "difference_type"
    t.integer  "time_difference"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timetable_entries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "batch_id"
    t.integer "weekday_id"
    t.integer "class_timing_id"
    t.integer "subject_id"
    t.integer "employee_id"
    t.integer "timetable_id"
    t.index ["timetable_id"], name: "index_timetable_entries_on_timetable_id", using: :btree
  end

  create_table "timetables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_active",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["start_date", "end_date"], name: "by_start_and_end", using: :btree
  end

  create_table "user_events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "admin"
    t.boolean  "student"
    t.boolean  "employee"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "reset_password_code"
    t.datetime "reset_password_code_until"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "parent"
    t.boolean  "is_first_login"
    t.index ["username"], name: "index_users_on_username", length: {"username"=>10}, using: :btree
  end

  create_table "weekdays", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "batch_id"
    t.string  "weekday"
    t.string  "name"
    t.integer "sort_order"
    t.integer "day_of_week"
    t.boolean "is_deleted",  default: false
    t.index ["batch_id"], name: "index_weekdays_on_batch_id", using: :btree
  end

end
