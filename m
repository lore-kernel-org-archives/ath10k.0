Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp3.ugent.be ([157.193.49.127])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHx1O-0007To-7M
 for ath10k@lists.infradead.org; Mon, 24 Feb 2014 15:00:43 +0000
Received: from localhost (mcheck2.ugent.be [157.193.49.249])
 by smtp3.ugent.be (Postfix) with ESMTP id 18706C3CA
 for <ath10k@lists.infradead.org>; Mon, 24 Feb 2014 15:59:46 +0100 (CET)
Received: from smtp3.ugent.be ([IPv6:::ffff:157.193.49.127])
 by localhost (mcheck2.UGent.be [::ffff:157.193.43.11]) (amavisd-new,
 port 10024)
 with ESMTP id LPofFk8OPq8C for <ath10k@lists.infradead.org>;
 Mon, 24 Feb 2014 15:59:40 +0100 (CET)
Received: from mail2.intec.ugent.be (mail2.intec.ugent.be [157.193.214.245])
 by smtp3.ugent.be (Postfix) with ESMTP id AA427C3C0
 for <ath10k@lists.infradead.org>; Mon, 24 Feb 2014 15:59:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail2.intec.ugent.be (Postfix) with ESMTP id A453C25
 for <ath10k@lists.infradead.org>; Mon, 24 Feb 2014 15:59:40 +0100 (CET)
Received: from mail2.intec.ugent.be ([127.0.0.1])
 by localhost (mail2.intec.ugent.be [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ZCgS0e12jE5 for <ath10k@lists.infradead.org>;
 Mon, 24 Feb 2014 15:59:40 +0100 (CET)
Received: from [157.193.214.167] (eckel.intec.ugent.be [157.193.214.167])
 by mail2.intec.ugent.be (Postfix) with ESMTP id 847EA1F
 for <ath10k@lists.infradead.org>; Mon, 24 Feb 2014 15:59:40 +0100 (CET)
Message-ID: <530B5E6A.8030800@intec.ugent.be>
Date: Mon, 24 Feb 2014 15:59:54 +0100
From: Bart Jooris <Bart.Jooris@intec.ugent.be>
MIME-Version: 1.0
Subject: Re: nl80211: Failed to set channel
References: <00ea01cee403$5331f1e0$f995d5a0$@sparklan.com>
 <00d101cee597$e8c57480$ba505d80$@sparklan.com>
 <52A592B7.9000806@intec.ugent.be>
 <006301cef71c$d850ec10$88f2c430$@sparklan.com>
 <52A98706.7080907@intec.ugent.be>
 <008d01cef722$2a9c05e0$7fd411a0$@sparklan.com>
 <52A9DEF9.8080305@intec.ugent.be>
 <012e01cef7e0$99017e70$cb047b50$@sparklan.com>
 <52AACFB9.8080901@intec.ugent.be>
 <006301cefa3c$44c07b50$ce4171f0$@sparklan.com>
 <52AEC26B.2060400@intec.ugent.be>
 <007f01cefa41$8a940de0$9fbc29a0$@sparklan.com>
 <52AEE61F.5030505@intec.ugent.be>
 <006b01cefacb$6c0b2d60$44218820$@sparklan.com>
 <52B00B10.3050300@intec.ugent.be>
 <004b01cefb9d$04a543e0$0defcba0$@sparklan.com>
 <52B2AE75.9050206@intec.ugent.be>
 <00df01cf0090$05944f10$10bced30$@sparklan.com>
 <52B9672E.9000701@intec.ugent.be>
 <008c01cf012e$e59563d0$b0c02b70$@sparklan.com>
 <530A64E5.2040401@intec.ugent.be> <530B0670.1010009@stackframe.org>
In-Reply-To: <530B0670.1010009@stackframe.org>
Reply-To: Bart.Jooris@intec.ugent.be
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi Sven,

thanks for the quick response!


On 02/24/2014 09:44 AM, Sven Schnelle wrote:
> On 02/23/2014 10:15 PM, Bart Jooris wrote:
>> nl80211: Regulatory information - country=FI
>>      nl80211: 2402-2482 @ 40 MHz 20 mBm
>>      nl80211: 5170-5250 @ 40 MHz 20 mBm
>>      nl80211: 5250-5330 @ 40 MHz 20 mBm
>>      nl80211: 5490-5710 @ 40 MHz 27 mBm
> You need to update your regulatory database. Your version doesn't
> allow 80MHz wide channels.

I've cloned the git like described on: 
http://wireless.kernel.org/en/developers/Regulatory
and executed make install in that dir.

The debug info indeed changed to 160MHz bandwidth, see my debug output.
sudo iw reg set BE doesn't seem to work anymore... but still works from 
hostapd config.

Does this look ok to you, as I am unable to observe the AP from another 
similar machine.

bjooris@DSS-1300-1:~/hostap/hostapd$ sudo ./hostapd ./80211ac_test.conf 
-dddd
random: Trying to read entropy from /dev/random
Configuration file: ./80211ac_test.conf
nl80211: Could not add multicast membership for vendor events: -2 (No 
such file or directory)
rfkill: initial event: idx=0 type=1 op=0 soft=1 hard=0
rfkill: WLAN soft blocked
nl80211: Supported cipher 00-0f-ac:1
nl80211: Supported cipher 00-0f-ac:5
nl80211: Supported cipher 00-0f-ac:2
nl80211: Supported cipher 00-0f-ac:4
nl80211: Supported cipher 00-0f-ac:6
nl80211: Using driver-based off-channel TX
nl80211: Use separate P2P group interface (driver advertised support)
nl80211: interface wlan0 in phy phy0
nl80211: Set mode ifindex 4 iftype 3 (AP)
nl80211: Setup AP(wlan0) - device_ap_sme=0 use_monitor=0
nl80211: Subscribe to mgmt frames with AP handle 0x1d5d430
nl80211: Register frame type=0xb0 nl_handle=0x1d5d430 match=
nl80211: Register frame type=0x0 nl_handle=0x1d5d430 match=
nl80211: Register frame type=0x20 nl_handle=0x1d5d430 match=
nl80211: Register frame type=0xa0 nl_handle=0x1d5d430 match=
nl80211: Register frame type=0xc0 nl_handle=0x1d5d430 match=
nl80211: Register frame type=0xd0 nl_handle=0x1d5d430 match=
nl80211: Register frame type=0x40 nl_handle=0x1d5d430 match=
Could not set interface wlan0 flags (UP): Operation not possible due to 
RF-kill
nl80211: Could not yet enable interface 'wlan0' due to rfkill
nl80211: Add own interface ifindex 4
phy: phy0
BSS count 1, BSSID mask 00:00:00:00:00:00 (0 bits)
wlan0: interface state UNINITIALIZED->COUNTRY_UPDATE
Previous country code 00, new country code BE
Continue interface setup after channel list update
ctrl_iface not configured!
wlan0: Event INTERFACE_DISABLED (29) received
Unknown event 29
random: Got 7/20 bytes from /dev/random
Channel list update timeout - try to continue anyway
nl80211: Regulatory information - country=00
nl80211: 2402-2472 @ 40 MHz 20 mBm
nl80211: 2457-2482 @ 40 MHz 20 mBm
nl80211: 2474-2494 @ 20 MHz 20 mBm
nl80211: 5170-5250 @ 160 MHz 20 mBm
nl80211: 5250-5330 @ 160 MHz 20 mBm
nl80211: 5490-5730 @ 160 MHz 20 mBm
Allowed channel: mode=2 chan=52 freq=5260 MHz max_tx_power=20 dBm (DFS 
state = usable)
Allowed channel: mode=2 chan=56 freq=5280 MHz max_tx_power=20 dBm (DFS 
state = usable)
Allowed channel: mode=2 chan=60 freq=5300 MHz max_tx_power=20 dBm (DFS 
state = usable)
Allowed channel: mode=2 chan=64 freq=5320 MHz max_tx_power=20 dBm (DFS 
state = usable)
hw vht capab: 0x338001b2, conf vht capab: 0x0
wlan0: interface state COUNTRY_UPDATE->HT_SCAN
Scan for neighboring BSSes prior to enabling 40 MHz channel
40 MHz affected channel range: [5290,5330] MHz
wlan0: nl80211: scan request
nl80211: Scan frequency 5300 MHz
nl80211: Scan frequency 5320 MHz
nl80211: Scan trigger failed: ret=-100 (Network is down)
nl80211: Set mode ifindex 4 iftype 2 (STATION)
nl80211: Teardown AP(wlan0) - device_ap_sme=0 use_monitor=0
nl80211: Unsubscribe mgmt frames handle 0x88888888895d5cb9 (AP teardown)
nl80211: Subscribe to mgmt frames with non-AP handle 0x1d5d470
nl80211: Register frame type=0xd0 nl_handle=0x1d5d470 match=0801
nl80211: Register frame type=0xd0 nl_handle=0x1d5d470 match=06
nl80211: Register frame type=0xd0 nl_handle=0x1d5d470 match=0a07
nl80211: Register frame type=0xd0 nl_handle=0x1d5d470 match=0a11


Best regards,

Bart

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
