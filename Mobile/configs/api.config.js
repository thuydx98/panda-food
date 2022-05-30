const URL = 'http://10.0.2.2:4001';

export const getApiUrl = (apiController) => {
    return apiController ? URL + apiController : URL;
}