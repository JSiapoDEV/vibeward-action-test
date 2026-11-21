export function renderAvatar(el, user) {
  el.innerHTML = '<img alt="' + user.name + '" src="' + user.avatarUrl + '">';
}
