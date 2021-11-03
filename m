Return-Path: <SRS0=Iu+e=PW=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9501FC433F5
	for <ath10k@archiver.kernel.org>; Wed,  3 Nov 2021 15:02:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58BBB6103B
	for <ath10k@archiver.kernel.org>; Wed,  3 Nov 2021 15:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58BBB6103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=squareup.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OGQOWsjPBzQJ7JXYER/jO4n9s16Lfjz5pCNV4Q1EgWE=; b=4uXCKtV7H4EvDCU/dSbK+NrnZG
	iWnYf5jL6NJr+7hIwgs0Qcq33d02ztr8qmqyZgEYjvtRcQjCt170p4EBSQAEeJwg1S8gywVUfmDEI
	JNPoS42glVK83xH4UfmuymfPgT1wi80zgHkqqptrKBLCyztOQGjVl6u/VL6gJIkNcPNXHebrYYn9o
	XISqHSAESy3kTNuIFMCQTgSSIHePp/JOI3mqe5CuBI5uthD/J5Thd6ZcF2/VB27hIwV7/VXP+UjTJ
	1NjaB9TevwRGEyYhXPxePeGeIWeLdqaa54Tm56Nv/PSJY8FdJB+cNnT8on6EOuSXyUxpfuu7NU02W
	KEIph5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miHmm-005W3Z-JC; Wed, 03 Nov 2021 15:02:44 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miHmj-005W2c-Dv
 for ath10k@lists.infradead.org; Wed, 03 Nov 2021 15:02:42 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so1609680pjl.2
 for <ath10k@lists.infradead.org>; Wed, 03 Nov 2021 08:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squareup.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2skVWyVpmkbERUsvfy2J7WTVhYtKb188XJDQUdHINz4=;
 b=GxT/8w0KRn5dD7naLgVl4pAgP/7zkEhmBrEeqxhcPPnk/buEzQZHQX6hXSfqisdkEW
 Yco2wbIyHxfVnfCnJdEQVcQhaaJ6NfNfAVRLmIYDy0Agrh3HfmSwBjvrsGPgLmRQLq6G
 fiE+R4x3MVNGP0Xb69mJyDKtC8tVvm7r0xa6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2skVWyVpmkbERUsvfy2J7WTVhYtKb188XJDQUdHINz4=;
 b=Kh3j5DVN9Trd80WzFGs893y344MTS1s9VCzyPKoUaG7+j3DdobjLA3fgDVgfdKHURW
 YR+EKru0AITU4N9G6iP1ce5q5Lx0UqJ90VgibI9atC5JQUOR68jTJmMBXtx80gSilSSM
 HsvP2qu6XWIJ8Ll4qzMI7JJDoEWn0uxgcZkYIzpJEhXzvGQUdrZ8c7Co3i9juuHtbNdV
 vS7nTTLvFFAhh+wjUM/bhBYSXF+lJNdgJTiqSljjlYw1eAA/yC8hTX8CuYVz5f1bY9Oc
 jPelN7BD2n8Kau2DIXFzVeNRluPTtiPnE9SBaoNc62k6JOZvBoVdOYqcmHaQPpKiMDzG
 IDJw==
X-Gm-Message-State: AOAM530knw6ySp/AAoB978VTYGaYRJIRXfxhBHrYkxYoQ63QG7hDC1VR
 6Ldoqwti/H+hWK3KR6CUbWpEyj76dtgpwQ==
X-Google-Smtp-Source: ABdhPJwX5+LrQqsIDLk31RUnlL+p6GFNCqwRL75YQ4UBT16Haz3Q17yK/pk+xR8gXjt5r5fZs5gqgg==
X-Received: by 2002:a17:90b:357:: with SMTP id
 fh23mr15253494pjb.238.1635951759413; 
 Wed, 03 Nov 2021 08:02:39 -0700 (PDT)
Received: from benl-m5lvdt.local ([2600:6c50:4d00:d401:d8a:3314:9c20:7eff])
 by smtp.gmail.com with ESMTPSA id q19sm3130576pfu.147.2021.11.03.08.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 08:02:38 -0700 (PDT)
Subject: Re: [kvalo-ath:pending 53/53]
 drivers/net/wireless/ath/wcn36xx/txrx.c:275:42: error: variable 'sband' set
 but not used
To: Kalle Valo <kvalo@codeaurora.org>, kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, ath10k@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <202111022135.B8TpALyf-lkp@intel.com>
 <875yt9sm1o.fsf@codeaurora.org>
From: Benjamin Li <benl@squareup.com>
Message-ID: <4a89c51c-cce3-1c19-d456-3761e8215600@squareup.com>
Date: Wed, 3 Nov 2021 08:02:37 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <875yt9sm1o.fsf@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_080241_784888_295396E7 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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

On 11/3/21 1:03 AM, Kalle Valo wrote:
> 
> This is a warning in the pending branch. I'll drop this version,
> Benjamin please fix the warning in v2.
> 

Will do.

Ben

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
