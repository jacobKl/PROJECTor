import { usePage } from "@inertiajs/react"
import { hasFullAccess, hasReadOnlyAccess, isAdmin } from "../utils/permission-checker";

export const useProjectPermission = () => {
    const page = usePage();

    if (!page.props.permissions) return {
        admin: false,
        fullAccess: false,
        readOnly: false
    };


    return {
        admin: isAdmin(page.props.permissions),
        fullAccess: hasFullAccess(page.props.permissions),
        readOnly: hasReadOnlyAccess(page.props.permissions)
    }
}
