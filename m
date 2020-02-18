Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4916-0005Ml-RG
 for ath10k@lists.infradead.org; Tue, 18 Feb 2020 19:58:50 +0000
Message-ID: <5E4C41F3.2000500@candelatech.com>
Date: Tue, 18 Feb 2020 11:58:43 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Management rate-control on IPQ4019
References: <20543d04-7847-8a4f-7882-78c2f42c98c0@david-bauer.net>
In-Reply-To: <20543d04-7847-8a4f-7882-78c2f42c98c0@david-bauer.net>
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
To: David Bauer <mail@david-bauer.net>, ath10k@lists.infradead.org

On 02/18/2020 11:12 AM, David Bauer wrote:
> Hello,
>
> while playing around with the 2.4GHz WiFi part of the IPQ4019, i was
> expecting being able to set the rate at which IPQ4019 transmits it's beacon
> frames.
>
> Using OpenWrt, setting "legacy_rates=0" on the radio leads to only advertising
> 802.11g speeds, however the beacons are still sent out at 1 Mbit/s. Using a QCA9984,
> the beacons are correctly sent out at the lowest 802.11g rate (6 Mbit/s). So i assume
> this is either a bug in the ath10k firmware or a hardware-shortcoming. Has anyone else
> experienced this bug and is it likely we'll see it fixed in a later firmware release?
>
> Hardware: IPQ4029 (Aruba AP-303)
> Firmware  Version: 10.4-3.6-00140 / 10.4-3.5.3-00078

There are separate API for setting management frame rates.  I forget exactly how
upstream supports this, but maybe check debugfs?

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
