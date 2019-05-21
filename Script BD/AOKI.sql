USE [alquiler]
GO
/****** Object:  StoredProcedure [dbo].[SP_BUSCAROFICINASERVICIO]    Script Date: 21/05/2019 5:57:49 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_BUSCARSERVICIO]    Script Date: 21/05/2019 5:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BUSCARSERVICIO]
@BUSCAR VARCHAR(50)
AS
select  idServicio as ID,nombre as NOMBRE,estado as ESTADO,fecreg as FECHAREGISTRO from Servicio
where nombre like @BUSCAR +'%'
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINAROFICINASERVICIO]    Script Date: 21/05/2019 5:57:49 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ELIMINARSERVICIO]    Script Date: 21/05/2019 5:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ELIMINARSERVICIO]
@ID INT
AS
DELETE FROM Servicio where idServicio=@ID
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAROFICINASERVICIO]    Script Date: 21/05/2019 5:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTAROFICINASERVICIO]
AS
select S.nombre AS SERVICIO,O.nro as NRO,O.piso AS PISO,os.fecreg as FECHAREGISTRO from OficinaServicio os INNER JOIN  Servicio S ON os.idServicio=S.idServicio
INNER JOIN Oficina O ON os.idOficina=O.idOficina
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTARSERVICIO]    Script Date: 21/05/2019 5:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTARSERVICIO]
as
select  idServicio as ID,nombre as NOMBRE,estado as ESTADO,fecreg as FECHAREGISTRO from Servicio


GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICARSERVICIO]    Script Date: 21/05/2019 5:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MODIFICARSERVICIO]
@id int,
@nombre varchar(30),
@estado char(1)
AS
update Servicio set
nombre=@nombre,estado=@estado
where  idServicio=@id
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAROFICINASERVICIO]    Script Date: 21/05/2019 5:57:49 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_REGISTRARSERVICIO]    Script Date: 21/05/2019 5:57:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REGISTRARSERVICIO]
@nombre varchar(30),
@estado char(1)
AS
insert into Servicio(nombre,estado,fecreg) values(@nombre,@estado,GETDATE())
GO
