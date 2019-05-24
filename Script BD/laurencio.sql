

CREATE PROCEDURE pa_edificio_getByID(
	@idEdificio int
)
AS
BEGIN
	SELECT idEdificio, nombre, nroPisos, estado, fecreg, ubig.idUbigeo
	FROM Edificio edificio
		INNER JOIN Ubigeo ubig ON edificio.idUbigeo = ubig.idUbigeo
	WHERE edificio.idEdificio = @idEdificio;
END
GO



CREATE PROCEDURE pa_edificio_listCbo(
	@idEdificio int
)
AS
BEGIN
	SELECT idEdificio, nombre, nroPisos, estado, fecreg, ubig.idUbigeo,
		ubig.departamento, ubig.distrito, ubig.provincia
	FROM Edificio edificio
		INNER JOIN Ubigeo ubig ON edificio.idUbigeo = ubig.idUbigeo
	WHERE edificio.estado = 1 OR (edificio.idEdificio = @idEdificio);
END
GO



CREATE PROCEDURE pa_edificio_list(
	@idUbigeo char(6),
	@buscar varchar(50),
	@estado tinyint 
)
AS
BEGIN
	SET @buscar = '%' + REPLACE(@buscar, ' ', '%') + '%';

	SELECT idEdificio, nombre, nroPisos, estado, fecreg, ubig.idUbigeo
	FROM Edificio edificio
		INNER JOIN Ubigeo ubig ON edificio.idUbigeo = ubig.idUbigeo
	WHERE (edificio.nombre LIKE @buscar)
		AND (@idUbigeo <> '' OR ubig.idUbigeo = @idUbigeo)
		AND edificio.estado = @estado;
END
GO


GO

CREATE PROCEDURE pa_edificio_insert(
	@nombre varchar(50),
	@nroPisos int,	 
	@idUbigeo char(6),
	@idEdificio int OUTPUT
)
AS
BEGIN
	INSERT INTO Edificio (
		nombre,
		nroPisos,
		estado,
		fecreg,
		idUbigeo
	)
	VALUES (
		@nombre,
		@nroPisos,
		1,
		GETDATE(),
		@idUbigeo
	);
	SET @idEdificio = SCOPE_IDENTITY();
END
GO



CREATE PROCEDURE pa_edificio_update(
	@idEdificio int,
	@nombre varchar(50),
	@nroPisos int,	
	@idUbigeo char(6)
)
AS
BEGIN
	UPDATE Edificio
	SET nombre = @nombre,
		nroPisos = @nroPisos,		
		idUbigeo = @idUbigeo
	WHERE idEdificio = @idEdificio;
END
GO



CREATE PROCEDURE pa_edificio_activate(
	@idEdificio int
)
AS
BEGIN
	UPDATE Edificio
	SET estado = 1
	WHERE idEdificio = @idEdificio;
END
GO



CREATE PROCEDURE pa_edificio_delete(
	@idEdificio int
)
AS
BEGIN
	UPDATE Edificio
	SET estado = 0
	WHERE idEdificio = @idEdificio;
END
GO



CREATE PROCEDURE pa_servicio_getByID(
	@idServicio int
)
AS
BEGIN
	SELECT idServicio, nombre, estado, fecreg
	FROM Servicio serv
	WHERE serv.idServicio = @idServicio;
END
GO



CREATE PROCEDURE pa_servicio_listCbo(
	@idServicio int
)
AS
BEGIN
	SELECT idServicio, nombre, estado, fecreg
	FROM Servicio serv
	WHERE serv.estado = 1 OR (serv.idServicio = @idServicio);
END
GO



CREATE PROCEDURE pa_servicio_list(
	@buscar varchar(50),
	@estado tinyint 
)
AS
BEGIN
	SET @buscar = '%' + REPLACE(@buscar, ' ', '%') + '%';

	SELECT idServicio, nombre, estado, fecreg
	FROM Servicio serv
	WHERE (serv.nombre LIKE @buscar)
		AND serv.estado = @estado;
END
GO


go

CREATE PROCEDURE pa_servicio_insert(
	@nombre varchar(30),	
	@idServicio int OUTPUT
)
AS
BEGIN
	INSERT INTO Servicio (
		nombre,
		estado,
		fecreg
	)
	VALUES (
		@nombre,
		1,
		GETDATE()
	);
	SET @idServicio = SCOPE_IDENTITY();
END
GO



CREATE PROCEDURE pa_servicio_update(
	@idServicio int,
	@nombre varchar(30)
)
AS
BEGIN
	UPDATE Servicio
	SET nombre = @nombre
	WHERE idServicio = @idServicio;
END
GO



CREATE PROCEDURE pa_servicio_activate(
	@idServicio int
)
AS
BEGIN
	UPDATE Servicio
	SET estado = 1
	WHERE idServicio = @idServicio;
END
GO



CREATE PROCEDURE pa_servicio_delete(
	@idServicio int
)
AS
BEGIN
	UPDATE Servicio
	SET estado = 0
	WHERE idServicio = @idServicio;
END
GO


