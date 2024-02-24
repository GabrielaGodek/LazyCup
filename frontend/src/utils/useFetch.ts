export const useFetch = async (url: string) => {
  try {
    const response = await fetch(url);
    const res = await response.json()
    return res
  } catch (error) {
    console.error('An error occurred while fetching data:', error);
    return error
  }
};

