Return-Path: <SRS0=LS8S=KB=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7F6C433B4
	for <ath10k@archiver.kernel.org>; Thu,  6 May 2021 03:22:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF9FC600CC
	for <ath10k@archiver.kernel.org>; Thu,  6 May 2021 03:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF9FC600CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=dd-wrt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZfO+TRJPAfoOIXwwHStm7uonlswzIVqohCa3tSFMzbA=; b=U66oOF/xDsDXNBRTNAwYUyA9i
	dBv+gSCKbfkVvsaH7dCg+/+7QLMoptgR60C3stub6UVQdOaP+fwnZ8loLxROsJJ3r7OOgV5TUAjHV
	g0t+6/r7nrJOTPx7fU+hyqpxHKjLGMBcGBeqaLOXqGaRlnCq2whSuJ3xiWQovIWUR9CcDareY4TJS
	7O27phyQR0mPgnZC5HCtyL4ozw3MLvjVAGUhaV5Qv7g5E1pf5QoAagI4ypFC5zyA3INFJSmNznctO
	Au8U5I39Eosk2QBj4sZpwswOJ7hkBFWFosdhZU51KR/L31KMfAfGCmXHzxtaTEHHboaxiZ0a7koPN
	95dlbZFEA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leUYq-002zbB-Jp; Thu, 06 May 2021 03:20:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leUYi-002zaC-U4
 for ath10k@desiato.infradead.org; Thu, 06 May 2021 03:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=r1HySobuTUfnND/NpG1THCkAbax0kEZACKME/6u/7yU=; b=YoLQQj3Lu/4qX09GvEp57knuMZ
 zWYQl4IZPvObotzlj1xahABvULAWzIIV/Mvq0hMTRpsvVg70H1Rsdx5yK+BwEXDyaevGtcNyitgFz
 +uYQSrY08LY8fKCfP1mv21dI0xC6j4+JsudguNVvQtsgR+ihrARBRdtATGkJ2JyzLp/FuDegpHJya
 OptDCLE21Y3ZOFOFLzsiZ9ijNEIABgXeZrm/Ih9GncZFM6Q4mZWF6dRIdk4HvIFJagkDeWHEePNKo
 +Ed7eUJ9UYF29EFXKuc/iO6XNzoYJM4nHQCxuvol1BJ4d/SISwx7vLoN4gat4+nHs6n3Zv3ImriZj
 Nff9HVoQ==;
Received: from mail.as201155.net ([185.84.6.188])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leUYe-005Y2b-Lp
 for ath10k@lists.infradead.org; Thu, 06 May 2021 03:20:15 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:39364
 helo=webmail.newmedia-net.de)
 by mail.as201155.net with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <s.gottschall@dd-wrt.com>)
 id 1leUYZ-0001Gk-0p
 for ath10k@lists.infradead.org; Thu, 06 May 2021 05:20:07 +0200
X-CTCH-RefID: str=0001.0A782F21.60936067.001A, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com;
 s=mikd; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID;
 bh=r1HySobuTUfnND/NpG1THCkAbax0kEZACKME/6u/7yU=; 
 b=XssBdRD4c0g+GqQr8bS1WebA4Czx/dCxFCbIVDYuT1RAl+9xfPzkFyyXUHT84bfzTH7Vszeo7+dINuqqgwzC7kPsNbv4Bp+neS3/jQdpQqLu2Y4RvWZNVB+SgmBHQPf09QKC+l+uBy39aZII7/f+eFoP6c0U9UxUQlCjivwzefY=;
Message-ID: <5754c4f3-003b-28a5-6859-b0ee1752d47b@dd-wrt.com>
Date: Thu, 6 May 2021 05:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH] ath10k: remove TX lock from ath10k_htt_tx_inc_pending
To: ath10k@lists.infradead.org
References: <20190824134857.4094-1-erik.stromdahl@gmail.com>
 <20190917071202.3752F6016D@smtp.codeaurora.org>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
In-Reply-To: <20190917071202.3752F6016D@smtp.codeaurora.org>
X-Received: from [2003:c9:3f18:200:fc58:3081:5137:b06c]
 by webmail.newmedia-net.de with esmtpsa (TLSv1:AES128-SHA:128)
 (Exim 4.72) (envelope-from <s.gottschall@dd-wrt.com>)
 id 1leUYZ-000Gyy-2x
 for ath10k@lists.infradead.org; Thu, 06 May 2021 05:20:07 +0200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_202012_888862_CDF8FE52 
X-CRM114-Status: GOOD (  17.31  )
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


Am 17.09.2019 um 09:12 schrieb Kalle Valo:
> Erik Stromdahl <erik.stromdahl@gmail.com> wrote:
>
>> This commit removes the call to ath10k_mac_tx_lock() from
>> ath10k_htt_tx_inc_pending() in case the high water mark is reached.
>>
>> ath10k_mac_tx_lock() calls ieee80211_stop_queues() in order to stop
>> mac80211 from pushing more TX data to the driver (this is the TX lock).
>>
>> If a driver is trying to fetch an skb from a queue while the queue is
>> stopped, ieee80211_tx_dequeue() will return NULL.
>>
>> So, in ath10k_mac_tx_push_txq(), there is a risk that the call to
>> ath10k_htt_tx_inc_pending() results in a stop of the mac80211 TX queues
>> just before the skb is fetched.
>>
>> This will cause ieee80211_tx_dequeue() to return NULL and
>> ath10k_mac_tx_push_txq() to exit prematurely and return -ENOENT.
>> Before the function returns ath10k_htt_tx_dec_pending() will be called.
>> This call will re-enable the TX queues through ath10k_mac_tx_unlock().
>> When ath10k_mac_tx_push_txq() has returned, the TX queue will be
>> returned back to mac80211 with ieee80211_return_txq() without the skb
>> being properly consumed.
>>
>> Since the TX queues were re-enabled in the error exit path of
>> ath10k_mac_tx_push_txq(), mac80211 can continue pushing data to the
>> driver. If the hardware does not consume the data, the above mentioned
>> case will be repeated over and over.
>>
>> A case when the hardware is not able to transmit the data from the host
>> is when a STA has been dis-associated from an AP and has not yet been
>> able to re-associate. In this case there will be no TX_COMPL_INDs from
>> the hardware, resulting in the TX counter not be decremented.
>>
>> This phenomenon has been observed in both a real and a test setup.
>>
>> In order to fix this, the actual TX locking (the call to
>> ath10k_mac_tx_lock()) was removed from ath10k_htt_tx_inc_pending().
>> Instead, ath10k_mac_tx_lock() is called separately after the skb has
>> been fetched (after the call to ieee80211_tx_dequeue()). At this point
>> it is OK to stop the queues.
>>
>> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> What hardware and firmware versions did you test this? Please always add that
> to the commit log.
>
> As Erik mostly works on SDIO I assume PCI is not that well tested. Has anyone
> else tried this?
i can tell you that we observed the same issue on 10.2 qca988x pcie 
chipsets. see my patch from yesterday.
but we are testing now if this patch here provides the same solution.

Sebastian


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
