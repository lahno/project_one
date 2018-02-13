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
 * Class Articles
 *
 * @property \App\Article $model
 *
 * @see http://sleepingowladmin.ru/docs/model_configuration_section
 */
class Articles extends Section
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
            AdminColumn::text('alias', 'Slug'),
            AdminColumnEditable::select('status', 'Status', ['yes'=>'yes', 'no'=>'no']),
            AdminColumn::datetime('created_at', 'Created')->setFormat('d.m.Y')
        ])
            ->setNewEntryButtonText('Новая статья')
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
                    AdminFormElement::text('alias', 'Slug')->required(),
                    AdminFormElement::text('tags', 'Tags ({"tag_1": "design", "tag_2": "web"})')->required(),
                    AdminFormElement::select('category_id')
                        ->setModelForOptions(new \App\Category_article())
                        ->setDisplay('name')
                        ->setLabel('Category')
                        ->required(),
                ], 6)
                ->addColumn([
                    AdminFormElement::image('img', 'Image')
                        ->setUploadSettings([
                            'orientate' => [],
                            'resize' => [1280, null, function ($constraint) {
                                $constraint->upsize();
                                $constraint->aspectRatio();
                            }],
                            'fit' => [600, 360, function ($constraint) {
                                $constraint->upsize();
                                $constraint->aspectRatio();
                            }]
                        ])
                        ->setUploadPath(function(\Illuminate\Http\UploadedFile $file) {
                            return 'img/uploads/articles';
                        })
                        ->setDefaultValue('img/uploads/articles/no_img.jpg')
                ], 3)
                ->addColumn([
                    AdminFormElement::datetime('created_at', 'Date create'),
                    AdminFormElement::number('views', 'Views')
                ], 3)
                ->addColumn([
                    AdminFormElement::textarea('short_desc', 'Краткое писание')
                ], 12)
                ->addColumn([
                    AdminFormElement::ckeditor('desc', 'Описание')
                ], 12)
                ->addColumn([
                    AdminFormElement::text('seo_title', 'Title SEO'),
                    AdminFormElement::select('status', 'Status', ['yes'=>'yes', 'no'=>'no'])
                ], 6)
                ->addColumn([
                    AdminFormElement::textarea('seo_description', 'Description SEO')->setHelpText('Max 255')
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
