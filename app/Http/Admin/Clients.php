<?php

namespace App\Http\Admin;

use SleepingOwl\Admin\Contracts\Display\DisplayInterface;
use SleepingOwl\Admin\Contracts\Form\FormInterface;
use SleepingOwl\Admin\Section;
use SleepingOwl\Admin\Contracts\Initializable;

use AdminColumn;
use AdminForm;
use AdminFormElement;
use AdminColumnEditable;
use AdminDisplayFilter;
use AdminColumnFilter;
use AdminDisplay;

/**
 * Class Clients
 *
 * @property \App\Client $model
 *
 * @see http://sleepingowladmin.ru/docs/model_configuration_section
 */
class Clients extends Section implements Initializable
{
    /**
     * @var \App\User
     */
    protected $model;

    /**
     * Initialize class.
     */
    public function initialize()
    {

    }
    /**
     * @see http://sleepingowladmin.ru/docs/model_configuration#ограничение-прав-доступа
     *
     * @var bool
     */
    protected $checkAccess = false;

    /**
     * @var string
     */
    protected $title;

    /**
     * @var string
     */
    protected $alias;

    /**
     * @return DisplayInterface
     */
    public function onDisplay()
    {
        $display = AdminDisplay::datatables()
            ->setHtmlAttribute('class', 'table-primary');

        $display->setColumns([
            AdminColumn::text('name', 'Name'),
            AdminColumn::text('email', 'Email'),
            AdminColumn::text('tell', 'Phone'),
            AdminColumn::text('company', 'Company'),
            AdminColumn::text('created_at', 'Created At')
        ])
            ->setNewEntryButtonText('Новый клиент')
            ->paginate(20);

        return $display;
    }

    /**
     * @param int $id
     *
     * @return FormInterface
     */
    public function onEdit($id)
    {
        return AdminForm::panel()->addBody([
            AdminFormElement::columns()
                ->addColumn([
                    AdminFormElement::text('name', 'Name')->required(),
                    AdminFormElement::text('email', 'Email')->required(),
                    AdminFormElement::text('tell', 'Phone')->required(),
                ], 6)

        ]);
    }

    /**
     * @return FormInterface
     */
    public function onCreate()
    {
        return $this->onEdit(null);
    }

    /**
     * @return void
     */
    public function onDelete($id)
    {
        // remove if unused
    }

    /**
     * @return void
     */
    public function onRestore($id)
    {
        // remove if unused
    }
}
