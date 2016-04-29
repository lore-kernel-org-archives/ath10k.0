Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1awBAn-0001jo-6C
 for ath10k@lists.infradead.org; Fri, 29 Apr 2016 16:21:45 +0000
Message-ID: <572389ED.6080306@candelatech.com>
Date: Fri, 29 Apr 2016 09:21:01 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: ath10k IBSS and A-MSDU throuput
References: <5723831A.7010607@tu-bs.de>
In-Reply-To: <5723831A.7010607@tu-bs.de>
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
To: "Harms, Hannes" <hannes.harms@tu-bs.de>, ath10k@lists.infradead.org



On 04/29/2016 08:51 AM, Harms, Hannes wrote:
> Hi everyone,
>
> I have set up two Compex WLE900 in ad-hoc mode, 80MHz channel width, channel 100.
> I am using kernel 3.17 from Gateworks for imx6 and
> my own compat_wirless (4.4.2) with all patches from Candela for ath10k and all patches for mac80211 from the
> Candela 4.4 kernel tree.
>
> The upload for TCP is about 200 MBit/s and the download is about 250 MBit/s, tested with iperf3.
>
> Now I am trying to enable A-MSDU as described in the firmware release 10.1.467-ct-15 from Candela,
> but I can not measure anydifference  in throughput.
>
> Could anyone confirm that A-MSDU is really working with IBSS?

You can sniff it and see if you can sniff amsdu frames on air?

I only tested it a bit when developing that feature for another user
(who eventually decided to not use it anyway since it required linux
kernel hacks to make it work), so possibly there was a regression...

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
