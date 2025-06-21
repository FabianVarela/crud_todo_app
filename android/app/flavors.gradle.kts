import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("default")

    productFlavors {
        create("develop") {
            dimension = "default"
            applicationId = "com.developer.fabian.crud_todo_app.dev"
            resValue(type = "string", name = "name_app", value = "To-Do List App - Dev")
        }
        create("production") {
            dimension = "default"
            applicationId = "com.developer.fabian.crud_todo_app"
            resValue(type = "string", name = "name_app", value = "To-Do List App")
        }
    }
}