Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A63C433EF
	for <ath10k@archiver.kernel.org>; Thu, 24 Feb 2022 09:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sth+ezKGkXcv3uAjQNaabYJGrMwfuClQUPP2tUxpEWA=; b=uR0TY2V608CJLx
	EOGgbNByIyULjvrV7IzP57f1EpryfSUGtE1DAJCZlBmejO+EBSZjLv/kNsIt7OBGycnnZHVBrdN8S
	Vj08YngYZVl5OlTjVFLJNOpgZGG08Hd7ADE0J1weTA93F/v7rdDFBsPbV0tJsEWDV1PMLgG+3p9yD
	XxOT4Mmtf83994ugABzq7qBlciV1ZoSiLzNLsYuGptQqDZ6+M1YzG0iDoA07Eqz3awCdSV+SoSJlI
	5kafQ1yzUK+lP4DtK6o0rmJRjfJKcBnLqKe85UFYYdfML8VwpUTivXUNXSOMMEtZoLQ/a6SqFAeu+
	H3k8/R4hpCaZZzpvoiZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNAuW-000Cqw-Vs; Thu, 24 Feb 2022 09:59:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNAuT-000Cpd-Qc
 for ath10k@lists.infradead.org; Thu, 24 Feb 2022 09:59:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 511CEB8249C;
 Thu, 24 Feb 2022 09:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C47C340E9;
 Thu, 24 Feb 2022 09:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645696778;
 bh=7eguQjJYyrMKQoojwbWhxFNmQYcJas6sOvBXxv+Jklw=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=IEWfxImdwfWYbTxagwFfgsHz0DBVEBVKvth39hjXUrwzMBB3Gt6yPT/liUcTHl4/i
 BfpyuzPrG+2qBVnMcWSPcpDsKPKYfnE+3/6NhjAIMpKRcFaRHsSQGQHf1OFav/9bRD
 8PRGNQOABS1w/lGulhLDct8DR6no5SC8+AjE/y/B+8GAQFSJJtEBtOcJqGPVk/l9Qa
 +Z0/dxDtuX7RGPMUJfSH/a8P8XacaYsquR6//0AikC9f7YNNVdegSmITqNNcaYi9eF
 om3hQQa/ItOuuzpxAnHMFq1irbUUPhxbNQqX1Nbc9WgWoLjfauregYUnV16A+3Eduk
 d63R4yr5wwzXQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Francesco Magliocca <franciman12@gmail.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 rmanohar@qti.qualcomm.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linuxfoundation.org>
Subject: Use of void pointer arithmetic?
References: <20220221122638.7971-1-franciman12@gmail.com>
 <e32de43c-e00a-5766-e988-fe192d36d719@quicinc.com>
 <CAH4F6utmtAM3CzX2_Fbn94Sb-X8m0patPh8yWwbuBB0t1VYH=g@mail.gmail.com>
 <87o82wvhtk.fsf@kernel.org> <20220224075346.GL3943@kadam>
Date: Thu, 24 Feb 2022 11:59:31 +0200
In-Reply-To: <20220224075346.GL3943@kadam> (Dan Carpenter's message of "Thu,
 24 Feb 2022 10:53:46 +0300")
Message-ID: <87fso8vb3w.fsf_-_@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_015942_053836_1045DCE6 
X-CRM114-Status: GOOD (  17.51  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
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
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

(Changing subject, adding Linus and linux-kernel)

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Thu, Feb 24, 2022 at 09:34:31AM +0200, Kalle Valo wrote:
>> Francesco Magliocca <franciman12@gmail.com> writes:
>> 
>> > Hi, I picked (void*) to be conformant with the other examples in htt_rx.c
>> > For example at line 1431:
>> >>    rxd = HTT_RX_BUF_TO_RX_DESC(hw,
>> >>                    (void *)msdu->data - hw->rx_desc_ops->rx_desc_size);
>> >
>> > But for me it is ok. Maybe we should fix all the occurrences of this kind.
>> 
>> Yeah, it would be good to fix the void pointer arithmetic in a separate
>> patch. I have planning to enable -Wpointer-arith in my ath10k-check and
>> ath11k-check scripts, so patches are very welcome.
>
> Void * casts simplify a lot of code.  Less noise.  More readable.
> They're more accurate in a sense because it's not a u8 at all.  The
> kernel can't compile with other compilers besides GCC and Clang so why
> care about that the C standard hasn't caught up?
>
> What does -Wpointer-arith buy us?

A good question. I have always just thought we should avoid void pointer
arithmetic due to the C standard, but now that you mention it void
pointers can indeed simplify the code. So I'm not so sure anymore.

Any opinions? Is there a kernel wide recommendation for this?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
