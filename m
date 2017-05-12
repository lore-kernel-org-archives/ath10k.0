Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d9Bpa-0005b3-JX
 for ath10k@lists.infradead.org; Fri, 12 May 2017 14:46:12 +0000
Subject: Re: ath10k: controlling TX aggregation
References: <CABPxzY+mQ-G6PTsQV9_WVgju4bmQHwxKKW070j7v6=DDgZop4Q@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <b830b657-3f73-de7f-d61c-1565dc14c2ef@candelatech.com>
Date: Fri, 12 May 2017 07:45:49 -0700
MIME-Version: 1.0
In-Reply-To: <CABPxzY+mQ-G6PTsQV9_WVgju4bmQHwxKKW070j7v6=DDgZop4Q@mail.gmail.com>
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
To: Krishna Chaitanya <chaitanya.mgit@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

What chipset, and what firmware version?

Thanks,
Ben

On 05/12/2017 07:43 AM, Krishna Chaitanya wrote:
> Hi,
>
> I am doing some comparative tests, wanted to configure common
> settings btw all STA's. wanted to limit agg_size to 24 in ath10k with
> the below command.
>
> echo "3 24" > /sys/kernel/debug/ieee80211/phy0/ath10k/htt_max_amsdu_ampdu
>
> The ADDBA request still has 64 and when i run iperf it is aggregating 64 frames.
>
> Except for 1 no number takes effect. If i configure 1 there is no ADDBA exchange
> initiated by ath10k.
>
> Is this expected? Can we control the aggregation size through driver?
>
> latest wireless-drivers-next and linux-firmware git is used.
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
