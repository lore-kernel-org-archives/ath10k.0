Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1boX8Q-0001H6-Mn
 for ath10k@lists.infradead.org; Mon, 26 Sep 2016 14:43:59 +0000
Message-ID: <57E93401.9070505@candelatech.com>
Date: Mon, 26 Sep 2016 07:43:13 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: about ath10k support 80211r, 80211w
References: <fc16a0311aac3b91f9147e8188c17d@cweb21.nm.nhnsystem.com>
In-Reply-To: <fc16a0311aac3b91f9147e8188c17d@cweb21.nm.nhnsystem.com>
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
To: KwangMin Kim <gwondori@nimbus.kr>, ath10k@lists.infradead.org
Cc: =?UTF-8?B?6rCV6rK97JmE?= <bigskang@nimbus.kr>

I don't think .11r works in stock firmware, at least in station mode.

With modified firmware, it can work fine.  And possibly newer upstream
firmware fixes this issue.

Thanks,
Ben

On 09/25/2016 09:43 PM, KwangMin Kim wrote:
> Hi. I'm using COMPEX WLE900VX-7AA(QCA9880).
>
> And using kernel version 3.2.80, backport version 4.4.2.
>
> My Question.
>
> 1. Can I use "ieee80211r" and "ieee80211w" in my environment?
>
> 2. Have you ever tried to seamless test? If you done test, how seamless?
>
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
