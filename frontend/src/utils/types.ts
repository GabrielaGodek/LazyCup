export interface ProductData {
      id: number
      description: string,
      image: string,
      ingredients: string,
      proportions: string
      title: string
    }

export interface ProductsState {
  products: ProductData[];
}