CREATE TABLE mfp_player_loans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id VARCHAR(255) NOT NULL,
    amount INT NOT NULL,
    remaining_amount INT NOT NULL,
    repaid TINYINT NOT NULL
);
