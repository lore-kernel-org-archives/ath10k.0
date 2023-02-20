Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851D9C636D6
	for <ath10k@archiver.kernel.org>; Mon, 20 Feb 2023 05:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8IslwfPRantN22mdMBqVE2m5nS5GYnGSVVWL1ihOHQ=; b=xse9hUtWuZZyDb
	E4PAbYBGh7XPEvevRFzSC8HBvQ7Mp2Gf7CkH2NM4HNFMZjwIFouj+a4ArlROdSSRvbZc1UeA3QAix
	w9hjJOvx/XzrzGFmtqrGzFVOpYyHbNL0zwEtAdY3jDq7tUmX8AHqiqTesue0hAuteHSi9T1Sl2rIy
	9nxRL9O96chAO/jnaUUvjmN50kC17r9L+xXLkmfMgMo0YADLuyvocXA1jLhWtVVnEuJUKg7TTF7Ej
	eJWS4DyZFDZNf8E6DOQFxcSh2ksMCC/TOkSZB9aH1VGo6MEFY1t1ywcedKPcbPp7GEy2KhFUBn4Gn
	C2CFX+xgEvbdI3YWcDfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTzCn-0036LW-Aw; Mon, 20 Feb 2023 05:59:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTzCk-0036Kg-60
	for ath10k@lists.infradead.org; Mon, 20 Feb 2023 05:59:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6B377B80A4A;
	Mon, 20 Feb 2023 05:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E13CC433D2;
	Mon, 20 Feb 2023 05:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676872751;
	bh=80zrX5DZqyiAM/9CJMVyLriJCfnAj/L6lQQq4guXpIo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=LF9ZQwCyn8uY5wEmjcQmVafG8v8hGGmoyucwOKs3tBbn/pOznW6M88orRdVX1hD2c
	 0R3StIWCCLl8qPjgqRmKBIpe6aDsUalJ5AsmcCG0MZyrQ9tarirxWpmzfDMWwdVwN9
	 cs3/TYN1gCoi3hY+U1561Wts7fl9he+grZa8heWg2+7T8AIh++oSFDROsyjYUrCKMg
	 3otbAJHBk9oJibiKXk8PsnYynP9rFHGeROx5sLJuNC/gXek/XE4M+YMSAoUEV1ohI+
	 nk0fuFLRExsIQP7PeJFjVZnWkOFY9fpWKdnDbYVr5v0qHVFf7VmPAgedSmmInaHNcw
	 tiwUyedzqjPSg==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath10k@lists.infradead.org,  "open list\:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Lenovo Yoga C630 laptop
References: <CAA8EJpqrHuTaN-bB6XoB7ZWNvfggNtMts3bBQwqMH8RpO1E3QQ@mail.gmail.com>
	<81448efc-5b77-5022-5b9f-3b5188509068@linaro.org>
Date: Mon, 20 Feb 2023 07:59:08 +0200
In-Reply-To: <81448efc-5b77-5022-5b9f-3b5188509068@linaro.org> (Dmitry
	Baryshkov's message of "Sat, 18 Feb 2023 03:33:29 +0200")
Message-ID: <875ybw513n.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_215914_385687_49E45C63 
X-CRM114-Status: GOOD (  13.18  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> Hello Kalle,
>
> On 07/10/2022 15:22, Dmitry Baryshkov wrote:
>> We'd like to ask for inclusion of the board file for the Lenovo Yoga
>> C630 laptop. It is
>> a WfA laptop using the Snapdragon SDM850 SoC.
>
> I noticed that you've updated the WCN3990's board-2.bin, but this file
> was not included. Are there any issues with the submission?

It's just that I haven't processed the pending ath10k board file
submissions from the list yet, I do it quite infrequently.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
