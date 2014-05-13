Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkCWa-0005sD-S2
 for ath10k@lists.infradead.org; Tue, 13 May 2014 13:13:49 +0000
Received: (from uucp@localhost) by mailhost.actiasodielec.fr id s4DDBPcd007434
 for <ath10k@lists.infradead.org>; Tue, 13 May 2014 15:11:25 +0200
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Tue, 13 May 2014 15:08:38 +0200
Subject: ath10k: set channel by command "iw" not from hostapd and DFS
 support of firmware-2.bin_10.1.467.2-1
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBC@srvexch01.SODIELEC.local>
 <5370F41A.70202@candelatech.com>
 <CAHqTa-1xYF=eO-Ai5UMF4BuzzLa84SrzayiGZVmt0jaGs5sZDQ@mail.gmail.com>,
 <53719332.9040700@candelatech.com>
In-Reply-To: <53719332.9040700@candelatech.com>
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
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>

I am able to run mode access point by using ath10k and hostapd, but I have to set the channel in the configuration file for hostapd (I desactivated ACS when building hostapd)
If I set channel by the command "iw wlan0 set channel 10 HT20"  and remove the line "channel=10" from the configuration file of hostapd, this error appears when I run hostapd: 

ACS was disabled on your build, rebuild hostapd with CONFIG_ACS=y or set channel    
wlan0: IEEE 802.11 Configured channel (0) not found from the channel list of current mode (1) IEEE 802.11g
wlan0: IEEE 802.11 Hardware does not support configured channel
Could not select hw_mode and channel. (-3)
wlan0: Unable to setup interface.
hostapd_free_hapd_data: Interface wlan0 wasn't started

Does it mean that ath10k does not support configured channel ???? The reason I want to do it by command "iw" because it has more options than hostapd (iw wlan0 set freq <control freq> [20|40|80|80+80|160] [<center freq 1>] [<center freq 2>] )

I had another problem with setting a cannal that employs DFS (for example 52): 

wlan0: interface state COUNTRY_UPDATE->DFS                                      
wlan0: DFS-CAC-START freq=5260 chan=52 sec_chan=0                               
wlan0: Unable to setup interface.   
ADDRCONF(NETDEV_UP): wlan0: link is not ready    

I'm using the firmware-2.bin_10.1.467.2-1 which indicates that supports DFS on the website of ath10k. Is there anyone got the same issue like me?
Thanks in advance,

NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
