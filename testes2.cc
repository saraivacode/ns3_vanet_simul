/* -*-  Mode: C++; c-file-style: "gnu"; indent-tabs-mode:nil; -*- */
/*
 * Copyright (c) 2005,2006,2007 INRIA
 * Copyright (c) 2013 Dalian University of Technology
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation;
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * Author: Mathieu Lacage <mathieu.lacage@sophia.inria.fr>
 * Author: Junling Bu <linlinjavaer@gmail.com>
 *
 */
/**
 * Script de Vanets, utilizando:
 * 802.11p
 * trace de mobilidade de utras com 99 veículos
 * possibilidade de dois modelos de propagação: FriisPropagationLossModel e TwoRayGroundPropagationLossModel
 * aplicação BSM com estatísticas ??? 
 */

#include <fstream>
#include <iostream>
#include "ns3/applications-module.h"
#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/wifi-module.h"
#include "ns3/vector.h"
#include "ns3/string.h"
#include "ns3/socket.h"
#include "ns3/double.h"
#include "ns3/config-store-module.h"
#include "ns3/config.h"
#include "ns3/command-line.h"
#include "ns3/log.h"
#include "ns3/mobility-model.h"
#include "ns3/mobility-module.h"
#include "ns3/mobility-helper.h"
#include "ns3/yans-wifi-helper.h"
#include "ns3/position-allocator.h"
#include "ns3/internet-module.h"
#include "ns3/integer.h"
#include "ns3/internet-stack-helper.h"
#include "ns3/ipv4-address-helper.h"
#include "ns3/ipv4-interface-container.h"
#include "ns3/ocb-wifi-mac.h"
#include "ns3/wifi-80211p-helper.h"
#include "ns3/aodv-module.h"
#include "ns3/olsr-module.h"
#include "ns3/dsdv-module.h"
#include "ns3/dsr-module.h"
#include "ns3/itu-r-1411-los-propagation-loss-model.h"
#include "ns3/wave-mac-helper.h"
#include "ns3/wave-mac-helper.h"
#include "ns3/wave-bsm-helper.h"
#include "ns3/wave-helper.h"
//#include "ns3/netanim-module.h"

using namespace ns3;
using namespace dsr;

class VanetRoutingExperiment
{
public:

  void CheckThroughput ();
  void SetupWaveMessages ();
  void Run ();
  void CommandSetup (int argc, char **argv);
  void configeral ();
  void WriteCsvHeader ();
  void ProcessOutputs ();

 // static void CourseChange (std::ostream *os, std::string foo, Ptr<const MobilityModel> mobility);
  uint32_t m_nNodes;
  std::string m_traceFile;
  double m_TotalSimTime;
  std::string m_lossModelName;
  uint32_t m_wavePacketSize;
  double m_waveInterval;
  double m_gpsAccuracyNs;
  WaveBsmHelper m_waveBsmHelper;
  std::vector <double> m_txSafetyRanges;
  int chAccessMode = 0;
  double m_txMaxDelayMs;
  int64_t m_streamIndex;
  std::string m_CSVfileName;
  std::string m_CSVfileName2;  
  Ipv4InterfaceContainer i;
  NodeContainer c;
  YansWifiChannelHelper wifiChannel;
  uint32_t m_port;
  
  
  };

void VanetRoutingExperiment::Run ()
{
 // NS_LOG_INFO ("Run Simulation.");
  CheckThroughput ();
  WriteCsvHeader ();
  Simulator::Stop (Seconds (m_TotalSimTime));
  //AnimationInterface anim ("animation.xml");
  //anim.SetMaxPktsPerTraceFile(5569200);
  Simulator::Run ();
  Simulator::Destroy ();
}

void VanetRoutingExperiment::configeral ()
{
  YansWifiPhyHelper wifiPhy =  YansWifiPhyHelper::Default ();
  m_lossModelName = "ns3::FriisPropagationLossModel";
  //m_lossModelName = "ns3::TwoRayGroundPropagationLossModel";
  m_TotalSimTime = 300.01;
  m_nNodes = 99;
  m_traceFile = "src/wave/examples/low99-ct-unterstrass-1day.filt.7.adj.mob";
  m_wavePacketSize = 400; //pode ser variado
  m_waveInterval = 1.0; //pode ser variado
  m_gpsAccuracyNs = 40; //tem que entender
  m_txMaxDelayMs = 10; //tem que entender
  m_streamIndex = 30; //tem que entender
  m_CSVfileName = "low_vanet-routing-compare.csv";
  m_CSVfileName2 = "low_vanet-routing-compare2.csv";

  m_txSafetyRanges.resize (10, 0); //tem que entender
  m_txSafetyRanges[0] = 50.0;
  m_txSafetyRanges[1] = 100.0;
  m_txSafetyRanges[2] = 150.0;
  m_txSafetyRanges[3] = 200.0;
  m_txSafetyRanges[4] = 250.0;
  m_txSafetyRanges[5] = 300.0;
  m_txSafetyRanges[6] = 350.0;
  m_txSafetyRanges[7] = 400.0;
  m_txSafetyRanges[8] = 450.0;
  m_txSafetyRanges[9] = 500.0;
  m_port = 9;
  
  std::string phyMode ("OfdmRate6MbpsBW10MHz"); //explicar
  bool verbose = false; //explicar

  c.Create (m_nNodes); //criação dos nós

  wifiChannel.SetPropagationDelay ("ns3::ConstantSpeedPropagationDelayModel"); //explicar
  
  if (m_lossModelName == "ns3::TwoRayGroundPropagationLossModel") //configurando modelo de perdas no espaço
    {
      wifiChannel.AddPropagationLoss (m_lossModelName, "Frequency", DoubleValue (5.9e9), "HeightAboveZ", DoubleValue (1.5));
    }
  else
    {
       wifiChannel.AddPropagationLoss (m_lossModelName, "Frequency", DoubleValue (5.9e9));
    }

  wifiChannel.AddPropagationLoss ("ns3::NakagamiPropagationLossModel"); //adiciona propagação por multiplos caminhos (fading)

  Ptr<YansWifiChannel> channel = wifiChannel.Create (); //explicar
  wifiPhy.SetChannel (channel); //explicar
 // wifiPhy.SetPcapDataLinkType (YansWifiPhyHelper::DLT_IEEE802_11);
  NqosWaveMacHelper wifi80211pMac = NqosWaveMacHelper::Default (); //explicar
  Wifi80211pHelper wifi80211p = Wifi80211pHelper::Default (); //explicar

  if (verbose) //necessário?
    {
      wifi80211p.EnableLogComponents ();      // Turn on all Wifi 802.11p logging
    }

  wifi80211p.SetRemoteStationManager ("ns3::ConstantRateWifiManager", //entender
                                      "DataMode",StringValue (phyMode),
                                      "ControlMode",StringValue (phyMode));

  NetDeviceContainer devices = wifi80211p.Install (wifiPhy, wifi80211pMac, c); //finaliza config. parte fisica

 // wifiPhy.EnablePcap ("wave-simple-80211p", devices);

  Ns2MobilityHelper ns2 = Ns2MobilityHelper (m_traceFile); //configura mobilidade baseada no trace
  ns2.Install (); //instala mobilidade

  InternetStackHelper internet; //explicar
  internet.Install (c); //explicar
  Ipv4AddressHelper ipv4; //endereçamento IP
  ipv4.SetBase ("10.1.0.0", "255.255.0.0"); //define faixa de endereçamento
  i = ipv4.Assign(devices); //atribui endereços

 
}

void VanetRoutingExperiment::SetupWaveMessages ()
{
  WaveBsmHelper::GetNodesMoving ().resize (m_nNodes, 1); //bota os carros para andar

  m_waveBsmHelper.Install (i,
                          Seconds (m_TotalSimTime),
                          m_wavePacketSize,
                          Seconds (m_waveInterval),
                          m_gpsAccuracyNs,
                          m_txSafetyRanges,
                          chAccessMode,
                          MilliSeconds (m_txMaxDelayMs));

  m_streamIndex += m_waveBsmHelper.AssignStreams (c, m_streamIndex);

}

void VanetRoutingExperiment::CheckThroughput () //função que calcula tudo
{
  double wavePDR = 0.0;

  int wavePktsSent = m_waveBsmHelper.GetWaveBsmStats ()->GetTxPktCount ();
  int wavePktsReceived = m_waveBsmHelper.GetWaveBsmStats ()->GetRxPktCount ();

  if (wavePktsSent > 0)
    {
      int wavePktsReceived = m_waveBsmHelper.GetWaveBsmStats ()->GetRxPktCount ();
      wavePDR = (double) wavePktsReceived / (double) wavePktsSent;
    }

  int waveExpectedRxPktCount = m_waveBsmHelper.GetWaveBsmStats ()->GetExpectedRxPktCount (1);

  int waveRxPktInRangeCount = m_waveBsmHelper.GetWaveBsmStats ()->GetRxPktInRangeCount (1);

  double wavePDR1_2 = m_waveBsmHelper.GetWaveBsmStats ()->GetBsmPdr (1);
  double wavePDR2_2 = m_waveBsmHelper.GetWaveBsmStats ()->GetBsmPdr (2);
  double wavePDR3_2 = m_waveBsmHelper.GetWaveBsmStats ()->GetBsmPdr (3);
  double wavePDR4_2 = m_waveBsmHelper.GetWaveBsmStats ()->GetBsmPdr (4);
  double wavePDR5_2 = m_waveBsmHelper.GetWaveBsmStats ()->GetBsmPdr (5);
  double wavePDR6_2 = m_waveBsmHelper.GetWaveBsmStats ()->GetBsmPdr (6);
  double wavePDR7_2 = m_waveBsmHelper.GetWaveBsmStats ()->GetBsmPdr (7);
  double wavePDR8_2 = m_waveBsmHelper.GetWaveBsmStats ()->GetBsmPdr (8);
  double wavePDR9_2 = m_waveBsmHelper.GetWaveBsmStats ()->GetBsmPdr (9);
  double wavePDR10_2 = m_waveBsmHelper.GetWaveBsmStats ()->GetBsmPdr (10);


 NS_LOG_UNCOND ("At t=" << (Simulator::Now ()).GetSeconds () << "s BSM_PDR1 (50m)=" << wavePDR1_2 << " BSM_PDR5 (250m)=" << wavePDR5_2 << " BSM_PDR10 (500m)=" << wavePDR10_2  /*<< " MAC/PHY-OH=" << mac_phy_oh*/);
 
// NS_LOG_UNCOND ("At t=" << (Simulator::Now ()).GetSeconds () << "s BSM_PDR9 (500m)=" << wavePDR9_2  /*<< " MAC/PHY-OH=" << mac_phy_oh*/);

  std::ofstream out (m_CSVfileName.c_str (), std::ios::app);

  out << (Simulator::Now ()).GetSeconds () << ","
     << wavePktsSent << ","
    << wavePktsReceived << ","
    << wavePDR << ","
    << waveExpectedRxPktCount << ","
    << waveRxPktInRangeCount << ","
    << wavePDR1_2 << ","
    << wavePDR2_2 << ","
    << wavePDR3_2 << ","
    << wavePDR4_2 << ","
    << wavePDR5_2 << ","
    << wavePDR6_2 << ","
    << wavePDR7_2 << ","
    << wavePDR8_2 << ","
    << wavePDR9_2 << ","
    << wavePDR10_2 << ""
    << std::endl;
    
    out.close ();

   Simulator::Schedule (Seconds (1.0), &VanetRoutingExperiment::CheckThroughput, this);
}

void VanetRoutingExperiment::WriteCsvHeader ()
{
  //blank out the last output file and write the column headers
  std::ofstream out (m_CSVfileName.c_str ());
  out << "Tempo(s)," <<
    "Pkt_env," <<
    "Pkt_Rcv," <<
    "Pkt_PDR," <<
    "Exp_Pkt_Rcv," <<
    "Exp_Pkts_Range_Recv," <<
    "BSM_PDR1," <<
    "BSM_PDR2," <<
    "BSM_PDR3," <<
    "BSM_PDR4," <<
    "BSM_PDR5," <<
    "BSM_PDR6," <<
    "BSM_PDR7," <<
    "BSM_PDR8," <<
    "BSM_PDR9," <<
    "BSM_PDR10" <<
    std::endl;
  out.close ();

  std::ofstream out2 (m_CSVfileName2.c_str ());
  out2 << "BSM_PDR1,"
       << "BSM_PDR2,"
       << "BSM_PDR3,"
       << "BSM_PDR4,"
       << "BSM_PDR5,"
       << "BSM_PDR6,"
       << "BSM_PDR7,"
       << "BSM_PDR8,"
       << "BSM_PDR9,"
       << "BSM_PDR10"
//       << "AverageRoutingGoodputKbps,"
//       << "MacPhyOverhead"
       << std::endl;
  out2.close ();

}

void VanetRoutingExperiment::ProcessOutputs ()
{
  // calculate and output final results
  
  double bsm_pdr1 = m_waveBsmHelper.GetWaveBsmStats ()->GetCumulativeBsmPdr (1);
  double bsm_pdr2 = m_waveBsmHelper.GetWaveBsmStats ()->GetCumulativeBsmPdr (2);
  double bsm_pdr3 = m_waveBsmHelper.GetWaveBsmStats ()->GetCumulativeBsmPdr (3);
  double bsm_pdr4 = m_waveBsmHelper.GetWaveBsmStats ()->GetCumulativeBsmPdr (4);
  double bsm_pdr5 = m_waveBsmHelper.GetWaveBsmStats ()->GetCumulativeBsmPdr (5);
  double bsm_pdr6 = m_waveBsmHelper.GetWaveBsmStats ()->GetCumulativeBsmPdr (6);
  double bsm_pdr7 = m_waveBsmHelper.GetWaveBsmStats ()->GetCumulativeBsmPdr (7);
  double bsm_pdr8 = m_waveBsmHelper.GetWaveBsmStats ()->GetCumulativeBsmPdr (8);
  double bsm_pdr9 = m_waveBsmHelper.GetWaveBsmStats ()->GetCumulativeBsmPdr (9);
  double bsm_pdr10 = m_waveBsmHelper.GetWaveBsmStats ()->GetCumulativeBsmPdr (10);

  std::ofstream out (m_CSVfileName2.c_str (), std::ios::app);

  out << bsm_pdr1 << ","
      << bsm_pdr2 << ","
      << bsm_pdr3 << ","
      << bsm_pdr4 << ","
      << bsm_pdr5 << ","
      << bsm_pdr6 << ","
      << bsm_pdr7 << ","
      << bsm_pdr8 << ","
      << bsm_pdr9 << ","
      << bsm_pdr10 << ""

      << std::endl;

  out.close ();

}

void
VanetRoutingExperiment::CommandSetup (int argc, char **argv)
{
  CommandLine cmd;
 
  // allow command line overrides
  cmd.AddValue ("CSVfileName", "The name of the CSV output file name", m_CSVfileName);
  cmd.AddValue ("CSVfileName2", "The name of the CSV output file name2", m_CSVfileName2);
  cmd.AddValue ("totaltime", "Simulation end time", m_TotalSimTime);
  cmd.AddValue ("nodes", "Number of nodes (i.e. vehicles)", m_nNodes);
  cmd.AddValue ("lossModel", "1=Friis;2=ItuR1411Los;3=TwoRayGround;4=LogDistance", m_lossModelName);
  cmd.AddValue ("traceFile", "Ns2 movement trace file", m_traceFile);
  cmd.AddValue ("bsm", "(WAVE) BSM size (bytes)", m_wavePacketSize);
  cmd.AddValue ("interval", "(WAVE) BSM interval (s)", m_waveInterval);
  cmd.AddValue ("gpsaccuracy", "GPS time accuracy, in ns", m_gpsAccuracyNs);
  cmd.AddValue ("txmaxdelay", "Tx max delay, in ms", m_txMaxDelayMs);
  cmd.AddValue ("streamIndex", "Stream Index (Ramdom), (number int)", m_streamIndex);

  cmd.Parse (argc, argv);

  // transfer config-store values to config parameters
  //SetConfigFromGlobals ();

  // parse again so you can override input file default values via command line
  cmd.Parse (argc, argv);

}

int main (int argc, char *argv[])
{
  VanetRoutingExperiment teste;
  teste.configeral();
  teste.CommandSetup (argc, argv);
  teste.SetupWaveMessages();
  teste.Run();
  teste.ProcessOutputs();

  return 0;
}
