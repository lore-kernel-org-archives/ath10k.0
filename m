Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E19AC433EF
	for <ath10k@archiver.kernel.org>; Sat, 26 Feb 2022 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ld7GQC83p9cvfKPt0GuJbNMm+64PaJS5gNdFjKYi0d4=; b=OFH2QCcZWPhpm4
	Bnc3N1XJLrNNZG83v0lb1W1xEe/+cd7wZp1+ILEVymJgODq8KMSEHEeg3e4MQaMyuUKWVlAXF7/pN
	ZweuF0OBa4zAqhwqv2Pw8BJI91+dCbdljqZoakehTzto66+gazuGoOLrtCv8ht8xbUpz4hgNHP9Zg
	0QdNCb4Wxw2fHj989pYNqrxwSrPLyStLHWsG1IBAzf8jv+bKc5/SzMNop6YckaI6+Ugoq7XFSJ+GQ
	BU0UFd7MVzMil18+aMDW+QKj6YtWH2HSO4FdRa7k4UNACYOcvRpVKU69DjNjRthUHbpmCNvxWLEim
	hAYvRmNcWp8C+onV5XJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nO06V-008FZI-9e; Sat, 26 Feb 2022 16:39:31 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nO06R-008FYq-8a
 for ath10k@lists.infradead.org; Sat, 26 Feb 2022 16:39:29 +0000
Received: by mail-ed1-x52a.google.com with SMTP id bq11so11559237edb.2
 for <ath10k@lists.infradead.org>; Sat, 26 Feb 2022 08:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eH77j8raadPVaGeR/XTLM6vHmIwKR9OlXjwbpcvIVEQ=;
 b=pqhtPA2ZEz+dhnL8Iw7rpagboZsjLyg+R0N791bjIzzO8EsFzOT5Kvj9+lfsumSbY1
 Pg+besS4B1pzKHAgkCopfJMCPyqa84pRmDMMmE+H4MLkKuGE9MxPvOXnLoS2wnjne2A+
 7tNHtX7oJ/e+pEsMniQN3YJXZY55DFQntxK4pTWPgy1pjCUZkQ6qVhUD1JdgmuukaDI0
 WIbBhJM+O9y2t+DpdPrwRx0OYWFx4ZAfezUPdX/BF5ii7LRC7rfEa0LuSo8eiDvMCqmI
 6D+2dVeaLu/z/qIKFtJg6X7XXiSOi8OXeCDB6txh1UuK5dcsu9eFeG6yHVk0UvSq2w+j
 b12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eH77j8raadPVaGeR/XTLM6vHmIwKR9OlXjwbpcvIVEQ=;
 b=qNmgYqKGjaWf003cJ4qHcbG0RafszPRlATc/NP4IcvuvgqMZ8pcKVtuHLMctm9g89H
 TRbsr0f+1q/bpEz+apitLk9JEUVkibhOehojhnjpnpwEc4HrL3alqUvijNn8pJgwqYWk
 LZDBEkv+BiZ9VpVI6RDvbLJNtaDySzRpO5LYHzUkMvApu+ljw3BowPUOsQOYMBxX7qtC
 VnEreHp2Mz5XLlUeCht47C+3zol9HMAqCxPK3Ain8Y/zgUVeCwZTG0ccgD+f+YBSaIj+
 TwlfSq1M/fxOQPo2MfmcUmQgl/n2mLpQGV4fXvgIIt8FvOgTlnZ18yyn3W0fo4RFq4jM
 VCEg==
X-Gm-Message-State: AOAM533Ng8LeYly/wZFRRoa+u9U9qgyhtpxnfWI0jPCvhOvF5OYcuzBJ
 XrTcxLvDeSWL6pSQtXqmBjaOVW0TChI=
X-Google-Smtp-Source: ABdhPJz+CyhmDrTOWZ1uH2qhHIWWO+6Z6qo5z7Swx3UcTpFuHmaS6sdtpGiWVwzCQDNJCdQzUiyvdQ==
X-Received: by 2002:aa7:d591:0:b0:411:6c4f:1725 with SMTP id
 r17-20020aa7d591000000b004116c4f1725mr12014177edq.342.1645893565007; 
 Sat, 26 Feb 2022 08:39:25 -0800 (PST)
Received: from debian64.daheim (pd9e29a04.dip0.t-ipconnect.de. [217.226.154.4])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a509357000000b00412b325b05fsm3003164eda.74.2022.02.26.08.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 08:39:24 -0800 (PST)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.95)
 (envelope-from <chunkeey@gmail.com>) id 1nNz9I-0007KG-Mr;
 Sat, 26 Feb 2022 17:39:23 +0100
Message-ID: <fa37099b-4d5b-7265-888c-fae3f48f6e9a@gmail.com>
Date: Sat, 26 Feb 2022 17:39:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/5] ath10k: QCA4019 hw1.0: update board-2.bin
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Josh Boyer <jwboyer@kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, ath10k@lists.infradead.org,
 Linux Wireless <linux-wireless@vger.kernel.org>,
 Kalle Valo <kvalo@qca.qualcomm.com>
References: <2ce6ca92f529aca13984db205ed38fa0fa6d436f.1645645875.git.chunkeey@gmail.com>
 <CA+5PVA5hPn9QDkmwJE3E7NU3hv08t416DfLvxeJFJCxWSzSCDg@mail.gmail.com>
 <87sfs5squm.fsf@kernel.org>
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <87sfs5squm.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220226_083927_345798_C0F1279C 
X-CRM114-Status: GOOD (  16.86  )
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

On 26/02/2022 14:24, Kalle Valo wrote:
> Josh Boyer <jwboyer@kernel.org> writes:
> 
>> On Wed, Feb 23, 2022 at 2:53 PM Christian Lamparter <chunkeey@gmail.com> wrote:
>>>
>>> syncs linux-firmware.git with the latest releases from Kalle Valo (QCA):
>>> <https://github.com/kvalo/ath10k-firmware/tree/master/QCA4019/hw1.0>
>>>
>>> Includes the following changes:
>>> 93591ce ath10k-firmware: QCA4019 hw1.0: Add ZTE MF286D specific BDFs
>>> [...]
>>> f305604 ath10k-firmware: QCA4019 hw1.0: Update OpenMesh A62 specific BDFs
>>>
>>> Cc: Kalle Valo <kvalo@qca.qualcomm.com>
>>> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
>>
>> Forgive me, but I have to ask.  Kalle, is there a reason you aren't
>> sending these or including a Signed-off-by?
> 
> I have not sent any new pull requests to linux-firmware while we are
> trying to sort out the notice.txt problem discussed in the other thread:
> 
> https://lore.kernel.org/all/CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com/
> 
> My plan was to send ath10k and ath11k updates once we find a solution
> for the notice files. I'm guessing Christian wanted to get these board
> files to linux-firmware quickly and decided to submit them directly, I
> was not involved with that at all.
> 
Thank you for telling me about the notice.txt issue. No, I wasn't aware
of that happening.

My reason for creating the patches is that OpenWrt (www.openwrt.org)
is moving forward with the next 22.xx release. OpenWrt pulls firmware
and boarddata mostly from linux-firmware.git - so having those
up-to-date in time for the upcoming release is all around a "good thing".

(OpenWrt uses the monthly linux-firmware.git releases, so there's an
extra delay to account for.)

The current situation is: OpenWrt has those board files (as ~40 separate
files) all lined up in:
<https://github.com/openwrt/openwrt/tree/master/package/firmware/ipq-wifi>
Once the board-2.bin in linux-firmware.git is updated and a new release is
made, those files can simply be deleted.)

Cheers,
Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
