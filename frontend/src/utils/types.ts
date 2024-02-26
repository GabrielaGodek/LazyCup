
export interface ProductData {
      id: number
      title: string
      description: string,
      ingredients: string,
      proportions: string
      image: string,
      price: number,
      salePrice: number
    }

export interface ProductsState {
  products: ProductData[];
}

export type AvailableSizes = 'S' | 'M' | 'L'

export interface Order extends ProductData{
  amount?: number,
  size?: AvailableSizes,
  date?: string,
}

export const localCartStorage = 'localCartStorage'
export const localProductsStorage = 'localProductsStorage'