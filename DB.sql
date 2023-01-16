create database ms2
go
create proc createAllTables as
	create table SystemUser(
		username varchar(20) primary key,
		pswd varchar(20)
	)
	create table StadiumManager(
		 id int primary key identity,
		 sname varchar(20),
		 username varchar(20),

		 constraint fk_SM foreign key (username) references SystemUser (username) on update cascade on delete cascade
	)

	create table ClubRepresentative(
		 id int primary key identity,
		 rname varchar(20),
		 username varchar(20),

		 constraint fk_CR foreign key (username) references SystemUser (username) on update cascade on delete cascade

	)

	create table Fan(
		 nationalID int primary key,
		 fname varchar(20),
		 username varchar(20),
		 birthday datetime,
		 phoneNo int,
		 unblocked bit,
		 faddress varchar(20)

		constraint fk_F foreign key (username) references SystemUser (username) on update cascade on delete cascade

	)

	create table SportsAssManager(
		 id int primary key identity,
		 sname varchar(20),
		 username varchar(20),

		constraint fk_SAM foreign key (username) references SystemUser (username) on update cascade on delete cascade

	)

	create table SystemAdmin(
		 id int primary key identity,
		 sname varchar(20),
		 username varchar(20),

		 constraint fk_SA foreign key (username) references SystemUser (username) on update cascade on delete cascade

	)

	create table Stadium(
		 id int primary key identity,
		 stadiumManagerID int,
		 sname varchar(20),
		 available bit,
		 capacity int,
		 slocation varchar(20),
		 username varchar(20),
		 pswd varchar(20)

		constraint fk_StadM foreign key (stadiumManagerID) references StadiumManager (id) on update cascade on delete cascade
	)

	create table Club(
		id int primary key identity,
		cname varchar(20),
		clocation varchar(20),
		clubRepresentativeID int

		constraint fk_ClubCR foreign key (clubRepresentativeID) references ClubRepresentative (id) on update cascade on delete cascade
	)

	create table Match(
		id int primary key identity,
		startTime datetime,
		endTime datetime,
		stadiumID int,
		hostClubID int not null,
		guestClubID int not null,
		check (guestClubID != hostClubID),

		constraint fk_Stad foreign key (stadiumID) references Stadium (id) on update cascade on delete cascade,
		constraint fk_guestClub foreign key (guestClubID) references Club (id),
		constraint fk_hostClub foreign key (hostClubID) references Club (id)
	
	)

	create table HostRequest(
		id int primary key identity,
		approved bit,
		matchID int not null,
		stadiumManagerID int not null,
		clubRepresentativeID int not null,


		constraint fk_hostRequestMatch foreign key (matchID) references Match (id)  on update cascade on delete cascade,
		constraint fk_hostRequestSM foreign key (stadiumManagerID) references StadiumManager (id),
		constraint fk_hostRequestCR foreign key (clubRepresentativeID) references ClubRepresentative (id)
	)

	create table Ticket(
		id int primary key identity,
		available bit,
		fanID int,
		matchID int not null,

		foreign key (fanID) references Fan (nationalID) on update cascade on delete cascade,
		foreign key (matchID) references Match (id)

	)
go
create proc dropAllTables as
	drop table Ticket, SystemAdmin, SportsAssManager, HostRequest, Fan, Match, Club, Stadium, ClubRepresentative, StadiumManager, SystemUser;
go
create proc dropAllProceduresFunctionsViews as
	drop proc createAllTables
	drop proc dropAllTables
	drop proc clearAllTables
	drop view allAssocManagers
	drop view allClubRepresentatives
	drop view allStadiumManagers
	drop view allFans
	drop view allMatches
	drop view allTickets
	drop view allClubs
	drop view allStadiums
	drop view allRequests
	drop proc addAssociationManager
	drop proc addNewMatch
	drop view clubsWithNoMatches
	drop proc deleteMatch
	drop proc deleteMatchesOnStadium
	drop proc addClub
	drop proc addTicket
	drop proc deleteClub
	drop proc addStadium
	drop proc deleteStadium
	drop proc blockFan
	drop proc unblockFan
	drop proc addRepresentative
	drop function viewAvailableStadiumsOn
	drop proc addHostRequest
	drop function allUnassignedMatches
	drop proc addStadiumManager
	drop function allPendingRequests
	drop proc acceptRequest
	drop proc rejectRequest
	drop proc addFan
	drop function upcomingMatchesOfClub
	drop function availableMatchesToAttend
	drop proc purchaseTicket
	drop proc updateMatchTiming
	drop view matchesPerTeam
	drop proc deleteMatchesOn
	drop view matchWithMostSoldTickets
	drop view matchesRankedBySoldTickets
	drop view clubWithTheMostSoldTickets
	drop view clubsRankedBySoldTickets
	drop function stadiumsNeverPlayedOn
go
create proc clearAllTables as
	exec dropAllTables
	exec createAllTables
go
create view allAssocManagers as
	select s.username, u.pswd, s.sname
	from SportsAssManager s, SystemUser u
	where s.username = u.username
go
create view allClubRepresentatives as
	select s.username, u.pswd, s.rname, c.cname
	from ClubRepresentative s, SystemUser u, Club c
	where s.username = u.username and c.clubRepresentativeID = s.id
go
create view allStadiumManagers as
	select s.username, u.pswd, s.sname, c.sname as StadiumName
	from StadiumManager s, SystemUser u, Stadium c
	where s.username = u.username and c.stadiumManagerID = s.id
go
create view allFans as
	select f.username, u.pswd, f.fname, f.nationalID, f.birthday, f.unblocked
	from Fan f, SystemUser u
	where f.username = u.username
go
create view allMatches as
	select host.cname as HostName, guest.cname as GuestName, m.startTime
	from Club host, Club guest, Match m
	where m.hostClubID = host.id and m.guestClubID = guest.id
go
create view allTickets as
	select host.cname as HostName, guest.cname as GuestName, s.sname, startTime
	from Ticket t, Match m, Club host, Club guest, Stadium s
	where t.matchID = m.id and host.id = m.hostClubID and guest.id = m.guestClubID and s.id = m.stadiumID
go
create view allClubs as
	select cname, clocation
	from Club
go
create view allStadiums as
	select sname, slocation, capacity, available
	from Stadium
go
create view allRequests as
	select c.rname, s.sname, r.approved
	from HostRequest r, ClubRepresentative c, StadiumManager s
	where r.clubRepresentativeID = c.id and r.stadiumManagerID = s.id
go
create proc addAssociationManager 
	@name varchar(20),
	@username varchar(20),
	@password varchar(20)

	as

	insert into SystemUser values(@username, @password);
	insert into SportsAssManager(sname, username) values(@name,@username);
go
create proc addNewMatch
	@host_club varchar(20), 
	@guest_club varchar(20),
	@start_time DATETIME,
	@end_time DATETIME
	as
	
	declare @hostID int
	declare @guestID int
	select @hostID = id from Club where cname = @host_club
	select @guestID = id from Club where cname = @guest_club
	
	insert into Match (startTime, endTime, hostClubID, guestClubID) values (@start_time, @end_time, @hostID, @guestID)
go
create view clubsWithNoMatches as
	select distinct c.cname 
	from Club c
	except (select distinct c2.cname
			from Club c2, Match m
			where c2.id = m.hostClubID or c2.id = m.guestClubID)
go
create proc deleteMatch 
	@hostClub varchar(20),
	@guestClub varchar(20)
	as

	declare @hostID int
	declare @guestID int
	select @hostID = id from Club where cname = @hostClub
	select @guestID = id from Club where cname = @guestClub


	delete from Ticket where matchID in (select id from Match where hostClubID = @hostID and guestClubID = @guestID)
	delete from HostRequest where matchID in (select id from Match where hostClubID = @hostID or guestClubID = @guestID)
	delete from Match where hostClubID = @hostID and guestClubID = @guestID
go
create proc deleteMatchesOnStadium
	@StadiumName varchar(20)
	as
	declare @stadiumID int
	select @stadiumID = id from Stadium where sname = @StadiumName


	delete from Ticket where matchID in (select id from Match where stadiumID = @stadiumID)
	delete from HostRequest where matchID in (select id from Match where stadiumID = @stadiumID)
	delete from Match where stadiumID = @stadiumID
go
create proc addClub
	@clubName varchar(20),
	@clubLocation varchar(20)
	as
	insert into Club (cname, clocation) values (@clubName, @clubLocation)
go
create proc addTicket
	@hostName varchar(20),
	@guestName varchar(20),
	@startTime datetime
	as
	
	declare @hostID int
	declare @guestID int
	select @hostID = id from Club where cname = @hostName
	select @guestID = id from Club where cname = @guestName

	declare @matchID int
	select @matchID = id from Match where hostClubID = @hostID and guestClubID = @guestID and startTime = @startTime

	insert into Ticket (available, matchID) values (1, @matchID)
go
create proc deleteClub
	@clubName varchar(20)
	as
	declare @clubID int
	select @clubID = id from Club where cname = @clubName

	delete from Ticket where matchID in (select id from Match where hostClubID = @clubID or guestClubID = @clubID)
	delete from HostRequest where matchID in (select id from Match where hostClubID = @clubID or guestClubID = @clubID)
	delete from Match where hostClubID = @clubID or guestClubID = @clubID
	delete from Club where cname = @clubName
go
create proc addStadium
	@name varchar(20),
	@location varchar(20),
	@capacity int
	as
	insert into Stadium (sname, slocation, capacity, available) values (@name, @location, @capacity, 1)
go
create proc deleteStadium
	@name varchar(20)
	as
	declare @stadiumID int
	select @stadiumID = id from Stadium where sname = @name

	exec deleteMatchesOnStadium @name
	delete from Stadium where sname = @name
go
create proc blockFan
	@id int
	as
	update Fan set unblocked = 0 where nationalID = @id
go
create proc unblockFan
	@id int
	as
	update Fan set unblocked = 1 where nationalID = @id
go
create proc addRepresentative
	@name varchar(20),
	@clubName varchar(20),
	@username varchar(20),
	@password varchar(20)
	as

	

	insert into SystemUser values (@username, @password)
	insert into ClubRepresentative (rname, username) values (@name, @username)

	declare @clubID int
	select @clubID = id from Club where cname = @clubName
	declare @repID int
	select @repID = id from ClubRepresentative where username = @username

	update Club set clubRepresentativeID = @repID where id = @clubID
go
create function viewAvailableStadiumsOn (@date datetime)
	returns table
	as
	
	return( 
		select sname as Stadium, slocation as Location, capacity as Capacity
		from Stadium s
		where available = 1
		except (select sname, slocation, capacity
			from Stadium s
			inner join Match m on m.stadiumID = s.id
			where @date between m.startTime and m.endTime)
	)
go
create proc addHostRequest
	@clubName varchar(20),
	@stadiumName varchar(20),
	@time datetime
	as
	declare @matchID int
	declare @clubRepID int
	declare @stadManID int
	
	select @matchID = m.id, @clubRepID = crep.id, @stadManID = sman.id
	from Club c inner join ClubRepresentative crep on crep.id = c.clubRepresentativeID
	inner join Match m on c.id = m.hostClubID
	inner join Stadium s on sname = @stadiumName
	inner join StadiumManager sman on s.stadiumManagerID = sman.id
	where m.startTime = @time and c.cname = @clubName

	insert into HostRequest (matchID, clubRepresentativeID, stadiumManagerID, approved) values (@matchID, @clubRepID, @stadManID, null)
go
create function allUnassignedMatches (@hostName varchar(20))
	returns table
	as
	return(
		select c.cname, m.startTime
		from Match m
		inner join Club c on m.guestClubID = c.id
		where m.stadiumID is null and m.hostClubID
		in (select hostClubID from Club where cname = @hostName)
	)
go
create proc addStadiumManager
	@name varchar(20),
	@stadiumName varchar(20),
	@username varchar(20),
	@password varchar(20)
	as

	insert into SystemUser values (@username, @password)
	insert into StadiumManager (username, sname) values (@username, @name)

	declare @stadManID int
	select @stadManID = sman.id from StadiumManager sman where username = @username

	update Stadium set stadiumManagerID = @stadManID where sname = @stadiumName
go
create function allPendingRequests (@stadMUsername varchar(20))
	returns table
	as
	return (
		select cr.rname, c.cname, m.startTime
		from HostRequest h
		inner join StadiumManager sm on h.stadiumManagerID = sm.id
		inner join ClubRepresentative cr on h.clubRepresentativeID = cr.id
		inner join Match m on h.matchID = m.id
		inner join Club c on c.id = m.guestClubID
		where h.approved is null
	)
go
create proc acceptRequest
	@stadMUsername varchar(20),
	@hostClub varchar(20),
	@guestClub varchar(20),
	@startTime datetime
	as
	declare @guestID int
	select @guestID = id from Club where cname = @guestClub
	declare @hostID int
	select @hostID = id from Club where cname = @hostClub
	update HostRequest set approved = 1
	where stadiumManagerID in (select id from StadiumManager where username = @stadMUsername)
	and matchID in (select id from Match where guestClubID = @guestID and hostClubID = @hostID and startTime = @startTime)
	
	declare @stadiumManagerID int
	select @stadiumManagerID = id from StadiumManager where username = @stadMUsername


	declare @stadiumID int
	select @stadiumID = id from Stadium where stadiumManagerID = @stadiumManagerID


	update Match set stadiumID = @stadiumID
	where id in (select id from Match where guestClubID = @guestID and hostClubID = @hostID and startTime = @startTime)
go
create proc rejectRequest
	@stadMUsername varchar(20),
	@hostClub varchar(20),
	@guestClub varchar(20),
	@startTime datetime
	as
	declare @guestID int
	select @guestID = id from Club where cname = @guestClub
	declare @hostID int
	select @hostID = id from Club where cname = @hostClub
	update HostRequest set approved = 0
	where stadiumManagerID in (select id from StadiumManager where username = @stadMUsername)
	and matchID in (select id from Match where guestClubID = @guestID and hostClubID = @hostID and startTime = @startTime)
go
create proc addFan
	@name varchar(20),
	@username varchar(20),
	@password varchar(20),
	@nationalID int,
	@birthday datetime,
	@address varchar(20),
	@phone int
	as
	insert into SystemUser values (@username, @password)
	insert into Fan (username, fname, nationalID, birthday, faddress, phoneNo, unblocked)
	values (@username, @name, @nationalID, @birthday, @address, @phone, 1)
go
create function upcomingMatchesOfClub (@clubName varchar(20))
	returns table
	as
	return (
		select c.cname as RequiredClub, c2.cname as Opps, m.startTime, s.sname
		from Club c
		inner join Match m on c.id = m.guestClubID or c.id = m.hostClubID
		inner join Club c2 on c2.cname != @clubName	and (c2.id = m.guestClubID or c2.id = m.hostClubID)
		inner join Stadium s on m.stadiumID = s.id
		where c.cname = @clubName and CURRENT_TIMESTAMP < m.startTime
	)
go
create function availableMatchesToAttend (@StartTime datetime)
	returns table
	as
	return(
		select host.cname as Host, guest.cname as Guest, s.sname
		from Match m
		inner join Club host on m.hostClubID = host.id
		inner join Club guest on m.guestClubID = guest.id
		inner join Stadium s on m.stadiumID = s.id
		where exists (select * from Ticket t where t.matchID = m.id and t.available = 1) and @StartTime >= m.startTime
	)
go
create proc purchaseTicket
	@nationalID varchar(20),
	@hostClub  varchar(20),
	@guestClub varchar(20),
	@startTime datetime
	as
	declare @guestID int
	select @guestID = id from Club where cname = @guestClub
	declare @hostID int
	select @hostID = id from Club where cname = @hostClub

	declare @matchID int
	select @matchID = id from Match m where startTime = @startTime and m.hostClubID = @hostID and m.guestClubID = @guestID

	update Ticket set available = 0, fanID = @nationalID where id in 
	(select top 1 id from Ticket where @matchID = matchID and available = 1)
go
create proc updateMatchTiming
	@hostClub varchar(20),
	@guestClub varchar(20),
	@oldStartTime datetime,
	@newStartTime datetime,
	@newEndTime datetime
	as
	declare @guestID int
	select @guestID = id from Club where cname = @guestClub
	declare @hostID int
	select @hostID = id from Club where cname = @hostClub

	update Match set startTime = @newStartTime, endTime = @newEndTime 
	where hostClubID = @hostID and guestClubID = @guestID and startTime = @oldStartTime 
go
create view matchesPerTeam as
	select c.cname, count(c.id) as count
	from Club c, Match m
	where (c.id = m.guestClubID or c.id = m.hostClubID) and m.endTime < CURRENT_TIMESTAMP
	group by c.cname
go
create proc deleteMatchesOn
	@date datetime
	as
	delete from Ticket where matchID in (select id from Match where convert(datetime, startTime) = convert(date, @date))
	delete from HostRequest where matchID in (select id from Match where convert(datetime, startTime) = convert(date, @date))
	delete from Match where convert(datetime, startTime) = convert(date, @date)
go
create view matchWithMostSoldTickets as
	select top 1 host.cname as Host, guest.cname as Guest
	from (
		select count(t.id) as c, matchID
		from Ticket t 
		where available = 0
		group by t.matchID
		) t
	inner join Match m on t.matchID = m.id
	inner join Club host on host.id = m.hostClubID
	inner join Club guest on guest.id = m.guestClubID
	order by c desc
go
create view matchesRankedBySoldTickets as
	select rank() over (order by c desc) as rank, host.cname as Host, guest.cname as Guest, c as SoldTickets
	from (
		select count(t.id) as c, matchID
		from Ticket t 
		where available = 0
		group by t.matchID
		) t
	inner join Match m on t.matchID = m.id
	inner join Club host on host.id = m.hostClubID
	inner join Club guest on guest.id = m.guestClubID
go
create proc clubWithTheMostSoldTickets @output varchar(20) output as
	
	
	select top 1 @output = t.Club
	from (
		select count(c.cname) as c, c.cname as Club
		from Ticket t 
		inner join Match m on m.id = matchID
		inner join Club c on c.id = m.hostClubID or c.id = m.guestClubID
		where available = 0 and endTime < CURRENT_TIMESTAMP
		group by c.cname
		) t
	order by c desc
go
create view clubsRankedBySoldTickets as
	select rank() over (order by c desc) as rank, t.Club, c as SoldTickets
	from (
		select count(c.cname) as c, cname as Club
		from Ticket t 
		inner join Match m on m.id = matchID
		inner join Club c on c.id = m.hostClubID or c.id = m.guestClubID
		where available = 0 and endTime < CURRENT_TIMESTAMP
		group by c.cname
		) t
go
create function stadiumsNeverPlayedOn (@clubName varchar(20))
	returns table as
	return (
		select s.sname, s.capacity
		from Stadium s
		except (
			select s2.sname, s2.capacity
			from Stadium s2
			inner join Match m on m.stadiumID = s2.id
			inner join Club c on m.hostClubID = c.id or m.guestClubID = c.id
			where endTime < CURRENT_TIMESTAMP and c.cname = @clubName
			)
	)
go

create view allUpcomingMatches as
	select host.cname as Host, guest.cname as Guest, m.startTime, m.endTime
	from Match m
	inner join Club host on m.hostClubID = host.id
	inner join Club guest on guest.id = m.guestClubID
	where CURRENT_TIMESTAMP < startTime
go

create view playedMatches as
	select host.cname as Host, guest.cname as Guest, m.startTime, m.endTime
	from Match m
	inner join Club host on m.hostClubID = host.id
	inner join Club guest on guest.id = m.guestClubID
	where endTime < CURRENT_TIMESTAMP
go

create view clubsNeverPlayedTogether as
	select c1.cname as Club1, c2.cname as Club2
	from Club c1, Club c2
	where c1.id > c2.id
	except (
	select c3.cname as Club1, c4.cname as Club2
	from Match m, Club c3, Club c4
	where (c3.id = m.hostClubID and c4.id = m.guestClubID) or (c4.id = m.hostClubID and c3.id = m.guestClubID))
go

create proc otherDeleteMatch
	@hostClub varchar(20),
	@guestClub varchar(20),
	@startTime datetime,
	@endtime datetime
	as

	declare @hostID int
	declare @guestID int
	select @hostID = id from Club where cname = @hostClub
	select @guestID = id from Club where cname = @guestClub


	delete from Ticket where matchID in (select id from Match where hostClubID = @hostID and guestClubID = @guestID and @startTime = startTime and @endtime = endTime)
	delete from HostRequest where matchID in (select id from Match where hostClubID = @hostID or guestClubID = @guestID and @startTime = startTime and @endtime = endTime)
	delete from Match where hostClubID = @hostID and guestClubID = @guestID and @startTime = startTime and @endtime = endTime
go

create function RepresentativeClub (@username varchar(20))
	returns table as
	return (
		select cname as Club, clocation as Location
		from Club, ClubRepresentative
		where Club.clubRepresentativeID = ClubRepresentative.id and ClubRepresentative.username = @username
	)
go

create function otherUpcomingMatchesOfClub (@clubName varchar(20))
	returns table as
	return (
		select host.cname as Host, guest.cname as Guest, m.startTime as StartTime, m.endTime as endTime, s.sname as Stadium
		from Club host
		inner join Match m on host.id = m.hostClubID
		inner join Club guest on guest.id = m.guestClubID
		inner join Club c on c.cname = @clubName and (c.id = host.id or c.id = guest.id)
		left outer join Stadium s on s.id = m.stadiumID
		where CURRENT_TIMESTAMP < m.startTime
	)
go