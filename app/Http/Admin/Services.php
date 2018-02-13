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
 * Class Services
 *
 * @property \App\Service $model
 *
 * @see http://sleepingowladmin.ru/docs/model_configuration_section
 */
class Services extends Section
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
            AdminColumn::text('name_en', 'Name EN'),
            AdminColumn::text('alias', 'Slug'),
            AdminColumn::text('sort', 'Sort')
        ])
            ->setNewEntryButtonText('Новая услуга')
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
                    AdminFormElement::text('name_en', 'Name EN')->required(),
                    AdminFormElement::text('alias', 'Slug')->required(),
                    AdminFormElement::text('sort', 'SORT')->setDefaultValue('0')->required(),
                ], 6)
                ->addColumn([
                    AdminFormElement::text('form_title', 'Form Title')->required(),
                    AdminFormElement::text('form_title_en', 'Form Title EN')->required(),
                    AdminFormElement::text('form_pod_title', 'Form Pod Title')->required(),
                    AdminFormElement::text('form_pod_title_en', 'Form Pod Title EN')->required(),
                ], 6)
                ->addColumn([
                    AdminFormElement::textarea('service_list', 'Service List')->required(),
                ], 6)
                ->addColumn([
                    AdminFormElement::textarea('service_list_en', 'Service List EN')->required(),
                ], 6)
                ->addColumn([
                    AdminFormElement::ckeditor('desc', 'Описание'),
                    AdminFormElement::ckeditor('desc_en', 'Описание EN'),
                ], 12)
                ->addColumn([
                    AdminFormElement::text('seo_title', 'Title SEO')
                ], 6)
                ->addColumn([
                    AdminFormElement::textarea('seo_description', 'Description SEO')
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
