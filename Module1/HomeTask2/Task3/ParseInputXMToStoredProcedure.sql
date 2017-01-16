CREATE PROCEDURE [dbo].[GetDrivers_FromXml] 
	(
		@XCriteria as XML
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @FirstName VARCHAR,
			@LastName VARCHAR;
	SET @FirstName = (SELECT n.c.value('@FirstName', 'varchar(100)') FROM @XCriteria.nodes('/rootset/row/frna') n(c));
	SET @LastName = (SELECT n.c.value('@LastName', 'varchar(100)') FROM @XCriteria.nodes('/rootset/row/lana') n(c));
    -- Insert statements for procedure here

	 SELECT  
            rr.item.value('@FirstName','varchar(100)') AS FirstName,  
            rr.item.value('@LastName','varchar(100)') AS LastName
        INTO #tmp  
        FROM @XCriteria.nodes('/rootset/row') AS rr(item)  

		  SELECT @FirstName, T.LastName
        FROM #tmp T 
END

exec GetDrivers_FromXml
@XCriteria =
'<rootset>
	<row>
		<frna>John</frna>
		<lana>Klessing</lana>
	</row>
	<row>
		<frna>Nick</frna>
		<lana>Frankfish</lana>
	</row>
</rootset>'


