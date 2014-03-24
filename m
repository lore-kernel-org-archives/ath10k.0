Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x229.google.com ([2a00:1450:4010:c04::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSB8r-0002J9-Qn
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 20:06:42 +0000
Received: by mail-lb0-f169.google.com with SMTP id q8so4140420lbi.0
 for <ath10k@lists.infradead.org>; Mon, 24 Mar 2014 13:06:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53308BD4.8060605@candelatech.com>
References: <53307524.8070501@candelatech.com>
 <CALhHN=oNjWr+xP=5A_NEnUn1Hc-ht8N4LJ6CU836Q99LrdcAdA@mail.gmail.com>
 <53308BD4.8060605@candelatech.com>
Date: Mon, 24 Mar 2014 21:06:17 +0100
Message-ID: <CALhHN=p2J=kTnzPWq4BUUJv8oGoP43OREZcO2ndMt-Fyh+w1bw@mail.gmail.com>
Subject: Re: Scanning all 5Ghz channels with AC NIC.
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: "hostap@lists.shmoo.com" <hostap@lists.shmoo.com>, ath10k <ath10k@lists.infradead.org>

On 24 March 2014 20:47, Ben Greear <greearb@candelatech.com> wrote:
> On 03/24/2014 12:33 PM, Janusz Dziedzic wrote:
>> On 24 March 2014 19:10, Ben Greear <greearb@candelatech.com> wrote:
>>> I notice this issue while trying to scan specific channels with
>>> an ath10k NIC.
>>>
>>> If I configure supplicant to use a specific freq list, it will fail:
>>>
>>> 1395683887.458813: nl80211: Scan frequency 5170 MHz
>>> 1395683887.458823: nl80211: Scan frequency 5180 MHz
>>> 1395683887.458829: nl80211: Scan frequency 5190 MHz
>>> 1395683887.458834: nl80211: Scan frequency 5200 MHz
>>> 1395683887.458840: nl80211: Scan frequency 5210 MHz
>>> 1395683887.458845: nl80211: Scan frequency 5220 MHz
>>> 1395683887.458850: nl80211: Scan frequency 5230 MHz
>>> 1395683887.458855: nl80211: Scan frequency 5240 MHz
>>> 1395683887.458861: nl80211: Scan frequency 5260 MHz
>>> 1395683887.458866: nl80211: Scan frequency 5280 MHz
>>> 1395683887.458871: nl80211: Scan frequency 5300 MHz
>>> 1395683887.458876: nl80211: Scan frequency 5320 MHz
>>> 1395683887.458881: nl80211: Scan frequency 5500 MHz
>>> 1395683887.458886: nl80211: Scan frequency 5520 MHz
>>> 1395683887.458890: nl80211: Scan frequency 5540 MHz
>>> 1395683887.458895: nl80211: Scan frequency 5560 MHz
>>> 1395683887.458900: nl80211: Scan frequency 5580 MHz
>>> 1395683887.458905: nl80211: Scan frequency 5600 MHz
>>> 1395683887.458911: nl80211: Scan frequency 5580 MHz
>>> 1395683887.458916: nl80211: Scan frequency 5600 MHz
>>> 1395683887.458921: nl80211: Scan frequency 5620 MHz
>>> 1395683887.458926: nl80211: Scan frequency 5640 MHz
>>> 1395683887.458931: nl80211: Scan frequency 5660 MHz
>>> 1395683887.458936: nl80211: Scan frequency 5620 MHz
>>> 1395683887.458942: nl80211: Scan frequency 5640 MHz
>>> 1395683887.458947: nl80211: Scan frequency 5660 MHz
>>> 1395683887.458952: nl80211: Scan frequency 5680 MHz
>>> 1395683887.458957: nl80211: Scan frequency 5700 MHz
>>> 1395683887.458962: nl80211: Scan frequency 5745 MHz
>>> 1395683887.458987: nl80211: Scan frequency 5645 MHz
>>> 1395683887.458996: nl80211: Scan frequency 5785 MHz
>>> 1395683887.459001: nl80211: Scan frequency 5805 MHz
>>> 1395683887.459005: nl80211: Scan frequency 5825 MHz
>>> 1395683887.459040: nl80211: Scan trigger failed: ret=-22 (Invalid argument)
>>>
>>>
>>> A standard scan seems to use only a subset of these channels.
>>> But, wouldn't that make us miss scanning for some /a or /n APs
>>> out there?
>>>
>>> [root@ct521-FCFC ~]# iw event
>>> wlan0 (phy #1): scan started
>>> wlan0 (phy #1): scan finished: 2412 2417 2422 2427 2432 2437 2442 2447 2452 2457 2462 5180 5200 5220 5240 5260 5280 5300 5320 5745 5765 5785 5805 5825, ""
>>>
>>>
>>> Any idea if this is a bug in my config/assumptions, ath10k, or supplicant?
>>>
>> Strange, works quite good from iw:
>>
>> janusz@dell:~$ sudo iw wlan1 scan freq 5180 5200 5220 5240 5260 5280
>> 5300 5320 5745 5765 5785 5805 5825|grep freq
>> janusz@dell:~$ sudo iw wlan1 scan freq 2412 2417 2422 2427 2432 2437
>> 2442 2447 2452 2457 2462 5180 5200 5220 5240 5260 5280 5300 5320 5745
>> 5765 5785 5805 5825|grep freq
>>     freq: 2437
>>     freq: 2427
>>     freq: 2432
>>     freq: 2452
>>     freq: 2442
>> janusz@dell:~$
>>
>> Last hostap with config:
>> network={
>>     ssid="linksys"
>>     psk="somepsk"
>>     key_mgmt=WPA-PSK
>>     disabled=1
>>     scan_freq=2412 2417 2422 2427 2432 2437 2442 2447 2452 2457 2462
>> 5180 5200 5220 5240 5260 5280 5300 5
>> 320 5745 5765 5785 5805 5825
>> }
>
> Maybe my config is wrong...I was using freq_list instead of scan_freq,
> and using it twice...
>
> ctrl_interface=/var/run/wpa_supplicant
> fast_reauth=1
> scan_cur_freq=1
> min_scan_gap=5
> freq_list=5170 5180 5190 5200 5210 5220 5230 5240 5260 5280 5300 5320 5500 5520 5540 5560 5580 5600 5580 5600 5620 5640 5660 5620 5640 5660 5680 5700 5745 5645
> 5785 5805 5825
>
> bss_max_count=2000
> network={
>     ssid="NETGEAR76-5G"
>     disable_ht=0
>     disable_vht=0
>     disable_ht40=0
>     disable_sgi=0
>     ht_mcs=""
>     disable_max_amsdu=-1
>     ampdu_factor=-1
>     ampdu_density=-1
>     freq_list=5170 5180 5190 5200 5210 5220 5230 5240 5260 5280 5300 5320 5500 5520 5540 5560 5580 5600 5580 5600 5620 5640 5660 5620 5640 5660 5680 5700 5745
> 5645 5785 5805 5825
>
>     key_mgmt=NONE
>     proactive_key_caching=0
>
> }
>
With such config also works fine:

ctrl_interface=/var/run/wpa_supplicant
update_config=1

freq_list=2412 2417 2422 2427 2432 2437 2442 2447 2452 2457 2462 5180
5200 5220 5240 5260 5280 5300 5320 5745
 5765 5785 5805 5825

network={
    ssid="linksys"
    psk="some psk"
    key_mgmt=WPA-PSK
    disabled=1
    freq_list=2412 2417 2422 2427 2432 2437 2442 2447 2452 2457 2462
5180 5200 5220 5240 5260 5280 5300 5
320 5745 5765 5785 5805 5825
}

1395691023.317204: nl80211: Scan frequency 5805 MHz
1395691023.317211: nl80211: Scan frequency 5825 MHz
1395691023.317489: Scan requested (ret=0) - scan timeout 30 seconds

1395691027.433376: wlan0: nl80211: New scan results available
1395691027.433429: nl80211: Scan probed for SSID ''
1395691027.433451: nl80211: Scan included frequencies: 2412 2417 2422
2427 2432 2437 2442 2447 2452 2457 2462 5180 5200 5220 5240 5260 5280
5300 5320 5745 5765 5785 5805 5825
1395691027.433502: wlan0: Event SCAN_RESULTS (3) received
1395691027.433589: wlan0: Scan completed in 4.115746 seconds

So maybe other options?
Does it works from iw?

>
>>
>> After enable_n 4:
>
> How are you enabling n?
>
From wpa_cli - 4 is my net_id I am testing - this enable network and
trigger scan.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
