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
 * Class Reviews
 *
 * @property \App\Review $model
 *
 * @see http://sleepingowladmin.ru/docs/model_configuration_section
 */
class Reviews extends Section implements Initializable
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
        // Добавление пункта меню и счетчика кол-ва записей в разделе
        $this->addToNavigation($priority = 550, function() {
            return \App\Review::count();
        });
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
            AdminColumn::text('id', 'ID')->setWidth('30px'),
            AdminColumn::text('name', 'Name'),
            AdminColumn::text('type_case', 'Тип сайта'),
            AdminColumn::image('avatar', 'Avatar'),
            AdminColumn::text('created_at', 'Created At')
        ])
            ->setNewEntryButtonText('Новый отзыв')
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
                    AdminFormElement::text('type_case', 'Тип сайта')->required(),
                ], 6)
                ->addColumn([
                    AdminFormElement::image('avatar', 'Avatar')
                        ->setUploadSettings([
                            'orientate' => [],
                            'resize' => [180, null, function ($constraint) {
                                $constraint->upsize();
                                $constraint->aspectRatio();
                            }],
                            'fit' => [60, 60, function ($constraint) {
                                $constraint->upsize();
                                $constraint->aspectRatio();
                            }]
                        ])
                        ->setUploadPath(function(\Illuminate\Http\UploadedFile $file) {
                            return 'img/uploads/avatars';
                        })
                        ->setDefaultValue('img/avatars/no_avatar.jpg')
                ], 6)
                ->addColumn([
                    AdminFormElement::ckeditor('desc', 'Текст отзыва')->required(),
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
