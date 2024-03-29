/*
 * This file is part of the ObjectVault Project.
 * Copyright (C) 2020-2022 Paulo Ferreira <vault at sourcenotes.org>
 *
 * This work is published under the GNU AGPLv3.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

// Web Application Environment Configuration
const __CONFIG = {
  API_SERVER_URL: 'http://127.0.0.1:3000'
  // OR: API_SERVER_URL: 'http://localhost:3000'
};

function __app_config(p, d) {
  return __CONFIG && __CONFIG[p] ? __CONFIG[p] : d;
}
