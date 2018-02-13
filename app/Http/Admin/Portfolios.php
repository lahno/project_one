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
 * Class Portfolios
 *
 * @property \App\Portfolio $model
 *
 * @see http://sleepingowladmin.ru/docs/model_configuration_section
 */
class Portfolios extends Section
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
            AdminColumn::text('views', 'Views'),
            AdminColumn::text('cat.name', 'Category'),
            AdminColumn::text('created_at', 'Created At')
        ])
            ->setNewEntryButtonText('Новая работа')
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
                    AdminFormElement::text('link', 'Link'),
                    AdminFormElement::text('iframe_link', 'Iframe Link'),
                ], 6)
                ->addColumn([
                    AdminFormElement::select('category_id')
                        ->setModelForOptions(new \App\Category_portfolio())
                        ->setDisplay('name')
                        ->setLabel('Category')
                        ->required(),
                    AdminFormElement::image('img', 'Image')
                        ->setUploadSettings([
                            'orientate' => [],
                            'resize' => [1280, null, function ($constraint) {
                                $constraint->upsize();
                                $constraint->aspectRatio();
                            }],
                            'fit' => [500, 300, function ($constraint) {
                                $constraint->upsize();
                                $constraint->aspectRatio();
                            }]
                        ])
                        ->setUploadPath(function(\Illuminate\Http\UploadedFile $file) {
                            return 'img/uploads/articles';
                        })
                        ->setDefaultValue('img/uploads/articles/no_img.jpg')
                        ->required()
                ], 6)
                ->addColumn([
                    AdminFormElement::columns()
                        ->addColumn([
                            AdminFormElement::textarea('short_desc', 'Краткое писание')
                        ], 6)
                        ->addColumn([
                            AdminFormElement::textarea('short_desc_en', 'Краткое писание EN')
                        ], 6)
                ], 12)
                ->addColumn([
                    AdminFormElement::ckeditor('desc', 'Описание'),
                    AdminFormElement::ckeditor('desc_en', 'Описание EN'),
                ], 12)

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
