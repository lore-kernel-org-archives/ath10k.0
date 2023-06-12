Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C611C7EE43
	for <ath10k@archiver.kernel.org>; Mon, 12 Jun 2023 19:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GK41YR0UyDcD5y+k1zVaSEKTgPXLJFDYWx2AYGMEVws=; b=kGYAFVkgBmuXRK
	zjrphoOCiBey56jKhznEQEDkDR/xFJ5p1VUy4IL4oGmEZ5Jv8ZWUuVb0CPSY1TIUKICvQJI7vLTsl
	fFEhiRkjLxAO+yGJny61S7Rnh3TguWIf7Iatl5DJSjXUV2NpbXtXh+z3ad+M4wkdXfVKbpbMb70Oq
	Gm5OYSqdbfqDrpuQQSPyL220987WFin+8GJ8WVrhvW6LUI2qTxQ06wSTflBmLg7RZM5ZmYgekQc/+
	GrrkN8IUj1ttv2ejOV/ZtOqkycB5auelUvp9X5+hHeVWUqi7V3kPJUvFfv76TRrOB3gjuTuPjSBmV
	68vo4nfsYTzinBeMMFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8n4k-0055Ww-1x;
	Mon, 12 Jun 2023 19:19:38 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8n4i-0055Vm-00
	for ath10k@lists.infradead.org;
	Mon, 12 Jun 2023 19:19:37 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-43b2e00d1dcso102033137.1
        for <ath10k@lists.infradead.org>; Mon, 12 Jun 2023 12:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686597573; x=1689189573;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmmBam/WHtDmPBduvUF5UCfOsX3TryVti48wcDyUMKU=;
        b=JosmW+B/Wr5n9Bxn2K60mJ2na3EbxKMRjo+ticaBZum9a/r7iWUj9ZUAcsuxjoZAd2
         p08bsrNafNg4mhFFPyElh5e6f/SlnHsmyl/qshZ4KtjCymC/RJ4Ye8kxLANkCXIRtFp/
         9Bwscqr2xIb9tagbWV+MCMrZ1E67zI6pqelZI5JKLXrR5uCRPAEcdSdZhMi9NFxY2lhE
         kceMAilEMvAd2F3MhWVcGbwiVUR4vaaOLJG9yY0FBV8xPskZZvge7yuhEwn7lnTKzLAw
         5S9SjWWndzdNWPwkRuyXAy/E0Zw2i7RPUQpwoNm1FYcJ9MotXZ2ijufSaopf7mXoiZEJ
         wVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686597573; x=1689189573;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mmmBam/WHtDmPBduvUF5UCfOsX3TryVti48wcDyUMKU=;
        b=KT0xsBIoFVEAHHTE9xGIlC2nuV9lJLc9OqpfkV0t39y1IO1DmBKJjsAJRHd58/yRqI
         ifZAlQVF7jNxwZ4d3i0+lH2pG22wO4ER6gKn8h1LZ1jdi3nzDo8RvsaOtF+OHtPDwiRt
         oCu3XArtLO5G40qKWAraoNOf/1w50skLWsPapfJOQjFLifNJ86T+Et9zP1sjJp+YfKIU
         f6a9txNL05OSRV3RAP9GCXQ10HIno/eYDwLKHZ2n6Glru3WLxb36q+n0uK1U2fgxraIX
         xBesvasEa/tdlGxGdAFx1SFroHm/il54gG4ZkpiUOGzeBxTxexXlWFm5tqux/sEtKWdu
         q2VA==
X-Gm-Message-State: AC+VfDwD8MIBMZNJK/W1G5bv2VTe23fcPGBcP6I5vCnpAeDJhI+Wsl5/
	Idzp6hSmWsrw1ddoopRfM1whCw+kxyE=
X-Google-Smtp-Source: ACHHUZ5rn5192A2lk/avFCuXFAjgy0M7z+OpNjWdLe6p9vlVDXJWnW6P7AO9b+kqtciiAGtx2F+8Mw==
X-Received: by 2002:a67:f292:0:b0:43b:2bd6:d07d with SMTP id m18-20020a67f292000000b0043b2bd6d07dmr3864942vsk.29.1686597573169;
        Mon, 12 Jun 2023 12:19:33 -0700 (PDT)
Received: from [10.102.4.159] (50-78-19-50-static.hfc.comcastbusiness.net. [50.78.19.50])
        by smtp.gmail.com with ESMTPSA id f18-20020a0cf3d2000000b0062595cd1972sm1630691qvm.82.2023.06.12.12.19.32
        for <ath10k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 12:19:32 -0700 (PDT)
Message-ID: <142b1724-9f6e-d662-ca16-3bb17a142b5d@gmail.com>
Date: Mon, 12 Jun 2023 12:19:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: ath10k@lists.infradead.org
From: James Prestwood <prestwoj@gmail.com>
Subject: Firmware fixes for "invalid vht params rate" (QCA6174)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_121936_040276_900C160D 
X-CRM114-Status: UNSURE (   8.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hello,

Using the latest ath10k firmware on linux-firmware (firmware-6.bin) the 
kernel logs are getting spammed with "invalid vht params rate". I have 
read through this thread about it:

https://www.mail-archive.com/ath10k@lists.infradead.org/msg13406.html

It looks like there was no resolution to this, but there was a mention 
of the firmware being fixed to not send an invalid rate? Is this true? 
or is firmware-6.bin not being maintained anymore?

firmware-4.bin doesn't have this problem but I am having other problems 
with that like firmware/driver crashes, in some cases that are 
unrecoverable without a reboot.

I wanted to see if firmware-6.bin resolves these problems but this 
"invalid vht params rate" message is pretty annoying.

Thanks,
James

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
