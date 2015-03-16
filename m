Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXViX-0001Hy-LT
 for ath10k@lists.infradead.org; Mon, 16 Mar 2015 14:10:06 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: match wait_for_completion_timeout return type
References: <1426094076-10134-1-git-send-email-hofrat@osadl.org>
 <87y4n0q1rq.fsf@kamboji.qca.qualcomm.com>
 <20150313173405.GB9934@opentech.at>
Date: Mon, 16 Mar 2015 16:09:35 +0200
In-Reply-To: <20150313173405.GB9934@opentech.at> (Nicholas Mc Guire's message
 of "Fri, 13 Mar 2015 18:34:05 +0100")
Message-ID: <87a8zdowyo.fsf@kamboji.qca.qualcomm.com>
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
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Nicholas Mc Guire <hofrat@osadl.org>

Nicholas Mc Guire <der.herr@hofr.at> writes:

> On Fri, 13 Mar 2015, Kalle Valo wrote:
>
>> Nicholas Mc Guire <hofrat@osadl.org> writes:
>> 
>> > Return type of wait_for_completion_timeout is unsigned long not int.
>> > An appropriately named unsigned long is added and the assignments fixed up.
>> >
>> > Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
>> 
>> Doesn't apply:
>> 
>> Applying: ath10k: match wait_for_completion_timeout return type
>> fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/mac.c).
>> Repository lacks necessary blobs to fall back on 3-way merge.
>> Cannot fall back to three-way merge.
>> Patch failed at 0001 ath10k: match wait_for_completion_timeout return type
>>
> sorry - no idea how I managed that - checking it.
>
> Will fix it up and repost.

Did you use master branch from ath.git repository? ath10k is in quite
active development so if you use something else there's a substantial
risk that the patch will not apply.

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/sources

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
