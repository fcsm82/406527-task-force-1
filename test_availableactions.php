<?php

spl_autoload_register ();

$action = new AvailableActions ();

assert($action->getNextStatus(AvailableActions::ACTION_CANCEL) == AvailableActions::STATUS_CANCELED, 'canceled');
assert($action->getNextStatus(AvailableActions::ACTION_RESPOND) == null, 'canceled');
assert($action->getNextStatus(AvailableActions::ACTION_START_PROCESS) == AvailableActions::STATUS_NEW, 'in process');
assert($action->getNextStatus(AvailableActions::ACTION_COMPLETE) == AvailableActions::STATUS_COMPLETED, 'completed');
assert($action->getNextStatus(AvailableActions::ACTION_REFUSE) == AvailableActions::STATUS_FAILED, 'failed');
