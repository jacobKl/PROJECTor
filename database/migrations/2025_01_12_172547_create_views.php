<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        DB::statement("
            CREATE OR REPLACE VIEW task_asignees AS SELECT u.email, u.name as USER_NAME, p.name as PROJECT_NAME, t.name as TASK_NAME, t.priority, t.description FROM users u JOIN tasks t ON u.id = t.asignee JOIN projects p ON p.id = t.project_id
        ");

        DB::statement("
            CREATE OR REPLACE VIEW tasks_in_projects AS SELECT p.name AS PROJECT_NAME, count(t.*) AS TASKS_AMOUNT FROM projects p JOIN tasks t on p.id = t.project_id GROUP BY p.name
        ");

        DB::unprepared("
            CREATE OR REPLACE FUNCTION give_creator_full_access_function()
            RETURNS TRIGGER AS $$
            BEGIN
                INSERT INTO project_participants (created_at, updated_at, user_id, project_id, role_id, status)
                VALUES (NOW(), NOW(), NEW.user_id, NEW.id, 2, 'ACTIVE');
                RETURN NEW;
            END;
            $$ LANGUAGE plpgsql;

            CREATE OR REPLACE TRIGGER give_creator_full_access
            AFTER INSERT ON projects
            FOR EACH ROW
            EXECUTE FUNCTION give_creator_full_access_function();
        ");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('views');
    }
};
