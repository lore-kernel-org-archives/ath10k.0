Return-Path: <SRS0=RSRu=PC=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF87C433EF
	for <ath10k@archiver.kernel.org>; Thu, 14 Oct 2021 13:24:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45EBE60E05
	for <ath10k@archiver.kernel.org>; Thu, 14 Oct 2021 13:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45EBE60E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyGLzwza1sqH0d4TSEhNCURHkGe+7AQYaH9qBSYlbWw=; b=OmL7UO+HiGmvdcF4ShiFlaBWGb
	ofCHftThlCG4RW5UCxpmnIAsi4WqNRa6hFLBak06r83GowWH7nFzHrBXjQpR6MvJB3kkcgVDVUpvN
	p/vVACrVCz+mHP5F5Lid1PYUAF8oDDaFmSlPJgwTFqpFDWvHQQkyn4DyQv3h2WIv7+AAuAmcxG/cK
	CUksmxWOco78xLi+lRr7c02hYLgRR5Z+FUiKc+XB9Zmv094KLTfqKcwHJ3wtu+AzZtvZpmOmUlyuk
	fhCzB4S44Ged2M96/yHupCnItJwq7loH9ACpNS9ZcP4Iwxa0p+m07xpFq6DfgkEQl/P1ZROS0cLWm
	8x2B0FJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb0iB-003E4i-Ci; Thu, 14 Oct 2021 13:23:55 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb0i8-003E3J-1a
 for ath10k@lists.infradead.org; Thu, 14 Oct 2021 13:23:53 +0000
Received: by mail-wr1-x429.google.com with SMTP id t2so19463866wrb.8
 for <ath10k@lists.infradead.org>; Thu, 14 Oct 2021 06:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dn8qntTXephimx3LoXkKaClxMq8rV7tTytuW+aAxGys=;
 b=TG4gKWLEl1HWM00/cvFeOgDj8WQYP1KCzXTGjFb7rZem/+WkoOb/xrGrkjvQRt7diq
 zd8viGl3L5J9hmO2rGfQHR1gaQlNNR6UTGuKzPZLn8Xs5/JuRGRrK0ZWgPiDSpWLdPHv
 DFfuIRHxQyvIHvztCAbcge5bZnpVDD1Lftk2hgMHufVFAFu3yOYsLA8ylcyzbkxTjEPV
 XObLkUZnCoisWw1iprA8xD93a1QCc/ClQ0rqa/f/+wAVOssgskUwMkvT3YdnPlViC02L
 gDuC6t1ugWwTWQNrILpaLsLBd9Eu0phGP8FW0E0kdaySSPMPPrCdltzLOlh+sqzFadVf
 /iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dn8qntTXephimx3LoXkKaClxMq8rV7tTytuW+aAxGys=;
 b=W5TYvI93W5FqSfgdKsmEJwIy+4gKNcgZyplCCPENOTs4EU6k9CHOJsH5WEKPx0Moeu
 gZkK6nYEMe/eGmmPH85wJKWEHSk/4Rm8V7/+mhGUTyABeEd9ASSrnHgXsHcLk2gM5ZN/
 /HlCy2PqZR50MzOfflEqBJNxLgzxW+Gg2tx1GYBfQFlIoIyFE6cYJ8HswGmbCWT32jW7
 pOrwbP8CANn/b50/JNCBi/gNQykYiO8LFOEDstz+KH1JijlGIUHZme4D6gNDHeYQn8ca
 2wAeDjTE/sg2fKt4YX7azevMk1x58AdBvtU1jXENJNGeZMmkF3x4KonpqZn3WyCV05fL
 QgpQ==
X-Gm-Message-State: AOAM533Xy8T5uucYvxi1KQmszKY0va/oaezqMndHBLa0K7WJjAgQxwzC
 jDrQztiAPPKBf7bmo1V4p9kij0Pm/ME=
X-Google-Smtp-Source: ABdhPJwSNoISoB6WHeruIs45RWZovGTfzvBYWEZ6vwQ1mL+wE7qCVNKa0oLduAeRRzzdMAyifMikeA==
X-Received: by 2002:a05:600c:1c88:: with SMTP id
 k8mr5782455wms.169.1634217830036; 
 Thu, 14 Oct 2021 06:23:50 -0700 (PDT)
Received: from debian64.daheim
 (p200300d5ff0f7400d63d7efffebde96e.dip0.t-ipconnect.de.
 [2003:d5:ff0f:7400:d63d:7eff:febd:e96e])
 by smtp.gmail.com with ESMTPSA id f186sm7823662wma.46.2021.10.14.06.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 06:23:49 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.95)
 (envelope-from <chunkeey@gmail.com>) id 1mb0i5-0009Kt-2o;
 Thu, 14 Oct 2021 15:23:49 +0200
Subject: Re: [PATCH] ath10k: support bus and device specific API 1 BDF
 selection
To: Robert Marko <robimarko@gmail.com>
Cc: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
References: <20211009221711.2315352-1-robimarko@gmail.com>
 <ba520cf0-480e-245b-395f-7d3a5f771521@gmail.com>
 <CAOX2RU7VaxdU3VykTZER-pdpu6pnk3tbVrBmkGU=jPQo6rL3Xg@mail.gmail.com>
From: Christian Lamparter <chunkeey@gmail.com>
Message-ID: <0180909b-1c62-208d-3dce-7ac34dbd584c@gmail.com>
Date: Thu, 14 Oct 2021 15:23:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAOX2RU7VaxdU3VykTZER-pdpu6pnk3tbVrBmkGU=jPQo6rL3Xg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_062352_173065_BCDA1B69 
X-CRM114-Status: GOOD (  22.20  )
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

On 14/10/2021 14:01, Robert Marko wrote:
> On Thu, 14 Oct 2021 at 13:54, Christian Lamparter <chunkeey@gmail.com> wrote:
>>
>> On 10/10/2021 00:17, Robert Marko wrote:
>>> Some ath10k IPQ40xx devices like the MikroTik hAP ac2 and ac3 require the
>>> BDF-s to be extracted from the device storage instead of shipping packaged
>>> API 2 BDF-s.
>>>
>>> This is required as MikroTik has started shipping boards that require BDF-s
>>> to be updated, as otherwise their WLAN performance really suffers.
>>> This is however impossible as the devices that require this are release
>>> under the same revision and its not possible to differentiate them from
>>> devices using the older BDF-s.
>>>
>>> In OpenWrt we are extracting the calibration data during runtime and we are
>>> able to extract the BDF-s in the same manner, however we cannot package the
>>> BDF-s to API 2 format on the fly and can only use API 1 to provide BDF-s on
>>> the fly.
>>> This is an issue as the ath10k driver explicitly looks only for the
>>> board.bin file and not for something like board-bus-device.bin like it does
>>> for pre-cal data.
>>> Due to this we have no way of providing correct BDF-s on the fly, so lets
>>> extend the ath10k driver to first look for BDF-s in the
>>> board-bus-device.bin format, for example: board-ahb-a800000.wifi.bin
>>> If that fails, look for the default board file name as defined previously.
>>>
>>> Signed-off-by: Robert Marko <robimarko@gmail.com>
>>> ---
>>
>> As mentioned in Robert's OpenWrt Pull request:
>> https://github.com/openwrt/openwrt/pull/4679
>>
>> It looks like the data comes from an mtd-partition parser.
>> So the board data takes an extra detour through userspace
>> for this.
>>
>> Maybe it would be great, if that BDF (and likewise pre-cal)
>> files could be fetched via an nvmem-consumer there?
>> (Kalle: like the ath9k-nvmem patches)
> 
> Christian, in this case, NVMEM wont work as this is not just read from
> an MTD device, it first needs to be parsed from the MikroTik TLV, and
> then decompressed as they use LZO with RLE to compress the caldata
> and BDF-s.

For more context here (it's unrelated to the patch):
There is more custom code than just the mtd splitter.
I do fear that this could be turning into a dreaded "separation between
mechanism vs policy"-proxy discussion with that in-kernel LZOR
decompressor/extractor and the way that the board-data then has be
rerouted through user-space back to ath10k.

---

As for the proposed feature: Yeah, back in 2017/2018-ish, I would have
really loved to have this "load separate board-1 based on device-location".
Instead the QCA4019's board-2.bin is now bigger than the device's
firmware itself. From what I can see, there are also more outstanding
board-2.bin merge requests too, though some those are updates.

Cheers,
Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
