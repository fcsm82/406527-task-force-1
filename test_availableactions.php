<?php

const APP_DIR = __DIR__;

require_once APP_DIR . '/vendor/autoload.php';
use Business\AvailableActions;

$action = new AvailableActions;

assert($action->getNextStatus(AvailableActions::ACTION_CREATE) === AvailableActions::STATUS_NEW, 'При передачи действия create возвращается статус new');
assert($action->getNextStatus(AvailableActions::ACTION_CANCEL) === AvailableActions::STATUS_CANCELED, 'При передачи действия cancel возвращается статус canceled');
assert($action->getNextStatus(AvailableActions::ACTION_RESPOND) === null, 'При передачи действия respond возвращается статус null');
assert($action->getNextStatus(AvailableActions::ACTION_SELECT_PERFORMER) === AvailableActions::STATUS_IN_PROCESS, 'При передачи действия select performer возвращается статус in process');
assert($action->getNextStatus(AvailableActions::ACTION_COMPLETE) === AvailableActions::STATUS_COMPLETED, 'При передачи действия complete возвращается статус completed');
assert($action->getNextStatus(AvailableActions::ACTION_REFUSE) === AvailableActions::STATUS_FAILED, 'При передачи действия refuse возвращается статус failed');
