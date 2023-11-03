import { MenuRootItem } from 'ontimize-web-ngx';

export const MENU_CONFIG: MenuRootItem[] = [
  { id: 'home', name: 'COMP_USER_TITLE', icon: 'home', route: '/main/home' },
  { id: 'available', name: 'COMP_AVAILABLE_MENU', icon: 'people', route: '/main/competitions/available' },
  { id: 'search', name: 'PRIVATE_LEAGUE', icon: 'search', route: '/main/competitions/search' },
  { id: 'logout', name: 'LOGOUT', route: '/login', icon: 'power_settings_new', confirm: 'yes' }
];
