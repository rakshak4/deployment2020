/**
 * @description       :
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             :
 * @last modified on  : 10-20-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 **/
/**
 * @File Name          : AP02_ParameterExercise.cls
 * @Description        : Initialisation with VSCode
 * @Author             : Spoon Consulting
 * @Group              :
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 10-20-2022
 * @Modification Log   :
 *==============================================================================
 * Ver         Date                     Author      Modification
 *==============================================================================
 * 1.0       20/10/22                    AGH       Initial Version
 **/
public with sharing class AP04_countryAcct {
     /**
        * @description Method that Create a map to store country as Key and corresponding states as Values
        * @author Asma Ghanty | 20/10/22
        * @return Map.
        **/

        public static void mapStoreCountry(){
            Map<String, List<String>> mapCountryState = new Map<String, List<String>>();

            mapCountryState.put('United States', new List<String>{'Connecticut , Nebraska, New Jersey'});
            mapCountryState.put('Germany', new List<String>{'Berlin, Hamburg'});

            System.debug('Countries and its states:' +mapCountryState.Values());


        }

   
}