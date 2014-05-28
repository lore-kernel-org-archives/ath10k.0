Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpZG9-0005Gy-92
 for ath10k@lists.infradead.org; Wed, 28 May 2014 08:30:54 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Wed, 28 May 2014 10:27:02 +0200
Subject: RE : New version of CT firmware is available.
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F109978F3@srvexch01.SODIELEC.local>
References: <5384E510.10109@candelatech.com>,
 <538522F2.1060803@candelatech.com>
In-Reply-To: <538522F2.1060803@candelatech.com>
Content-Language: fr-FR
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>

Hi, I just test your firmware (version non commercial). The firmware ver 10=
.1.467 crashed when I enter promiscuous mode to activate network birdge for=
 my station but I can install network bridge with your firmware now. But is=
 it normal if in my AP, I have another interface when my station connected: =

Interface wlan0.sta1                                                    =

                ifindex 10                                                 =
     =

                wdev 0x6                                                   =
     =

                addr 04:f0:21:0e:38:be                                     =
     =

                type AP/VLAN                                               =
     =

                channel 36 (5180 MHz), width: 40 MHz, center1: 5190 MHz
(I only have wlan0 and mon.wlan0 with other version of firmware, not yours)=
. The mon.wlan0 may be because that I'm still have old/wrong modules compil=
ation (as Janusz said, I'm still trying to fix it). And when I test the rat=
e with iperf, I get this in debug mess:

<7>ath10k: htc rx completion ep 1 skb d2c57200                             =
     =

<7>ath10k: htt tx free msdu_id 66                                          =
     =

<7>ath10k: htt tx flags0 37 flags1 24576 len 1538 id 68 frags_paddr 12c5db6=
8, ms
du_paddr 00ca984a vdev 0 tid 0                                             =
     =

<7>ath10k: pci tx item 1 paddr 0x00a5a84a len 52 n_items 2                 =
     =

<7>ath10k: htc rx completion ep 1 skb d2b5f180                             =
     =

net_ratelimit: 24613 callbacks suppressed                                  =
     =

br0: received packet on wlan0.sta1 with own address as source address      =
     =

br0: received packet on wlan0.sta1 with own address as source address      =
     =

br0: received packet on wlan0.sta1 with own address as source address      =
     =

br0: received packet on wlan0.sta1 with own address as source address

Here is my network config: (I used 2PC with iperf, 1 connect to my AP and o=
ther to my STA)
PC1 (connect to AP) with IP: 192.93.121.71, gate way: 192.93.121.62
AP with IP 192.93.121.63
STA with IP 192.93.121.62
PC2 (connect to STA) with IP 192.93.121.70, gate way: 192.93.121.63
And my rate (from iperf) is around 120Mbps though the info from the command=
 station dump and in the file "fw_stats" from debugfs show me MCS23 with 40=
5Mbps

NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE

________________________________________
De : ath10k [ath10k-bounces@lists.infradead.org] de la part de Ben Greear [=
greearb@candelatech.com]
Date d'envoi : mercredi 28 mai 2014 01:42
=C0 : ath10k
Objet : Re: New version of CT firmware is available.

On 05/27/2014 12:18 PM, Ben Greear wrote:
> Just a quick note:  Our firmware should now work on standard kernels with
> no kernel modifications.  Just drop the firmware into the appropriate dir=
ectory
> (and re-named firmware-2.bin), and reboot.
>
> I did a quick test on Ubuntu 14.04 with kernel 3.13.0-24-generic:  Associ=
ated
> a station on an AP on channel 36 and obtained DHCP.  Used open authentica=
tion.
>
> If you can crash this firmware or see any other bugs that could be firmwa=
re related,
> please send me the kernel firmware crash dump and/or bug report.
>
> Please do not bother QCA about issues with my firmware image.
>
> I am interested to know results if anyone tries this.
>
> You can ignore most of this page linked below if not dealing with
> multiple station vifs, but it has a link to the firmware image, etc:
>
> http://www.candelatech.com/vsta.php

And, as previously promised, there is now a 'community'
version that may be used commercially or otherwise, under
the same restrictions as that of the official QCA firmware.

The only difference is that the community version will not
allow multiple station vifs to connect to the same AP when
using encryption because it does not allow software-rx-crypt.
Multiple stations to same AP with open authentication works fine
if you are using our kernel patches or some proper subset thereof.

For normal use (single station, or single AP), both images should
act similar and should work on standard un-patched kernels.

See link above for more info...just see notes in bold at top, and
list item #3 for normal-use scenarios.

Thanks,
Ben


--
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
