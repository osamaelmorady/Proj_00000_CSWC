/* ************************************************************************** */
/* ********************** FILE DEFINITION SECTION *************************** */
/* ************************************************************************** */
/** \file CSWC_cfg.h
*  \Component   CSWC
*  \brief     \DESIGNER_START Brief description of the file \DESIGNER_END
*  \details   \DESIGNER_START Much more details can be added \DESIGNER_END
*  \n\n
*  Scope: Private
*  \n\n
*  Coding language : C
*   \copydoc _cfgh
 *  \copydoc COPYRIGHT (c) AstreTech  all rights reserved
*/
/* ************************************************************************** */
/* ********************** MODIFICATION LOG SECTION ************************** */
/* ************************************************************************** */
/** \page _cfgh CSWC_cfg.h History
 * |                  ::    Author        | Version              | Date                   |    Status        |       Description                      |
 * |                  :: :-------------:  | :------------------: | :--------------------: | :----------      | :------------------------------------: |
 * | \verbatim $Author:: Osama ElMorady   | $Version::  1.0      | $Date:: 18 Oct,2024    | $Status:: Draft  | $Description::  Initial Commit          \endverbatim  |           
*/
/* ************************************************************************** */
/* ************************* HEADER PROTECTION ****************************** */
/* ************************************************************************** */
#ifndef CSWC_CFG_H
#define CSWC_CFG_H
/* ************************************************************************** */
/* ************************ HEADER FILES INCLUDES **************************  */
/* ************************************************************************** */



/* ************************************************************************** */
/* ************************** MACRO/DEFINE SECTION ************************** */
/* ************************************************************************** */
/** \brief \DESIGNER_START  Chip Number  \DESIGNER_END
 *   \details  \DESIGNER_START 
 *    Type: char           \n
 *    Range :[0..255]      \n
 *    Resolution: 1        \n           \DESIGNER_END
 */
#define CSWC_CHIP_NUMBER   ((char) 2)


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
/* **************************** FUNCTION SECTION **************************** */
/* ************************************************************************** */
/**
 *   \brief \DESIGNER_START CSWC  Initialization callback function  \DESIGNER_END
 *   \details \DESIGNER_START Initialize all config signals, Modes and number of chips \DESIGNER_END
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
extern void CSWC_vInitCallBack(void);






#endif /* CSWC_CFG_H */
/* *********************** E N D (CSWC_cfg.h) *************************** */