require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  # テストデータの作成
  let!(:task1) { create(:task, title: 'first_task', deadline_on: '2022-02-18', priority: 'medium', status: 'not_started') }
  let!(:task2) { create(:task, title: 'second_task', deadline_on: '2022-02-17', priority: 'high', status: 'in_progress') }
  let!(:task3) { create(:task, title: 'third_task', deadline_on: '2022-02-16', priority: 'low', status: 'completed') }
  
  before do
    visit tasks_path
  end

  describe 'ソート機能' do
    context '「終了期限」というリンクをクリックした場合' do
      it '終了期限昇順に並び替えられたタスク一覧が表示される' do
        click_link '終了期限'
        sleep 1  # 必要に応じて待機
        task_titles = page.all('tbody tr').map { |row| row.find('td:nth-child(1)').text }
        expect(task_titles).to eq ['third_task', 'second_task', 'first_task']
      end
    end

    context '「優先度」というリンクをクリックした場合' do
      it '優先度の高い順に並び替えられたタスク一覧が表示される' do
        click_link '優先度'
        sleep 1  # 必要に応じて待機
        task_titles = page.all('tbody tr').map { |row| row.find('td:nth-child(1)').text }
        expect(task_titles).to eq ['second_task', 'first_task', 'third_task']
      end
    end
  end

  describe '検索機能' do
    context 'タイトルであいまい検索をした場合' do
      it '検索ワードを含むタスクのみ表示される' do
        fill_in 'search[title]', with: 'first'
        click_button '検索'
        expect(page).to have_content 'first_task'
        expect(page).not_to have_content 'second_task'
        expect(page).not_to have_content 'third_task'
      end
    end

    context 'ステータスで検索をした場合' do
      it '検索したステータスに一致するタスクのみ表示される' do
        select '未着手', from: 'search[status]'
        click_button '検索'
        expect(page).to have_content 'first_task'
        expect(page).not_to have_content 'second_task'
        expect(page).not_to have_content 'third_task'
      end
    end

    context 'タイトルとステータスで検索をした場合' do
      it '検索ワードをタイトルに含み、かつステータスに一致するタスクのみ表示される' do
        fill_in 'search[title]', with: 'task'
        select '完了', from: 'search[status]'
        click_button '検索'
        expect(page).to have_content 'third_task'
        expect(page).not_to have_content 'first_task'
        expect(page).not_to have_content 'second_task'
      end
    end
  end
end
