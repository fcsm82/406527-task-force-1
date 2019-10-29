<?php

spl_autoload_register ();

$action = new AvailableActions ();

assert($action->getNextStatus(AvailableActions::ACTION_CANCEL) === AvailableActions::STATUS_CANCELED, 'При передачи действия cancel возвращается статус canceled');
assert($action->getNextStatus(AvailableActions::ACTION_RESPOND) === null, 'При передачи действия respond возвращается статус null');
assert($action->getNextStatus(AvailableActions::ACTION_START_PROCESS) === AvailableActions::STATUS_NEW, 'При передачи действия start process возвращается статус new');
assert($action->getNextStatus(AvailableActions::ACTION_COMPLETE) === AvailableActions::STATUS_COMPLETED, 'При передачи действия complete возвращается статус completed');
assert($action->getNextStatus(AvailableActions::ACTION_REFUSE) === AvailableActions::STATUS_FAILED, 'При передачи действия refuse возвращается статус failed');
