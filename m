Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B619C61DF4
	for <ath10k@archiver.kernel.org>; Sat, 25 Nov 2023 03:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=kHHrpZArcyIueA8+V0Jn8XJClawfnUXlDUyH3kOHAog=; b=ll5
	ypvVrxYHlxbUej2xEHyvBEvYIZoqLo6uUn645qsYIniaDMhKOmdF0vQbq4wY1ENOKS5QjW+LHh1xZ
	ExQshYQKI1fGM7KXuw415u27mHU9T9hTiOe6lPBGUg/WOBn0vL0Y57SJ/iegms5eGoytI30LTOBwI
	g0LtnTsbuThbkVtYfeJp2iHDfSpdPGGYFy+B4urMkgxA/QxRI2FHWYVcuVAWmn7CAlVUZW6rfauGo
	nMLZvPCRe+4pnkAcB9z8SnPCahmOyx1BWYsesd7XIHoQ0crhXzC8DmZEPwV5T9eKcVNLwSkALQpJk
	mOYAWoyah85EhMloIfRVYN/Czq6E86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6jGb-008TkC-01;
	Sat, 25 Nov 2023 03:23:37 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6jGX-008Tjk-2T
	for ath10k@lists.infradead.org;
	Sat, 25 Nov 2023 03:23:35 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5b383b4184fso24723537b3.1
        for <ath10k@lists.infradead.org>; Fri, 24 Nov 2023 19:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700882611; x=1701487411; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sjL81e6YDLfv+wrtlijj62WmZNGcc6e+Qo6poqFVcLQ=;
        b=HdrDJYKvk0+jAz+kLpIkUPyosJBviwKkn7YhS3MRIBIPUCChN0oaHKaAtBHYUfh1kv
         felst5l+ijq0zkNTU6PWoFvNRYU92jKBcb5sOafCLEXYFIdXLsyUDUP3JxgmKKa47uaI
         xWQLhcQnTH35SEjSSBQHQ4c5tGdwgBoFJW0MfI9hsNaGkhULPeFKH3/rfxlmmrLf+MWP
         jGfWZrNHibQRuk6SL7XmV+xjyK071k5bG9f6oYafXy1Vz4jmce0CS6UvFumkATuD09xD
         gWbHQWtqvWm3d0OE0eRdmp/PHlfZP08wPCxE835P7fkgVkaKOuRcYey7AnpkFghW83Un
         LHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700882611; x=1701487411;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sjL81e6YDLfv+wrtlijj62WmZNGcc6e+Qo6poqFVcLQ=;
        b=QO1/FmR12OQXURJgThEonFbcVYFSYZaEB1MpvdU/JpEfrQ6agUjx8bKp4Hlp7EXA1p
         SLOXMFP1QuQJmu6H3Zbc8FQ2SDWHpUrOpTK2Tj5Y7OaXBQg/bbYhFgnljfr4NSwCyj1R
         g6d8UMj28DftMSSyxd8TlB9a9TbzDt8cw78y0RBT2Ibt5ivG06bGxi/f6aPDuXbjreQL
         0CEYvAHc7AUB8DHpH0mcHU/PNxNag4rcApgT3jyufCPdDEcy63P6FPqhL90h5JXlzMaa
         n+g3u4JJTfN8w2GfwFVORUXSqUfXx5kGHO/SUKIPj/BkMJmyUN+PNDVBka8A+mu4WIZ1
         UpyQ==
X-Gm-Message-State: AOJu0Yzr0e6yGRevkrqlz/Y+C6U4wQDUkBHtTeAiv4bGhlTqFdBAcl0E
	dB5yCJKJFhWlzX/o/yo3kMRoq0/gYBAKU2LXD9LVrxczDD5iJgu2cNk=
X-Google-Smtp-Source: AGHT+IECgmqQabDFGiv1Tx6rmpVoGPwGawGaCeEnfzbzdw1qqpZZSxq93SjSW4z8fe7uLB+2cJsZ4dWTT7tVNYKe6dI=
X-Received: by 2002:a0d:d40f:0:b0:5cc:7431:871 with SMTP id
 w15-20020a0dd40f000000b005cc74310871mr5188552ywd.25.1700882611622; Fri, 24
 Nov 2023 19:23:31 -0800 (PST)
MIME-Version: 1.0
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Nov 2023 05:23:20 +0200
Message-ID: <CAA8EJpp+SJpX4FFmcTm133KNtztTJH0ovTLRm0bftahPT8a1kw@mail.gmail.com>
Subject: ath10k / WCN3990: firmware-5.bin and wlanmdsp.mbn being out of sync
To: ath10k@lists.infradead.org, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_192333_831368_4B772816 
X-CRM114-Status: UNSURE (   8.02  )
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

Hello,

I wanted to ask your opinion regarding one of the issues we stumbled
upon on the Qualcomm RB1 and RB2 platforms. These platforms use ath10k
snoc (WCN3990) WiFi "card". We noticed the following messages being
spawned on the console, which I traced it to the
ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL feature:

ath10k_snoc c800000.wifi: chan info: invalid frequency 0 (idx 41 out of bounds)

As a reminder, on this platform the wlan firmware and firmware-N.bin
files come separately.
The wlanmdsp.mbn is downloaded by the onboard modem DSP via the
tqftpserv request (which is served from the board-specific folder
qcom/qcm2210). The firmware-N.bin file is loaded by the WiFi driver
itself from the generic folder, ath10k/WCN3990/hw1.0. Current
firmware-5.bin file was provided with the sdm845's wlanmdsp.mbn, which
is older than qcm2210/qrb4210's wlanmdsp.mbn.

I'm looking for suggestions on how to make ath10k driver load
firmware-N.bin file which corresponds to the board-specific
wlanmdsp.mbn.

In particular I'd like to hear your opinion on the following proposal:

Add the  optional property to the board DT, that specifies:
firmware-name = "path/to/wlanmdsp.mbn".  The property, if present,
will be used as an override for the firmware directory. So, while the
ath10k driver will not load wlanmdsp.mbn on its own, it will still
look for the firmware-N files in the specified directory.

-- 
With best wishes
Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
