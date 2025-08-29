entity mux4x1 is
	port
	(
	   X: in  bit_vector (3 downto 0);
	-- Quando X é declarado como bit_vector (3 downto 0)
	-- ordem dos bits | X(3) | X(2) | X(1) | X(0) |
	-- X(0) é o bit mais a direita do vetor X, X(3) é o bit mais a esquerda do vetor X.

	-- X: in  bit_vector (0 to 3);
	-- Se X é declarado como bit_vector (0 to 3)
	-- ordem dos bits | X(0) | X(1) | X(2) | X(3) |
	-- X(3) é o bit mais a direita do vetor X, X(0) é o bit mais a esquerda do vetor X.
	   Sel : in bit_vector (1 downto 0);
	   Y : out bit
	);
end entity;

-- Implementação com lógica pura
architecture v_logica_pura of mux4x1 is
begin
 Y <= (X(0) and (not Sel(1)) and (not Sel(0))) or
      (X(1) and (not Sel(1)) and Sel(0)) or (X(2) and Sel(1) and (not Sel(0))) or
		(X(3) and Sel(1) and (not Sel(0)));
end architecture;