#!/usr/bin/env bash

# Copyright (c) 2024, 2025 acrion innovations GmbH
# Authors: Stefan Zipproth, s.zipproth@acrion.ch
#
# This file is part of ditana-config-xfce, see https://github.com/acrion/ditana-config-xfce
#
# ditana-config-xfce is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# ditana-config-xfce is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with ditana-config-xfce. If not, see <https://www.gnu.org/licenses/>.

if [[ ! -f install-hooks.sh ]]; then
    echo "This script needs to be executed from the directory 'git-hooks'."
    exit 1
fi

for hook in *; do
    if [[ "$hook" != install-hooks.sh ]]; then
        ln -sf "../../git-hooks/$hook" "../.git/hooks/$hook"
        ls -l "../.git/hooks/$hook"
    fi
done
