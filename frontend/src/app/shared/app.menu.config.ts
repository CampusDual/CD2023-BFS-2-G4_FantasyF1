import { MenuRootItem } from 'ontimize-web-ngx';

export const MENU_CONFIG: MenuRootItem[] = [
  { id: 'home', name: 'COMP_USER_TITLE', icon: 'emoji_events', route: '/main/home' },
  { id: 'available', name: 'COMP_AVAILABLE_MENU', icon: 'search', route: '/main/competitions/available' },
  { id: 'pilots', name: 'PILOTS', icon: 'groups', route: '/main/pilots' },
  { id: 'logout', name: 'LOGOUT', route: '/login', icon: 'power_settings_new', confirm: 'yes' }
];
