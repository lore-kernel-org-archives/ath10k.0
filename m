Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F034C4345F
	for <ath10k@archiver.kernel.org>; Mon, 29 Apr 2024 12:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5ObQUawk4bBPAvuBrfxrzADUeMiB8LDSsILFpaCSJ8=; b=wXzFLjeXZ9JRdoCZ6GhWVZlJEf
	nb15yfof8iLqF758/wreZCRiP+TvJipivrprBwkwykAkmJgnJUdgg+NjE7DMl+9GXSFoP3kkTWJHs
	mYp8iEpVCVUOcCAVcUSzCUsLqssLwdZfeNY2MjVb02OvRGpVP7ncugoNp+w+2uVOQW6Q63WtQUMUm
	9UGtdxMLBp9g7iXhdq4wfra++pzNHehUoyw0HEYccuMt4s5tpaS2CejE2VFQK7zzKa0h0KVOSF71n
	1UZcnMUn3VlLzeZc1ZocJ1zUTqH8rIEEFJuZ6fa4hgTJpUKST631EoaBSw0pdnZ9KBlfSa3k2khBJ
	kSOGYrHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PyO-00000002g20-1rwT;
	Mon, 29 Apr 2024 12:19:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Pxh-00000002fa5-034u
	for ath10k@lists.infradead.org;
	Mon, 29 Apr 2024 12:18:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA3B960D14;
	Mon, 29 Apr 2024 12:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3AF6C4AF1A;
	Mon, 29 Apr 2024 12:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714393103;
	bh=9eG3SrbqQjV5Mve97C2DhYlNj+/kiaTHcf0KhVhPJr0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kVL0gNr+haNcoRelGOfNz+wat9xjltYhrN0QhqAyYQbzhKWYYpnxfnFR19QqLdu5Q
	 XVzW+ovIU1O7m+DvK5ApXnnhUAjfjS8Hply2ve7+H1cq+CYbdjjcooCdIDeHfms9vZ
	 0W8X0iKNa4LKZ5JY+TfHBsRLy/8X5VcO8Qn0IL75CqdRfIlH6jyJTKv/LMRpwicT8z
	 wJhMkWtH/o+amzehgFSmTrst2KIPE1Eaf7K4TgOHA3wnoSnujagXdAdsS/ScfJN0NM
	 8Oc6zFOFuGost7KN0c0kLMH6OCMMmGUrHT18k1QowyoGuFHTdk75KVtH6bBvFiNRT4
	 VtZo9ABlVwvTQ==
From: Kalle Valo <kvalo@kernel.org>
To: Eric Park <me@ericswpark.com>
Cc: ath10k@lists.infradead.org
Subject: Re: QCA6174 showing terrible performance when connecting via WPA3-SAE
References: <2b4e20fa-3c76-4800-b872-f5d20b0cfe95@ericswpark.com>
	<87r0ghf4rw.fsf@kernel.org>
	<a1231edb5e12283f6f5fbbf9e0ba7af8@ericswpark.com>
	<87wmolsrcc.fsf@kernel.org>
	<eb86c5b7-b1b6-4515-afdf-cf3e78a79df2@ericswpark.com>
Date: Mon, 29 Apr 2024 15:18:20 +0300
In-Reply-To: <eb86c5b7-b1b6-4515-afdf-cf3e78a79df2@ericswpark.com> (Eric
	Park's message of "Sat, 27 Apr 2024 23:04:16 -0400")
Message-ID: <87o79sfjlf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_051825_408725_A201688A 
X-CRM114-Status: GOOD (  24.94  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Eric Park <me@ericswpark.com> writes:

> On 4/25/24 5:51 AM, Kalle Valo wrote:
>
>> I do not use Network Manager or other connection managers when testing.
>> It's much more reliable to use wpasupplicant directly and you get full
>> control. I usually create a custom config file and then start the
>> supplicant manually. Some pointers:
>>
>> (...)
>
> I had some time today to test this, but unfortunately I couldn't
> figure out if wpa_supplicant was using WPA2 or WPA3. Trying to connect
> via `key_mgmt=SAE` caused `dhcpcd` to time out looking for carriers,
> so I guess it was connecting via WPA2. In any case the speed results
> were the same as disabling WPA3 on the router-side.

If you run wpa_supplicant -dddt (or similar) you get a lot of debug
output, I'm sure it will also include the cipher.

> The reason I'm sending this email despite not making much progress
> above is because it turns out I was chasing a red herring. The real
> problem behind the degraded throughput was 802.11w. The router was
> advertising support for it (802.11w capable but optional), but was not
> forcing clients that didn't have the capability (required mode).
>
> In Optional mode, I was experiencing the degraded performance. But
> after I disabled 802.11w on the router side, the speeds recovered to
> normal levels on both 2.4 GHz and 5 GHz bands, even connected over
> WPA3.
>
> So I'm guessing something on the driver's side is signaling that it
> supports 802.11w, when in reality it doesn't or some bug with the
> implementation causes the speed to drop. Or maybe there's an overhead
> I'm unaware of when 802.11w is enabled? My limited understanding of
> 802.11w is that the management frames are protected to prevent deauth
> attacks.
>
> I'm not sure where to begin troubleshooting this, but in the interim
> can I disable the capability advertising on the driver-level? I don't
> want to disable 802.11w on my entire network, if possible.

Very good that you found this is 802.11w related. What is the make and
model of your router?

I don't know how well ath10k 802.11w support is tested and then it was
last tested. Do you happen to have other Access Points supporting
802.11w? That might help to pinpoint if 802.11w is completely broken in
ath10k or if this is an interoperability issue with ath10k and your AP.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

