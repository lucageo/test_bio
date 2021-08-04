CREATE OR REPLACE FUNCTION marine_ecosystems.api_seagrass_wdpa_statistics(
	wdpaid text DEFAULT NULL::text)
    RETURNS SETOF marine_ecosystems.seagrass_wdpa_protection_perc
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
BEGIN
IF $1 is null THEN
      RETURN query SELECT * FROM marine_ecosystems.seagrass_wdpa_protection_perc;
ELSE
      RETURN query SELECT * FROM marine_ecosystems.seagrass_wdpa_protection_perc where seagrass_wdpa_protection_perc.wdpaid::text=$1;
END IF;
END
$BODY$;

ALTER FUNCTION marine_ecosystems.api_seagrass_wdpa_statistics(text)
    OWNER TO biopama_api_user;

COMMENT ON FUNCTION marine_ecosystems.api_seagrass_wdpa_statistics (text)
    IS 'test';
