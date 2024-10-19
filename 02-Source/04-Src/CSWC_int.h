/* ************************************************************************** */
/* *************** COMPONENT DESIGN DEFINITION SECTION ********************** */
/* ************************************************************************** */
/** \page _Overall Component Specifications
 * 
 * \section 1-Overview
 *  \par 1.1 - Component Overview
 *  \DESIGNER_START Description of the component \DESIGNER_END
 *   
 * 
 * 
 * \section 2-Usage
 *  \par 2.1 - Component Usage
 *  \DESIGNER_START   \DESIGNER_END
 * 
 * 
 * 
 * \section 3-Safety
 *  \par 3.1 - Component Safety
 *  \DESIGNER_START   \DESIGNER_END
 * 
 * 
 * 
 * \section 4-Software Context Diagram
 *  \par 4.1 - Component Software Context Diagram
 *  \DESIGNER_START  \DESIGNER_END
 * 
 * 
 * 
 * \section 5- Communication Diagram
 *  \par 5.1 - Component Communication Diagram
 *  \DESIGNER_START   \DESIGNER_END
 * 
 * 
 * 
 * \section 6-State Machine Diagram
 *  \par 6.1 - Component State Machine Diagram
 *  \DESIGNER_START  \DESIGNER_END
 * 
 * 
 * 
 * \section 7-Constraints
 *  \par 7.1 - HW Constraints
 *  \DESIGNER_START  \DESIGNER_END
 * 
 *  \par 1.2 - SW Constraints
 * 
*/
/* ************************************************************************** */
/* ********************** FILE DEFINITION SECTION *************************** */
/* ************************************************************************** */
/** \file CSWC_int.h
*  \Component   CSWC
*  \brief     \DESIGNER_START Brief description of the file \DESIGNER_END
*  \details   \DESIGNER_START Much more details can be added \DESIGNER_END
*  \n\n
*  Scope: Public
*  \n\n
*  Coding language : C
*   \copydoc _inth
 *  \copydoc COPYRIGHT (c) AstreTech  all rights reserved
*/
/* ************************************************************************** */
/* ********************** MODIFICATION LOG SECTION ************************** */
/* ************************************************************************** */
/** \page _inth CSWC_int.h History
 * |                  ::    Author        | Version              | Date                   |    Status        |       Description                      |
 * |                  :: :-------------:  | :------------------: | :--------------------: | :----------      | :------------------------------------: |
 * | \verbatim $Author:: Osama ElMorady   | $Version::  1.0      | $Date:: 18 Oct,2024    | $Status:: Draft  | $Description::  Initial Commit          \endverbatim  |           
*/
/* ************************************************************************** */
/* ************************* HEADER PROTECTION ****************************** */
/* ************************************************************************** */
#ifndef CSWC_INT_H
#define CSWC_INT_H
/* ************************************************************************** */
/* ************************ HEADER FILES INCLUDES **************************  */
/* ************************************************************************** */
#include "CSWC_cfg.h"

/* ************************************************************************** */
/* ************************** MACRO/DEFINE SECTION ************************** */
/* ************************************************************************** */



/* ************************************************************************** */
/* ********************************* TYPE_DEF ******************************* */
/* ************************************************************************** */
/** \brief \DESIGNER_START  typedef paramter size width   \DESIGNER_END
 *   \details  \DESIGNER_START 
 *    Type: char           \n
 *    Range :[0..255]      \n
 *    Resolution: 1        \n           \DESIGNER_END
 */
typedef char CSWC_PAR_WIDTH_t ; 



/* ************************************************************************** */
/* ********************************** Enums ********************************* */
/* ************************************************************************** */
/** \brief \DESIGNER_START  Parameter 1 ranges  \DESIGNER_END
 *   \details  \DESIGNER_START 
 *    Type: char           \n
 *    Range :[CSWC_Param_1..CSWC_Param_N]      \n
 *    Resolution: 1        \n           \DESIGNER_END
 */
typedef enum 
{
    CSWC_Param_Chip1 ,         
    CSWC_Param_Chip2 , 
    CSWC_Param_Chip3 ,

    CSWC_Chip_N , 
} CSWC_CHIP_t ;



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
/* **************************** FUNCTION SECTION **************************** */
/* ************************************************************************** */
/**
 *   \brief \DESIGNER_START Initialize CSWC component \DESIGNER_END
 *   \details \DESIGNER_START Initialize all signals, Modes and number of chips \DESIGNER_END
 *
 *   \par Scope:
 *        \DESIGNER_START Public \DESIGNER_END
 *   \par Synch/Asynch:
 *        \DESIGNER_START Synchronous \DESIGNER_END
 *   \par Re-entrancy:
 *        \DESIGNER_START Non Re-entrant \DESIGNER_END
 *
 *   \param[in]  void 
 *          \DESIGNER_START Description of the input paramater   Type void / Range [NA] / Resolution NA / Unit NA \DESIGNER_END
 *   \return  void 
 *          \DESIGNER_START Description of the return paramater   Type void / Range [NA] / Resolution NA / Unit NA \DESIGNER_END
 *           \DESIGNER_START 
 *             Returned Value List:    1 , 2 , 3
 *           \DESIGNER_END
 *
 *   \par Requirement_ID:
 *        \DESIGNER_START  NA  \DESIGNER_END
 *   \par Coverage_ID:
 *        \DESIGNER_START  NA  \DESIGNER_END
 */
extern void CSWC_vInit(void);











/**
 *   \brief \DESIGNER_START Component Task \DESIGNER_END
 *   \details \DESIGNER_START Run Component State machine, Set SW Enable value, Read Chip Diag  and Update Defects \DESIGNER_END
 *
 *   \par Scope:
 *        \DESIGNER_START Public \DESIGNER_END
 *   \par Synch/Asynch:
 *        \DESIGNER_START Synchronous \DESIGNER_END
 *   \par Re-entrancy:
 *        \DESIGNER_START Non Re-entrant \DESIGNER_END
 *
 *   \param[in]  void 
 *          \DESIGNER_START Description of the input paramater   Type void / Range [NA] / Resolution NA / Unit NA \DESIGNER_END
 *   \param[out]  void 
 *          \DESIGNER_START Description of the input paramater   Type void / Range [NA] / Resolution NA / Unit NA \DESIGNER_END
 *   \return  void 
 *          \DESIGNER_START Description of the return paramater   Type void / Range [NA] / Resolution NA / Unit NA \DESIGNER_END
 *           \DESIGNER_START 
 *             Returned Value List:    1 , 2 , 3
 *           \DESIGNER_END
 *
 *   \par Requirement_ID:
 *        \DESIGNER_START  NA  \DESIGNER_END
 *   \par Coverage_ID:
 *        \DESIGNER_START  NA  \DESIGNER_END
 */
extern void CSWC_vTaskMgmt(void);                








#endif /* CSWC_INT_H */
/* *********************** E N D (CSWC_int.h) *************************** */