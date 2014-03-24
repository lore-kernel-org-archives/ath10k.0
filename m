Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSAcw-0001EJ-L9
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 19:33:44 +0000
Received: by mail-la0-f48.google.com with SMTP id gf5so3975201lab.21
 for <ath10k@lists.infradead.org>; Mon, 24 Mar 2014 12:33:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53307524.8070501@candelatech.com>
References: <53307524.8070501@candelatech.com>
Date: Mon, 24 Mar 2014 20:33:18 +0100
Message-ID: <CALhHN=oNjWr+xP=5A_NEnUn1Hc-ht8N4LJ6CU836Q99LrdcAdA@mail.gmail.com>
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

On 24 March 2014 19:10, Ben Greear <greearb@candelatech.com> wrote:
> I notice this issue while trying to scan specific channels with
> an ath10k NIC.
>
> If I configure supplicant to use a specific freq list, it will fail:
>
> 1395683887.458813: nl80211: Scan frequency 5170 MHz
> 1395683887.458823: nl80211: Scan frequency 5180 MHz
> 1395683887.458829: nl80211: Scan frequency 5190 MHz
> 1395683887.458834: nl80211: Scan frequency 5200 MHz
> 1395683887.458840: nl80211: Scan frequency 5210 MHz
> 1395683887.458845: nl80211: Scan frequency 5220 MHz
> 1395683887.458850: nl80211: Scan frequency 5230 MHz
> 1395683887.458855: nl80211: Scan frequency 5240 MHz
> 1395683887.458861: nl80211: Scan frequency 5260 MHz
> 1395683887.458866: nl80211: Scan frequency 5280 MHz
> 1395683887.458871: nl80211: Scan frequency 5300 MHz
> 1395683887.458876: nl80211: Scan frequency 5320 MHz
> 1395683887.458881: nl80211: Scan frequency 5500 MHz
> 1395683887.458886: nl80211: Scan frequency 5520 MHz
> 1395683887.458890: nl80211: Scan frequency 5540 MHz
> 1395683887.458895: nl80211: Scan frequency 5560 MHz
> 1395683887.458900: nl80211: Scan frequency 5580 MHz
> 1395683887.458905: nl80211: Scan frequency 5600 MHz
> 1395683887.458911: nl80211: Scan frequency 5580 MHz
> 1395683887.458916: nl80211: Scan frequency 5600 MHz
> 1395683887.458921: nl80211: Scan frequency 5620 MHz
> 1395683887.458926: nl80211: Scan frequency 5640 MHz
> 1395683887.458931: nl80211: Scan frequency 5660 MHz
> 1395683887.458936: nl80211: Scan frequency 5620 MHz
> 1395683887.458942: nl80211: Scan frequency 5640 MHz
> 1395683887.458947: nl80211: Scan frequency 5660 MHz
> 1395683887.458952: nl80211: Scan frequency 5680 MHz
> 1395683887.458957: nl80211: Scan frequency 5700 MHz
> 1395683887.458962: nl80211: Scan frequency 5745 MHz
> 1395683887.458987: nl80211: Scan frequency 5645 MHz
> 1395683887.458996: nl80211: Scan frequency 5785 MHz
> 1395683887.459001: nl80211: Scan frequency 5805 MHz
> 1395683887.459005: nl80211: Scan frequency 5825 MHz
> 1395683887.459040: nl80211: Scan trigger failed: ret=-22 (Invalid argument)
>
>
> A standard scan seems to use only a subset of these channels.
> But, wouldn't that make us miss scanning for some /a or /n APs
> out there?
>
> [root@ct521-FCFC ~]# iw event
> wlan0 (phy #1): scan started
> wlan0 (phy #1): scan finished: 2412 2417 2422 2427 2432 2437 2442 2447 2452 2457 2462 5180 5200 5220 5240 5260 5280 5300 5320 5745 5765 5785 5805 5825, ""
>
>
> Any idea if this is a bug in my config/assumptions, ath10k, or supplicant?
>
Strange, works quite good from iw:

janusz@dell:~$ sudo iw wlan1 scan freq 5180 5200 5220 5240 5260 5280
5300 5320 5745 5765 5785 5805 5825|grep freq
janusz@dell:~$ sudo iw wlan1 scan freq 2412 2417 2422 2427 2432 2437
2442 2447 2452 2457 2462 5180 5200 5220 5240 5260 5280 5300 5320 5745
5765 5785 5805 5825|grep freq
    freq: 2437
    freq: 2427
    freq: 2432
    freq: 2452
    freq: 2442
janusz@dell:~$

Last hostap with config:
network={
    ssid="linksys"
    psk="somepsk"
    key_mgmt=WPA-PSK
    disabled=1
    scan_freq=2412 2417 2422 2427 2432 2437 2442 2447 2452 2457 2462
5180 5200 5220 5240 5260 5280 5300 5
320 5745 5765 5785 5805 5825
}

After enable_n 4:

1395688797.243510: nl80211 Scan frequency 2412 MHz
1395688797.243522: nl80211: Scan frequency 2417 MHz
1395688797.243530: nl80211: Scan frequency 2422 MHz
1395688797.243537: nl80211: Scan frequency 2427 MHz
1395688797.243545: nl80211: Scan frequency 2432 MHz
1395688797.243552: nl80211: Scan frequency 2437 MHz
1395688797.243559: nl80211: Scan frequency 2442 MHz
1395688797.243566: nl80211: Scan frequency 2447 MHz
1395688797.243574: nl80211: Scan frequency 2452 MHz
1395688797.243581: nl80211: Scan frequency 2457 MHz
1395688797.243588: nl80211: Scan frequency 2462 MHz
1395688797.243596: nl80211: Scan frequency 5180 MHz
1395688797.243603: nl80211: Scan frequency 5200 MHz
1395688797.243610: nl80211: Scan frequency 5220 MHz
1395688797.243618: nl80211: Scan frequency 5240 MHz
1395688797.243625: nl80211: Scan frequency 5260 MHz
1395688797.243632: nl80211: Scan frequency 5280 MHz
1395688797.243639: nl80211: Scan frequency 5300 MHz
1395688797.243647: nl80211: Scan frequency 5320 MHz
1395688797.243654: nl80211: Scan frequency 5745 MHz
1395688797.243661: nl80211: Scan frequency 5765 MHz
1395688797.243669: nl80211: Scan frequency 5785 MHz
1395688797.243676: nl80211: Scan frequency 5805 MHz
1395688797.243683: nl80211: Scan frequency 5825 MHz
1395688797.243926: Scan requested (ret=0) - scan timeout 30 seconds

1395688797.244349: wlan0: CTRL-EVENT-SCAN-STARTED
1395688798.595940: nl80211: Scan included frequencies: 2412 2417 2422
2427 2432 2437 2442 2447 2452 2457 2462 5180 5200 5220 5240 5260 5280
5300 5320
1395688798.595993: wlan0: Event SCAN_RESULTS (3) received

CTRL-EVENT-CONNECTED - Connection to 00:14:bf:16:b8:44 completed [id=4 id_str=]


BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
