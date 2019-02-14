require 'rails_helper'

describe 'Todos Item API' do
  let!(:todo) { create(:todo) }
  let!(:items) { create_list(:item, 10, todo_id: todo.id) }
  let(:todo_id) { todo.id }
  let(:id) { items.first.id }

  describe 'GET /todos/:todo_id/items' do
    before { get "/todos/#{todo_id}/items" }

    it 'returns items' do
      expect(json).not_to be_empty
      expect(json.length).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /todos/:id/items/:id' do
    before { get "/todos/#{todo_id}/items/#{id}" }

    context 'when the record exists' do
      it 'returns the item' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  describe 'POST /todos/:todo_id/items' do
    let(:valid_attributes) { { title: 'Learn Elm', read: false } }

    context 'when the request is valid' do
      before do
        post "/todos/#{todo_id}/items",
             params: valid_attributes
      end

      it 'creates a item' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post "/todos/#{todo_id}/items", params: { title: '' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  describe 'PUT /todos/:todo_id/items/:id' do
    let(:valid_attributes) { { title: 'Mozart' } }

    before { put "/todos/#{todo_id}/items/#{id}", params: valid_attributes }

    context 'when item exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the item' do
        updated_item = Item.find(id)
        expect(updated_item.title).to match(/Mozart/)
      end
    end

    context 'when the item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end

  describe 'DELETE /todos/:todo_id/items/:id' do
    before { delete "/todos/#{todo_id}/items/#{id}" }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /todos/:todo_id/items/:id' do
    before { get "/todos/#{todo_id}/items/#{id}" }

    it "matches Item schema" do
      expect(response.status).to eq 200
      expect(response).to match_response_schema("item")
    end
  end

  describe 'GET /todos/:todo_id/items' do
    before { get "/todos/#{todo_id}/items" }

    it "matches Item schema" do
      expect(response.status).to eq 200
      expect(response).to match_response_schema("items")
    end
  end
end
