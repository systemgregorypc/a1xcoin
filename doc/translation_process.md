Translations
The Qt GUI can be easily translated into other languages. Here's how we handle those translations.

Files and Folders
paycoin-qt.pro
This file takes care of generating .qm files from .ts files. It is mostly automated.

src/qt/bitcoin.qrc
This file must be updated whenever a new translation is added. Please note that files must end with .qm, not .ts.

<qresource prefix="/translations">
    <file alias="en">locale/a1xcoin_en.qm</file>
    ...
</qresource>
src/qt/locale/
This directory contains all translations. Filenames must adhere to this format:

a1xcoin_xx_YY.ts or a1xcoin_xx.ts
a1xcoin_en.ts (Source file)
src/qt/locale/a1xcoin_en.ts is treated in a special way. It is used as the source for all other translations. Whenever a string in the code is changed this file must be updated to reflect those changes. A custom script is used to extract strings from the non-Qt parts. This script makes use of gettext, so make sure that utility is installed (ie, apt-get install gettext on Ubuntu/Debian). Once this has been updated, lupdate (included in the Qt SDK) is used to update paycoin_en.ts. This process has been automated, from src/qt, simply run: make translate

Handling of plurals in the source file
When new plurals are added to the source file, it's important to do the following steps:

Open paycoin_en.ts in Qt Linguist (also included in the Qt SDK)
Search for %n, which will take you to the parts in the translation that use plurals
Look for empty English Translation (Singular) and English Translation (Plural) fields
Add the appropriate strings for the singular and plural form of the base string
Mark the item as done (via the green arrow symbol in the toolbar)
Repeat from step 2. until all singular and plural forms are in the source file
Save the source file
Creating the pull-request
An updated source file should be merged to github and Transifex will pick it up from there (can take some hours). Afterwards the new strings show up as "Remaining" in Transifex and can be translated.

To create the pull-request you have to do:

git add src/qt/bitcoinstrings.cpp src/qt/locale/a1xcoin_en.ts
git commit
Syncing with Transifex
We are using https://transifex.com as a frontend for translating the client.

https://www.transifex.com/a1xcoin/a1xcoin/qt-translation-03x/

The "Transifex client" (see: http://support.transifex.com/customer/portal/topics/440187-transifex-client/articles) is used to fetch new translations from Transifex. The configuration for this client (.tx/config) is part of the repository.

Do not directly download translations one by one from the Transifex website, as we do a few postprocessing steps before committing the translations.

Fetching new translations
python contrib/devtools/update-translations.py
update src/qt/bitcoin.qrc manually or via ls src/qt/locale/*ts|xargs -n1 basename|sed 's/\(a1xcoin_\(.*\)\).ts/<file alias="\2">locale\/\1.qm<\/file>/'
git add new translations from src/qt/locale/
