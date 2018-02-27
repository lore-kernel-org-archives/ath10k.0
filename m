Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eqiKL-0004Oc-Gh
 for ath10k@lists.infradead.org; Tue, 27 Feb 2018 16:42:07 +0000
Subject: Re: fixed bit rate 9Mbps set as 24Mbps in g mode(legacy)
References: <1519625792-12010-1-git-send-email-periyasa@codeaurora.org>
 <20180227083933.M59708@cdot.in>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <3047f184-d600-7be7-52bc-2ed4cee37ffe@candelatech.com>
Date: Tue, 27 Feb 2018 08:41:50 -0800
MIME-Version: 1.0
In-Reply-To: <20180227083933.M59708@cdot.in>
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
To: KAVITA MATHUR <kavitam@cdot.in>, ath10k@lists.infradead.org, backports@vger.kernel.org
Cc: linux-wireless@vger.kernel.org

On 02/27/2018 12:49 AM, KAVITA MATHUR wrote:
> Hi,
>
> I have configured AP in g mode and tested legacy rates.All basic rates and supported
> rates(1,2,5.5,11,6,9,12,18,24,36,48,54) are set except 9Mbps.
>
> When fixed bit rate 9Mbps is set, it gets set as 24 Mbps. This issue has been observed
> in backports-4.4.2-1 as well as latest git version of ath10k driver.
>
>
> Is anybody aware of this issue? How can I fix this rate 9Mbps?

You should specify which firmware/chipset you are using, since this might
easily be a firmware issue.

And, how are you determining that 'it gets set to 24Mbps'.  Is that the encoding
you see in a wifi sniff, or is the driver being set to 24Mbps improperly when
you use iw (or whatever) to try configuring the rate?

Recent upstream mac80211 has broken the ability to set a single tx rate as well,
last I checked.

Thanks,
Ben

>
>
> Thanks & Regards,
> Kavita
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe backports" in
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
