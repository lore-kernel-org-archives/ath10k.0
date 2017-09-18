Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1du0HQ-00026j-NT
 for ath10k@lists.infradead.org; Mon, 18 Sep 2017 17:56:26 +0000
Subject: Re: Configuring QCA9984 in LEDE as a client fails
References: <B7065BD913000045856E229462B27FE2AF3B01@MILEX03.Miltope.local>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <f20edeb5-3ee5-f6b3-13c7-8197873b7497@candelatech.com>
Date: Mon, 18 Sep 2017 10:56:01 -0700
MIME-Version: 1.0
In-Reply-To: <B7065BD913000045856E229462B27FE2AF3B01@MILEX03.Miltope.local>
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
To: "Stone, Aaron" <astone@Miltope.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Please figure out how to enable more verbose debugging with wpa_supplicant and
send the supplicant logs to the list.  I don't know exactly how to do this in LEDE
but probably google can find something.

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
> https://forum.lede-project.org/t/cant-add-wave2-qca9984-radio-in-client-mode/6649
>
> Through compiling in a few well-placed debug messages I've been able to obtain some additional info.
>
> Fri Jan 30 05:52:53 1970 daemon.notice netifd: Interface 'wwan' is disabled
> Fri Jan 30 05:52:55 1970 daemon.notice netifd: radio0 (3222): AMS iw phy0 info (null)
> Fri Jan 30 05:52:55 1970 daemon.notice netifd: radio0 (3222): AMS iw reg get (null)
> Fri Jan 30 05:52:55 1970 daemon.notice netifd: radio0 (3222): AMS iw phy phy0 set antenna_gain 0 (null)
> Fri Jan 30 05:52:55 1970 daemon.notice netifd: radio0 (3222): AMS iw phy phy0 set distance 0 (null)
> Fri Jan 30 05:52:55 1970 daemon.notice netifd: radio0 (3222): command failed: Not supported (-95)
> Fri Jan 30 05:52:55 1970 daemon.notice netifd: radio0 (3222): AMS iw phy phy0 interface add wlan0 type managed (null)
> Fri Jan 30 05:52:55 1970 daemon.notice netifd: radio0 (3222): AMS iw wlan0 set power_save off (null)
> Fri Jan 30 05:52:58 1970 kern.info kernel: [  858.837891] IPv6: ADDRCONF(NETDEV_UP): wlan0: link is not ready
>
> From there it also calls wpa_supplicant with a failure as well but this wasn't compiled into the off the shelf LEDE.
> Currently my best guess is that IW is have a problem with the driver.
>
> I'm a bit new to the ath10K driver but I'm trying to learn as much about it as possible.  I don't know all the steps that
> Need to be taken in order to get the radio working in client mode but if anyone can point me in the right direction
> It would be much appreciated.
>
> Thanks
> Aaron
>
> CONFIDENTIAL NOTE: This e-mail and any attachments may be
> confidential and protected by legal privilege. If you are not the
> intended recipient, be aware that you are hereby notified that
> any unauthorized review, use, disclosure, dissemination,
> distribution, or copying of this communication, or any of its
> contents, is strictly prohibited. If you have received this email
> in error, please notify us immediately by replying to the sender
> and deleting this copy and the reply from your system.
>
> Thank you for your cooperation.
>
> EXPORT CONTROLLED DOCUMENT
> This document may contain information whose export is restricted
> by the Arms Export Control Act (Title 22, U.S.C., Sec 2751 Et
> Seq.) or the International Traffic in Arms Regulation (ITAR)
> under the Export Administration Act of 1979, as amended, (Title
> 50, U.S.C., App. 2401, Et. Seq.). Violations to these export laws
> are subject to severe criminal penalties
>
> All technical data forwarded by VT Miltope to its suppliers is
> EXPORT CONTROLLED. Suppliers shall not disclose technical data in
> any form to a Foreign Person (including foreign persons employed
> by the Supplier), or export the technical data from the United
> States without U.S. Government authority and the written
> authorization of VT Miltope.
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
