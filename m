Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56602C83F2C
	for <ath10k@archiver.kernel.org>; Tue,  5 Sep 2023 05:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IytecN2TXNtHqRjc/qYIi7iTWQEqSZNKfSjjKazhLIA=; b=wuzrnomoD3XjAphYN/RqJoIvTA
	GLF9K2lMQsXFWCIlsFYE2rWXCQct6Rd+fkb68IbPk19UfEWKAoyFjk7sIlkck/Klhu0tpYuhrw9dl
	z03JEzW7gO4OZMA/+XiLN6rDSZB1LUNGN//fpoKrDkV7JTpvNx5ejo3k1/NMgmpMPou1m6YV74oTr
	SZh3ntyVEb92wEUi2VmpJ6y1DEzy2+VccrNm9GWNy11k27zjn92PDzejAlNiERQ9yc+EO+eNCx8b5
	qofm1PEXTuIcLGz9vTVMlYKb6SggYHeZa0egWXDyPIJdlYOil+W8BMW2SYdGY/mYZNSZwcAO44oWt
	mG/Upt1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdP58-005JlI-1s;
	Tue, 05 Sep 2023 05:58:34 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdP56-005Jk3-1o
	for ath10k@lists.infradead.org;
	Tue, 05 Sep 2023 05:58:34 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id CD7E324002A
	for <ath10k@lists.infradead.org>; Tue,  5 Sep 2023 07:58:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1693893505; bh=L9hXUZytELOppkUyJdGWF64vxouLi6UoRzo1iGahBvI=;
	h=MIME-Version:Content-Transfer-Encoding:Date:From:To:Cc:Subject:
	 Message-ID:From;
	b=fbla6mnB7hoDvJ1/i+aukwxmDpZbmmnWmLKdLJWGqMnVGdkDyHXwMAvDXmXAFhsm4
	 Ou3FcSbF7ECzrrm2KrT1OWh8BRta+6zUQwMl+wJLDUnnhB+rl+uE5khJB/JyYzF9ZH
	 dAPRduewabzi9PH9n7LvotjDn+TqiguRRXdQ5FjPsxd44wAnjX08yrwGTdsFaJwTpU
	 lFpw5rvlbCETcsxgaCRvyJR7SbmW8Wh8lqDJyPdJM41iSXefMONEb62f8zwVh15j+d
	 OD/EvIZ2bqbwae4Hz7TU7/wrsT/XiSLcajzkQ2t7EVXZaNoJ1lA4vqyY0BCiUZa/tI
	 zpp6uOAJMAmdg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Rfvv13nS9z6tm4;
	Tue,  5 Sep 2023 07:58:21 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 05 Sep 2023 05:58:21 +0000
From: w.wadepohl@posteo.de
To: Bastian Krause <bst@pengutronix.de>
Cc: "Lukas F. Hartmann" <lukas@mntre.com>, Gary Bisson
 <bisson.gary@gmail.com>, Kalle Valo <kvalo@kernel.org>,
 ath10k@lists.infradead.org, gary.bisson@boundarydevices.com,
 kernel@pengutronix.de
Subject: Re: Problems with QCA9377 SDIO on NXP i.MX8MPlus SOM
In-Reply-To: <c22e2867-5ebb-4337-a9c9-be95621b3e78@pengutronix.de>
References: <875y7swixj.fsf@mntre.com> <87mt13eqit.fsf@kernel.org>
 <ZIgoHqP8gk5wdP8A@p1g2> <878rcn4boh.fsf@mntre.com>
 <c22e2867-5ebb-4337-a9c9-be95621b3e78@pengutronix.de>
Message-ID: <6b7a87b601e60052120d8fbb3567df1b@posteo.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_225832_773804_3BB6EB08 
X-CRM114-Status: GOOD (  16.44  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

We are using a QCA9377 based device (8devices Redbean) with the ath10k 
over SDIO together with kernel 5.10. It works well. We also use qcacld 
for regulative testing purpose. All our patches are mainlined.

Am 04.09.2023 16:28 schrieb Bastian Krause:
> Hi Lukas and everybody else,
> 
> On 6/13/23 17:35, Lukas F. Hartmann wrote:
>> Gary Bisson <bisson.gary@gmail.com> writes:
>> 
>>>> Trying significantly older ath10k from an older kernel is something 
>>>> to
>>>> try in case there are recent regressions in ath10k.
>>>> 
>>>> I don't have an ath10k SDIO device myself so I don't know the state 
>>>> of
>>>> SDIO support in ath10k. Does anyone else from the list know?
>>> 
>>> FYI we have a branch in our repo with the firmware that worked on 
>>> ath10k
>>> at some point [2].
>> 
>> Thanks, I looked at this FW now and it is exactly the same as the
>> "untested" in the ath10k-firmware repo
>> https://github.com/kvalo/ath10k-firmware/tree/master/QCA9377/hw1.0/untested
>> 
>> So if that worked with ath10k several years ago (when?) I could try to
>> reconstruct an older version and try to bisect for a regression, 
>> though
>> I imagine it will be complicated to make these old versions work with
>> APIs that have changed in the meantime in Linux.
> 
> I just wanted to check if I understood this correctly and whether this
> is still the latest information: The QCA9377 connected via SDIO won't
> work with the ath10k driver right now, correct? Neither with [1] nor
> with any other known firmware, right?
> 
> Thanks for the previous information, by the way. I'm also stuck with a
> QCA9377 (Telit module) connected via SDIO and I'm not too keen on using
> the qcacld driver. With Kernel 6.5, I see basically the same output as
> pasted here [2] with slightly different register dumps.
> 
> Regards,
> Bastian
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ath10k/QCA9377/hw1.0
> [2] https://gist.github.com/mntmn/7d18cba485572bf0690267f37647cacb

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
