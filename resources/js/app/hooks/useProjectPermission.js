import { usePage } from "@inertiajs/react"
import { hasFullAccess, hasReadOnlyAccess, isAdmin } from "../utils/permission-checker";

export const useProjectPermission = () => {
    const page = usePage();

    if (!page.permissions) return {
        admin: false,
        fullAccess: false,
        readOnly: false
    };


    return {
        admin: isAdmin(page.permissions),
        fullAccess: hasFullAccess(page.permissions),
        readOnly: hasReadOnlyAccess(page.permissions)
    }
}
