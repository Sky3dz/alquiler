USE [alquiler]
GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCAROFICINASERVICIO]    Script Date: 21/05/2019 8:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BUSCAROFICINASERVICIO]
@BUSCAR VARCHAR(50)
AS
select S.nombre AS SERVICIO,O.nro as NRO,O.piso AS PISO,os.fecreg as FECHAREGISTRO from OficinaServicio os INNER JOIN  Servicio S ON os.idServicio=S.idServicio
INNER JOIN Oficina O ON os.idOficina=O.idOficina
where S.nombre like @BUSCAR +'%' OR O.nro like @BUSCAR +'%' OR O.piso like @BUSCAR +'%'
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAROFICINA]    Script Date: 21/05/2019 8:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ELIMINAROFICINA]
@IDOFICINA INT
AS
DELETE FROM Oficina WHERE idOficina=@IDOFICINA
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAROFICINASERVICIO]    Script Date: 21/05/2019 8:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ELIMINAROFICINASERVICIO]
@IDOFICINA INT,
@IDSERVICIO INT
AS
DELETE FROM OficinaServicio where idOficina=@IDOFICINA AND idServicio=@IDSERVICIO
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAROFICINA]    Script Date: 21/05/2019 8:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTAROFICINA]
AS
SELECT e.nombre as EDIFICIO,e.nroPisos as NROPISOS,o.nro AS OFICINA,o.piso as PISO FROM Oficina o inner join  Edificio e ON o.idEdificio=e.idEdificio
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAROFICINASERVICIO]    Script Date: 21/05/2019 8:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTAROFICINASERVICIO]
AS
select S.nombre AS SERVICIO,O.nro as NRO,O.piso AS PISO,os.fecreg as FECHAREGISTRO from OficinaServicio os INNER JOIN  Servicio S ON os.idServicio=S.idServicio
INNER JOIN Oficina O ON os.idOficina=O.idOficina
GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICAROFICINA]    Script Date: 21/05/2019 8:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MODIFICAROFICINA]
@IDOFICINA INT,
@IDEDIFICIO INT,
@PISO INT,
@ESTADO CHAR(1),
@NRO INT
AS
UPDATE Oficina SET 
idEdificio=@IDEDIFICIO,piso=@PISO,estado=@ESTADO,nro=@NRO
where idOficina=@IDOFICINA
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAROFICINA]    Script Date: 21/05/2019 8:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REGISTRAROFICINA]
@IDEDIFICIO INT,
@PISO INT,
@ESTADO CHAR(1),
@NRO INT
AS
INSERT INTO Oficina(idEdificio,piso,estado,nro,fecreg)
values(@IDEDIFICIO,@PISO,@ESTADO,@NRO,GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAROFICINASERVICIO]    Script Date: 21/05/2019 8:15:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REGISTRAROFICINASERVICIO]
@IDOFICINA INT,
@IDSERVICIO INT
AS
insert into OficinaServicio(idOficina,idServicio,fecreg)values(@IDOFICINA,@IDSERVICIO,GETDATE())
GO
