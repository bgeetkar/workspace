GO

BEGIN TRY

	BEGIN TRAN

		/****** Object:  Table [dbo].[Employees]    Script Date: 4/24/2024 6:03:39 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
	DROP TABLE [dbo].[Employees]

	COMMIT TRAN
END TRY

BEGIN CATCH    
		IF @@TRANCOUNT>0    
					BEGIN    
									ROLLBACK TRAN;    
											END;    
												EXEC dbo.Log_ProcedureCall @ObjectID = @@PROCID;    
											END CATCH  

											GO

											BEGIN TRY

												BEGIN TRAN

													CREATE TABLE [dbo].[Employees](
															[EmployeeID] [int] NOT NULL,
																[FirstName] [nvarchar](50) NULL,
																	[LastName] [nvarchar](50) NULL,
																		[Department] [nvarchar](50) NULL,
																			[Salary] [decimal](10, 2) NULL,
																			PRIMARY KEY CLUSTERED 
																			(
																					[EmployeeID] ASC
																				)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
																			) ON [PRIMARY]

																			COMMIT TRAN
																		END TRY

																		BEGIN CATCH    
																				IF @@TRANCOUNT>0    
																							BEGIN    
																											ROLLBACK TRAN;    
																													END;    
																														EXEC dbo.Log_ProcedureCall @ObjectID = @@PROCID;    
																													END CATCH  

																													BEGIN TRY

																														BEGIN TRAN

																															CREATE TABLE [dbo].[Employees](
																																	[EmployeeID] [int] NOT NULL,
																																		[FirstName] [nvarchar](50) NULL,
																																			[LastName] [nvarchar](50) NULL,
																																				[Department] [nvarchar](50) NULL,
																																					[Salary] [decimal](10, 2) NULL,
																																					PRIMARY KEY CLUSTERED 
																																					(
																																							[EmployeeID] ASC
																																						)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
																																					) ON [PRIMARY]

																																					ALTER TABLE [dbo].[Employees]
																																					ADD StatusId INT NULL DEFAULT 1

																																					ALTER TABLE [dbo].[Employees]
																																					ALTER COLUMN [Department] [nvarchar](100) NULL

																																					COMMIT TRAN
																																				END TRY

																																				BEGIN CATCH    
																																						IF @@TRANCOUNT>0    
																																									BEGIN    
																																													ROLLBACK TRAN;    
																																															END;    
																																																EXEC dbo.Log_ProcedureCall @ObjectID = @@PROCID;    
																																															END CATCH  


