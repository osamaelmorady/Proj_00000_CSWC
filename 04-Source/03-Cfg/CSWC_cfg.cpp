/* ************************************************************************** */
/* ********************** FILE DEFINITION SECTION *************************** */
/* ************************************************************************** */
/** \file   CSWC_cfg.c
 *  \Component   CSWC
 *  \brief     \DESIGNER_START Brief description of the file\DESIGNER_END
 *  \details   \DESIGNER_START Much more details can be added \DESIGNER_END
 *  \n\n
 *  Scope: Public
 *  \n\n
 *  Coding language : C
 *    \copydoc _cfgc
 *  \copydoc COPYRIGHT (c) AstreTech  all rights reserved
 */
/* ************************************************************************** */
/* ********************** MODIFICATION LOG SECTION ************************** */
/* ************************************************************************** */
/** \page _cfgc CSWC_cfg.c History
 * |                  ::    Author        | Version              | Date                   |    Status        |       Description                      |
 * |                  :: :-------------:  | :------------------: | :--------------------: | :----------      | :------------------------------------: |
 * | \verbatim $Author:: Osama ElMorady   | $Version::  1.0      | $Date:: 18 Oct,2024    | $Status:: Draft  | $Description::  Initial Commit          \endverbatim  |           
*/
/* ************************************************************************** */
/* ************************ HEADER FILES INCLUDES **************************  */
/* ************************************************************************** */
#include "LFIC_CSWC_cfg.hpp"
#include "MFIC_CSWC_cfg.hpp"
#include "HFIC_CSWC_cfg.hpp"
#include "SFIC_CSWC_cfg.hpp"

#include "CSWC_int.hpp"
#include "CSWC_priv.hpp"



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
/** \brief \DESIGNER_START  Component Global Config struct  \DESIGNER_END
 *   \details  \DESIGNER_START 
 *    Type: strcut           \n
 *    Range :[NA]            \n
 *    Resolution: [NA]       \n           \DESIGNER_END
 */
typedef struct 
{
    CSWC_CHIP_t CSWC_ChipID ;
    CSWC_PAR_WIDTH_t CSWC_ChipData ;
} CSWC_CONFIG_t ;




/* ************************************************************************** */
/* ***************************** CONST SECTION ****************************** */
/* ************************************************************************** */
/** \brief \DESIGNER_START  Global configuration parameters  \DESIGNER_END
 *  \details  \DESIGNER_START 
 *    Type: char           \n
 *    Range :[0..255]      \n
 *    Resolution: 1        \n           \DESIGNER_END
 */
const static CSWC_CONFIG_t CSWC_Config[CSWC_CHIP_NUMBER]=
{
    {CSWC_Param_Chip1 , 0x50 },
    {CSWC_Param_Chip2 , 0x60 }

};



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
 *      boundary CSWC
 *      CSWC -> CSWC : CSWC_vInitCallBack
 *   @enduml
 */
extern void CSWC_vInitCallBack(void)
{




}







/* ************************************************************************** */
/* ************************* Private FUNCTION SECTION *********************** */
/* ************************************************************************** */















/* *********************** E N D (CSWC_cfg.c) *************************** */