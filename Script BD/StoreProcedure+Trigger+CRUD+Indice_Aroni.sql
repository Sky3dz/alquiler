USE [ALQUILER]
GO
/****** Object:  StoredProcedure [dbo].[delt_moneda]    Script Date: 23/05/2019 21:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[delt_moneda]
@idMoneda as int
as
delete from Moneda
where idMoneda=@idMoneda
GO
/****** Object:  StoredProcedure [dbo].[delt_Tip_med_com]    Script Date: 23/05/2019 21:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[delt_Tip_med_com]
@idTipomeco as int
as
delete from TipoMedioComunicacion
where idTipomeco=@idTipomeco

GO
/****** Object:  StoredProcedure [dbo].[insertar_Moneda]    Script Date: 23/05/2019 21:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[insertar_Moneda]

( 
@idMoneda  int,
@nombre   varchar(25),
@codSunat   varchar(2),
@codInternacional varchar(4),
@estado  char(1),
@fecreg   datetime
 )
AS
begin
insert into Moneda ([idMoneda], [nombre] , [codSunat] , [codInternacional] ,[estado] , [fecreg] ) 

 values (@idMoneda, @nombre , @codSunat, @codInternacional , @estado  , @fecreg  )
 END
GO
/****** Object:  StoredProcedure [dbo].[insertar_Tip_med_com]    Script Date: 23/05/2019 21:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[insertar_Tip_med_com]

( @idTipomeco int,
 @nombre varchar(30)
 )
AS
begin
 insert into TipoMedioComunicacion([idTipomeco] , [nombre])
  values (@idTipomeco, @nombre)
End
GO
/****** Object:  StoredProcedure [dbo].[sp_cons_Moneda]    Script Date: 23/05/2019 21:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_cons_Moneda]
as
select * from Moneda
GO
/****** Object:  StoredProcedure [dbo].[sp_cons_registros_Moneda]    Script Date: 23/05/2019 21:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[sp_cons_registros_Moneda]
as
SELECT CAST( fecreg AS DATE ) as Dia, COUNT( idMoneda ) as Total_Registros
FROM Moneda
GROUP BY CAST( fecreg AS DATE )
GO
/****** Object:  StoredProcedure [dbo].[sp_cons_TipmedCom]    Script Date: 23/05/2019 21:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_cons_TipmedCom]
as
select * from TipoMedioComunicacion
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_reporte_fechas_moneda]    Script Date: 23/05/2019 21:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spbuscar_reporte_fechas_moneda]
	@FechaInicio datetime,
	@FechaFin datetime
AS
BEGIN
	SELECT
		m.idMoneda, 
		m.nombre ,
		m.codSunat, 
		m.codInternacional, 
		m.estado, 
		m.fecreg 
		
	FROM  
		Moneda m
	WHERE
		m.fecreg BETWEEN @FechaInicio AND @FechaFin
END
GO
/****** Object:  StoredProcedure [dbo].[Update_Moneda]    Script Date: 23/05/2019 21:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Update_Moneda]

( 
@idMoneda  int,
@nombre   varchar(25),
@codSunat   varchar(2),
@codInternacional  varchar(4),
@estado  char(1),
@fecreg   datetime
 )
AS
Update Moneda set  @nombre=nombre, @codSunat=codSunat , @codInternacional=codInternacional,
@estado=estado,@fecreg=fecreg
where @idMoneda= idMoneda
GO
/****** Object:  StoredProcedure [dbo].[Update_Tip_med_com]    Script Date: 23/05/2019 21:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Update_Tip_med_com]

( @idTipomeco int,
 @nombre varchar(30)
 )
AS
Update TipoMedioComunicacion set  @nombre=nombre
where @idTipomeco= idTipomeco
GO
/****** Object:  StoredProcedure [dbo].[ver_Moneda]    Script Date: 23/05/2019 21:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ver_Moneda]
as
select * From Moneda
GO
/****** Object:  StoredProcedure [dbo].[ver_TipoMedioComunicacion]    Script Date: 23/05/2019 21:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ver_TipoMedioComunicacion]
as
select * From TipoMedioComunicacion
GO
/****** Object:  DdlTrigger [seguridad_tri]    Script Date: 23/05/2019 21:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [seguridad_tri] 

on database for DROP_TABLE, ALTER_TABLE 

as 

begin

raiserror ('No está permitido borrar ni modificar tablas !' , 16, 1)
rollback transaction
end 
GO
ENABLE TRIGGER [seguridad_tri] ON DATABASE
GO
