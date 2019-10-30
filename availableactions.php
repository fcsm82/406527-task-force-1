<?php

class AvailableActions
{
    const ACTION_CREATE = 'create';
    const ACTION_CANCEL = 'cancel';
    const ACTION_RESPOND = 'respond';
    const ACTION_SELECT_PERFORMER = 'select performer';
    const ACTION_COMPLETE = 'complete';
    const ACTION_REFUSE = 'refuse';

    const STATUS_NEW = 'new';
    const STATUS_CANCELED = 'canceled';
    const STATUS_IN_PROCESS = 'in process';
    const STATUS_COMPLETED = 'completed';
    const STATUS_FAILED = 'failed';

    const ROLE_CUSTOMER = 'customer';
    const ROLE_PERFORMER = 'performer';


    public $id_performer = null;
    public $id_customer = null;
    public $completion_date = null;
    public $active_status = null;

    public function getAvailableActions ($status) {

        switch ($status) {
            case self::STATUS_NEW:
                return [self::ACTION_CANCEL, self::ACTION_RESPOND];

            case self::STATUS_IN_PROCESS:
                return [self::ACTION_COMPLETE, self::ACTION_REFUSE];
        }
        return null;
    }

    public function getNextStatus ($action) {

        switch ($action) {
            case self::ACTION_CREATE:
                return self::STATUS_NEW;

            case self::ACTION_CANCEL:
                return self::STATUS_CANCELED;

            case self::ACTION_RESPOND:
                break;

            case self::ACTION_SELECT_PERFORMER:
                return self::STATUS_IN_PROCESS;

            case self::ACTION_COMPLETE:
                return self::STATUS_COMPLETED;

            case self::ACTION_REFUSE:
                return self::STATUS_FAILED;
        }
    }
}


