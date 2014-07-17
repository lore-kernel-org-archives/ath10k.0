Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7khq-0005Ax-Vt
 for ath10k@lists.infradead.org; Thu, 17 Jul 2014 12:22:40 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Thu, 17 Jul 2014 14:22:06 +0200
Subject: RE : Trouble shooting low rate MCS9 in 802.11ac
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F15C1D7EC@srvexch01.SODIELEC.local>
References: <30258C2D-7A80-42C1-8AE7-713C490ABF05@st-andrews.ac.uk>
 <53C6A1C7.5060004@intec.ugent.be>
 <CA+BoTQ==9HQrPxp3qZGwEm_a3wQY_wMW5ckrbSRu+MkxU1HRgw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EB@srvexch01.SODIELEC.local>,
 <CACKGw+HM-VYpotQGcTsanebvfU-4iGocOpbbGak7iUDb7sUURA@mail.gmail.com>
In-Reply-To: <CACKGw+HM-VYpotQGcTsanebvfU-4iGocOpbbGak7iUDb7sUURA@mail.gmail.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>Did you use cables or measured OTA?

My system is like this: 
PC1 - Device 1 (AP) <= Wifi => Device 2 (STA) - PC2
Each PC connects to the device by a Gigabit Ethernet  cable. 


>What platform it is? 
My platform is a PC built with an ARMv7 1.2GHz. 

> Did you use hostapd? Is it AP mode (bridge)?
I'm using hostapd for AP and wpa_supplicant for STA. AP is in mode bridge 
but STA isn't (the official firmware crashed in bridge mode, I can set up bridged STA 
using the firmware of Candelatech but the rate is slower a little bit when I do iperf test.

>(You did not provide basically any details on what exacly you've measured).
Sorry, please feel free to ask me more details.
I obtained that result table  when I did iperf test in TCP, option -w256K and 10 streams (-P10)
If I did the test in UDP, with the same bandwidth (option -b),  I lost more packets 
in MCS 8 and 9 compared to MCS7, which also means that MCS7 has better performance.


>In open AP mode (bridge), CUS223 HW (not WLE900VX however) and on
>AP135 platform (customized openwrt SW + bleeding edge of
>ath10k/wireless subsystem souces - private backports tarball).. for
>UDP (last time I measured) I have around 820Mpbs for UCP both ways and
>720Mbps TCP.

This is in NSS3 -MCS9? Did you get better or worse rate if you clear the mask
(iw wlanX set bitrates) cause if I don't config rate, from AP to STA I have the best rate
(ie same as MCS7) but from STA to AP my rate is much lower than MCS7 (240 Mbps 
vs 370 Mbps in TCP).

NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
