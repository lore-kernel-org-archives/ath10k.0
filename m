Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE56C433FE
	for <ath10k@archiver.kernel.org>; Wed,  8 Dec 2021 14:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7OzkCCKXy8R+E6+toHoKE3bOZQ11Dj4eQb/sCt7qKhw=; b=vOcanH/59UAiWP
	ieio/23fsWTq/8FQbz9EKukHdfar077YOXm1hHJe54f9iNKO/TUqXu0nziRwRpA48SHBQ9C+g9lc0
	HwIgryheR9238fDA4GjYE+uQqE+uXc4lJ8H46rGqDAm2FbGwHHlCJWpnrg/xCHP2UxqMahBa6WgTb
	kQmzOqKTI+S8iLVnUqHSu1wsJ62/YpUFq9/b+rNyTJ+UWQ0Fa1EghFlJFepqmC0+EtIKyDuzWZHpE
	M/o06A+WnXOr999adVXsYT7YIoTdONkaCE0y8Il1bpUWQt8LTpFjx99mcmIHWqRTeNBLMDlGCMMDj
	BrfuasHLIlY53ayRglXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muxba-00CvTW-Bu; Wed, 08 Dec 2021 14:07:34 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muxbX-00CvSY-60
 for ath10k@lists.infradead.org; Wed, 08 Dec 2021 14:07:32 +0000
Received: by mail-wr1-x432.google.com with SMTP id a9so4272986wrr.8
 for <ath10k@lists.infradead.org>; Wed, 08 Dec 2021 06:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=flO2O8RvdMi4zDyJ0phVtOeQZBpULAZ1IhqXyVEqyzA=;
 b=Egk86bCKE8ZJa9Cxbm7c7hc3MxfwwPpQfeTlLF1zqfn9EQxmPANDyOI9rBxigF1gBy
 z0FE1yf7TsZp7sXnDofJIAaW3rKF5aWJTc2kZHUF/+hZGbcz89t52kGQ+4inbIqHUxA9
 clPpkb7qZ3s+Try2LP26Z+XTyvMinh/mBP8uXl4PW56FpmeQJsCaW6UMLdXT2YjiNy7F
 kWjZJyTJ9lLjPyC6KqoZyjfNEZnCLMSfz+diNnPIKVPeSN0AxW7wOc/ca8xCQQZTLAVT
 Sthi0dRPwE9h0DAZ6lxO+R/qjVfz3vrj7Uv77+3ZPG6bRQFgGSjejt76DkRKR0EIjOEL
 MTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=flO2O8RvdMi4zDyJ0phVtOeQZBpULAZ1IhqXyVEqyzA=;
 b=VM/W9o4+HikaRykLKqK6GHgPONqfEq/TIb2FppuQ/zB/UzE6FU4JsZLMTl9A2KNH1A
 K/Ytfh2RzdygEvq6CGDHcRuLX7FdB+WzEvViO33XJ1Fnl72GO0vZ47yb4/z5zKV8VPyH
 /XwQVq3+NEfJEkMwdUl50UNa/LiQl4vxyiBV76wXuZ9CjD0iTKAN0rW/XxrxRiZ1VO6B
 WhPOBNHhxSAq8JDQWapk2hNEbTJgX4wyOlAn3ZyRYquFK06lYf+B/O95s3vk451Y+e0i
 +Pr1vEIF01Uy+r5dbJx8ZXJ+EARo783Ln2DyJ2UOH5bScMMjHQSPha3i6/8Sko788CBf
 CEaw==
X-Gm-Message-State: AOAM533vKihe8a0x0jdTpLstIuZ7JqHQVAQomJ6/e9Nks9CPw4KJg0BZ
 hFgfB8QPQHFgUySWgnDiHYhLl3MHvjA=
X-Google-Smtp-Source: ABdhPJxwrd+qCdOIbLO5MeObmUldpC0bKJPA1DSjSX0ZaTkODCFhRslJ7yErIE3qwCprCkUf/wLWgw==
X-Received: by 2002:a05:6000:181:: with SMTP id
 p1mr60216470wrx.292.1638972448449; 
 Wed, 08 Dec 2021 06:07:28 -0800 (PST)
Received: from debian64.daheim (p5b0d797a.dip0.t-ipconnect.de. [91.13.121.122])
 by smtp.gmail.com with ESMTPSA id c10sm3101318wrb.81.2021.12.08.06.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 06:07:27 -0800 (PST)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.95)
 (envelope-from <chunkeey@gmail.com>) id 1muwdv-0008Oc-Ou;
 Wed, 08 Dec 2021 15:07:24 +0100
Message-ID: <09a27912-9ea4-fe75-df72-41ba0fa5fd4e@gmail.com>
Date: Wed, 8 Dec 2021 15:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] ath10k: support bus and device specific API 1 BDF
 selection
Content-Language: de-DE
To: Robert Marko <robimarko@gmail.com>, Kalle Valo <kvalo@kernel.org>
Cc: kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
References: <20211009221711.2315352-1-robimarko@gmail.com>
 <163890036783.24891.8718291787865192280.kvalo@kernel.org>
 <CAOX2RU5mqUfPRDsQNSpVPdiz6sE_68KN5Ae+2bC_t1cQzdzgTA@mail.gmail.com>
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <CAOX2RU5mqUfPRDsQNSpVPdiz6sE_68KN5Ae+2bC_t1cQzdzgTA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_060731_259966_8BAAAF3E 
X-CRM114-Status: GOOD (  19.48  )
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

On 08/12/2021 13:21, Robert Marko wrote:
> On Tue, 7 Dec 2021 at 19:06, Kalle Valo <kvalo@kernel.org> wrote:
>>
>> Robert Marko <robimarko@gmail.com> wrote:
>>
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
>>
>> Can someone review this, please? I understand the need for this, but the board
>> handling is getting quite complex in ath10k so I'm hesitant.
>>
>> What about QCA6390 and other devices. Will they still work?
> Hi Kalle,
> everything else should just continue working as before unless the
> board-bus-device.bin file
> exists it will just use the current method to fetch the BDF.
> 
> Also, this only applies to API1 BDF-s.
> 
> We are really needing this as currently there are devices with the
> wrong BDF being loaded as
> we have no way of knowing where MikroTik changed it and dynamic
> loading would resolve
> all of that since they are one of the rare vendors that embed the
> BDF-s next to calibration data.

Isn't the only user of this the non-upstreamable rb_hardconfig
mikrotik platform driver? So, in your case the devices in question
needs to setup a detour through the userspace firmware (helper+scripts)
to pull on the sysfs of that mikrotik platform driver? Wouldn't it
be possible to do this more directly?

Cheers,
Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
