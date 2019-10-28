<?php

class Task
{
    const ACTION_CANCEL = 'cancel';
    const ACTION_RESPOND = 'respond';
    const ACTION_COMPLETE = 'complete';
    const ACTION_REFUSE = 'refuse';

    const STATUS_NEW = 'new';
    const STATUS_CANCELED = 'canceled';
    const STATUS_ONPROGRESS = 'onprogress';
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
                $list_actions = array (self::ACTION_CANCEL, self::ACTION_RESPOND);
                return $list_actions;

            case self::STATUS_ONPROGRESS:
                $list_actions = array (self::ACTION_COMPLETE, self::ACTION_REFUSE);
                return $list_actions;
        }

        return null;
    }

    public function getNextStatus ($action) {

        switch ($action) {
            case self::ACTION_CANCEL:
                $status = self::STATUS_CANCELED;
                break;

            case self::ACTION_RESPOND:
                break;

            case self::ACTION_COMPLETE:
                $status = self::STATUS_COMPLETED;
                break;

            case self::ACTION_REFUSE:
                $status = self::STATUS_FAILED;
                break;
        }
        return $status;
    }
}