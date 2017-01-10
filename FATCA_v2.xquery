declare namespace sfa = "urn:oecd:ties:stffatcatypes:v2";
declare namespace ftc = "urn:oecd:ties:fatca:v2";

<ftc:FATCA_OECD>
	<ftc:MessageSpec>
		<sfa:SendingCompanyIN>
			{
			/root/MessageSpec/SendingCompanyIN/text()
			}
		</sfa:SendingCompanyIN>
		<sfa:TransmittingCountry>
			{
			/root/MessageSpec/TransmittingCountry/text()
			}
		</sfa:TransmittingCountry>
		<sfa:ReceivingCountry>
			{
			/root/MessageSpec/ReceivingCountry/text()
			}
		</sfa:ReceivingCountry>
		<sfa:MessageType>
			{
			/root/MessageSpec/MessageType/text()
			}
		</sfa:MessageType>
		<sfa:Warning>
			{
			/root/MessageSpec/Warning/text()
			}
		</sfa:Warning>
		<sfa:Contact>
			{
			/root/MessageSpec/Contact/text()
			}
		</sfa:Contact>
		<sfa:MessageRefId>
			{
			/root/MessageSpec/MessageRefId/text()
			}
		</sfa:MessageRefId>
		<sfa:ReportingPeriod>
			{
			/root/MessageSpec/ReportingPeriod/text()
			}
		</sfa:ReportingPeriod>
		<sfa:Timestamp>
			{
			/root/MessageSpec/Timestamp/text()
			}
		</sfa:Timestamp>
	</ftc:MessageSpec>
	<ftc:FATCA>
		<ftc:ReportingFI>
			{
			/root/ReportingFI/text()
			}
			<sfa:ResCountryCode>
				{
				/root/ReportingFI/ResCountryCode/text()
				}
			</sfa:ResCountryCode>
			<sfa:TIN>
				{
				/root/ReportingFI/TIN/text()
				}
			</sfa:TIN>
			<sfa:Name>
				{
				/root/ReportingFI/Name/text()
				}
				{
				/root/ReportingFI/OrgnisationName/text()
				}
			</sfa:Name>
			<sfa:Address legalAddressType="{/root/ReportingFI/LegalAddressType}">
				<sfa:CountryCode>
					{
					/root/ReportingFI/CountryCode/text()
					}
				</sfa:CountryCode>
				<sfa:AddressFree>
					{
					/root/ReportingFI/AddressFree/text()
					}
				</sfa:AddressFree>





























      </sfa:Address>
      <ftc:FilerCategory>FATCA601</ftc:FilerCategory>
			<ftc:DocSpec>
				<ftc:DocTypeIndic>
					{
					/root/ReportingFI/DocTypeIndic/text()
					}
				</ftc:DocTypeIndic>
				<ftc:DocRefId>
					{
					/root/ReportingFI/DocRefId/text()
					}
				</ftc:DocRefId>
				<ftc:CorrMessageRefId>
					{
					/root/ReportingFI/CorrMessageRefId/text()
					}
				</ftc:CorrMessageRefId>
				<ftc:CorrDocRefId>
					{
					/root/ReportingFI/CorrDocRefId/text()
					}
				</ftc:CorrDocRefId>
			</ftc:DocSpec>
		</ftc:ReportingFI>
		{
		for $ReportingGroup in /root/ReportingGroup 
		return 
		<ftc:ReportingGroup>




























			{
			for $CorrectableAcountReport in /root/CorrectableAcountReport 
			where ($ReportingGroup/ReportingGroupIndicator = "AccountReport") and ($ReportingGroup/ReportingGroupValue = $CorrectableAcountReport/ReportingGroupValue) 
			return 
			<ftc:AccountReport>
				<ftc:DocSpec>
					<ftc:DocTypeIndic>
						{
						$CorrectableAcountReport/DocTypeIndic/text()
						}
					</ftc:DocTypeIndic>
					<ftc:DocRefId>
						{
						$CorrectableAcountReport/DocRefId/text()
						}
					</ftc:DocRefId>
					<ftc:CorrMessageRefId>
						{
						$CorrectableAcountReport/CorrMessageRefId/text()
						}
					</ftc:CorrMessageRefId>
					<ftc:CorrDocRefId>
						{
						$CorrectableAcountReport/CorrDocRefId/text()
						}
					</ftc:CorrDocRefId>
				</ftc:DocSpec>
				<ftc:AccountNumber>
					{
					$CorrectableAcountReport/PolicyNumber/text()
					}
					{
					$CorrectableAcountReport/AccountNumber/text()
					}
				</ftc:AccountNumber>
				<ftc:AccountHolder>
					{
					for $PersonParty in /root/PersonParty , 
					    $CorrectableAcountReport1 in $CorrectableAcountReport 
					where $CorrectableAcountReport1/AccountHolder = $PersonParty/PersonPartyValue 
					return 
					<ftc:Individual>
						<sfa:ResCountryCode>
							{
							$PersonParty/ResCountryCode/text()
							}
						</sfa:ResCountryCode>
						<sfa:TIN>
							{
							$PersonParty/TIN/text()
							}
						</sfa:TIN>
						<sfa:Name>
							<sfa:Title>
								{
								$PersonParty/Title/text()
								}
							</sfa:Title>
							<sfa:FirstName>
								{
								$PersonParty/FirstName/text()
								}
							</sfa:FirstName>
							<sfa:MiddleName>
								{
								$PersonParty/MiddleName/text()
								}
							</sfa:MiddleName>
							<sfa:NamePrefix>
								{
								$PersonParty/NamePrefix/text()
								}
							</sfa:NamePrefix>
							<sfa:LastName>
								{
								$PersonParty/LastName/text()
								}
							</sfa:LastName>
							<sfa:GenerationIdentifier>
								{
								$PersonParty/GenerationIdentifier/text()
								}
							</sfa:GenerationIdentifier>
							<sfa:Suffix>
								{
								$PersonParty/Suffix/text()
								}
							</sfa:Suffix>
							<sfa:GeneralSuffix>
								{
								$PersonParty/GeneralSuffix/text()
								}
							</sfa:GeneralSuffix>
						</sfa:Name>
						<sfa:Address legalAddressType="{$PersonParty/@OECDLegalAddressType}">
							<sfa:CountryCode>
								{
								$PersonParty/CountryCode/text()
								}
							</sfa:CountryCode>
							<sfa:AddressFree>
								{
								$PersonParty/AddressFree/text()
								}
							</sfa:AddressFree>





























						</sfa:Address>
						<sfa:Nationality>
							{
							$PersonParty/NationalityCountryCode/text()
							}
						</sfa:Nationality>
						<sfa:BirthInfo>
							<sfa:BirthDate>
								{
								$PersonParty/BirthDate/text()
								}
							</sfa:BirthDate>
							<sfa:City>
								{
								$PersonParty/BirthCity/text()
								}
							</sfa:City>
							<sfa:CitySubentity>
								{
								$PersonParty/CitySubEntity/text()
								}
							</sfa:CitySubentity>
							<sfa:CountryInfo>
								<sfa:CountryCode>
									{
									$PersonParty/CountryInfoCountryCode/text()
									}
								</sfa:CountryCode>
							</sfa:CountryInfo>
						</sfa:BirthInfo>
					</ftc:Individual>
					}
					{
					for $OrganisationParty in /root/OrganisationParty , 
					    $CorrectableAcountReport2 in $CorrectableAcountReport 
					where $CorrectableAcountReport2/AccountHolder = $OrganisationParty/OrganisationPartyValue 
					return 
					<ftc:Organisation>
						<sfa:ResCountryCode>
							{
							$OrganisationParty/ResCountryCode/text()
							}
						</sfa:ResCountryCode>
						<sfa:TIN>
							{
							$OrganisationParty/TIN/text()
							}
						</sfa:TIN>
						<sfa:Name>
							{
							$OrganisationParty/Name/text()
							}
							{
							$OrganisationParty/NameOrganisation/text()
							}
							{
							$OrganisationParty/OrganisationName/text()
							}
						</sfa:Name>
						<sfa:Address legalAddressType="{$OrganisationParty/@LegalAddressType}">
							<sfa:CountryCode>
								{
								$OrganisationParty/CountryCode/text()
								}
							</sfa:CountryCode>
							<sfa:AddressFree>
								{
								$OrganisationParty/AddressFree/text()
								}
							</sfa:AddressFree>





























						</sfa:Address>
					</ftc:Organisation>
					}
					{
					for $OrganisationParty1 in /root/OrganisationParty , 
					    $CorrectableAcountReport4 in $CorrectableAcountReport 
					where $CorrectableAcountReport4/AccountHolder = $OrganisationParty1/OrganisationPartyValue 
					return 
					<ftc:AcctHolderType>
						{
						$OrganisationParty1/AccountHolderType/text()
						}
					</ftc:AcctHolderType>
					}
				</ftc:AccountHolder>
				{
				for $CorrectableAcountReport3 in $CorrectableAcountReport , 
				    $PersonParty1 in /root/PersonParty 
				where $CorrectableAcountReport3/SubstantialOwner = $PersonParty1/PersonPartyValue 
				return 
				<ftc:SubstantialOwner>
                      		<ftc:Individual>
					<sfa:ResCountryCode>
						{
						$PersonParty1/ResCountryCode/text()
						}
					</sfa:ResCountryCode>
					<sfa:TIN>
						{
						$PersonParty1/TIN/text()
						}
					</sfa:TIN>
					<sfa:Name>
						<sfa:PrecedingTitle/>
						<sfa:Title>
							{
							$PersonParty1/Title/text()
							}
						</sfa:Title>
						<sfa:FirstName>
							{
							$PersonParty1/FirstName/text()
							}
						</sfa:FirstName>
						<sfa:MiddleName>
							{
							$PersonParty1/MiddleName/text()
							}
						</sfa:MiddleName>
						<sfa:NamePrefix>
							{
							$PersonParty1/NamePrefix/text()
							}
						</sfa:NamePrefix>
						<sfa:LastName>
							{
							$PersonParty1/LastName/text()
							}
						</sfa:LastName>
						<sfa:GenerationIdentifier>
							{
							$PersonParty1/GenerationIdentifier/text()
							}
						</sfa:GenerationIdentifier>
						<sfa:Suffix>
							{
							$PersonParty1/Suffix/text()
							}
						</sfa:Suffix>
						<sfa:GeneralSuffix>
							{
							$PersonParty1/GeneralSuffix/text()
							}
						</sfa:GeneralSuffix>
					</sfa:Name>
					<sfa:Address legalAddressType="{$PersonParty1/@OECDLegalAddressType}">
						<sfa:CountryCode>
							{
							$PersonParty1/CountryCode/text()
							}
						</sfa:CountryCode>
						<sfa:AddressFree>
							{
							$PersonParty1/AddressFree/text()
							}
						</sfa:AddressFree>
					</sfa:Address>
					<sfa:Nationality>
						{
						$PersonParty1/NationalityCountryCode/text()
						}
					</sfa:Nationality>
					<sfa:BirthInfo>
						<sfa:BirthDate>
							{
							$PersonParty1/BirthDate/text()
							}
						</sfa:BirthDate>
						<sfa:City>
							{
							$PersonParty1/BirthCity/text()
							}
						</sfa:City>
						<sfa:CitySubentity>
							{
							$PersonParty1/CitySubEntity/text()
							}
						</sfa:CitySubentity>
						<sfa:CountryInfo>
							<sfa:CountryCode>
								{
								$PersonParty1/CountryInfoCountryCode/text()
								}
							</sfa:CountryCode>
						</sfa:CountryInfo>
					</sfa:BirthInfo>
                      		</ftc:Individual>
				</ftc:SubstantialOwner>
				}
                		{
                 	 	for $CorrectableAcountReport5 in $CorrectableAcountReport,
		  		$OrganisationParty2 in /root/OrganisationParty
                  		where $CorrectableAcountReport5/SubstantialOwner = $OrganisationParty2/OrganisationPartyValue
		                return
		                <ftc:SubstantialOwner>
		                <ftc:Organisation>
		                	<sfa:ResCountryCode>
		                          { $OrganisationParty2/ResCountryCode/text() }
		                        </sfa:ResCountryCode>
		                        <sfa:TIN>
		                          { $OrganisationParty2/TIN/text() }
		                        </sfa:TIN>
		                        <sfa:Name>
		                          { $OrganisationParty2/Name/text() }
		                          { $OrganisationParty2/NameOrganisation/text() }
		                          { $OrganisationParty2/OrganisationName/text() }
		                        </sfa:Name>
		                        <sfa:Address legalAddressType="{ $OrganisationParty2/@LegalAddressType }">
		                          <sfa:CountryCode>
		                            { $OrganisationParty2/CountryCode/text() }
		                          </sfa:CountryCode>
		                          <sfa:AddressFree>
		                            { $OrganisationParty2/AddressFree/text() }
		                          </sfa:AddressFree>
		                        </sfa:Address>
		                      </ftc:Organisation>
		                    </ftc:SubstantialOwner>
		                }
				<ftc:AccountBalance currCode="{$CorrectableAcountReport/AccountBalanceCurrencyCode}">
					{
					$CorrectableAcountReport/AccountBalanceAmount/text()
					}
				</ftc:AccountBalance>
	






				{
					if( (($CorrectableAcountReport/PaymentTypeDividends != "") and ($CorrectableAcountReport/PaymentTypeDividendCurrency != "")) and ($CorrectableAcountReport/PaymentTypeDividendAmount != "") ) then
						<ftc:Payment>
							<ftc:Type>
								{
								$CorrectableAcountReport/PaymentTypeDividends/text()
								}
							</ftc:Type>
							<ftc:PaymentAmnt currCode="{$CorrectableAcountReport/PaymentTypeDividendCurrency}">
								{
								$CorrectableAcountReport/PaymentTypeDividendAmount/text()
								}
							</ftc:PaymentAmnt>
						</ftc:Payment>
					else ()
				}





				{
					if( (($CorrectableAcountReport/PaymentTypeInterest != "") and ($CorrectableAcountReport/PaymentTypeInterestCurrency != "")) and ($CorrectableAcountReport/PaymentTypeInterestAmount != "") ) then
						<ftc:Payment>
							<ftc:Type>
								{
								$CorrectableAcountReport/PaymentTypeInterest/text()
								}
							</ftc:Type>
							<ftc:PaymentAmnt currCode="{$CorrectableAcountReport/PaymentTypeInterestCurrency}">
								{
								$CorrectableAcountReport/PaymentTypeInterestAmount/text()
								}
							</ftc:PaymentAmnt>
						</ftc:Payment>
					else ()
				}





				{
					if( (($CorrectableAcountReport/PaymentTypeGrossProceeds != "") and ($CorrectableAcountReport/PaymentTypeGrossProceedsCurrency != "")) and ($CorrectableAcountReport/PaymentTypeGrossProceedsAmount != "") ) then
						<ftc:Payment>
							<ftc:Type>
								{
								$CorrectableAcountReport/PaymentTypeGrossProceeds/text()
								}
							</ftc:Type>
							<ftc:PaymentAmnt currCode="{$CorrectableAcountReport/PaymentTypeGrossProceedsCurrency}">
								{
								$CorrectableAcountReport/PaymentTypeGrossProceedsAmount/text()
								}
							</ftc:PaymentAmnt>
						</ftc:Payment>
					else ()
				}
				{
					if( (($CorrectableAcountReport/PaymentTypeOther != "") and ($CorrectableAcountReport/PaymentTypeOtherCurrency != "")) and ($CorrectableAcountReport/PaymentTypeOtherAmount != "") ) then
						<ftc:Payment>
							<ftc:Type>
								{
								$CorrectableAcountReport/PaymentTypeOther/text()
								}
							</ftc:Type>
							<ftc:PaymentAmnt currCode="{$CorrectableAcountReport/PaymentTypeOtherCurrency}">
								{
								$CorrectableAcountReport/PaymentTypeOtherAmount/text()
								}
							</ftc:PaymentAmnt>
						</ftc:Payment>
					else ()
				}





			</ftc:AccountReport>
			}
		</ftc:ReportingGroup>
		}
	</ftc:FATCA>
</ftc:FATCA_OECD>(: Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Scenario1" userelativepaths="yes" externalpreview="no" useresolver="yes" url="..\2016-WNB163K\FATCA_SRC_WNB163K.xml" outputurl="" processortype="datadirect" tcpport="0" profilemode="0" profiledepth="" profilelength=""
		          urlprofilexml="" commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" host="" port="0" user="" password="" validateoutput="no"
		          validator="internal" customvalidator="">
			<advancedProperties name="DocumentURIResolver" value=""/>
			<advancedProperties name="CollectionURIResolver" value=""/>
			<advancedProperties name="ModuleURIResolver" value=""/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="..\FatcaXML_v2.0.xsd" destSchemaRoot="FATCA_OECD" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="..\2016-WNB163K\FATCA_SRC_WNB163K.xml" srcSchemaRoot="root" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template name="xquery_body">
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr" x="392" y="112"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr" x="432" y="112"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/and[1]" x="386" y="134"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/and[1]/=[0]" x="340" y="128"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/and[1]/=[1]" x="340" y="156"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/ftc:AccountHolder/flwr" x="152" y="112"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/ftc:AccountHolder/flwr/=[1]" x="106" y="134"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/ftc:AccountHolder/flwr[1]" x="112" y="112"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/ftc:AccountHolder/flwr[1]/=[1]" x="66" y="134"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/ftc:AccountHolder/flwr[2]" x="72" y="112"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/ftc:AccountHolder/flwr[2]/=[1]" x="26" y="134"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/flwr" x="199" y="76"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/flwr/=[1]" x="153" y="98"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/flwr[1]" x="159" y="76"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/flwr[1]/=[1]" x="113" y="98"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if" x="312" y="112"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if/and[0]" x="266" y="106"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if/and[0]/and[0]" x="220" y="100"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if/and[0]/and[0]/!=[0]" x="174" y="94"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if/and[0]/and[0]/!=[1]" x="174" y="122"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if/and[0]/!=[1]" x="220" y="128"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[1]" x="272" y="112"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[1]/and[0]" x="226" y="106"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[1]/and[0]/and[0]" x="180" y="100"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[1]/and[0]/and[0]/!=[0]" x="134" y="94"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[1]/and[0]/and[0]/!=[1]" x="134" y="122"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[1]/and[0]/!=[1]" x="180" y="128"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[2]" x="232" y="112"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[2]/and[0]" x="186" y="106"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[2]/and[0]/and[0]" x="140" y="100"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[2]/and[0]/and[0]/!=[0]" x="94" y="94"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[2]/and[0]/and[0]/!=[1]" x="94" y="122"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[2]/and[0]/!=[1]" x="140" y="128"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[3]" x="192" y="112"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[3]/and[0]" x="146" y="106"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[3]/and[0]/and[0]" x="100" y="100"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[3]/and[0]/and[0]/!=[0]" x="54" y="94"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[3]/and[0]/and[0]/!=[1]" x="54" y="122"/>
				<block path="ftc:FATCA_OECD/ftc:FATCA/flwr/ftc:ReportingGroup/flwr/ftc:AccountReport/if[3]/and[0]/!=[1]" x="100" y="128"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source">
			<Fragment url="" path="" action="hideAll"/>
			<Fragment url="file:///c:/Works/FATCA/2016-WNB163K/FATCA_SRC_WNB163K.xml" path="root/MessageSpec" action="showFragment"/>
		</MapperFilter>
	</MapperMetaTag>
</metaInformation>
:)