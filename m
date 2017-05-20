Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x22c.google.com ([2607:f8b0:4001:c06::22c])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dC792-0004xC-9K
 for ath10k@lists.infradead.org; Sat, 20 May 2017 16:22:22 +0000
Received: by mail-io0-x22c.google.com with SMTP id p24so62135193ioi.0
 for <ath10k@lists.infradead.org>; Sat, 20 May 2017 09:21:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABPxzY+Y3Jcxw9UitytgrFS1H53pT7mCvVSbFM0qoj74x4gdFg@mail.gmail.com>
References: <CABPxzY+mQ-G6PTsQV9_WVgju4bmQHwxKKW070j7v6=DDgZop4Q@mail.gmail.com>
 <b830b657-3f73-de7f-d61c-1565dc14c2ef@candelatech.com>
 <CABPxzY+Y3Jcxw9UitytgrFS1H53pT7mCvVSbFM0qoj74x4gdFg@mail.gmail.com>
From: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Date: Sat, 20 May 2017 21:51:38 +0530
Message-ID: <CABPxzY+bnfV-z=J=Tz7HH_8PQ1kW-XDpDhEZnqQK6DV_mGfaDg@mail.gmail.com>
Subject: Re: ath10k: controlling TX aggregation
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On Mon, May 15, 2017 at 3:02 PM, Krishna Chaitanya
<chaitanya.mgit@gmail.com> wrote:
> On Fri, May 12, 2017 at 8:15 PM, Ben Greear <greearb@candelatech.com> wrote:
>> What chipset, and what firmware version?
>>
>> Thanks,
>> Ben
>
> Hi Ben,
>
> I have missed your response. PFB details.
>
>  chip: QCA986x/988x PCIe
>  FW ver: 10.2.4.70.54 api 5
>  kernel: 4.11.0-rc+7 (wireless-drivers-next)
>
Ben,

any clues?
>
>> On 05/12/2017 07:43 AM, Krishna Chaitanya wrote:
>>>
>>> Hi,
>>>
>>> I am doing some comparative tests, wanted to configure common
>>> settings btw all STA's. wanted to limit agg_size to 24 in ath10k with
>>> the below command.
>>>
>>> echo "3 24" > /sys/kernel/debug/ieee80211/phy0/ath10k/htt_max_amsdu_ampdu
>>>
>>> The ADDBA request still has 64 and when i run iperf it is aggregating 64
>>> frames.
>>>
>>> Except for 1 no number takes effect. If i configure 1 there is no ADDBA
>>> exchange
>>> initiated by ath10k.
>>>
>>> Is this expected? Can we control the aggregation size through driver?
>>>
>>> latest wireless-drivers-next and linux-firmware git is used.
>>>
>>
>> --
>> Ben Greear <greearb@candelatech.com>
>> Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
