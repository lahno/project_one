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
 * Class Pages
 *
 * @property \App\Page $model
 *
 * @see http://sleepingowladmin.ru/docs/model_configuration_section
 */
class Pages extends Section
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
            AdminColumn::text('id', 'ID')->setWidth('30px'),
            AdminColumn::text('name', 'Name'),
            AdminColumn::text('name_en', 'Name EN'),
            AdminColumn::text('alias', 'Alias'),
            AdminColumn::text('created_at', 'Created At')
        ])
            ->setNewEntryButtonText('Новая страница')
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
                    AdminFormElement::columns()
                        ->addColumn([
                            AdminFormElement::text('name', 'Name')->required(),
                        ], 4)
                        ->addColumn([
                            AdminFormElement::text('name_en', 'Name EN')->required()
                        ], 4)
                        ->addColumn([
                            AdminFormElement::text('alias', 'Slug')->required()
                        ], 4)
                ], 12)
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
