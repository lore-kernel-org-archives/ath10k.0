Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBF5C6FD1C
	for <ath10k@archiver.kernel.org>; Tue, 14 Mar 2023 13:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJLDL1u/u5eTH3MYBlFjy2Q9nwIDEdI5Pw4mFWYztUI=; b=Cz0O+/JzHEJrih
	Iq21a3imG+1MbXXos9RA4mt9J/ZRQqKxfyEu9yizOiOhomvQ7T/Pq93e0hkUd7UqIf8dmypowFYII
	MVyio9bub2QJyPPHElRhgJ64ixu0C0GzdqfnokSgNVQ/5KtGL0eNBxpfVSYoRWypvQuMuHvHJveER
	2fp8E1OCS5N0PsiNuDkbkV0hPYSsWmGv2S7gLoiFuOcK8FtYwSFpoS/CA3ax20eI+j3gZjJasSdUj
	Zh5PIpkNqdJXiU7GHi2t+VXRD2cQpQtL2FJCtHOqzTtepYArtyeALc/+r1A+BkWSM8PhQg3keBAUB
	7ivVKSs1FlM9mqYrP9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc4Fu-00AEns-2a;
	Tue, 14 Mar 2023 12:59:54 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc4Fs-00AEnH-0B
	for ath10k@lists.infradead.org;
	Tue, 14 Mar 2023 12:59:53 +0000
Received: by mail-ed1-x535.google.com with SMTP id ek18so30513960edb.6
        for <ath10k@lists.infradead.org>; Tue, 14 Mar 2023 05:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678798789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vOvlS9sNnIAgMeiZIPQKbYtFPVSiHJBUwPLfTIY6Uq8=;
        b=l/GMyLsSNlEI1ncXHpAGoyfpP8t/0JsG2vUswVrn3T6jLx/ClNO00bRJuRZCHFjnRf
         jp0cp24Y3yimd7t/ajg+yyhdSaQLd0RhmqTuzPnBFVzw/MmN1erFp58bZNVP0f2qzsX7
         LlovXuQ4fYxUoUXbhFvY2lO73attcWOI6UORg+JIO0Xa8RwC6xi28ZFHNHvrH5IH90gg
         9FT72cu7hIkDMv6UYNuJ2PZj2O3KBe9+Qab3XEBUTlYEToPbRmfMIftmSQ3UbLnOphjJ
         I0B9+tjxUmHWN4wm0FtNd2Tcwn8B+aDT4PtKt2IYlSLZha5tAIqIoctoN4iXM+5pKc0/
         kkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678798789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vOvlS9sNnIAgMeiZIPQKbYtFPVSiHJBUwPLfTIY6Uq8=;
        b=YWuDCYDmO9iFigyJ953lUEd4iiSgyOjt4FBPs5mEFiI9MssdZ4VIELyDLoiXqhoI7q
         IznMMdZC6tSjhCqlX1lSX3rtrSa4RxwahthS9S5Ek5tij3+Km766HfskbJPVdD7XSVdk
         rdH1XzU0oVbwNQEY7IoQLuClZ0paY0oSUl4VnVQ3D381QYZqkbGbF+oiN31wiUgmfU3Z
         MQbLe6SR5EVccvLDqKAKgmvPXCyEFP83O+PLMVmeSpvKewq8MzEdgk/CwTv02nlb78F9
         kluUy/qiJdFOlRAjcctO0PZmzR+T9bbzIvJefDE7oyldZ8nKny0QMUXoDZMgix8Az1AC
         Epmw==
X-Gm-Message-State: AO0yUKWHsid3jw7qrhFoajbogtpsW8N8VWjEVmzer984lf8WROxfO7DN
	1fDKcw1DtFGv/tcvJaX9HYM=
X-Google-Smtp-Source: AK7set8PFmSkHtNOh7s02YAOdDNYllsLU9pj8pSCnyBE/jBVSNveBkc6BoztdE8/F9AuUBqUpsutfA==
X-Received: by 2002:a17:906:6150:b0:8df:8381:52f7 with SMTP id p16-20020a170906615000b008df838152f7mr2368916ejl.17.1678798788783;
        Tue, 14 Mar 2023 05:59:48 -0700 (PDT)
Received: from shift (pd9e2911a.dip0.t-ipconnect.de. [217.226.145.26])
        by smtp.gmail.com with ESMTPSA id y4-20020a170906558400b008bfe95c46c3sm1106256ejp.220.2023.03.14.05.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 05:59:48 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift with esmtp (Exim 4.96)
	(envelope-from <chunkeey@gmail.com>)
	id 1pc4Df-0005AQ-2T;
	Tue, 14 Mar 2023 13:59:48 +0100
Message-ID: <97b7f35c-f7c9-1257-ff67-e5b61efe0ce0@gmail.com>
Date: Tue, 14 Mar 2023 13:59:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230215
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org
References: <878rgzuw37.fsf@kernel.org>
 <c9ccbfe1-9535-f46c-756e-4eb19c1afbff@gmail.com> <87a618517g.fsf@kernel.org>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <87a618517g.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_055952_115189_6D962358 
X-CRM114-Status: GOOD (  11.42  )
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

On 2/20/23 06:56, Kalle Valo wrote:
> Christian Lamparter <chunkeey@gmail.com> writes:
> 
>> On 2/15/23 10:17, Kalle Valo wrote:
>>> Here's a new pull request for ath10k and ath11k. We have new hardware
>>> IPQ5018 and various updates for existing hardware. Especially many have
>>> requested the firmware update for WCN6855 which seems to fix an
>>> important suspend problem.
>>>
>>> Please let me know if there are any problems.
>>
>> Could you also please include all the QCA9888+IPQ4019 boardfiles updates
>> from last year too?
> 
> I will try to go through them later. The problem here is that I don't
> have much time for ath10k nowadays.

Ok, should I just post the board-2.bin updates to linux-firmware?
I have them ready to go for IPQ4019, QCA9888 and QCA9984.

Cheers,
Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
