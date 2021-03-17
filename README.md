# README

## Prep

* Run `bin/setup`.
* Run `bin/rails server`.
* Visit <http://localhost:3000/events> and check you can see events.

## Task 1

You have a table of user events with columns: id, occurred_at, email, event_type.
You have been using the follow query to get a daily rollup of events. Now you
need to implement an endpoint to run the query and return the result as JSON.

```sql
SELECT
  occurred_at::date,
  count(*)
  -- count(*) filter (where event_type IN ('commented', 'viewed'))
FROM
  events
WHERE
  date_trunc('month', occurred_at) = date_trunc('month', now())
GROUP BY
  occurred_at::date
ORDER BY
  occurred_at::date
```

1. Update the /events/rollup endpoint (in the EventsController) to return the
   results of the query, e.g. `[{ "occurred_at": "2021-03-01", "count": 48 }, …]`.
2. Allow the month to be changed by `?month=2021-02-01`
3. Allow the count to be filtered by `?event_type=commented,purchased`.
4. Allow the sort direction to be changed by `?sort=asc` or `?sort=desc`.

## Task 2

You've been using the following query to get a report of event types for a given user.

```sql
SELECT event_type, count(*)
FROM events
WHERE email = 'user1@example.com'
GROUP BY event_type
```

1. Update the `bin/summarise_events` script to automate this task, taking an email
   as a command line agument. NB: This is a pure ruby (non-rails) script.

## Task 3

You have been using the follow query to import events into the database:

```sql
INSERT INTO events (occurred_at, email, event_type)
VALUES
('2021-03-17 06:34:52.24982', 'user1@example.com', 'signed-in'),
('2021-03-17 06:06:09.090482', 'user1@example.com', 'signed-in'),
('2021-03-17 04:21:09.370199', 'user4@example.com', 'signed-in')
```
Now you'd like to automate this via a CSV import.

1. Update the `bin/import_events` to bulk insert a CSV into the table. Example
   data is supplied in events.csv.
