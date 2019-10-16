-- drop database if exits todos;
create database
if not exists todos;
use todos;
create table user
(
  userId int
  auto_increment unique,
userName varchar
  (20)not null default '',
userFname varchar
  (20)not null default '',
primary key
  (userId))engine=innoDB default charset=latin1;

  insert into user
  value(1,'Suthatta','Lindstrii'
  );
  insert into user
  value(2,'Jan',
  'Lindstrii'
  );
  insert into user
  value(3,'Filip',
  'Lindstrii'
  );
  select count(*)
  from user;

  show tables;

  create table tags
  (
    tagsId int
    auto_increment unique,
 tagsName varchar
    (20) not null default'',
 primary key
    (tagsId))engine =innoDB default charset=latin1;
    insert into tags
    value(1,'inkop'
    );
    insert into tags
    value(2,'study'
    );
    insert into tags
    value(3,'kids'
    );
    insert into tags
    value(4,'home'
    );
    insert into tags
    value(5,'findjob'
    );
    -- update
    update tags set tagsName='shoplist'where tagsId = 1;
    select *
    from tags
    where tagsId =1;
    select count(*)
    from tags;
    -- add list to todolist
    -- drop table todolist;
    show tables;

    -- drop table list;
    create table list
    (
      listId int
      auto_increment unique,
listName varchar
      (20) not null default '',
tagsId int not null,
primary key
      (listId), foreign key
      (tagsId) references tags
      (tagsId)
)engine=innoDB default charset=latin1;

      select count(*)
      from list;
      select *
      from list;
      insert into list
      value(1,'milk',1
      );
      insert into list
      value(2,'cleanhouse',4
      );
      insert into list
      value(3,'db-homework',2
      );
      insert into list
      value(4,'pickupKids',3
      );

      select count(1)
      from list;
      -- select * from list;
show tables;

      create table todolist
      (todoId int auto_increment unique,
userId int not null,
listId int not null,
reminding datetime,
isCompleted boolean not null default false,
primary key (todoId)
)engine =innoDB default charset=latin1;

        insert into todolist
        value(1,1,1,'2019-10-15',false
        );
        insert into todolist
        value(2,2,2,'2019-10-18',false
        );


select listName, isCompleted from todolist inner join list on list.listId = todolist.listId;

 select userName,listName, isCompleted from todolist 
 inner join list on list.listId = todolist.listId 
 inner join user on user.userId = todolist.userId;


update todolist set isCompleted =true where userId =1;
