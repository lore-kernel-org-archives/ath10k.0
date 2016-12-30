Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMyT1-0004EM-Vs
 for ath10k@lists.infradead.org; Fri, 30 Dec 2016 14:47:37 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [1/2] ath10k: add accounting for the extended peer statistics
Date: Fri, 30 Dec 2016 14:47:09 +0000
Message-ID: <87inq1jwyc.fsf@kamboji.qca.qualcomm.com>
References: <992a4e2676037a06f482cdbe2d3d39e287530be5.1480974623.git.chunkeey@googlemail.com>
 <c3f99e7634384475b475b97ff46bec76@euamsexm01a.eu.qualcomm.com>
 <CAAd0S9DcCM9XQOihZx1sVf_1=S3VvDye4k1gEMgWEmNWDaBk5Q@mail.gmail.com>
In-Reply-To: <CAAd0S9DcCM9XQOihZx1sVf_1=S3VvDye4k1gEMgWEmNWDaBk5Q@mail.gmail.com>
 (Christian Lamparter's message of "Fri, 30 Dec 2016 15:35:10 +0100")
Content-Language: en-US
Content-ID: <A5E0866B5A57634292F624AAFF5F80FB@qualcomm.com>
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
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Christian Lamparter <chunkeey@googlemail.com> writes:

> On Thu, Dec 29, 2016 at 3:11 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Christian Lamparter <chunkeey@googlemail.com> wrote:
>>> The 10.4 firmware adds extended peer information to the
>>> firmware's statistics payload. This additional info is
>>> stored as a separate data field and the elements are
>>> stored in their own "peers_extd" list.
>>>
>>> These elements can pile up in the same way as the peer
>>> information elements. This is because the
>>> ath10k_wmi_10_4_op_pull_fw_stats() function tries to
>>> pull the same amount (num_peer_stats) for every statistic
>>> data unit.
>>>
>>> Fixes: 4a49ae94a448faa ("ath10k: fix 10.4 extended peer stats update")
>>> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
>>
>> My understanding is that I should skip this patch 1. Please let me know if
>> I misunderstood. But I'm still plannning to apply patch 2.
>
> I added Mohammed (I hope, he can reply to the open question when he
> returns), Since I'm not sure what he wants or not.
>
> As far as I'm aware, the "extended" boolean serves no purpose
> because it was only used in once place in debugfs_sta which was
> removed in the patch. ( "ath10k_sta_update_stats_rx_duration"
> and "ath10k_sta_update_extd_stats_rx_duration" have been unified).

I had problems following the discussion so the conclusion was not clear
for me.

>> Patch set to Changes Requested.
>
> Isn't there a: "Waiting for Maintainer" state as well?
> Otherwise, if nobody has any complains or question:
> can you please queue it for the next merge window?

There is a state called "Deferred" which I use whenever I need to
revisit a patch later time. I moved this patch to that state now:

https://patchwork.kernel.org/patch/9461631/

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
