Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EF0C54791
	for <ath10k@archiver.kernel.org>; Wed, 13 Mar 2024 15:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AzBQ+tLW2d59aDgYBNh01xhjYL/4GzcjrgAxlnqiSI=; b=MNGecHmMJAqI60s3sDUCwS27vG
	KB96fH0MGwrL+nWQLmybhpcy9teroLyn/I3w9+kOW1lYQ7zkKL3/bcgq7n9/b6SAZOjM6yecVGyff
	IRmQ9+phEOnzzj0uI8PhYILHzcqMxIOKpNmQ6CNCu/xiW9gyiUQCGDv34XF1V5NHiPFaT4t7jje2/
	6QREiZj83AkK8DDMinEGK/HwAxeFUuFWCCfU8lLNg6xBLrIrmNDx4KqeFNSKsG6Wj4CgETfSoVkFj
	6N1fgHZugDqbMNVGNLzWzTWZZDRl9tu61675ATRNNdnYAynyOpZyI55LSz8casfEkfTiPVKQafKML
	1ByQFoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQvI-0000000Afxd-3mGx;
	Wed, 13 Mar 2024 15:53:45 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQvF-0000000AfxC-45OU
	for ath10k@lists.infradead.org;
	Wed, 13 Mar 2024 15:53:43 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso6496587276.0
        for <ath10k@lists.infradead.org>; Wed, 13 Mar 2024 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710345218; x=1710950018; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6AzBQ+tLW2d59aDgYBNh01xhjYL/4GzcjrgAxlnqiSI=;
        b=PXM3mTwLnZjO0G3eObtYTIgwJmQmpLBKPxk/XFKzQ6NTDy7goxLkUfDuZYfRU4zXk0
         cGDuxzP4hzC8xvSeURNIK8+D9YRTV8Qwj7Zubwh3w5lft+dzvdDhbdcZ2T9VkV7EXFBU
         Pm3KOuikMuifWmYA5uWJDQ3SzPcNpdxgI5ym4G36E/QY53IcHyTV/54lqBSu0znFGQgF
         MbCKgRkY29iKpKkZJ3PbCir0HA6JSH5j15LPZmxy2ISQ21E8bADvPDkfJODdQw15I62l
         +mXVKoQurE3W+fKU0T8Jh6zBDEqYnJMgC5xB7oaSdwum5D/2551l7875cZ8m3izQfEj9
         M9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710345218; x=1710950018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6AzBQ+tLW2d59aDgYBNh01xhjYL/4GzcjrgAxlnqiSI=;
        b=V/OeP3ys04pEZEs6owYSpsVfCCd9ZlQZfmStRoArogNl7zh0Zlxellu2w1/OMgH5fW
         WoFG+8LSzcZEM0YuBWqhJ1jEAASMT7OOmiQnYFqXW0heneEiGVOWItjb8CZ6VcOq63VN
         Jr88h9FBdJglF7/AH2qgfD+Cct6/WvOroq/aOUT39zOQc8tBIOrwZ7x4JWztfdR2RnY5
         rEa9lUBSEBSXuRwE4XiK0XXa41b19llT+i7pEVEYwybQkN7WHCWo1TUyG2C4ic2pV0UJ
         9MqHu6YGLkqE8DUKKmmuBfMUkIy84OW6UMoFeXlAc/RM8IMnenJcUYtSBj8xBGTxjVLZ
         Ex4g==
X-Forwarded-Encrypted: i=1; AJvYcCWZ+UGhwyLU9M3wBl+Cw6ahS/FQvT0Ifk4PjZHx3jrZFyrhDJ/T/q9rBV6wLvnziUYSpxNAHeisu5hNEY6GTD/8ywVCqThcqh5YPQ==
X-Gm-Message-State: AOJu0YydkWFuQ3JhY8RYXzzfpnNPGdAvcg2dNZp9yBGaYuCxhqBzv2/l
	9xvXHtJ4ORjImhPam6+gde2ltNv/nY1r71beS7rIqusn7axtnzdCViQ3jP634BoHikW+laQtnqY
	pk/3VBP3x6VAWYN1c+IXzhrQkdsK7Zj7pAoqMRA==
X-Google-Smtp-Source: AGHT+IFEXBYea2H7akvOYLZnU0E8yFk/kdMNNhRxZzxlLPLFxZd9tmb0mKfs/cS05ZdYc2wWKixhp6fXP1k2h0BiDjw=
X-Received: by 2002:a25:db85:0:b0:dd0:129f:16 with SMTP id g127-20020a25db85000000b00dd0129f0016mr3097478ybf.11.1710345217678;
 Wed, 13 Mar 2024 08:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
 <c58e67e6-6a7f-4963-86b9-580165bf05ba@freebox.fr> <87cyse8j9m.fsf@kernel.org>
 <6d4b1381-c121-4cda-a8c9-9ccac56bd447@freebox.fr> <87plw87nsc.fsf@kernel.org>
 <0816f7bb-3c97-4b90-8e19-191552ea6e26@freebox.fr> <87h6hk7aee.fsf@kernel.org> <fb0ffdd9-923a-4191-8304-583243ad528b@freebox.fr>
In-Reply-To: <fb0ffdd9-923a-4191-8304-583243ad528b@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Mar 2024 17:53:26 +0200
Message-ID: <CAA8EJppHa=qEkKbSVs9hMCBXfhiC9MyAQO+v+6TCWhg==4CpOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Kalle Valo <kvalo@kernel.org>, 
	Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k <ath10k@lists.infradead.org>, 
	wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Jami Kettunen <jamipkettunen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_085342_047402_57DB479C 
X-CRM114-Status: GOOD (  22.46  )
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

On Wed, 13 Mar 2024 at 17:09, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> [ Dropping the DT fellows ]
>
> On 05/03/2024 20:20, Kalle Valo wrote:
>
> > Marc Gonzalez wrote:
> >
> >> I need to build a kernel + rootfs + FW to test the proposed solution,
> >> then I can spin a formal submission.
> >
> > Yeah, please do test this to make sure we are not missing anything :)
>
> I used buildroot ( https://buildroot.org ) to generate a kernel + rootfs
> for my board (a variation of qcom/msm8998-mtp.dts)
>
> Not sure if I must use the vendor FW blobs? Or if I can use the blobs
> from linux-firmware-20240115.tar.xz (as supported by BR2).
>
>
> All I see from the ath10k driver (with debugging cranked to the max) is:
>
> [    0.539801] ath10k_snoc 18800000.wifi: Adding to iommu group 0
> [    0.541941] ath10k_snoc 18800000.wifi: snoc xo-cal-data return -22
> [    0.543633] ath10k_snoc 18800000.wifi: supply vdd-3.3-ch1 not found, using dummy regulator
> [    0.544002] ath10k_snoc 18800000.wifi: qmi msa.paddr: 0x0000000094400000 , msa.vaddr: 0x(____ptrval____)
> [    0.544271] ath10k_snoc 18800000.wifi: snoc probe
>
>
> # ip link
> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
>     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
> 2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen 1000
>     link/ether 34:27:92:82:48:ec brd ff:ff:ff:ff:ff:ff
>
> No wlan device at this point.

Do you have pd-mapper, rmtfs and tqftpserv running? You also need to
have wlanmdsp.mbn in the same directory as modem.mbn for your platform
(see how this is handled for sdm845).
If these points are implemented and you still don't have the wlan,
please check for tqftpserv messages in syslog.

>
> I got shell-shock from reading these setup steps:
>
> https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_835_(MSM8998)#WLAN
> https://github.com/jhugo/linux/blob/5.5rc2_wifi/README

These readmes are mostly correct. You don't need qrtr now, it is
provided by the kernel.  pd-mapper (protection-domain-mapper),
tqftpserv and rmtfs usually can be installed from your distro.

You can mostly ignore the part for board.bin / board-2.bin for now.
You'll get to that point later, when the driver complains about
missing board data.

Also, if you pick up series at [1], you can put your bdwlan.XXX file
as ath10k/WCN3990/hw1.0/board.bin and skip all the json and stuff.
This will work for the bringup, then you can follow the process at [2]
and submit your file for inclusion into board-2.bin.

[1] https://lore.kernel.org/ath10k/20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org/
[2] https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles

>
>
> Jeffrey, Bjorn, Konrad,
> Has someone written idiot-proof (such as myself) steps to enable
> the ath10k core on a msm8998 board?
>
> I'm still not quite sure where linux-firmware.git fits into all this.
>
> Regards
>


-- 
With best wishes
Dmitry

