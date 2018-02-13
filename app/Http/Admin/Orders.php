<?php

namespace App\Http\Admin;

use App\Order;
use App\StatusOrder;
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
 * Class Orders
 *
 * @property \App\Order $model
 *
 * @see http://sleepingowladmin.ru/docs/model_configuration_section
 */
class Orders extends Section
{
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
            AdminColumn::lists('client.name', 'Client'),
            AdminColumn::text('get_service.name', 'Service'),
            AdminColumnEditable::select('status_id')
                ->setModelForOptions(new StatusOrder())
                ->setLabel('Status')
                ->setDisplay('name'),
            AdminColumn::text('created_at', 'Created At')
        ])
            ->setNewEntryButtonText('Новый заказ')
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
                    AdminFormElement::text('email', 'Email'),
                    AdminFormElement::text('tell', 'Phone'),
                    AdminFormElement::text('code', 'Сode'),
                    AdminFormElement::html('<div class="form-group">
                      <label>Дата</label>
                      <input type="text" class="form-control" 
                        placeholder="'.Order::where('id', $id)->first()->created_at.'" disabled="">
                    </div>')
                ], 6)
                ->addColumn([
                    AdminFormElement::select('service_id')
                        ->setModelForOptions(new \App\Service())
                        ->setDisplay('name')
                        ->setLabel('Service')
                        ->required(),
                    AdminFormElement::select('status_id')
                        ->setModelForOptions(new \App\StatusOrder())
                        ->setDisplay('name')
                        ->setLabel('Status')
                        ->required(),
                    AdminFormElement::textarea('comment', 'Comment')
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
