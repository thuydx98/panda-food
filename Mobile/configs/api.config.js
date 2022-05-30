const URL = 'http://10.0.2.2:3002';

export const getApiUrl = (apiController) => {
    return apiController ? URL + apiController : URL;
}