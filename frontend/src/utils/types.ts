
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
export interface CartState {
  cart: Order[];
}
export interface OrderState {
  orders: OrderData[];
}

export type AvailableSizes = 'S' | 'M' | 'L'

export interface Order extends ProductData{
  amount?: number,
  size?: AvailableSizes,
  date?: string,
}
export interface OrderData{
  title: string,
  amount: number,
  date: string,
  size: string,
  price: number,
}

export const localOrdersStorage = 'localOrdersStorage'
export const localCartStorage = 'localCartStorage'
export const localProductsStorage = 'localProductsStorage'