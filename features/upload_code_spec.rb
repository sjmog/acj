Capybara.feature 'uploading Pdfs' do
  context 'as an authed coach' do
    let!(:task) { FactoryBot.create(:task) }
    let(:pdfs) {
      [
        'ajdavey8.pdf',
        'antoniobelmar.pdf',
        'cazwazacz.pdf'
      ].map { |filename| Rails.root + "spec/fixtures/#{filename}" }
    }

    before do
      coach = FactoryBot.create(:coach)
      login_as(coach)
    end

    scenario 'I can upload new codes' do
      visit task_path(task)
      page.attach_file("files[]", pdfs, multiple: true)
      click_button 'Upload PDFs'

      expect(page).to have_content 'ajdavey8.pdf'
      expect(page).to have_content 'antoniobelmar.pdf'
      expect(page).to have_content 'cazwazacz.pdf'
    end
  end
end