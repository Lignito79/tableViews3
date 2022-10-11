//
//  TableViewController.swift
//  tableViews3
//
//  Created by Alumno on 07/10/22.
//

import UIKit

class TableViewController: UITableViewController {

    var listaPaises = [Pais]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        listaPaises = [Pais(nombre: "Mexico", habitantes: 128900000, foto: UIImage(named: "mexico"), capital: "CDMX"),
            Pais(nombre: "Japon", habitantes: 125800000, foto: UIImage(named: "japon"), capital: "Tokyo"),
            Pais(nombre: "España", habitantes: 47350000, foto: UIImage(named: "españa"), capital: "Madrid"),
            Pais(nombre: "Italia", habitantes: 59550000, foto: UIImage(named: "italia"), capital: "Roma")]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaPaises.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CustomTableViewCell

        // Configure the cell...
        cell.lbNombre.text = listaPaises[indexPath.row].nombre
        
        cell.lbHabitantes.text = String(listaPaises[indexPath.row].habitantes)
        
        cell.lbCapital.text = listaPaises[indexPath.row].capital
        
        if let foto = listaPaises[indexPath.row].foto {
            cell.imgFoto.image = foto
        } else {
            cell.imgFoto.image = UIImage(named: "user")
        }
        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            listaPaises.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let emp = listaPaises[fromIndexPath.row]
        listaPaises.remove(at: fromIndexPath.row)
        listaPaises.insert(emp, at: to.row)
        
    }


    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
        let pais = listaPaises[indexPath.row]
        
        let alerta = UIAlertController(title: "Mensaje", message: pais.nombre, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .cancel)
        alerta.addAction(action)
        present(alerta, animated: true)

        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
