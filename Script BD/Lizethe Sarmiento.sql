USE [alquiler]
GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCARDIRECCIONPERSONA]    Script Date: 22/05/2019 1:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BUSCARDIRECCIONPERSONA]
@NRODOCUMENTO CHAR(11)
AS
select d.idDireccion as ID,d.valor AS DIRECCION,p.nombres as PERSONA from Direccion d inner join Persona p on d.idPersona=p.idPersona
where p.nrodocu LIKE @NRODOCUMENTO+'%'
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINARDIRECCIONPERSONA]    Script Date: 22/05/2019 1:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ELIMINARDIRECCIONPERSONA]
@IDDIRECCION INT
AS
DELETE FROM Direccion where idDireccion=@IDDIRECCION
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINARPERSONA]    Script Date: 22/05/2019 1:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ELIMINARPERSONA]
@IDPERSONA INT
AS
DELETE FROM Persona where idPersona=@IDPERSONA
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTARBUSCARNOMBREPERSONA]    Script Date: 22/05/2019 1:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTARBUSCARNOMBREPERSONA]
@NOMBRE VARCHAR(100)
AS
SELECT p.idPersona as ID,p.nombres AS PERSONA,CASE WHEN p.estado = 0 THEN 'INACTIVO'  ELSE  'ACTIVO' END  AS ESTADO,
p.fecreg as FECHAREGISTRO,p.nrodocu, t.nombre TIPODOCUMENTO 
FROM Persona p inner join tipoDocumentoIdentidad t on p.idtipodoide=t.idtipodoide
WHERE p.nombres LIKE @NOMBRE + '%'
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTARDATOSPERSONA]    Script Date: 22/05/2019 1:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTARDATOSPERSONA]
AS
SELECT p.idPersona as ID,p.nombres AS PERSONA,CASE WHEN p.estado = 0 THEN 'INACTIVO'  ELSE  'ACTIVO' END  AS ESTADO,
p.fecreg as FECHAREGISTRO,p.nrodocu, t.nombre TIPODOCUMENTO 
FROM Persona p inner join tipoDocumentoIdentidad t on p.idtipodoide=t.idtipodoide
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTARDIRECCION]    Script Date: 22/05/2019 1:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTARDIRECCION]
AS
select d.idDireccion as ID,d.valor AS DIRECCION,p.nombres as PERSONA from Direccion d inner join Persona p on d.idPersona=p.idPersona
GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICARDIRECCION]    Script Date: 22/05/2019 1:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MODIFICARDIRECCION]
@IDDIRECCION INT,
@IDPERSONA INT,
@IDUBIGEO INT,
@VALOR VARCHAR(100)
AS
UPDATE Direccion set idPersona=@IDPERSONA,idUbigeo=@IDUBIGEO,valor=@VALOR
where idDireccion=@IDDIRECCION
GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICARPERSONA]    Script Date: 22/05/2019 1:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MODIFICARPERSONA]
@IDPERSONA INT,
@NOMBRE VARCHAR(100),
@TIPOPERSONA CHAR(1),
@ESTADO CHAR(1),
@NRODOCUMENTO VARCHAR(11),
@TIPODOCUMENTO INT
AS
update Persona SET tipoPersona=@TIPOPERSONA,nombres=@NOMBRE,estado=@ESTADO,nrodocu=@NRODOCUMENTO,idtipodoide=@TIPODOCUMENTO
WHERE idPersona=@IDPERSONA
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRODIRECCION]    Script Date: 22/05/2019 1:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REGISTRODIRECCION]
@IDPERSONA INT,
@IDUBIGEO INT,
@VALOR VARCHAR(100)
AS
INSERT INTO Direccion(idPersona,idUbigeo,valor) VALUES(@IDPERSONA,@IDUBIGEO,@VALOR)
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTROPERSONA]    Script Date: 22/05/2019 1:09:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REGISTROPERSONA]
@NOMBRE VARCHAR(100),
@TIPOPERSONA CHAR(1),
@ESTADO CHAR(1),
@NRODOCUMENTO VARCHAR(11),
@TIPODOCUMENTO INT
AS
INSERT INTO Persona(tipoPersona,nombres,estado,fecreg,nrodocu,idtipodoide)
VALUES(@TIPOPERSONA,@NOMBRE,@ESTADO,GETDATE(),@NRODOCUMENTO,@TIPODOCUMENTO)
GO
