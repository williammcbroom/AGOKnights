
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/01/2014 17:07:10
-- Generated from EDMX file: C:\Users\Tommy\Documents\Visual Studio 2013\Projects\AGOKnights\AGOKnights\AGOKnightsDBModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AlphaSite];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [PersonId] int IDENTITY(1,1) NOT NULL,
    [Fname] nvarchar(max)  NOT NULL,
    [Lname] nvarchar(max)  NOT NULL,
    [BirthDate] nvarchar(max)  NULL,
    [Nickname] nvarchar(max)  NOT NULL,
    [StudentId] nvarchar(max)  NULL
);
GO

-- Creating table 'Addresses'
CREATE TABLE [dbo].[Addresses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Street] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL,
    [Alias] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Members'
CREATE TABLE [dbo].[Members] (
    [MemberId] int IDENTITY(1,1) NOT NULL,
    [OrganizationId] int  NOT NULL,
    [PersonId] int  NOT NULL
);
GO

-- Creating table 'Organizations'
CREATE TABLE [dbo].[Organizations] (
    [OrganizationId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Calendars'
CREATE TABLE [dbo].[Calendars] (
    [CalendarId] int IDENTITY(1,1) NOT NULL,
    [CalendarAlias] nvarchar(max)  NOT NULL,
    [OrganizationId] int  NOT NULL
);
GO

-- Creating table 'Events'
CREATE TABLE [dbo].[Events] (
    [NonRecurringEventId] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [StartTime] time  NOT NULL,
    [EndTime] time  NOT NULL,
    [HostPersonId] int  NOT NULL,
    [SponsorPersonId] int  NOT NULL,
    [Recurrance] nvarchar(max)  NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [LocationId] int  NOT NULL,
    [AddressId] int  NOT NULL,
    [Calendar_CalendarId] int  NOT NULL
);
GO

-- Creating table 'Offices'
CREATE TABLE [dbo].[Offices] (
    [OfficeId] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [MemberId] int  NOT NULL,
    [OrganizationId] int  NOT NULL,
    [Email] nvarchar(max)  NULL,
    [Calendar_CalendarId] int  NOT NULL
);
GO

-- Creating table 'EventSignIn'
CREATE TABLE [dbo].[EventSignIn] (
    [EventsAttended_NonRecurringEventId] int  NOT NULL,
    [Attendees_PersonId] int  NOT NULL
);
GO

-- Creating table 'AddressPerson'
CREATE TABLE [dbo].[AddressPerson] (
    [Addresses_Id] int  NOT NULL,
    [People_PersonId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [PersonId] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([PersonId] ASC);
GO

-- Creating primary key on [Id] in table 'Addresses'
ALTER TABLE [dbo].[Addresses]
ADD CONSTRAINT [PK_Addresses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [MemberId] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [PK_Members]
    PRIMARY KEY CLUSTERED ([MemberId] ASC);
GO

-- Creating primary key on [OrganizationId] in table 'Organizations'
ALTER TABLE [dbo].[Organizations]
ADD CONSTRAINT [PK_Organizations]
    PRIMARY KEY CLUSTERED ([OrganizationId] ASC);
GO

-- Creating primary key on [CalendarId] in table 'Calendars'
ALTER TABLE [dbo].[Calendars]
ADD CONSTRAINT [PK_Calendars]
    PRIMARY KEY CLUSTERED ([CalendarId] ASC);
GO

-- Creating primary key on [NonRecurringEventId] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [PK_Events]
    PRIMARY KEY CLUSTERED ([NonRecurringEventId] ASC);
GO

-- Creating primary key on [OfficeId] in table 'Offices'
ALTER TABLE [dbo].[Offices]
ADD CONSTRAINT [PK_Offices]
    PRIMARY KEY CLUSTERED ([OfficeId] ASC);
GO

-- Creating primary key on [EventsAttended_NonRecurringEventId], [Attendees_PersonId] in table 'EventSignIn'
ALTER TABLE [dbo].[EventSignIn]
ADD CONSTRAINT [PK_EventSignIn]
    PRIMARY KEY CLUSTERED ([EventsAttended_NonRecurringEventId], [Attendees_PersonId] ASC);
GO

-- Creating primary key on [Addresses_Id], [People_PersonId] in table 'AddressPerson'
ALTER TABLE [dbo].[AddressPerson]
ADD CONSTRAINT [PK_AddressPerson]
    PRIMARY KEY CLUSTERED ([Addresses_Id], [People_PersonId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [OrganizationId] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [FK_OrganizationMembership]
    FOREIGN KEY ([OrganizationId])
    REFERENCES [dbo].[Organizations]
        ([OrganizationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrganizationMembership'
CREATE INDEX [IX_FK_OrganizationMembership]
ON [dbo].[Members]
    ([OrganizationId]);
GO

-- Creating foreign key on [PersonId] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [FK_PersonMembership]
    FOREIGN KEY ([PersonId])
    REFERENCES [dbo].[People]
        ([PersonId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonMembership'
CREATE INDEX [IX_FK_PersonMembership]
ON [dbo].[Members]
    ([PersonId]);
GO

-- Creating foreign key on [OrganizationId] in table 'Calendars'
ALTER TABLE [dbo].[Calendars]
ADD CONSTRAINT [FK_OrganizationCalendar]
    FOREIGN KEY ([OrganizationId])
    REFERENCES [dbo].[Organizations]
        ([OrganizationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrganizationCalendar'
CREATE INDEX [IX_FK_OrganizationCalendar]
ON [dbo].[Calendars]
    ([OrganizationId]);
GO

-- Creating foreign key on [HostPersonId] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [FK_EventHost]
    FOREIGN KEY ([HostPersonId])
    REFERENCES [dbo].[People]
        ([PersonId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EventHost'
CREATE INDEX [IX_FK_EventHost]
ON [dbo].[Events]
    ([HostPersonId]);
GO

-- Creating foreign key on [SponsorPersonId] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [FK_EventSponsor]
    FOREIGN KEY ([SponsorPersonId])
    REFERENCES [dbo].[People]
        ([PersonId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EventSponsor'
CREATE INDEX [IX_FK_EventSponsor]
ON [dbo].[Events]
    ([SponsorPersonId]);
GO

-- Creating foreign key on [Calendar_CalendarId] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [FK_NonRecurringCalendarEvent]
    FOREIGN KEY ([Calendar_CalendarId])
    REFERENCES [dbo].[Calendars]
        ([CalendarId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_NonRecurringCalendarEvent'
CREATE INDEX [IX_FK_NonRecurringCalendarEvent]
ON [dbo].[Events]
    ([Calendar_CalendarId]);
GO

-- Creating foreign key on [MemberId] in table 'Offices'
ALTER TABLE [dbo].[Offices]
ADD CONSTRAINT [FK_OfficeMember]
    FOREIGN KEY ([MemberId])
    REFERENCES [dbo].[Members]
        ([MemberId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OfficeMember'
CREATE INDEX [IX_FK_OfficeMember]
ON [dbo].[Offices]
    ([MemberId]);
GO

-- Creating foreign key on [OrganizationId] in table 'Offices'
ALTER TABLE [dbo].[Offices]
ADD CONSTRAINT [FK_OrganizationOffice]
    FOREIGN KEY ([OrganizationId])
    REFERENCES [dbo].[Organizations]
        ([OrganizationId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OrganizationOffice'
CREATE INDEX [IX_FK_OrganizationOffice]
ON [dbo].[Offices]
    ([OrganizationId]);
GO

-- Creating foreign key on [EventsAttended_NonRecurringEventId] in table 'EventSignIn'
ALTER TABLE [dbo].[EventSignIn]
ADD CONSTRAINT [FK_EventSignIn_Event]
    FOREIGN KEY ([EventsAttended_NonRecurringEventId])
    REFERENCES [dbo].[Events]
        ([NonRecurringEventId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Attendees_PersonId] in table 'EventSignIn'
ALTER TABLE [dbo].[EventSignIn]
ADD CONSTRAINT [FK_EventSignIn_Person]
    FOREIGN KEY ([Attendees_PersonId])
    REFERENCES [dbo].[People]
        ([PersonId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EventSignIn_Person'
CREATE INDEX [IX_FK_EventSignIn_Person]
ON [dbo].[EventSignIn]
    ([Attendees_PersonId]);
GO

-- Creating foreign key on [Addresses_Id] in table 'AddressPerson'
ALTER TABLE [dbo].[AddressPerson]
ADD CONSTRAINT [FK_AddressPerson_Address]
    FOREIGN KEY ([Addresses_Id])
    REFERENCES [dbo].[Addresses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [People_PersonId] in table 'AddressPerson'
ALTER TABLE [dbo].[AddressPerson]
ADD CONSTRAINT [FK_AddressPerson_Person]
    FOREIGN KEY ([People_PersonId])
    REFERENCES [dbo].[People]
        ([PersonId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_AddressPerson_Person'
CREATE INDEX [IX_FK_AddressPerson_Person]
ON [dbo].[AddressPerson]
    ([People_PersonId]);
GO

-- Creating foreign key on [AddressId] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [FK_EventAddress]
    FOREIGN KEY ([AddressId])
    REFERENCES [dbo].[Addresses]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EventAddress'
CREATE INDEX [IX_FK_EventAddress]
ON [dbo].[Events]
    ([AddressId]);
GO

-- Creating foreign key on [Calendar_CalendarId] in table 'Offices'
ALTER TABLE [dbo].[Offices]
ADD CONSTRAINT [FK_OfficeCalendar]
    FOREIGN KEY ([Calendar_CalendarId])
    REFERENCES [dbo].[Calendars]
        ([CalendarId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OfficeCalendar'
CREATE INDEX [IX_FK_OfficeCalendar]
ON [dbo].[Offices]
    ([Calendar_CalendarId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------