Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wkvtj-0000km-1c
 for ath10k@lists.infradead.org; Thu, 15 May 2014 13:41:14 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Thu, 15 May 2014 15:36:50 +0200
Subject: RE : RE : RE : ath10k: set channel by command "iw" not from hostapd
 and DFS support of firmware-2.bin_10.1.467.2-1
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F109978CF@srvexch01.SODIELEC.local>
References: <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>
 <5373382C.1030709@elisanet.fi>
 <EE97821C81277E459BEA5C6384C6F241012F109978C9@srvexch01.SODIELEC.local>
 <DUB122-W4070B8F41A0F8A25061141CB360@phx.gbl>
 <EE97821C81277E459BEA5C6384C6F241012F109978CE@srvexch01.SODIELEC.local>,
 <CALhHN=pGozL43B+qiJ20it3QCkvKkOL_RynfvUod_Ert8v1+3Q@mail.gmail.com>
In-Reply-To: <CALhHN=pGozL43B+qiJ20it3QCkvKkOL_RynfvUod_Ert8v1+3Q@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Matti Laakso <malaakso@elisanet.fi>

>Nope, CAC time is not required to start CAC (in case cac == 0 kernel
>will use default value 60s).
>What error you have EBUSY or EINVAL?
>What system (PC kernel, wireless ...) configuration?

Sorry I don't know how to detect if the error is EBUSY or EINVAL, Can you give me a more detail please? :D . I just get this debug message:

wlan0: interface state COUNTRY_UPDATE->DFS                                     
wlan0: DFS-CAC-START freq=5260 chan=52 sec_chan=0                              
wlan0: Unable to setup interface.  
ADDRCONF(NETDEV_UP): wlan0: link is not ready    

My PC kernel is 3.2.36 (provided from Marvell for Marvell ARMADA 370 chipset). I built ath10k from backport v-3.15 and using folder driver/net/wireless/ath from the master branch of ath10k. 
Here is the configuration in my hostapd.conf:

interface=wlan0
driver=nl80211
bridge=br0
country_code=FR
ieee80211d=1
ieee80211h=1
hw_mode=a
ieee80211n=1
ht_capab=[HT40+][SHORT-GI-20][SHORT-GI-40][SMPS-STATIC][TX-STBC][RX-STBC1][MAX-AMSDU-7935][DSSS_CCK-40]
channel=52
rts_threshold=2347
beacon_int=100
wmm_enabled=1

NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
