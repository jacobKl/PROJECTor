export const isAdmin = permissions => permissions.includes('admin');

export const hasFullAccess = permissions => permissions.includes('full_access');

export const hasReadOnlyAccess = permissions => permissions.includes('read_only');
