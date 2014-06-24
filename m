Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzLLF-0007ka-Ov
 for ath10k@lists.infradead.org; Tue, 24 Jun 2014 07:40:34 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Tue, 24 Jun 2014 09:39:59 +0200
Subject: RE : Warning message in bridge mode
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F10997915@srvexch01.SODIELEC.local>
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FF@srvexch01.SODIELEC.local>
 <5390A9CC.7060400@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997900@srvexch01.SODIELEC.local>
 <5391E363.50907@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997902@srvexch01.SODIELEC.local>
 <53972984.8020303@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997906@srvexch01.SODIELEC.local>
 <53988C53.6030806@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997908@srvexch01.SODIELEC.local>
 <539A0C06.6050105@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F1099790A@srvexch01.SODIELEC.local>
 <539B2F21.3020609@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F1099790B@srvexch01.SODIELEC.local>
 <539F0393.1090009@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F1099790D@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F10997914@srvexch01.SODIELEC.local>
 <53A89D2E.6010708@candelatech.com>,
 <E37BEAE7-CCA9-4C79-9F24-051E867FC0F6@gmail.com>
In-Reply-To: <E37BEAE7-CCA9-4C79-9F24-051E867FC0F6@gmail.com>
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
To: Bruno Antunes <baantunes@gmail.com>, Ben Greear <greearb@candelatech.com>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>>> I get this warning message when doing my test with iperf in my AP:
>>> br0: received packet on wlan0.sta1 with own address as source address

>That message is common in other scenarios.
>I also have this messages when in layer 2 mesh ( batman-adv)

So I don't have to worry about this warning???

>>> My STA is set up in bridge network (promiscuous mode) and using the firmware of CT.
>>> http://www.candelatech.com/downloads/firmware-2-ct-community-6.bin
>>> When my STA is associated successfully with my AP, the interface "wlan0.sta1" is created
>>> in my AP. And I have this config:
>>> br0              Link encap:Ethernet  HWaddr 04:F0:21:0E:38:C6
>>> eth0            Link encap:Ethernet  HWaddr 00:10:02:0F:C5:05
>>> wlan0          Link encap:Ethernet  HWaddr 04:F0:21:0E:38:C6
>>> wlan0.sta1  Link encap:Ethernet     HWaddr 04:F0:21:0E:38:C6
>>>
>>> I think that the warning message is because my interface br0 and wlan0.sta1 have the same
>>> mac address. And it decrease the performance of the rate (I get higher rate with iperf when my
>>> STA is set up in router network (not enter promiscuous mode). I can not do the test with the
>>>official firmware cause it crashed in promiscuous mode.
>>> So I wonder that if anyone get the same issue like me?

>> Why do you have the same MAC for wlan0 and wlan0.sta1?  What are those interfaces
>> exactly?  It is normal for the bridge to have same MAC as one of the interfaces
>> it contains.
>I think he is using WDS mode.
>For each station connected to the AP a new sub interface is added: wlan0.sta1, wlan0.sta2 ...
>All sub interfaces share the MAC address.
>At least that's what happens with ath9k.

Yes I'm using WDS mode, set up from command "iw set 4addr on" and in my hostapd config I also have 
wds_sta=1. The sub interface is created only if my STA is set up is bridge network, if I use my STA as
a router there is no sub interface created, my STA associate with AP directly on interface wlan0.

>>> I can use it for my STA in promiscuous mode and connect to my AP on channels DFS,
>>> Sometimes I get this message "wlan0: received packet with  own address as source address".
>>> I'm not sure that it is your firmware issue or because of my network configuration.
>>> I'll try to figure it out and report to you if it relates to your firmware.

>> I doubt my firmware has any impact on this particular problem.
>Me too.

I was wrong, the only warning msg is "br0: received packet on wlan0.sta1 with own address as source address".
And I have another question: When doing test with iperf, I always have rate from AP to STA higher than STA to AP
(380Mbps vs 240 Mbps).This is normal too right? Cause before you told me that when you did the test with your 
own traffic generator, you can get 500+Mbps download, and about 400Mbps upload.

Thanks,
NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
