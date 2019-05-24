--INDICE Tabla: pago
CREATE INDEX IX_Pago_estado ON Pago (estado);
CREATE INDEX IX_Pago_fecha ON Pago (fecha);
--CHECK Tabla: pago

-- IF (OBJECT_ID('chk_pag_idTipoMopa') IS NOT NULL) ALTER TABLE Pago DROP CONSTRAINT chk_pag_idTipoMopa;
ALTER TABLE Pago
	ADD CONSTRAINT chk_pag_idTipoMopa CHECK (idTipoMopa > 0);

-- IF (OBJECT_ID('chk_pag_estado') IS NOT NULL) ALTER TABLE Pago DROP CONSTRAINT chk_pag_estado;
ALTER TABLE Pago
	ADD CONSTRAINT chk_pag_estado CHECK (LEN(rtrim(ltrim(estado))) > 0);

-- IF (OBJECT_ID('chk_pag_idPersona') IS NOT NULL) ALTER TABLE Pago DROP CONSTRAINT chk_pag_idPersona;
ALTER TABLE Pago
	ADD CONSTRAINT chk_pag_idPersona CHECK (idPersona > 0);

-- IF (OBJECT_ID('chk_pag_idMoneda') IS NOT NULL) ALTER TABLE Pago DROP CONSTRAINT chk_pag_idMoneda;
ALTER TABLE Pago
	ADD CONSTRAINT chk_pag_idMoneda CHECK (idMoneda > 0);

-- IF (OBJECT_ID('chk_pag_idTipoCam') IS NOT NULL) ALTER TABLE Pago DROP CONSTRAINT chk_pag_idTipoCam;
ALTER TABLE Pago
	ADD CONSTRAINT chk_pag_idTipoCam CHECK (idTipoCam > 0);

--CHECK Tabla: pago DETALLE

-- IF (OBJECT_ID('chk_pagcbte_idPago') IS NOT NULL) ALTER TABLE PagoComprobante DROP CONSTRAINT chk_pagcbte_idPago;
ALTER TABLE PagoComprobante
	ADD CONSTRAINT chk_pagcbte_idPago CHECK (idPago > 0);

-- IF (OBJECT_ID('chk_pagcbte_idComprobante') IS NOT NULL) ALTER TABLE PagoComprobante DROP CONSTRAINT chk_pagcbte_idComprobante;
ALTER TABLE PagoComprobante
	ADD CONSTRAINT chk_pagcbte_idComprobante CHECK (idComprobante > 0);

-- IF (OBJECT_ID('chk_pagcbte_importe') IS NOT NULL) ALTER TABLE PagoComprobante DROP CONSTRAINT chk_pagcbte_importe;
ALTER TABLE PagoComprobante
	ADD CONSTRAINT chk_pagcbte_importe CHECK (importe > 0);


--PA Tabla: pago


CREATE PROCEDURE pa_pago_getByID(
	@idPago int
)
AS
BEGIN
	SELECT idPago, tmodpag.idTipoMopa, tmodpag.nombre as tipomopa_nombre, 
		   pag.fecha as pag_fecha, pag.estado as pag_estado, pag.fecreg as pag_fecreg, 
		   pers.idPersona, pers.nombres as pers_nombres, mon.idMoneda, 
		   mon.nombre as mon_nombre, tc.idTipoCam, tc.importe
	FROM Pago pag
		INNER JOIN Moneda mon ON pag.idMoneda = mon.idMoneda
		INNER JOIN Persona pers ON pag.idPersona = pers.idPersona
		INNER JOIN TipoCambio tc ON pag.idTipoCam = tc.idTipoCam
		INNER JOIN TipoModoPago tmodpag ON pag.idTipoMopa = tmodpag.idTipoMopa
	WHERE pag.idPago = @idPago;
END
GO

-- Tabla: pago
-- IF (OBJECT_ID(pa_pago_listCbo) IS NOT NULL) DROP PROCEDURE pa_pago_listCbo;

CREATE PROCEDURE pa_pago_listCbo(
	@idPago int
)
AS
BEGIN
	SELECT idPago, tmodpag.idTipoMopa, tmodpag.nombre as tipomopa_nombre, 
		   pag.fecha as pag_fecha, pag.estado as pag_estado, pag.fecreg as pag_fecreg, 
		   pers.idPersona, pers.nombres as pers_nombres, mon.idMoneda, 
		   mon.nombre as mon_nombre, tc.idTipoCam, tc.importe
	FROM Pago pag
		INNER JOIN Moneda mon ON pag.idMoneda = mon.idMoneda
		INNER JOIN Persona pers ON pag.idPersona = pers.idPersona
		INNER JOIN TipoCambio tc ON pag.idTipoCam = tc.idTipoCam
		INNER JOIN TipoModoPago tmodpag ON pag.idTipoMopa = tmodpag.idTipoMopa
	WHERE pag.estado = 1 OR (pag.idPago = @idPago);
END
GO

-- Tabla: pago
-- IF (OBJECT_ID(pa_pago_list) IS NOT NULL) DROP PROCEDURE pa_pago_list;

CREATE PROCEDURE pa_pago_list(
	@fecha_ini datetime2,
	@fecha_fin datetime,
	@estado tinyint 
)
AS
BEGIN
	SELECT idPago, tmodpag.idTipoMopa, tmodpag.nombre as tipomopa_nombre, 
		   pag.fecha as pag_fecha, pag.estado as pag_estado, pag.fecreg as pag_fecreg, 
		   pers.idPersona, pers.nombres as pers_nombres, mon.idMoneda, 
		   mon.nombre as mon_nombre, tc.idTipoCam, tc.importe
	FROM Pago pag
		INNER JOIN Moneda mon ON pag.idMoneda = mon.idMoneda
		INNER JOIN Persona pers ON pag.idPersona = pers.idPersona
		INNER JOIN TipoCambio tc ON pag.idTipoCam = tc.idTipoCam
		INNER JOIN TipoModoPago tmodpag ON pag.idTipoMopa = tmodpag.idTipoMopa
	WHERE pag.estado = @estado and pag.fecha between @fecha_ini and @fecha_fin;
END
GO

-- Tabla: pago
-- IF (OBJECT_ID(pa_pago_insert) IS NOT NULL) DROP PROCEDURE pa_pago_insert;

CREATE PROCEDURE pa_pago_insert(
	@idPago int,
	@idTipoMopa int,
	@fecha datetime,
	@fecreg datetime,
	@idPersona int,
	@idMoneda int,
	@idTipoCam int
)
AS
BEGIN
	INSERT INTO Pago (
		idPago,
		idTipoMopa,
		fecha,
		estado,
		fecreg,
		idPersona,
		idMoneda,
		idTipoCam
	)
	VALUES (
		@idPago,
		@idTipoMopa,
		@fecha,
		1,
		@fecreg,
		@idPersona,
		@idMoneda,
		@idTipoCam
	);
END
GO

-- Tabla: pago
-- IF (OBJECT_ID(pa_pago_update) IS NOT NULL) DROP PROCEDURE pa_pago_update;

CREATE PROCEDURE pa_pago_update(
	@idPago int,
	@idTipoMopa int,
	@fecha datetime,
	@fecreg datetime,
	@idPersona int,
	@idMoneda int,
	@idTipoCam int
)
AS
BEGIN
	UPDATE Pago
	SET idPago = @idPago,
		idTipoMopa = @idTipoMopa,
		fecha = @fecha,
		fecreg = @fecreg,
		idPersona = @idPersona,
		idMoneda = @idMoneda,
		idTipoCam = @idTipoCam
	WHERE idPago = @idPago;
END
GO

-- Tabla: pago
-- IF (OBJECT_ID(pa_pago_delete) IS NOT NULL) DROP PROCEDURE pa_pago_delete;

CREATE PROCEDURE pa_pago_delete(
	@idPago int
)
AS
BEGIN
	UPDATE Pago
	SET estado = 0
	WHERE idPago = @idPago;
END
GO

--PA detalle pago
-- Tabla: pagocomprobante
-- IF (OBJECT_ID(pa_pagocomprobante_getByID) IS NOT NULL) DROP PROCEDURE pa_pagocomprobante_getByID;

CREATE PROCEDURE pa_pagocomprobante_getByID(
	@idPago int,
	@idComprobante int
)
AS
BEGIN
	SELECT pagcbte.idPago, pagcbte.idComprobante, importe
	FROM PagoComprobante pagcbte
		INNER JOIN Comprobante cbte ON pagcbte.idComprobante = cbte.idComprobante
		INNER JOIN Pago pag ON pagcbte.idPago = pag.idPago
	WHERE pagcbte.idPago = @idPago
		AND pagcbte.idComprobante = @idComprobante;
END
GO

-- Tabla: pagocomprobante
-- IF (OBJECT_ID(pa_pagocomprobante_listCbo) IS NOT NULL) DROP PROCEDURE pa_pagocomprobante_listCbo;

CREATE PROCEDURE pa_pagocomprobante_listCbo(
	@idPago int,
	@idComprobante int
)
AS
BEGIN
	SELECT pagcbte.idPago, pagcbte.idComprobante, importe
	FROM PagoComprobante pagcbte
		INNER JOIN Comprobante cbte ON pagcbte.idComprobante = cbte.idComprobante
		INNER JOIN Pago pag ON pagcbte.idPago = pag.idPago;
END
GO

-- Tabla: pagocomprobante
-- IF (OBJECT_ID(pa_pagocomprobante_list) IS NOT NULL) DROP PROCEDURE pa_pagocomprobante_list;

CREATE PROCEDURE pa_pagocomprobante_list(
	@buscar varchar(50) 
)
AS
BEGIN
	SELECT pagcbte.idPago, pagcbte.idComprobante, importe
	FROM PagoComprobante pagcbte
		INNER JOIN Comprobante cbte ON pagcbte.idComprobante = cbte.idComprobante
		INNER JOIN Pago pag ON pagcbte.idPago = pag.idPago;
END
GO

-- Tabla: pagocomprobante
-- IF (OBJECT_ID(pa_pagocomprobante_insert) IS NOT NULL) DROP PROCEDURE pa_pagocomprobante_insert;

CREATE PROCEDURE pa_pagocomprobante_insert(
	@idPago int,
	@idComprobante int,
	@importe decimal(10, 2)
)
AS
BEGIN
	INSERT INTO PagoComprobante (
		idPago,
		idComprobante,
		importe
	)
	VALUES (
		@idPago,
		@idComprobante,
		@importe
	);
END
GO

-- Tabla: pagocomprobante
-- IF (OBJECT_ID(pa_pagocomprobante_update) IS NOT NULL) DROP PROCEDURE pa_pagocomprobante_update;

CREATE PROCEDURE pa_pagocomprobante_update(
	@idPago int,
	@idComprobante int,
	@importe decimal(10, 2)
)
AS
BEGIN
	UPDATE PagoComprobante
	SET idPago = @idPago,
		idComprobante = @idComprobante,
		importe = @importe
	WHERE idPago = @idPago
	  AND idComprobante = @idComprobante;
END
GO

-- Trigers
DROP TRIGGER trg_pagocomprobante_insert;
GO

CREATE TRIGGER trg_pagocomprobante_insert
ON PagoComprobante FOR INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON  
    DECLARE @idComprobante INT
    DECLARE @idPago INT

    SET @idComprobante = (SELECT idComprobante FROM INSERTED);
    SET @idPago = (SELECT idPago FROM INSERTED);

    DECLARE @total_pagado decimal(9,2)

    -- calcular el saldo de un comprobante
    -- todos los pagos de una comprobante

    SET @total_pagado = (        
        SELECT SUM(pc.importe * tc.importe) AS total_pagado
        FROM pago pg
            INNER JOIN PagoComprobante pc ON pg.idPago = pc.idPago
            INNER JOIN TipoCambio tc ON pg.idTipoCam = tc.idTipoCam
        WHERE pc.idComprobante = @idComprobante             
    );

    UPDATE comprobante
    SET Saldo = total - @total_pagado,
        pagado = @total_pagado
    WHERE idComprobante = @idComprobante;    
END
GO
