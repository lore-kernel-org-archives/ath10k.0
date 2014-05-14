Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from vs15.mail.saunalahti.fi ([62.142.117.202])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkVYg-00034u-6h
 for ath10k@lists.infradead.org; Wed, 14 May 2014 09:33:07 +0000
Received: from vams (localhost [127.0.0.1])
 by vs15.mail.saunalahti.fi (Postfix) with SMTP id 3FC5B400B2
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 12:32:39 +0300 (EEST)
Received: from gw01.mail.saunalahti.fi (gw01.mail.saunalahti.fi
 [195.197.172.115])
 by vs15.mail.saunalahti.fi (Postfix) with ESMTP id 1DC074005F
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 12:32:39 +0300 (EEST)
Received: from [134.61.10.67] (nbtad04.physik.rwth-aachen.de [134.61.10.67])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by gw01.mail.saunalahti.fi (Postfix) with ESMTPSA id 06F18400BB
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 12:32:37 +0300 (EEST)
Message-ID: <5373382C.1030709@elisanet.fi>
Date: Wed, 14 May 2014 11:32:28 +0200
From: Matti Laakso <malaakso@elisanet.fi>
MIME-Version: 1.0
Subject: Re: ath10k: set channel by command "iw" not from hostapd and DFS
 support of firmware-2.bin_10.1.467.2-1
References: <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>
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
To: ath10k@lists.infradead.org

> I am able to run mode access point by using ath10k and hostapd, but I have to set the channel in the configuration file for hostapd (I desactivated ACS when building hostapd)
> If I set channel by the command "iw wlan0 set channel 10 HT20"  and remove the line "channel=10" from the configuration file of hostapd, this error appears when I run hostapd: 
>
> ACS was disabled on your build, rebuild hostapd with CONFIG_ACS=y or set channel    
> wlan0: IEEE 802.11 Configured channel (0) not found from the channel list of current mode (1) IEEE 802.11g
> wlan0: IEEE 802.11 Hardware does not support configured channel
> Could not select hw_mode and channel. (-3)
> wlan0: Unable to setup interface.
> hostapd_free_hapd_data: Interface wlan0 wasn't started
>
> Does it mean that ath10k does not support configured channel ???? The reason I want to do it by command "iw" because it has more options than hostapd (iw wlan0 set freq <control freq> [20|40|80|80+80|160] [<center freq 1>] [<center freq 2>] )

Removing the channel from hostapd.conf implies channel=0. And it
obviously is not a valid channel when ACS is disabled. All the options
that iw has can be set in hostapd.conf as well.

> I had another problem with setting a cannal that employs DFS (for example 52): 
>
> wlan0: interface state COUNTRY_UPDATE->DFS                                      
> wlan0: DFS-CAC-START freq=5260 chan=52 sec_chan=0                               
> wlan0: Unable to setup interface.   
> ADDRCONF(NETDEV_UP): wlan0: link is not ready    
>
> I'm using the firmware-2.bin_10.1.467.2-1 which indicates that supports DFS on the website of ath10k. Is there anyone got the same issue like me?
>

Did you build ath10k with ATH10K_DFS_CERTIFIED enabled?

Matti

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
