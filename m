Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAwew-0007hc-RD
 for ath10k@lists.infradead.org; Wed, 26 Aug 2020 14:44:46 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Add interrupt summary based CE processing
References: <1593193967-29897-1-git-send-email-pillair@codeaurora.org>
 <CAD=FV=V_ynwukeR92nbJXkuQ7OAW4mLaTjxko7fXt5aEfDUNhA@mail.gmail.com>
 <CAD=FV=XJDmGbEJQ1U-VDuN2p0+V+uRm_1=DwBnDPmPQsXqS4ZA@mail.gmail.com>
 <CA+ASDXNOCFZhdNMDk9XTuC2H+owQ0+wHipDbkJAGnU9q7BXz_w@mail.gmail.com>
 <871rlcx8uv.fsf@codeaurora.org>
 <CALhWmc1PbTKhrkaPn9yfpx3gZHAMuR-bPY=4_o4wQHv_H5D9dA@mail.gmail.com>
 <CALhWmc3i9Z+KiG1cJNvpSWNsiFhOa5jBw=XfcFz_gKwi_5QibA@mail.gmail.com>
 <CALhWmc1B0+SONV6_AF+nUzgxZdekPD3sZuhrsmwVQx1Q-cgT_g@mail.gmail.com>
 <CALhWmc0qF5stKRcikjwbeFmE-32hNCDazgQdqTMidUyt7u-T1Q@mail.gmail.com>
 <CALhWmc0JtQZE5CfLPb1WnwhE9wCYsjE-53kYWbwtFCs1k7FrCQ@mail.gmail.com>
 <CALhWmc11OefTh6Ov5GqP-yHMVTUO4r9CxqkdHT1F3yzor72v7g@mail.gmail.com>
 <000201d65f51$83d2ac60$8b780520$@codeaurora.org>
Date: Wed, 26 Aug 2020 17:43:42 +0300
In-Reply-To: <000201d65f51$83d2ac60$8b780520$@codeaurora.org> (Rakesh Pillai's
 message of "Tue, 21 Jul 2020 16:54:30 +0530")
Message-ID: <877dtlcvs1.fsf@codeaurora.org>
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: 'Brian Norris' <briannorris@chromium.org>, 'linux-wireless' <linux-wireless@vger.kernel.org>, 'Doug Anderson' <dianders@chromium.org>, 'ath10k' <ath10k@lists.infradead.org>, 'LKML' <linux-kernel@vger.kernel.org>, 'Peter Oh' <peter.oh@eero.com>

(Guys, PLEASE edit your quotes. These long emails my use of patchwork
horrible.)

"Rakesh Pillai" <pillair@codeaurora.org> writes:

>> -----Original Message-----
>> From: Peter Oh <peter.oh@eero.com>
>> Sent: Tuesday, July 21, 2020 7:03 AM
>> To: Kalle Valo <kvalo@codeaurora.org>
>> Cc: Brian Norris <briannorris@chromium.org>; Doug Anderson
>> <dianders@chromium.org>; linux-wireless <linux-
>> wireless@vger.kernel.org>; Rakesh Pillai <pillair@codeaurora.org>; ath10k
>> <ath10k@lists.infradead.org>; LKML <linux-kernel@vger.kernel.org>
>> Subject: Re: [PATCH] ath10k: Add interrupt summary based CE processing
>> 
>> I'll take my word back.
>> It's not this patch problem, but by others.
>> I have 2 extra patches before the 3 patches so my system looks like
>> 
>> backports from ath.git 5.6-rc1 + linux kernel 4.4 (similar to OpenWrt)
>> On top of the working system, I cherry-picked these 5.
>> 
>> #1.
>> ath10k: Avoid override CE5 configuration for QCA99X0 chipsets
>> ath.git commit 521fc37be3d879561ca5ab42d64719cf94116af0
>> #2.
>> ath10k: Fix NULL pointer dereference in AHB device probe
>> wireless-drivers.git commit 1cfd3426ef989b83fa6176490a38777057e57f6c
>> #3.
>> ath10k: Add interrupt summary based CE processing
>> https://patchwork.kernel.org/patch/11628299/
>
> This patch is applicable only for snoc target WCN3990, since there is
> a check for per_ce_irq. For PCI targets, per_ce_irq is false, and
> hence follows a different path.

This information should be in the commit log. But I have a patch in the
pending branch which removes per_ce_irq:

[v2,2/2] ath10k: Get rid of "per_ce_irq" hw param

https://patchwork.kernel.org/patch/11654621/

So how will multilple hardware support work then?

In theory I like the patch but there's no information in the patch if
this works or breaks other hardware, especially QCA9884 or QCA6174 PCI
devices. I really need some kind of assurance that this works with all
ath10k devices, not just WCN3990 which you are working on.

I have written about this in the wiki:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#hardware_families

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
