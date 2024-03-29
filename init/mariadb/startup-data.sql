-- DISABLE AUTO_INCREMENT for '0'
-- IMPORTANT: Required for 0 USER and 0 ORGANIZATION
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- CREATE 0 USER (Initial System Administrator)
-- DEFAULT PASSWORD adminADMIN
INSERT INTO `users` (`id`, `name`, `username`, `email`, `ciphertext`, `creator`)
       VALUES       (0, 'System Administrator', 'admin', 'admin@object.vault', UNHEX('a571513abb69a0de867f8163f042ee5f4aacc580dde8906ffd494800e1e87fc053dc10cb55a223e152c6fef8b36ca10c18eb43b75686863277ee5516'), 0);

-- CREATE 0 ORGANIZATION (System Management Organization)
INSERT INTO `orgs` (`id`, `orgname`, `name`, `creator`)
       VALUES      (0, 'system', 'System Organization', 0);
-- TODO: SET 0 Organization Object Including Default Password Policy

-- RESET SQL_MODE
SET SQL_MODE="STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION";

-- GLOBAL User Registry : Register 0 User
INSERT INTO `registry_users` (`id_user`, `name`, `username`, `email`, `state`, `ciphertext`)
       VALUES                (CONV('1000000000000', 16, 10), 'System Administrator', 'admin', 'admin@objectvault', 4096, UNHEX('a571513abb69a0de867f8163f042ee5f4aacc580dde8906ffd494800e1e87fc053dc10cb55a223e152c6fef8b36ca10c18eb43b75686863277ee5516'));

-- GLOBAL Organization Registry : Register 0 Org - State 4096 (SYSTEM Organization)
INSERT INTO `registry_orgs` (`id_org`, `orgname`, `name`, `state`)
       VALUES               (CONV('2000000000000', 16, 10), 'system', 'System Organization', 4096);

-- ORGANIZATION User Registry : Associate 0 User with 0 Org - All Roles - State 4096 (SYSTEM ADMIN)
INSERT INTO `registry_object_users` (`id_object`, `id_user`, `username`, `state`, `roles`)
       VALUES                       (CONV('2000000000000', 16, 10), CONV('1000000000000', 16, 10), 'admin', 4096, '16908287,16973823,17039359,33685503,33751039,33816575,33882111,33947647,34144255');

-- USER Objects Registry : Associate 0 User wih 0 Org
INSERT INTO `registry_user_objects` (`id_user`, `type`, `id_object`, `alias`, `favorite`)
       VALUES                       (CONV('1000000000000', 16, 10), 2, CONV('2000000000000', 16, 10), 'system', 1);

-- Basic Templates
-- TEMPLATE: NOTE
INSERT INTO `templates` (`name`, `version`, `title`, `description`, `model`)
       VALUES           ('note', '1', 'Note', 'Note Template', '{"template":{"name":"note","version":1},"display":{"title":"Note","groups":["detail"],"layout":"column"},"groups":{"detail":{"layout":"row","fields":["note"]}},"fields":{"note":{"type":"text","label":"Note","settings":{"required":true,"max-length":2048}}}}');
-- TEMPLATE: SITE-CREDENTIALS
INSERT INTO `templates` (`name`, `version`, `title`, `description`, `model`)
       VALUES           ('site-credentials', '1', 'Site Credentials', 'Access Credentials for a Site or Portal', '{"template":{"name":"site-credentials","version":1},"display":{"title":"Site Access Credentials","groups":["site","credentials","notes"],"layout":"column"},"groups":{"site":{"layout":"row","fields":["site"]},"credentials":{"layout":"row","fields":["user","password"]},"notes":{"layout":"row","fields":["notes"]}},"fields":{"site":{"type":"url","label":"URL","settings":{"required":true,"max-length":256,"clipboard":true}},"user":{"type":"user","label":"User name","settings":{"required":true,"max-length":80,"clipboard":true}},"password":{"type":"password","label":"Password","settings":{"required":true,"max-length":80,"clipboard":true}},"notes":{"type":"text","label":"Notes","settings":{"required":false,"max-length":2048}}}}');

-- (ALL TEMPLATES HAVE TO BE REGISTERED WITH SYSTEM ORGANIZATION
INSERT INTO `registry_object_templates` (`id_object`, `template`, `title`)
       VALUES                           (CONV('2000000000000', 16, 10), 'note', 'Note');
INSERT INTO `registry_object_templates` (`id_object`, `template`, `title`)
       VALUES                           (CONV('2000000000000', 16, 10), 'site-credentials', 'Site Credentials');
