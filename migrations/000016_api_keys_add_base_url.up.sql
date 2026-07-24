DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.tables
        WHERE table_name = 'evo_core_api_keys'
    ) AND NOT EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_name = 'evo_core_api_keys'
        AND column_name = 'base_url'
    ) THEN
        ALTER TABLE evo_core_api_keys ADD COLUMN base_url TEXT NULL;
    END IF;
END
$$;
