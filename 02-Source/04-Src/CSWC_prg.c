/* ************************************************************************** */
/* ********************** FILE DEFINITION SECTION *************************** */
/* ************************************************************************** */
/** \file   CSWC_prg.c
 *  \Component   CSWC
 *  \brief     \DESIGNER_START Brief description of the file \DESIGNER_END
 *  \details   \DESIGNER_START Much more details can be added \DESIGNER_END
 *  \n\n
 *  Scope: Private
 *  \n\n
 *  Coding language : C
 *    \copydoc _prgc
 *  \copydoc COPYRIGHT (c) AstreTech  all rights reserved
 */
/* ************************************************************************** */
/* ********************** MODIFICATION LOG SECTION ************************** */
/* ************************************************************************** */
/** \page _prgc CSWC_prg.c History
 * |                  ::    Author        | Version              | Date                   |    Status        |       Description                      |
 * |                  :: :-------------:  | :------------------: | :--------------------: | :----------      | :------------------------------------: |
 * | \verbatim $Author:: Osama ElMorady   | $Version::  1.0      | $Date:: 18 Oct,2024    | $Status:: Draft  | $Description::  Initial Commit          \endverbatim  |           
*/
/* ************************************************************************** */
/* ************************ HEADER FILES INCLUDES **************************  */
/* ************************************************************************** */
#include "LFIC_CSWC_cfg.h"
#include "MFIC_CSWC_cfg.h"
#include "HFIC_CSWC_cfg.h"
#include "SFIC_CSWC_cfg.h"

#include "CSWC_int.h"
#include "CSWC_priv.h"



/* ************************************************************************** */
/* ************************** MACRO/DEFINE SECTION ************************** */
/* ************************************************************************** */


/* ************************************************************************** */
/* ********************************* TYPE_DEF ******************************* */
/* ************************************************************************** */




/* ************************************************************************** */
/* ********************************** Enums ********************************* */
/* ************************************************************************** */




/* ************************************************************************** */
/* ******************************** STRUCT_DEF ****************************** */
/* ************************************************************************** */





/* ************************************************************************** */
/* ***************************** CONST SECTION ****************************** */
/* ************************************************************************** */




/* ************************************************************************** */
/* ***************************** VARIABLE SECTION *************************** */
/* ************************************************************************** */





/* ************************************************************************** */
/* ************************* PUBLIC FUNCTION SECTION ************************ */
/* ************************************************************************** */
/**
 *   \DESIGNER_START Define Function main sequence diagram \DESIGNER_END
 *   @startuml
 *   title Function main sequence
 *      boundary OS
 *      OS -> CSWC : CSWC_vInit
 *   @enduml
 */
void CSWC_vInit(void)
{
   /**
    * \DESIGNER_START Define Function activity diagram \DESIGNER_END
    * @startuml
    * title Function activity diagram
    * start */

   /**: Initialize Local Containers  ;*/
   CSWC_PAR_WIDTH_t Local_Data = 0 ;
   char Local_cData = 1 ;


   /**: Do some Logic  ;*/
   CSWC_vInitCallBack();




   /** stop*/
   /** @enduml*/
}








/**
 *   \DESIGNER_START  Function main sequence diagram \DESIGNER_END
 *   @startuml
 *   title Function main sequence
 *      boundary ENV
 *      ENV -> SWC : CSWC_vidRunMgmt
 *      activate SWC
 *      SWC ->  :
 *       --> SWC : return
 *      SWC --> ENV : return
 *      deactivate SWC
 *   @enduml
 */
void CSWC_vTaskMgmt(void)
{
   /**
    * \DESIGNER_START Define Function activity diagram \DESIGNER_END
    * @startuml
    * title Function activity diagram
    * start */

   /**: Initialize Local Containers  ;*/


   /**: Do some Logic  ;*/


   /** stop*/
   /** @enduml*/
}















/* ************************************************************************** */
/* ************************* Private FUNCTION SECTION *********************** */
/* ************************************************************************** */



















/* *********************** E N D (CSWC_prg.c) *************************** */