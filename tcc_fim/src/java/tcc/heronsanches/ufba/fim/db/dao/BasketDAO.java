package tcc.heronsanches.ufba.fim.db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

import tcc.heronsanches.ufba.fim.db.DB;

public class BasketDAO {
    
    
    /**@return a arrf file weka with a unique instance*/
    public String getBasketWeka(long idBasket){
        
        Connection con = DB.getConnectionDB();
        final String sideEffect = "yes";
        final String nonSideEffect = "no";
        
        final String head = "@RELATION basket\n\n"
                + "@ATTRIBUTE m_altura REAL\n"
                + "@ATTRIBUTE s_altura REAL\n"
                + "@ATTRIBUTE class {"+nonSideEffect+","+sideEffect+"}\n\n"
                + "@DATA\n";
        
        String basket = head;
        
        if(con != null){
            
            try {
                
                PreparedStatement ps = con.prepareStatement("select b.bool_side_effect, bi.num_quantity, bi.id_basket, i.num_width, i.num_height, i.num_length, i.num_mass, i.num_diameter "
                        + "from master.item i inner join master.basket_item bi on i.id_item=bi.id_item inner join master.basket b on bi.id_basket=b.id_basket and b.id_basket=?");
                
                ps.setLong(1, idBasket);
                ResultSet rs = ps.executeQuery();
                boolean actualSiddeEffect = false;
                boolean beforeSiddeEffect = false;
                boolean first = true;
                long id = 0;
                long actualId = 0;
                
                double sumWidth = 0;
                double sumHeight = 0;
                double numberItens = 0;
                DecimalFormat df = new DecimalFormat("#.###################");
                
                while(rs.next()){
                    
                    int qtt = rs.getInt("num_quantity");
                    actualId = rs.getLong("id_basket");
                    actualSiddeEffect = rs.getBoolean("bool_side_effect");
                    
                    if(first){
                        
                        id = actualId;
                        beforeSiddeEffect = actualSiddeEffect;
                        first = false;
                        
                    }else if(actualId != id){
                        
                        basket += df.format(sumHeight / numberItens)+","+df.format(sumWidth);
                        
                        sumWidth = 0;
                        sumHeight = 0;
                        numberItens = 0;
                        
                        if(beforeSiddeEffect)
                            basket += ",?"/*+sideEffect*/;
                        else
                            basket += ",?"/*+sideEffect*/;

                        basket += "\n";  
                        
                        id = actualId;
                        beforeSiddeEffect = actualSiddeEffect;
                        
                    }
                    
                    int i = 0;
                    
                    while(i<qtt){
                        
                        numberItens++;
                        sumWidth += rs.getDouble("num_width");
                        sumHeight += rs.getDouble("num_height");
                        i++;
                        
                    }
                    
                    if(rs.isLast()){
                        
                       basket += df.format(sumHeight / numberItens)+","+df.format(sumWidth);                    
                        
                        sumWidth = 0;
                        sumHeight = 0;
                        numberItens = 0;
                        
                        if(beforeSiddeEffect)
                            basket += ",?"/*+sideEffect*/;
                        else
                            basket += ",?"/*+nonSideEffect*/;
                        
                    }
                    
                }
                               
            } catch (SQLException ex) {
                Logger.getLogger(BasketDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        
        System.out.println(basket);
        return basket;
        
    }
    
    
    public String generatesDatasetWeka(){
        
        Connection con = DB.getConnectionDB();
        final String sideEffect = "yes";
        final String nonSideEffect = "no";
        
        final String head = "@RELATION basket\n\n"
                //+ "@ATTRIBUTE m_largura REAL\n"
                + "@ATTRIBUTE m_altura REAL\n"
                //+ "@ATTRIBUTE m_comprimento REAL\n"
                //+ "@ATTRIBUTE m_massa REAL\n"
                //+ "@ATTRIBUTE m_diametro REAL\n"
                //+ "@ATTRIBUTE s_largura REAL\n"
                + "@ATTRIBUTE s_altura REAL\n"
                //+ "@ATTRIBUTE s_comprimento REAL\n"
                //+ "@ATTRIBUTE s_massa REAL\n"
                //+ "@ATTRIBUTE s_diametro REAL\n"
                //+ "@ATTRIBUTE qtde_itens REAL\n"
                + "@ATTRIBUTE class {"+nonSideEffect+","+sideEffect+"}\n\n"
                + "@DATA\n";

        String dataset = head;
        
        if(con != null){
            
            try {
                
                PreparedStatement ps = con.prepareStatement("select b.bool_side_effect, bi.num_quantity, bi.id_basket, i.num_width, i.num_height, i.num_length, i.num_mass, i.num_diameter "
                        + "from master.item i inner join master.basket_item bi on i.id_item=bi.id_item inner join master.basket b on bi.id_basket=b.id_basket order by bi.id_basket");
                
                ResultSet rs = ps.executeQuery();
                boolean actualSiddeEffect = false;
                boolean beforeSiddeEffect = false;
                boolean first = true;
                long id = 0;
                long actualId = 0;
                
                double sumWidth = 0;
                double sumHeight = 0;
                double sumLength = 0;
                double sumMass = 0;
                double sumDiameter = 0;
                double numberItens = 0;
                DecimalFormat df = new DecimalFormat("#.###################");
                
                while(rs.next()){
                    
                    int qtt = rs.getInt("num_quantity");
                    actualId = rs.getLong("id_basket");
                    actualSiddeEffect = rs.getBoolean("bool_side_effect");
                    
                    if(first){
                        
                        id = actualId;
                        beforeSiddeEffect = actualSiddeEffect;
                        first = false;
                        
                    }else if(actualId != id){

                        /*dataset += df.format(sumWidth / numberItens)+","+df.format(sumHeight / numberItens)+","+df.format(sumLength / numberItens)+","
                                +df.format(sumMass / numberItens)+","+df.format(sumDiameter / numberItens)+","+df.format(sumWidth)+","+df.format(sumHeight)+","
                                +df.format(sumLength)+","+df.format(sumMass)+","+df.format(sumDiameter)+","+numberItens;*/
                        
                        //dataset += df.format(sumWidth)+","+df.format(sumDiameter);
                        //dataset += df.format(sumHeight / numberItens)+","+df.format(sumWidth)+","+df.format(sumMass)+","+df.format(sumDiameter);
                        dataset += df.format(sumHeight / numberItens)+","+df.format(sumMass);
                        //dataset += df.format(sumDiameter / numberItens)+","+df.format(sumWidth)+","+df.format(sumMass);
                        
                        sumWidth = 0;
                        sumHeight = 0;
                        sumLength = 0;
                        sumMass = 0;
                        sumDiameter = 0;
                        numberItens = 0;
                        
                        if(beforeSiddeEffect)
                            dataset += ","+sideEffect;
                        else
                            dataset += ","+nonSideEffect;

                        dataset += "\n";  
                        
                        id = actualId;
                        beforeSiddeEffect = actualSiddeEffect;
                        
                    }
                    
                    int i = 0;
                    
                    while(i<qtt){
                        
                        numberItens++;
                        sumWidth += rs.getDouble("num_width");
                        sumHeight += rs.getDouble("num_height");
                        sumLength += rs.getDouble("num_length");
                        sumMass += rs.getDouble("num_mass");
                        sumDiameter += rs.getDouble("num_diameter");
                        i++;
                        
                    }
                    
                    if(rs.isLast()){
                        
                        /*dataset += df.format(sumWidth / numberItens)+","+df.format(sumHeight / numberItens)+","+df.format(sumLength / numberItens)+","
                                +df.format(sumMass / numberItens)+","+df.format(sumDiameter / numberItens)+","+df.format(sumWidth)+","+df.format(sumHeight)+","
                                +df.format(sumLength)+","+df.format(sumMass)+","+df.format(sumDiameter)+","+numberItens;*/
                        //dataset += df.format(sumHeight / numberItens)+","+sumMass;
                        //dataset += df.format(sumWidth)+","+df.format(sumMass);
                        //dataset += df.format(sumHeight / numberItens)+","+df.format(sumWidth);
                        //dataset += df.format(sumWidth)+","+df.format(sumDiameter);
                        //dataset += df.format(sumWidth);
                        //dataset += df.format(sumDiameter / numberItens)+","+df.format(sumWidth);
                        //dataset += df.format(sumDiameter / numberItens)+","+df.format(sumWidth)+","+df.format(sumMass);
                        //dataset += df.format(sumHeight / numberItens)+","+df.format(sumWidth)+","+df.format(sumMass)+","+df.format(sumDiameter);
                        dataset += df.format(sumHeight / numberItens)+","+df.format(sumMass);
                        
                        sumWidth = 0;
                        sumHeight = 0;
                        sumLength = 0;
                        sumMass = 0;
                        sumDiameter = 0;
                        numberItens = 0;
                        
                        if(beforeSiddeEffect)
                            dataset += ","+sideEffect;
                        else
                            dataset += ","+nonSideEffect;
                        
                    }
                    
                }
                               
            } catch (SQLException ex) {
                Logger.getLogger(BasketDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        }
        
        return dataset;
        
    }
    
    
}