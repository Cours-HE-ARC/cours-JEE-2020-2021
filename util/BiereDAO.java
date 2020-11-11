package ch.jee.gc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Classe DAO d'accès aux données
 *
 */
public class BiereDAO {

	/**
	 * Retourne une liste contenant le nom des bières
	 * @return la liste du nom des bières
	 */
	public List<String> findAllBieres() {
		//Liste de retour
		List<String> bieres = new ArrayList<>();
		
		//requête sql
		String query = "SELECT * FROM biere";
		
		//Connection mysql
		Connection connection  = MySqlConnection.getConnection();
		
		try {
			//Préparation de l'instruction sql
			Statement s = connection.createStatement();
			
			//execution et récupération du resultset
			ResultSet rs = s.executeQuery(query);
			
			//Iteration sur les résultats
			while (rs.next())
		      {
		        int id = rs.getInt("id");
		        String nom = rs.getString("nom");
		        String fabricant = rs.getString("fabricant");
		        Double prix  = rs.getDouble("prix");
		        
		        // log les resultats
		        System.out.format("%s, %s, %s\n", id, nom, prix);
		        
		        //ajput du nom de la biere à la liste
		        bieres.add(nom);
		      }
			
			   s.close();
			   
		} catch (SQLException e) {
			
			throw new RuntimeException(e);
			
		}finally {
			//Important : on ferme toujours la connection
			try {
				connection.close();
			} catch (SQLException e) {
				throw new RuntimeException(e);
			}
		}
		
		return bieres;
	}
}
