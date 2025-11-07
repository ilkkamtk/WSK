CREATE TABLE `wsk_cats` (
  `cat_id` int(11) NOT NULL,
  `cat_name` text NOT NULL,
  `weight` float NOT NULL,
  `owner` int(11) NOT NULL,
  `filename` text NOT NULL,
  `birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `wsk_cats` (`cat_id`, `cat_name`, `weight`, `owner`, `filename`, `birthdate`) VALUES
(41, 'Siiri', 4, 37, 'some_filename', '2010-03-05');

CREATE TABLE `wsk_users` (
  `user_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `username` text NOT NULL UNIQUE,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `role` text NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `wsk_users` (`user_id`, `name`, `username`, `email`, `password`, `role`) VALUES
(1, 'Administrator', 'admin', 'admin@metropolia.fi', '$2a$10$5RzpyimIeuzNqW7G8seBiOzBiWBvrSWroDomxMa0HzU6K2ddSgixS', 'admin'),
(37, 'Test User', 'john', 'john@metropolia.fi', '$2a$10$5RzpyimIeuzNqW7G8seBiOzBiWBvrSWroDomxMa0HzU6K2ddSgixS', 'user');

ALTER TABLE `wsk_cats`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `owner` (`owner`);

ALTER TABLE `wsk_users`
  ADD PRIMARY KEY (`user_id`);

ALTER TABLE `wsk_cats`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

ALTER TABLE `wsk_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

ALTER TABLE `wsk_cats`
  ADD CONSTRAINT `fk_owner_user_id` FOREIGN KEY (`owner`) REFERENCES `wsk_users` (`user_id`);
