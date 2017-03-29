Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctFGt-0003Yr-UH
 for ath10k@lists.infradead.org; Wed, 29 Mar 2017 15:12:30 +0000
Received: by mail-ot0-x235.google.com with SMTP id 102so12310201otv.0
 for <ath10k@lists.infradead.org>; Wed, 29 Mar 2017 08:12:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <05ddc8a7-2abe-200b-bc70-15f674579d80@qca.qualcomm.com>
References: <CALJ2kaGBUyjtDDNQj-rLDK-J--ObZ+e5P_KVkaZfa4UtYUUMdQ@mail.gmail.com>
 <05ddc8a7-2abe-200b-bc70-15f674579d80@qca.qualcomm.com>
From: Chris Price <chris.price@dejero.com>
Date: Wed, 29 Mar 2017 11:12:05 -0400
Message-ID: <CALJ2kaEWrUcMGGdPv1KB7-ajMs0c+WQ_rjLM_2BFni4ksXXrpQ@mail.gmail.com>
Subject: Re: QCA6174 ACS failure on first attempt
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> I am actually not sure if this is some bug that has been fixed in the latest v2.6. Or maybe is still valid.
> Would you mind help to dump the iw reg get again at the first attempt before you starting the hostapd?

> And also tried with the latest v2.6 hostapd to see if you could see the same issue?

I'm now using hostapd version 2.6, built from the sources at hash 2462f34:

# hostapd -v
hostapd v2.6-hostap_2_6
User space daemon for IEEE 802.11 AP management,
IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator
Copyright (c) 2002-2016, Jouni Malinen <j@w1.fi> and contributors

# iw reg get
country 00: DFS-UNSET
(2402 - 2472 @ 40), (N/A, 20), (N/A)
(2457 - 2482 @ 20), (N/A, 20), (N/A), NO-IR
(2474 - 2494 @ 20), (N/A, 20), (N/A), NO-OFDM, NO-IR
(5170 - 5250 @ 80), (N/A, 20), (N/A), NO-IR
(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, NO-IR
(5490 - 5730 @ 160), (N/A, 20), (0 ms), DFS, NO-IR
(5735 - 5835 @ 80), (N/A, 20), (N/A), NO-IR
(57240 - 63720 @ 2160), (N/A, 0), (N/A)

We have found the following workaround which allows us to launch
hostapd with the posted config on the first try.

iw reg set CA
ip link set dev wlan0 up
iw dev wlan0 scan passive
ip link set dev wlan0 down

Then hostapd can be started successfully.

If we use a card with a different chipset (realtek), the 5G channels
are available on the first try without the above workaround. That
said, AFAIK hostapd does not support ACS with this card, so I'm not
sure if this issue belongs here or on the hostapd list. Logs:

Previous country code 00, new country code CA
Continue interface setup after channel list update
ctrl_iface not configured!
random: Got 15/20 bytes from /dev/random
RTM_NEWLINK: ifi_index=4 ifname=wlan0 operstate=0 linkmode=0
ifi_family=0 ifi_flags=0x1043 ([UP][RUNNING])
RTM_NEWLINK: ifi_index=4 ifname=wlan0 operstate=2 linkmode=0
ifi_family=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK: ifi_index=4 ifname=wlan0 operstate=2 linkmode=0 master=7
ifi_family=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK: ifi_index=4 ifname=wlan0 operstate=2 linkmode=0 master=7
ifi_family=0 ifi_flags=0x1003 ([UP])
RTM_NEWLINK: ifi_index=4 ifname=wlan0 master=7 operstate=2
ifi_family=7 ifi_flags=0x1003 ([UP])
nl80211: Add ifindex 7 for bridge br0
nl80211: Add own interface ifindex 7 (ifidx_reason 4)
nl80211: ifindex 7 already in the list
random: Got 5/5 bytes from /dev/random
nl80211: Event message available
nl80211: Drv Event 36 (NL80211_CMD_REG_CHANGE) received for wlan0
nl80211: Regulatory domain change
 * initiator=1
 * type=0
 * alpha2=CA
wlan0: Event CHANNEL_LIST_CHANGED (28) received
Channel list updated - continue setup
nl80211_get_hw_feature_data: entered.
nl80211: Regulatory information - country=CA (DFS-FCC)
nl80211: 2402-2472 @ 40 MHz 30 mBm
nl80211: 5170-5250 @ 80 MHz 17 mBm
nl80211: 5250-5330 @ 80 MHz 24 mBm (DFS)
nl80211: 5490-5600 @ 80 MHz 24 mBm (DFS)
nl80211: 5650-5730 @ 80 MHz 24 mBm (DFS)
nl80211: 5735-5835 @ 80 MHz 30 mBm
nl80211: Added 802.11b mode based on 802.11g information
Allowed channel: mode=1 chan=1 freq=2412 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=2 freq=2417 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=3 freq=2422 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=4 freq=2427 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=5 freq=2432 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=6 freq=2437 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=7 freq=2442 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=8 freq=2447 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=9 freq=2452 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=10 freq=2457 MHz max_tx_power=30 dBm
Allowed channel: mode=1 chan=11 freq=2462 MHz max_tx_power=30 dBm
Allowed channel: mode=2 chan=36 freq=5180 MHz max_tx_power=17 dBm
Allowed channel: mode=2 chan=40 freq=5200 MHz max_tx_power=17 dBm
Allowed channel: mode=2 chan=44 freq=5220 MHz max_tx_power=17 dBm
Allowed channel: mode=2 chan=48 freq=5240 MHz max_tx_power=17 dBm
Allowed channel: mode=2 chan=149 freq=5745 MHz max_tx_power=30 dBm
Allowed channel: mode=2 chan=153 freq=5765 MHz max_tx_power=30 dBm
Allowed channel: mode=2 chan=157 freq=5785 MHz max_tx_power=30 dBm
Allowed channel: mode=2 chan=161 freq=5805 MHz max_tx_power=30 dBm
Allowed channel: mode=2 chan=165 freq=5825 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=1 freq=2412 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=2 freq=2417 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=3 freq=2422 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=4 freq=2427 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=5 freq=2432 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=6 freq=2437 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=7 freq=2442 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=8 freq=2447 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=9 freq=2452 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=10 freq=2457 MHz max_tx_power=30 dBm
Allowed channel: mode=0 chan=11 freq=2462 MHz max_tx_power=30 dBm
ACS: Automatic channel selection started, this may take a bit

On Fri, Mar 24, 2017 at 2:37 PM, Ryan Hsu <ryanhsu@qca.qualcomm.com> wrote:
> On 03/24/2017 05:13 AM, Chris Price wrote:
>
>> My hostapd version and config file are as follows.
>> # hostapd -v
>> hostapd v2.4
>> User space daemon for IEEE 802.11 AP management,
>> IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator
>> Copyright (c) 2002-2015, Jouni Malinen <j@w1.fi> and contributors
>
> You might want to get the latest v2.6|| - git clone git://w1.fi/srv/git/hostap.git
>
>> nl80211: Event message available
>> nl80211: Drv Event 36 (NL80211_CMD_REG_CHANGE) received for wlp2s0
>> nl80211: Regulatory domain change
>>  * initiator=1
>>  * type=0
>>  * alpha2=CA
>> wlp2s0: Event CHANNEL_LIST_CHANGED (28) received
>> Channel list updated - continue setup
>> nl80211: Regulatory information - country=CA (DFS-FCC)
>> nl80211: 2402-2472 @ 40 MHz 30 mBm
>> nl80211: 5170-5250 @ 80 MHz 17 mBm
>> nl80211: 5250-5330 @ 80 MHz 24 mBm (DFS)
>> nl80211: 5490-5600 @ 80 MHz 24 mBm (DFS)
>> nl80211: 5650-5730 @ 80 MHz 24 mBm (DFS)
>> nl80211: 5735-5835 @ 80 MHz 30 mBm
>> nl80211: Added 802.11b mode based on 802.11g information
>> Allowed channel: mode=1 chan=1 freq=2412 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=2 freq=2417 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=3 freq=2422 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=4 freq=2427 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=5 freq=2432 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=6 freq=2437 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=7 freq=2442 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=8 freq=2447 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=9 freq=2452 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=10 freq=2457 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=11 freq=2462 MHz max_tx_power=30 dBm
>> Allowed channel: mode=0 chan=1 freq=2412 MHz max_tx_power=30 dBm
>> Allowed channel: mode=0 chan=2 freq=2417 MHz max_tx_power=30 dBm
>> Allowed channel: mode=0 chan=3 freq=2422 MHz max_tx_power=30 dBm
>> Allowed channel: mode=0 chan=4 freq=2427 MHz max_tx_power=30 dBm
>> Allowed channel: mode=0 chan=5 freq=2432 MHz max_tx_power=30 dBm
>> Allowed channel: mode=0 chan=6 freq=2437 MHz max_tx_power=30 dBm
>> Allowed channel: mode=0 chan=7 freq=2442 MHz max_tx_power=30 dBm
>> Allowed channel: mode=0 chan=8 freq=2447 MHz max_tx_power=30 dBm
>> Allowed channel: mode=0 chan=9 freq=2452 MHz max_tx_power=30 dBm
>> Allowed channel: mode=0 chan=10 freq=2457 MHz max_tx_power=30 dBm
>> Allowed channel: mode=0 chan=11 freq=2462 MHz max_tx_power=30 dBm
>
> I guess the initial run of changing the regulatory and the available channel list cause the issue.
> Since the 5G channel list is not in the allowed channel list here...
>
>> ACS: Automatic channel selection started, this may take a bit
>> ACS: Scanning 1 / 5
>> wlp2s0: nl80211: scan request
>> Scan requested (ret=0) - scan timeout 10 seconds
>> wlp2s0: interface state COUNTRY_UPDATE->ACS
>> wlp2s0: ACS-STARTED
> [snipped]
>
>> nl80211: Drv Event 34 (NL80211_CMD_NEW_SCAN_RESULTS) received for wlp2s0
>> wlp2s0: nl80211: New scan results available
>> nl80211: Scan included frequencies: 2412 2417 2422 2427 2432 2437 2442
>> 2447 2452 2457 2462 5180 5200 5220 5240 5260 5280 5300 5320 5500 5520
>> 5540 5560 5580 5660 5680 5700 5720 5745 5765 5785 5805 5825
>> wlp2s0: Event SCAN_RESULTS (3) received
>
> Then you can see you do have the scan results, but I guess your configuring the hw_mode=a?
> so that the ACS is trying to pick up the channel from 5G only.
>
>> ACS: Using survey based algorithm (acs_num_scans=5)
>> nl80211: Fetch survey data
>> nl80211: Freq survey dump event (freq=2412 MHz noise=-99
>> channel_time=149 busy_time=38 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=2417 MHz noise=-100
>> channel_time=149 busy_time=29 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=2422 MHz noise=-101
>> channel_time=149 busy_time=29 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=2427 MHz noise=-102
>> channel_time=149 busy_time=48 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=2432 MHz noise=-103
>> channel_time=149 busy_time=47 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=2437 MHz noise=-105
>> channel_time=149 busy_time=28 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=2442 MHz noise=-105
>> channel_time=149 busy_time=31 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=2447 MHz noise=-105
>> channel_time=149 busy_time=65 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=2452 MHz noise=-106
>> channel_time=149 busy_time=4 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=2457 MHz noise=-106
>> channel_time=149 busy_time=25 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=2462 MHz noise=-106
>> channel_time=149 busy_time=79 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5180 MHz noise=-99
>> channel_time=149 busy_time=1 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5200 MHz noise=-43
>> channel_time=149 busy_time=94 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5220 MHz noise=-99
>> channel_time=149 busy_time=2 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5240 MHz noise=-99
>> channel_time=149 busy_time=3 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5260 MHz noise=-99
>> channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5280 MHz noise=-99
>> channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5300 MHz noise=-98
>> channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5320 MHz noise=-97
>> channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5500 MHz noise=-43
>> channel_time=149 busy_time=84 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5520 MHz noise=-96
>> channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5540 MHz noise=-96
>> channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5560 MHz noise=-97
>> channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5580 MHz noise=-97
>> channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5660 MHz noise=-97
>> channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5680 MHz noise=-97
>> channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5700 MHz noise=-97
>> channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5720 MHz noise=-97
>> channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5745 MHz noise=-97
>> channel_time=149 busy_time=24 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5765 MHz noise=-43
>> channel_time=149 busy_time=107 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5785 MHz noise=-95
>> channel_time=149 busy_time=13 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5805 MHz noise=-97
>> channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
>> nl80211: Freq survey dump event (freq=5825 MHz noise=-96
>> channel_time=149 busy_time=0 tx_time=0 rx_time=0 filled=0007)
>> wlp2s0: Event SURVEY (46) received
>> ACS: Trying survey-based ACS
>
> Then while the hostapd_event_get_survey() to parse the scan result.
> due to the channel is not allowed... so that all those channels are not captured.
>
> 1029         dl_list_for_each_safe(survey, tmp, &survey_results->survey_list,
> 1030                               struct freq_survey, list) {
> 1031                 chan = hostapd_get_mode_channel(iface, survey->freq);
> 1032                 if (!chan)
> 1033                         continue;
> 1034                 if (chan->flag & HOSTAPD_CHAN_DISABLED)
> 1035                         continue;
> 1036
> 1037                 dl_list_del(&survey->list);
> 1038                 dl_list_add_tail(&chan->survey_list, &survey->list);
> 1039
> 1040                 hostapd_update_nf(iface, chan, survey);
> 1041
> 1042                 iface->chans_surveyed++;
> 1043         }
>
>> ACS: Unable to collect survey data
>> ACS: All study options have failed
>
> Then this causes the first attempt failed due to the empty iface->chans_surveyed.
>
>> The next (and subsequent) attempts are always successful, as far as I can tell.
>> # hostapd -dd /etc/hostapd/hostapd1.conf
>> random: Trying to read entropy from /dev/random
>> Configuration file: /etc/hostapd/hostapd1.conf
>> rfkill: initial event: idx=0 type=2 op=0 soft=0 hard=0
>> rfkill: initial event: idx=5 type=1 op=0 soft=0 hard=0
>> nl80211: TDLS supported
>> nl80211: TDLS external setup
>> nl80211: Supported cipher 00-0f-ac:1
>> nl80211: Supported cipher 00-0f-ac:5
>> nl80211: Supported cipher 00-0f-ac:2
>> nl80211: Supported cipher 00-0f-ac:4
>> nl80211: Supported cipher 00-0f-ac:6
>> nl80211: Supports Probe Response offload in AP mode
>> nl80211: Using driver-based off-channel TX
>> nl80211: Use separate P2P group interface (driver advertised support)
>> nl80211: Enable multi-channel concurrent (driver advertised support)
>> nl80211: use P2P_DEVICE support
>> nl80211: interface wlp2s0 in phy phy0
>> nl80211: Set mode ifindex 8 iftype 3 (AP)
>> nl80211: Setup AP(wlp2s0) - device_ap_sme=0 use_monitor=0
>> nl80211: Subscribe to mgmt frames with AP handle 0x558bef681100
>> nl80211: Register frame type=0xb0 (WLAN_FC_STYPE_AUTH)
>> nl_handle=0x558bef681100 match=
>> nl80211: Register frame type=0x0 (WLAN_FC_STYPE_ASSOC_REQ)
>> nl_handle=0x558bef681100 match=
>> nl80211: Register frame type=0x20 (WLAN_FC_STYPE_REASSOC_REQ)
>> nl_handle=0x558bef681100 match=
>> nl80211: Register frame type=0xa0 (WLAN_FC_STYPE_DISASSOC)
>> nl_handle=0x558bef681100 match=
>> nl80211: Register frame type=0xc0 (WLAN_FC_STYPE_DEAUTH)
>> nl_handle=0x558bef681100 match=
>> nl80211: Register frame type=0xd0 (WLAN_FC_STYPE_ACTION)
>> nl_handle=0x558bef681100 match=
>> nl80211: Register frame type=0x40 (WLAN_FC_STYPE_PROBE_REQ)
>> nl_handle=0x558bef681100 match=
>> nl80211: Add own interface ifindex 8
>> nl80211: if_indices[16]: 8
>> phy: phy0
>> BSS count 1, BSSID mask 00:00:00:00:00:00 (0 bits)
>> wlp2s0: interface state UNINITIALIZED->COUNTRY_UPDATE
>> Previous country code CA, new country code CA
>> nl80211: Regulatory information - country=CA (DFS-FCC)
>> nl80211: 2402-2472 @ 40 MHz 30 mBm
>> nl80211: 5170-5250 @ 80 MHz 17 mBm
>> nl80211: 5250-5330 @ 80 MHz 24 mBm (DFS)
>> nl80211: 5490-5600 @ 80 MHz 24 mBm (DFS)
>> nl80211: 5650-5730 @ 80 MHz 24 mBm (DFS)
>> nl80211: 5735-5835 @ 80 MHz 30 mBm
>> nl80211: Added 802.11b mode based on 802.11g information
>> Allowed channel: mode=1 chan=1 freq=2412 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=2 freq=2417 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=3 freq=2422 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=4 freq=2427 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=5 freq=2432 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=6 freq=2437 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=7 freq=2442 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=8 freq=2447 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=9 freq=2452 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=10 freq=2457 MHz max_tx_power=30 dBm
>> Allowed channel: mode=1 chan=11 freq=2462 MHz max_tx_power=30 dBm
>> Allowed channel: mode=2 chan=36 freq=5180 MHz max_tx_power=17 dBm
>> Allowed channel: mode=2 chan=40 freq=5200 MHz max_tx_power=17 dBm
>> Allowed channel: mode=2 chan=44 freq=5220 MHz max_tx_power=17 dBm
>> Allowed channel: mode=2 chan=48 freq=5240 MHz max_tx_power=17 dBm
>> Allowed channel: mode=2 chan=149 freq=5745 MHz max_tx_power=30 dBm
>> Allowed channel: mode=2 chan=157 freq=5785 MHz max_tx_power=30 dBm
>
> In this 2nd attempt here, you can see the 5G channel list.
>
> [snipped]
>
>> wlp2s0: Event SURVEY (46) received
>> ACS: Trying survey-based ACS
>> ACS: Survey analysis for channel 36 (5180 MHz)
>
> The scan result is not empy this time and with those channel, so that ch36 is picked.
>
> I am actually not sure if this is some bug that has been fixed in the latest v2.6. Or maybe is still valid.
> Would you mind help to dump the iw reg get again at the first attempt before you starting the hostapd?
>
> And also tried with the latest v2.6 hostapd to see if you could see the same issue?
>
> Ryan
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
