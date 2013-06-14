XTeamManager
============

This is intended to be an experimental project, to bring kanban management to another level.
Too often, as team leader and project manager, I found myself in the need of using more then one tool to manage the project in terms of people, time, project deadline, and so forth.
Business people, technicians, and other company role wanna see things from their own perspective, and basically you need one tool for each perspective.
That's why I choose to implement a dynamic board, which can be viewed from different perspective, organizing projects, peoples, releases, working status, timeing, and so forth (you will be able to add your own entity and use it in your perspectives).
Once defined the entity you'll be working on, and the way they are grouped in the different perspectives you setup, you'll have very flexible boards that rapresent your situation from any possibile point of you.
Obviously, everything is bounded to the concept of the "card" to rapresent a task, 

Let's make a simple example. 

Let's say that I want to use a kanban board to manage my project.
I'll define entities like: project and status.
Date, people and effort are entities defined by default in any single dynamicboard project. So you'll have also these stuff to play with.
Cards also is there as the central element, always.

I can define 3 perspectives:

1. Project manager perspective
Here I'll define Projects to be the boards, status to be the column, and I hve the typical kanban boards, one for every project, with column like todo, working, done.
Obviously every card can have a due date and a owner (or more then one).

2. Team Leader perspective
I can regroup things (cards actually), defining projects to be the boards and people to be the column.
This way I can easly see for each project, for each person, what are they doing, what they have done, and what they're going to do next. Status will now appear as a label on the card. Filtering by status working, I'll have a quick snapshot of what everyone id working on in this moment.

3. Very stressing command&control boss perspective :)
Let's define People as the boards and status as the column, and project as a label on the card, and the stressing boss, who wanna check how any single developer is doing, can have a quinck snapshot of the single developer (or other professional figure).

That's maybe a trivial example, but it should give the basic idea.
Number of entities definable for dynamicboards are free. Any perspective is defined choosing 3 of that (plus people) as the boars, columns and main label to be shown on the card.

And here it comes the date. Giving the effort (expressed in anything you prefer, man/days, storypoint, dollars, calories burned, ecc.) to the card you can have a projection of the effort on any entities you defined.
Classic example? Defined the sprint as an entity for our dynamic board, we can see how much effort is estimated in each spirnt.
Here we can also define a value for an entity who will be compared with the due date field. Let's say we defined the entity status, and set up that task (card) will be done when status = done.
This way e can have a projection in wich we see the velocity of the team in the sprint. Or the velocity of a single developer accross the sprint or in a single sprint.

So we can handle milestone, burndown chart and (using the due date) even a roadmap of the projects. We have all the data.
You just need to tell XTeamManager how to put them in a nice chart. And all of this managing your project in a visual way, just draggind your card around :)

Given that configuration of dynamicboards (entities, perspectives, charts, and so on) can be a little initial effort, I intend to setup a bunch of templates from where user can start.
For sure everyone could create his own template, and sharing it with the community.



