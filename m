Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3376C4332F
	for <ath10k@archiver.kernel.org>; Mon, 13 Nov 2023 17:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=naLqUhDVmO057y7mc0T5GIxF84ahZfl+ZgFK2kK+25M=; b=qGMH9hTt5bLgvC
	/dbNuZPfx58EUXI3Ptoue/vjojonXcMQuqknpArl2We9FCp2u9QZklIsmeUX3yr9wSa6yQgIM0eSg
	4DPkTZbkpq6Bbs2wYqZTaq2LfVtmILHrKpngSGCJOyz8KwulqMuNCNF1/Hz5ftbCcgqKLpnUooNsv
	91TS+aAmediP+eyr3YkG/0DpKTcvczepTX/XB0swx8VgB6cMZ8jKaDj4wtSB4ye6yfHEkT/G0oIVM
	gwYPv/MCnz0G0SJ/e6sVhyK9yiWr1i1X9Nu9ZQ4qC0OXShA7mNmWrGla1CxHQBti6VZdR0Zg0f6g/
	fRsbXiQiMGHLS7f32RDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ajJ-00EOOS-2S;
	Mon, 13 Nov 2023 17:28:09 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ajF-00EONp-1u
	for ath10k@lists.infradead.org;
	Mon, 13 Nov 2023 17:28:07 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-778940531dbso291601885a.0
        for <ath10k@lists.infradead.org>; Mon, 13 Nov 2023 09:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699896483; x=1700501283; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/EarQGfQ0KH88cQ3Er8HRbPWgpdJJF153yZq1brBck8=;
        b=J6L5CLZk/jfxSc4zyTX1+a8py0kidiZjvt5yeziEKqFqoC9hmjHp8n5ECMGUeAgKAf
         BHUzHL+wFlbbZ0OunCj+tN3DVoh+wQ6UmpCkmbvkDF3SZIMZJHrTWtIucCDeuqY3Ipm1
         bp8RWFBoUlIW6DrugGHyIPPs3To0e+uIs04KZZIXSvYd/UgsjGyyh9ckzMmyide5OFVX
         0SuvclKzZHbpfN6b02nSfkfpGVb84G2Wmo+Dpk9a/+DhC5E/3jrrw7mpQkf8cGjBnirr
         EqPFhAv3xmEoaaaA7B34jByahFaG1bjIFJewGRmJqCABcipHYXpZKWMwFEBA7v+lA3dF
         wdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699896483; x=1700501283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/EarQGfQ0KH88cQ3Er8HRbPWgpdJJF153yZq1brBck8=;
        b=fwsl6KcgtDcz7MWjjkbr8XWEmPJPAASDkNV059y7fTtqegA5It+BtN5TMUUp0DrJf/
         V2UTQEyYsxcbbXQqwBtu7HG9vuM5kZYswDqOIwIh5MkGx6UEWau2mQ8lxJh7xjqqV10S
         OmS4citCoXMD7jfSknAjQshxJJLZwfNgh5sVrMS3d1nvPDR7kG0btHnv+IYL16X2TrYV
         y5I9mg3Gal573dMWqOIpHLP6DetgbwyULa2pEfsF1H9nXPajBNJyS5I4tA7QbRkrAswL
         b1ECPj9YU0QbW+qZLO939Mjis9D82y8+NNnMf/zIvDVd0HPZGdDvw86sNa5/TcPaH564
         7Pjw==
X-Gm-Message-State: AOJu0YzgZbbDgvq0fJsYM8Nh7hapzbpZ5MoaES6vZ4m3tLyQjIHrRl7d
	cUaNoPJnLgw1Yd4SsGdTP+VBBblGdXg=
X-Google-Smtp-Source: AGHT+IGE/1eojiQegF8+4bmXQZtU4gDC72j33RpKCrCxQ3JV49iP+/bv8GL7uB/H8f5EDgdMA8pWkw==
X-Received: by 2002:a05:620a:1789:b0:76e:f62e:45cc with SMTP id ay9-20020a05620a178900b0076ef62e45ccmr8904193qkb.32.1699896483510;
        Mon, 13 Nov 2023 09:28:03 -0800 (PST)
Received: from [10.102.4.159] (50-78-19-50-static.hfc.comcastbusiness.net. [50.78.19.50])
        by smtp.gmail.com with ESMTPSA id qk6-20020a05620a888600b0077a02b8b504sm2011839qkn.52.2023.11.13.09.28.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 09:28:02 -0800 (PST)
Message-ID: <2033c16c-4d9a-4592-bb81-7a9ad7821576@gmail.com>
Date: Mon, 13 Nov 2023 09:27:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: add support to allow broadcast action from
 RX
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20231017165306.118779-1-prestwoj@gmail.com>
 <169989062657.3473659.188127753057713210.kvalo@kernel.org>
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <169989062657.3473659.188127753057713210.kvalo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_092805_650005_99E9A2DA 
X-CRM114-Status: GOOD (  10.94  )
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

Hi Kalle,

On 11/13/23 7:50 AM, Kalle Valo wrote:
> James Prestwood <prestwoj@gmail.com> wrote:
> 
>> Advertise support for multicast frame registration and update the RX
>> filter with FIF_MCAST_ACTION to allow broadcast action frames to be
>> received. Broadcast action frames are needed for the Device
>> Provisioning Protocol (DPP) for Presence and PKEX Exchange requests.
>>
>> Signed-off-by: James Prestwood <prestwoj@gmail.com>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> 
> On what hardware and firmware did you test with this? As there's so many
> different combinations in ath10k we use Tested-on tag to document that.
> 
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#tested-on_tag
> 
> As ath10k hardware and firmware can work very differently from each other I'm
> suspicious if this feature really work in all of them.

I only tested on a QCA6174 (and I'll add Tested-on for that). This makes 
sense and maybe enabling unconditionally for all ath10k hardware is the 
wrong way to go about it.

Since I don't have the ability to test every hardware combination 
hopefully someone from atheros can chime in. Is there some 
firmware/driver value that can be queried which tells me if broadcast RX 
is supported? Or if not is checking ar->hw_rev == ATH10K_HW_QCA6174 good 
enough? Or are there sub-variants that may or may not support this?

Thanks
James

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
