Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FEEC54E60
	for <ath10k@archiver.kernel.org>; Tue, 19 Mar 2024 13:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwR815DYME77h4o7urLuS7peELXtGeH8pgEWYCx5jok=; b=TYZB/OXb73/kzJgcXAQxHJqHCK
	qzxKUnfSrTe9BfxHoLEiTE0ZX0QYAkbna50Ylvv/YlSKDHCwJFpMClJ/JLDWaayTwPZcmUM+3GlzF
	KCvo/5Fjkf5yHQiUo33vAkSwCyZWDuIp9um9TEUdoBMLDuGn6RlQE1miHAohmna+Uxs6Km9yPuXY9
	2T491uhflvROWPNVjsTZ+4CQO6EPdWR+19P2UHcImgtlg1tWF7blwYyZ8yyJ90DaGAPqwqp2h3eRW
	P/8NzBr/4I5/h5WOH+v82ajW+CVsfkhmVjdovEuzFYtO+aefBbhle1jQjO5O5EOfN0yzC+loqi7Hu
	GBb33/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmZo3-0000000Cr6N-3lgW;
	Tue, 19 Mar 2024 13:47:07 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmZo0-0000000Cr5f-2cZ1
	for ath10k@lists.infradead.org;
	Tue, 19 Mar 2024 13:47:06 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-34100f4f9a2so1609966f8f.2
        for <ath10k@lists.infradead.org>; Tue, 19 Mar 2024 06:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1710856022; x=1711460822; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lwR815DYME77h4o7urLuS7peELXtGeH8pgEWYCx5jok=;
        b=fLrLBE4utnfFX04YeGkjwljdOONBLUW26y5/hjQn7zMVsxPm7hmvQk/W0aCOnHlT+m
         Us6Pag43YNehM6EaFtsJs05/08Falz9oTtQDY1g8m34xRbBCLIPDjWycdGkla/bGCKKx
         Gityz3ZbKG1TTO5a812OYZvQOKLFeKxqnN0dFzuFwBxAWPuz0YiSIVV5RQ5P4z454Fmr
         zw27UQC7TxUJ4hi6uI4LB833vR58wn5azCX0W4aTg9uOB9JmxBbaoAeZzm8MhLG63Baa
         ABcGkDnCAhFnXi05i8sJfHNTC4Jj5I+n64W2E0sxAOQXKJR/qjDtJ8LZ9YnS0P3u6oqY
         rDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710856022; x=1711460822;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lwR815DYME77h4o7urLuS7peELXtGeH8pgEWYCx5jok=;
        b=t0wF2IHodAVs3B2UPCZmgAvAbQKGXJZfCtGdYzeYrPxrHHn3YOTpj9attlZFAJ577p
         5tgg+S8X7UjEPTCJHmfrP0gLwdcZIN+IhSloMMwVaQrsZsPH9x7B7NdAmhuerTiYH0T4
         C8poJ7b3rZcal5Ks34+XQTLIwTkFKntDI78IpW0AFA0FHH6n9SsRwWU+SVuvqQKSBLzR
         HmMAfNnm5MN2th67a7mK8X4ObEng9T3ymkYW95edxZ+zsdkyOBco8Ajk7lA2nAxju1nD
         GKogyvBkmUNWaovXJkWmw+SYHRdVQTIjk9IO3jl78Lb2cDuBe+yIsGIfuvkZUlEAUlcP
         t/4w==
X-Forwarded-Encrypted: i=1; AJvYcCXQwKJzDzOK5IQCRYbTDadR7R20mg5/Ga2XGUWF6FmXoVqBHXqrZHcVJvte1lkQpeSDALHfTU/q8Bi9pAoQQrGcAv+Y5jljDeOCWQ==
X-Gm-Message-State: AOJu0YzvCEp1OCH51BLeEbS+VnzaejgXm7Ozl/K0AwMFOZT6wVO95Bmq
	Bt6JBVot8Z5KzjR5f/zFSsgtqQEPKx0IEuy3AXZOJVK2J3+hHJDvhfGF/cd3zEE=
X-Google-Smtp-Source: AGHT+IH5tZbVzPk+iAAJs7mty1sSC4oAZJsAYS9f43ya3U/pZlXDgOVvkRBrz6cvKF1yPa9PO+hiEg==
X-Received: by 2002:a5d:4577:0:b0:33e:8c7e:608f with SMTP id a23-20020a5d4577000000b0033e8c7e608fmr9272226wrc.12.1710856022158;
        Tue, 19 Mar 2024 06:47:02 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id u17-20020a5d4351000000b0034180f6d3cfsm2974760wrr.73.2024.03.19.06.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 06:47:01 -0700 (PDT)
Message-ID: <880e016a-d4d2-4bc9-8c75-bbe4848515ad@freebox.fr>
Date: Tue, 19 Mar 2024 14:47:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: wireless <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 DT <devicetree@vger.kernel.org>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jami Kettunen <jamipkettunen@gmail.com>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
 <c58e67e6-6a7f-4963-86b9-580165bf05ba@freebox.fr> <87cyse8j9m.fsf@kernel.org>
 <6d4b1381-c121-4cda-a8c9-9ccac56bd447@freebox.fr> <87plw87nsc.fsf@kernel.org>
 <0816f7bb-3c97-4b90-8e19-191552ea6e26@freebox.fr> <87h6hk7aee.fsf@kernel.org>
 <fb0ffdd9-923a-4191-8304-583243ad528b@freebox.fr>
 <CAA8EJppHa=qEkKbSVs9hMCBXfhiC9MyAQO+v+6TCWhg==4CpOQ@mail.gmail.com>
 <f26dfcc6-5fd3-486d-b0f2-80168eb213c7@freebox.fr>
In-Reply-To: <f26dfcc6-5fd3-486d-b0f2-80168eb213c7@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_064704_830250_336EB1AB 
X-CRM114-Status: UNSURE (   8.99  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 18/03/2024 17:56, Marc Gonzalez wrote:

> Hmm, I don't see protection-domain-mapper running...
> 
> Feb 27 17:44:01 venus pd-mapper[308]: no pd maps available
> Feb 27 17:44:01 venus pd-mapper[328]: no pd maps available
> Feb 27 17:44:02 venus pd-mapper[345]: no pd maps available
> Feb 27 17:44:02 venus pd-mapper[347]: no pd maps available

Doh! I had the firmware blobs properly embedded in the kernel,
but the user-space tools needed them in the root filesystem.

With that latest change, the kernel issue disappears,
and most of the user-space tools seem happy:

  systemd-journald[199]: Journal started
  systemd-journald[199]: Runtime Journal (/run/log/journal/0f2e92c39e6f4f3fa6585b56f928c8ed) is 8.0M, max 73.3M, 65.3M free.
  systemd-random-seed[206]: Kernel entropy pool is not initialized yet, waiting until it is.
  systemd-journald[199]: Time spent on flushing to /var/log/journal/0f2e92c39e6f4f3fa6585b56f928c8ed is 12.074ms for 3 entries.
  systemd-journald[199]: System Journal (/var/log/journal/0f2e92c39e6f4f3fa6585b56f928c8ed) is 8.0M, max 4.0G, 3.9G free.
  systemd-udevd[227]: Using default interface naming scheme 'v255'.
  cron[285]: (CRON) INFO (pidfile fd = 3)
  cron[285]: (CRON) INFO (Running @reboot jobs)
  qrtr-ns[288]: ERROR qrtr-ns: nameserver already running, going dormant: Address already in use
  rmtfs[291]: [RMTFS storage] request for unknown partition '/boot/modem_fsg_oem_1', rejecting
  rmtfs[291]: [RMTFS storage] request for unknown partition '/boot/modem_fsg_oem_2', rejecting


Corresponding kernel log:

[    0.321715] ath10k_snoc 18800000.wifi: Adding to iommu group 0
[    0.323787] ath10k_snoc 18800000.wifi: snoc xo-cal-data return -22
[    0.325443] ath10k_snoc 18800000.wifi: supply vdd-3.3-ch1 not found, using dummy regulator
[    0.325767] ath10k_snoc 18800000.wifi: qmi msa.paddr: 0x0000000094400000 , msa.vaddr: 0x(____ptrval____)
[    0.325999] ath10k_snoc 18800000.wifi: snoc probe
...
[    8.430099] cfg80211: Loading compiled-in X.509 certificates for regulatory database
[    8.443287] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    8.446323] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
[    8.451411] clk: Not disabling unused clocks
[    8.454159] cfg80211: loaded regulatory.db is malformed or signature is missing/invalid
[    8.468829] ALSA device list[    8.506030] VFS: Mounted root (nfs filesystem) on device 0:21.
[    8.511551] Freeing unused kernel memory: 5632K
[    9.122863] systemd[1]: System time before build time, advancing clock.
[   12.009922] systemd-journald[204]: Collecting audit messages is disabled.
[   12.193174] systemd-journald[204]: Received client request to flush runtime journal.
[   12.803236] random: crng init done
[   13.580077] atl1c 0000:01:00.0 enp1s0: renamed from eth0 (while UP)
[   15.255763] remoteproc remoteproc0: powering up 4080000.remoteproc
[   15.263925] remoteproc remoteproc0: Booting fw image mba.mbn, size 234152
[   15.277228] ath10k_snoc 18800000.wifi: received modem starting event
[   15.370471] qcom-q6v5-mss 4080000.remoteproc: MBA booted without debug policy, loading mpss
[   16.020964] ath10k_snoc 18800000.wifi: received modem running event
[   16.029559] remoteproc remoteproc0: remote processor 4080000.remoteproc is now up
[   18.649633] ath10k_snoc 18800000.wifi: wifi fw qmi service found
[   18.649870] ath10k_snoc 18800000.wifi: qmi wifi fw qmi service connected
[   18.658200] ath10k_snoc 18800000.wifi: qmi indication register request completed
[   18.666483] ath10k_snoc 18800000.wifi: qmi host capability request completed
[   18.674486] ath10k_snoc 18800000.wifi: qmi msa mem region 0 addr 0x0x0000000094400000 size 0x4000 flag 0x00000001
[   18.676164] ath10k_snoc 18800000.wifi: qmi msa mem region 1 addr 0x0x0000000094404000 size 0xfc000 flag 0x00000000
[   18.686350] ath10k_snoc 18800000.wifi: qmi msa mem info request completed
[   18.738546] ath10k_snoc 18800000.wifi: qmi msa mem ready request completed
[   18.791705] ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40010002
[   18.792014] ath10k_snoc 18800000.wifi: qmi fw_version 0x100204b2 fw_build_timestamp 2019-09-04 03:01 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.1.0-01202-QCAHLSWMTPLZ-1.221523.2


Yet, I still don't have a wlan network interface.

# ip link
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
    link/ether 34:27:92:82:48:ec brd ff:ff:ff:ff:ff:ff


I'm kinda stumped at this point... :(

Regards



