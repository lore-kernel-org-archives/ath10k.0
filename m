Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fn1tq-0003bt-KX
 for ath10k@lists.infradead.org; Tue, 07 Aug 2018 13:19:48 +0000
Subject: Re: ath10k: antenna bitmask support?
References: <20180807020813.GA185137@ban.mtv.corp.google.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <6dbb4086-f5bd-2ece-e3f3-9ac7cd5b4d9c@candelatech.com>
Date: Tue, 7 Aug 2018 06:19:22 -0700
MIME-Version: 1.0
In-Reply-To: <20180807020813.GA185137@ban.mtv.corp.google.com>
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
To: Brian Norris <briannorris@chromium.org>, ath10k@lists.infradead.org



On 08/06/2018 07:08 PM, Brian Norris wrote:
> Hi all,
>
> I'm looking at ancient changes like this:
>
> commit 5572a95b4b5768187652a346356e39e7542ca6e0
> Author: Ben Greear <greearb@candelatech.com>
> Date:   Mon Nov 24 16:22:10 2014 +0200
>
>     ath10k: apply chainmask settings to vdev on creation
>
> since I see that some firmwares seem to crash a lot if you apply certain
> chainmask settings (e.g., 0x2).
>
> Is it really expected that you can set gaps in the chainmask or not? I
> ask because I've been trying to use this for doing some antenna
> configuration verification (e.g., disable all but one antenna and see
> what happens), and this works as expected on APs I have running IPQ8064
> (QCA988X?), but it crashes the firmware on IPQ4019.

I don't think you can even directly set the chainmask in the firmware,
and from my previous looking at the firmware, it is not designed to support
gaps.

If you want to determine if an antenna is working, you can look at the per-chain
RSSI stats when receiving frames using all available antenna (ie, 3x3 rates for a 3x3 NIC).

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
