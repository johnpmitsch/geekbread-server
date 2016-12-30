class V1::UsersController < V1::ApiController
  def current_user_id
    {id: current_user.id} if current_user
  end
end
