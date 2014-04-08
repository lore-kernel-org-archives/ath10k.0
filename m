Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXLpa-00068Z-2w
 for ath10k@lists.infradead.org; Tue, 08 Apr 2014 02:32:11 +0000
Message-ID: <53435F89.60500@candelatech.com>
Date: Mon, 07 Apr 2014 19:31:37 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFT 0/4] ath10k: fix flushing and tx stalls
References: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>	<5341F1A9.2030202@candelatech.com>
 <CA+BoTQndgEB7X-RUPPkxdjnp96LJzbv6=Q9K4XTTrky-QwE4Ww@mail.gmail.com>
In-Reply-To: <CA+BoTQndgEB7X-RUPPkxdjnp96LJzbv6=Q9K4XTTrky-QwE4Ww@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 04/07/2014 02:11 AM, Michal Kazior wrote:

> These logs are not enough. I'd love to see traces for this to see what
> frames are actually submitted and when tx credits are replenished.
>
> I also wonder if this can be somehow related to your FW changes to
> allow connecting multiple client virtual interfaces to a single AP?

I think it is unlikely due to my firmware changes...little of that touched
the handling of management frames.  It might very well be a basic problem in
either the firmware or driver when using multiple station VIFS.  I think that
aside from my testing that code has not been used much.

Note my followup email that problems started with patch 3/4...not sure you
saw that one or not.  I saw similar failure to associate & get DHCP (and
slow/hung user-space) without the kernel error logs.

I've added the first two patches to my tree and will continue to run
with them since they do not appear to cause problems so far.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
