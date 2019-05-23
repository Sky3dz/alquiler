create Procedure crear_Tarifa

( @id_Concepto int,
@id_Tarifa int,
 @periodo int,
 @estado char(1),
 @importe decimal(10,2)
 

 )
AS
begin
 insert into Tarifa(idConcepto,idTarifa,periodo,estado,importe)
  values (@id_Concepto,@id_Tarifa,@periodo,@estado,@importe)
end

create procedure update_tarifa
(
 @id_Concepto int,
@id_Tarifa int,
 @periodo int,
 @estado char(1),
 @importe decimal(10,2)
 
) 
as
update Tarifa set idConcepto = @id_Concepto,periodo=@periodo, estado = @estado, importe = @importe
where idTarifa = @id_Tarifa

DECLARE	@return_value int
  EXEC 	@return_value = update_tarifa
		@id_Concepto = 1,
		@id_Tarifa = 1,
		@periodo =2,
		@estado = 'c',
		@importe = '5200'

		SELECT	'Return Value' = @return_value

GO
select * from tarifa



IF OBJECT_ID('ReadTarifa') IS NOT NULL
BEGIN 
    DROP PROC ReadTarifa
END 
GO
CREATE PROC ReadTarifa
    @id_Tarifa int
AS 
BEGIN 
 
    SELECT idConcepto,periodo,estado,importe
    FROM   Tarifa  
    WHERE  (idTarifa = @id_Tarifa) 
END
GO

DECLARE	@return_value int
  EXEC 	@return_value = ReadTarifa
		
		@id_Tarifa = 1
		

		SELECT	'Return Value' = @return_value

GO



IF OBJECT_ID('DeleteTarifa') IS NOT NULL
BEGIN 
    DROP PROC DeleteTarifa
END 
GO
CREATE PROC DeleteTarifa
    @id_Tarifa int
AS 
BEGIN 
 DELETE
    FROM   Tarifa  
    WHERE  (idTarifa = @id_Tarifa) 
END
GO

DECLARE	@return_value int
  EXEC 	@return_value = DeleteTarifa
		
		@id_Tarifa = 2
		

		SELECT	'Return Value' = @return_value

GO
select * from tarifa



SELECT        c.idConcepto, c.nombre, c.estado, c.fijo, t.periodo, t.importe
FROM            Concepto as c  INNER JOIN
                         Tarifa as t ON c.idConcepto = t.idConcepto where nombre like '%'


create trigger seguridad_tri 

on database for DROP_TABLE, ALTER_TABLE 

as 

begin

raiserror ('No está permitido borrar ni modificar tablas !' , 16, 1)
rollback transaction
end