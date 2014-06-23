Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wz0Af-00049L-99
 for ath10k@lists.infradead.org; Mon, 23 Jun 2014 09:04:14 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Mon, 23 Jun 2014 11:03:30 +0200
Subject: Warning message in bridge mode
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F10997914@srvexch01.SODIELEC.local>
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <538E9D26.4040009@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FB@srvexch01.SODIELEC .local>,
 <538F9255.1060101@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FF@srvexch01.SODIELEC.local>,
 <5390A9CC.7060400@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997900@srvexch01.SODIELEC.local>,
 <5391E363.50907@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997902@srvexch01.SODIELEC.local>,
 <53972984.8020303@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997906@srvexch01.SODIELEC.local>,
 <53988C53.6030806@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997908@srvexch01.SODIELEC.local>,
 <539A0C06.6050105@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F1099790A@srvexch01.SODIELEC.local>,
 <539B2F21.3020609@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F1099790B@srvexch01.SODIELEC.local>,
 <539F0393.1090009@candelatech.com>,
 <EE97821C81277E459BEA5C6384C6F241012F1099790D@srvexch01.SODIELEC.local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F1099790D@srvexch01.SODIELEC.local>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "greearb@candelatech.com" <greearb@candelatech.com>

I get this warning message when doing my test with iperf in my AP:
br0: received packet on wlan0.sta1 with own address as source address

My STA is set up in bridge network (promiscuous mode) and using the firmware of CT.
http://www.candelatech.com/downloads/firmware-2-ct-community-6.bin
When my STA is associated successfully with my AP, the interface "wlan0.sta1" is created
in my AP. And I have this config:
br0              Link encap:Ethernet  HWaddr 04:F0:21:0E:38:C6  
eth0            Link encap:Ethernet  HWaddr 00:10:02:0F:C5:05
wlan0          Link encap:Ethernet  HWaddr 04:F0:21:0E:38:C6
wlan0.sta1  Link encap:Ethernet  HWaddr 04:F0:21:0E:38:C6 

I think that the warning message is because my interface br0 and wlan0.sta1 have the same
mac address. And it decrease the performance of the rate (I get higher rate with iperf when my 
STA is set up in router network (not enter promiscuous mode). I can not do the test with the
official firmware cause it crashed in promiscuous mode.
So I wonder that if anyone get the same issue like me?

Thanks,
NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE



I can use it for my STA in promiscuous mode and connect to my AP on channels DFS,
Sometimes I get this message "wlan0: received packet with  own address as source address".
I'm not sure that it is your firmware issue or because of my network configuration.
I'll try to figure it out and report to you if it relates to your firmware.

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

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
