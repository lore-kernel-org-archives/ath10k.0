Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-135.mimecast.com ([63.128.21.135])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1du571-0007sc-Rb
 for ath10k@lists.infradead.org; Mon, 18 Sep 2017 23:06:02 +0000
From: "Stone, Aaron" <astone@Miltope.com>
Subject: RE: Configuring QCA9984 in LEDE as a client fails
Date: Mon, 18 Sep 2017 23:05:26 +0000
Message-ID: <B7065BD913000045856E229462B27FE2AF3C85@MILEX03.Miltope.local>
References: <B7065BD913000045856E229462B27FE2AF3B01@MILEX03.Miltope.local>
 <f20edeb5-3ee5-f6b3-13c7-8197873b7497@candelatech.com>
Content-Language: en-US
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
To: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "Sturn, Jay" <jsturn@Miltope.com>

Master is 12.12.3.2, Client is 12.12.3.100

On the master:
	ping 12.12.3.100

On the client:
	root@LEDE:~# tcpdump -i wlan0
	08:32:56.891174 ARP, Request who-has 12.12.3.2 tell 12.12.3.100, length 28
	08:32:56.896423 ARP, Reply 12.12.3.2 is-at 0e:ae:96:63:9d:af (oui Unknown), length 28
	08:33:39.622290 IP 12.12.3.2 > 12.12.3.100: ICMP echo request, id 11200, seq 1, length 64
	08:33:39.624091 IP 12.12.3.100 > 12.12.3.2: ICMP echo reply, id 11200, seq 1, length 64

However, tcpdump on the Master shows no indication of the return packets on the icmp request.  It does see the ARP  responses though.

On the client:
	echo 0x1 > /sys/module/ath10k_core/parameters/debug_mask  // Sets up PCI Debugging.
	dmesg -wH
	[  +0.037645] ath10k_pci 0000:05:00.0: pci rx ce pipe 5 len 64
	[  +0.004255] ath10k_pci 0000:05:00.0: pci tx item 0 paddr 0x4d6c1050 len 24 n_items 2
	[  +0.000026] ath10k_pci 0000:05:00.0: pci tx item 1 paddr 0x4f07f030 len 52 n_items 2
	[  +0.060390] ath10k_pci 0000:05:00.0: pci rx ce pipe 2 len 224

Wouldn't this indicate that something has at least made it to the Tx transfer queue?

Aaron

-----Original Message-----
From: Stone, Aaron 
Sent: Monday, September 18, 2017 12:02 PM
To: 'Ben Greear'; ath10k@lists.infradead.org
Cc: Sturn, Jay
Subject: RE: Configuring QCA9984 in LEDE as a client fails

Hi Ben,

I was able to figure out that 2 separate scripts were causing issues. 

comment out "iw phy "$phy" set distance "$distance"" in /lib/netifd/wireless/mac80211.sh modified lib/netifd/hostapd.sh - wpa_supplicant -B -P /var/run/wpa_supplicant-wlan0.pid -D nl80211 -i wlan0 -c /var/run/wpa_supplicant-wlan0.conf

It seems that wpa_supplicant was being called with a "-s" option that I can't seem to find in any documentation.
At least now I'm getting a client link.

Now the issue is sending IP packets.  I've been able to compile in tcpdump and can see that the client and master are able to exchange ARP packets.
But when I try to send ICMP ping or an SSH login it fails.

Tcpdump can verify that I can receive packets from the master on the client but any packets (besides ARP) that are sent out the client never seem to make it To the master.

Aaron

-----Original Message-----
From: Ben Greear [mailto:greearb@candelatech.com]
Sent: Monday, September 18, 2017 11:56 AM
To: Stone, Aaron; ath10k@lists.infradead.org
Subject: Re: Configuring QCA9984 in LEDE as a client fails

Please figure out how to enable more verbose debugging with wpa_supplicant and send the supplicant logs to the list.  I don't know exactly how to do this in LEDE but probably google can find something.

Thanks,
Ben

On 09/15/2017 01:30 PM, Stone, Aaron wrote:
> Hi,
>
> I'm attempting to get the QCA9984 radio working with the ath10k driver as a client.
> I've already been successful getting it running in AP mode.
> When I attempt to put it in client mode LEDE shows 0% Radio Wireless is disabled or not associated.
>
> I've already posted a thread on LEDE forum showing some of the logs 
> https://forum.lede-project.org/t/cant-add-wave2-qca9984-radio-in-clien
> t-mode/6649
>
> Through compiling in a few well-placed debug messages I've been able to obtain some additional info.
>
> Fri Jan 30 05:52:53 1970 daemon.notice netifd: Interface 'wwan' is 
> disabled Fri Jan 30 05:52:55 1970 daemon.notice netifd: radio0 (3222):
> AMS iw phy0 info (null) Fri Jan 30 05:52:55 1970 daemon.notice netifd: 
> radio0 (3222): AMS iw reg get (null) Fri Jan 30 05:52:55 1970 
> daemon.notice netifd: radio0 (3222): AMS iw phy phy0 set antenna_gain
> 0 (null) Fri Jan 30 05:52:55 1970 daemon.notice netifd: radio0 (3222): 
> AMS iw phy phy0 set distance 0 (null) Fri Jan 30 05:52:55 1970 
> daemon.notice netifd: radio0 (3222): command failed: Not supported
> (-95) Fri Jan 30 05:52:55 1970 daemon.notice netifd: radio0 (3222): 
> AMS iw phy phy0 interface add wlan0 type managed (null) Fri Jan 30
> 05:52:55 1970 daemon.notice netifd: radio0 (3222): AMS iw wlan0 set 
> power_save off (null) Fri Jan 30 05:52:58 1970 kern.info kernel: [ 
> 858.837891] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
>
> From there it also calls wpa_supplicant with a failure as well but this wasn't compiled into the off the shelf LEDE.
> Currently my best guess is that IW is have a problem with the driver.
>
> I'm a bit new to the ath10K driver but I'm trying to learn as much 
> about it as possible.  I don't know all the steps that Need to be 
> taken in order to get the radio working in client mode but if anyone can point me in the right direction It would be much appreciated.
>
> Thanks
> Aaron
>
> CONFIDENTIAL NOTE: This e-mail and any attachments may be confidential 
> and protected by legal privilege. If you are not the intended 
> recipient, be aware that you are hereby notified that any unauthorized 
> review, use, disclosure, dissemination, distribution, or copying of 
> this communication, or any of its contents, is strictly prohibited. If 
> you have received this email in error, please notify us immediately by 
> replying to the sender and deleting this copy and the reply from your 
> system.
>
> Thank you for your cooperation.
>
> EXPORT CONTROLLED DOCUMENT
> This document may contain information whose export is restricted by 
> the Arms Export Control Act (Title 22, U.S.C., Sec 2751 Et
> Seq.) or the International Traffic in Arms Regulation (ITAR) under the 
> Export Administration Act of 1979, as amended, (Title 50, U.S.C., App.
> 2401, Et. Seq.). Violations to these export laws are subject to severe 
> criminal penalties
>
> All technical data forwarded by VT Miltope to its suppliers is EXPORT 
> CONTROLLED. Suppliers shall not disclose technical data in any form to 
> a Foreign Person (including foreign persons employed by the Supplier), 
> or export the technical data from the United States without U.S.
> Government authority and the written authorization of VT Miltope.
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


--
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
