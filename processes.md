# Processes of TaskForce

## 1. Sign Up
Class: 'UserSignupService'
Models: 'users', 'locations', 'countries', 'cities', 'skills', 'categories'

## 2. Publishing Task
Class: 'TaskCreateService'
Models: 'users', 'locations', 'countries', 'cities', 'skills', 'categories', 'tasks'

## 3. Online Authentication
Class: 'Authentication'
Models: 'users', 'locations', 'countries', 'cities', 'tasks'

## 4. Adding Response
Class: 'AddingResponse'
Models: 'users', 'responses', 'tasks', 'notifications'

## 5. Completing The Task
Class: 'CompletingTask'
Models: 'users', 'task', 'notifications'

## 6. Rejection Of Task
Class: 'RejectionTask'
Models: 'users', 'tasks'

## 7. Cancelation Of Task
Class: 'CancellationTask'
Models: 'users', 'tasks'

## 8. Job Start
Class: 'StartingTask'
Models: 'users', 'tasks', 'responses', 'notifications'

## 9. Sending a Notifications
Class: 'SendingNotifications'
Models: 'users', 'notifications', 'responses', 'chats'

## 10. Sending a Message
Class: 'SendingMessage',
Models: 'users', 'chats', 'tasks'
