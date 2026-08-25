Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F472C61DB9
	for <ath10k@archiver.kernel.org>; Tue, 25 Aug 2026 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHteRhnSdg7VQ5V6RVG3ngwPW4dm3wGkUrKlCQUQjGQ=; b=iMpLCrnoR4cm5UJOkpqGw9h/1/
	rNs/tvenYFYHvJOVbvBscnp/oa8kz94BVQ18wS38AF1Stq+nxGhfCmqnjfAIkBip6yVrRa6NFYbv6
	UIh0Z/eDY9INby7AxLV/6zECtGZnoC9weIrCRwBlQd7Y5DM2L3daDovDAo7hWT/Myc0lNeyidNsSO
	cE0r3fHEnCGUzDRUJ9Hx014kymHHLREOC7ecSTRekNtLz/KMnFDm+d4GqK7npytOxCH+Md8KjRapn
	zHEUfk2facKkUE6FUigCHuivS0pzjO6KPMOIDEZQ/Pplqgy7l8Xi+RcXNpTtAMq4ftjdOtckeSmOT
	VnmZawyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyt9S-000000012hR-3L0b;
	Tue, 25 Aug 2026 15:33:26 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyt9P-000000012h4-03y3
	for ath10k@lists.infradead.org;
	Tue, 25 Aug 2026 15:33:24 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc149372c14so3636780a12.1
        for <ath10k@lists.infradead.org>; Tue, 25 Aug 2026 08:33:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787672002; cv=none;
        d=google.com; s=arc-20260327;
        b=GA8WlhQuDI/YBR4pwMsJJPBKUsP3Ipitj5R0LaHj3XAPHQk9o3veXVMHTuzzY+SdvS
         Mmgp9F6Q4MSGqNsMrp8Bz8XIN6518YSXN/TcD/QlBVUA7xxp3Y2EVfsK1PHzxR4pExyG
         3GIP6h97FTTgMr2WHfVzCwta578RQXSnwWQqyu9ThqT/B6d2ey8vAEz/ciaUhxa87Cd9
         XOYcDzfrES62qfYuYSKqQdonCa4inU36TKQ8prS2Za0wtPtuAhI0Ay2LGJf4C5aCXMNl
         cMxhtyUg4SQf6aXFwTu1nJjKSNZ03hhIQZu2pAG3Sv+WFQPD+IFMDveRJbCi1nbob0/7
         Auyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BHteRhnSdg7VQ5V6RVG3ngwPW4dm3wGkUrKlCQUQjGQ=;
        fh=xOnS0kcs6yugXMPxvYI3SptcXBWryid6UNKyPafLhXs=;
        b=rmwzSkX2XMwkxgRf2FyRDEHnDyM+GmkfLraxtY9347XTaqYhA7tYjaTdFnouSwDpk/
         Izn2C+gK+lI4GPui20ojCfdu5q37DyAEswQchYePiCzW8ItjMyRvclY0EHxLGfahm1g7
         ml804dfxs9PoF5PP4E9MxRS64pvnCQ3JFo0qX0Vn56huUcThK6RIrU6kf8jHRxkoADjj
         nV0hzRf4ks6f1MQ//oxOkzKSOYYsr21fIUqNxOBtDWwEU0ny99s+FgaDQeoYYO3+j6H9
         EBiTBh+yRanzUjyZuataHJED6oswqde5IXSxqqPNfAkEQcow+8bAilSe1twVcd708ZtJ
         Qb6w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787672002; x=1788276802; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BHteRhnSdg7VQ5V6RVG3ngwPW4dm3wGkUrKlCQUQjGQ=;
        b=G119XSDZD4VKzpz89JsQA9yHtMKhNcY2TVOUvOmw9vhlz2bd7buSzrQWRErktGd/3W
         L0TL5pej7N8ZM2e1aApUAqPcamLRYOIGPZEpCUgAB36ZKtFL6PbQuQ2kLk3+CEZNs7zi
         tZp007cWi8yRQZ0Z7BOTn+OSQtD9l/533REEvW+wzcIS3883EUwJCj0L1CJUfXwFUWWQ
         JmoRU6bFcPnpsRul6OcdYqcovYdnajS280mNLp5J6+1d/D8gSI+uJLlT0drpUkj+R6mq
         b0xC1Sl812k4kbiIUWxxqlK+9A5eZIptetZTMyVzLTuZ9mQOLa0sP9lKr4YHfuCD+A6b
         P+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787672002; x=1788276802;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHteRhnSdg7VQ5V6RVG3ngwPW4dm3wGkUrKlCQUQjGQ=;
        b=PxLSgBvvnW3eYnFXSmt2hpdn7yv4zEBhkphH1/uulsvmKuvd85+3G1wPZrLEz/oEG2
         Qx/OTEI0ulK/sz0c3YwotkmOQwXNINBkDjLEUL121wzOLzlg/Aw5vfCpxSmAOpy1SRsC
         7ezjkP8OIWLTOZnkNATUTt6X3fkkjXzuRVmXD+6TyEUAsTVSQCLpd/HEUdqkTNbNLRL5
         iXPhEbrSuXbl9a7yHwp4c4/jHOqKYy/04Ld+hHg9riLVxObzPB5ErxbzBD0qqDaqzA/N
         8xcWGlA0APcIv6dDkuh69vW0vHjwR96EFvoCxsB4wVXaOMSxsl1yoEepuAYuv3SxBNnI
         tkPw==
X-Gm-Message-State: AFuF++kNyTAQ2R77MGbjPE/HnE1m+3PUx+KWIkyIyYWFHFyvjlbgZaYn
	Mta0G1MeXQKefh917WlnUKtK+I1EIlGmL9mvotUuF8DApJRKkIde1jJyWC7+kys99uSGSgTNrrl
	wTe9Z72tfiSI/Hps8EOpMd5gC48sLq7E=
X-Gm-Gg: AR+sD11A0SrlBYDYFxA8k/ocOiCVYopm+tT0mBvdMdS/aOh9FDDicQK1pT6nqddUBqm
	8M1O+karoytFReQZx58rppegu9THBbRGKxXkDaHJ2QO4nGNh16pslrYQcCXZXwMOdpJn/tQ7UZd
	wBo0hQJPmY5FC3PX4LRGZw5AfDeEDF8FsDPexuBNmcT1IgCIRXElU5LqGgK/QgmohLi4dzJkFqd
	UJG/44yBFBnP09+25VSZvtU3JtT5AZfIZRjZ0MWGvTszN/Ol4V5ZGXzj70AEWdNwwEltOUTpqy1
	DOrEnkWbgTzhzmbOGaL/g8ifcQrrTK9FqJXHUZS+c62BhGyvlmHBUFd3vOo=
X-Received: by 2002:a05:6a20:d52d:b0:3cd:602e:f8ab with SMTP id
 adf61e73a8af0-3cd90fbdaf4mr16733524637.4.1787672001866; Tue, 25 Aug 2026
 08:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <CA+kcdF5BtM9dZJ6JNAvvsTfFZ18xcio06iSsYHGY4S7xDjtZ2A@mail.gmail.com>
 <2280a747-03d3-4468-86c6-6fdcb2154285@oss.qualcomm.com>
In-Reply-To: <2280a747-03d3-4468-86c6-6fdcb2154285@oss.qualcomm.com>
From: Omar Abuzaid <omarabuzaid587@gmail.com>
Date: Tue, 25 Aug 2026 11:33:10 -0400
X-Gm-Features: AcwNN1W7CpmZdBu43DeWr_KvDX_jXo7ly5_7Mk7h-NIXJyJxRU7H_DjiVA_0Xds
Message-ID: <CA+kcdF6xm0ciV2ET_0q3kg4GFFSK513m965C1DX=wKbcHH3vLA@mail.gmail.com>
Subject: Re: ath10k_pci: QCA9377 hard lock on resume from S3/deep suspend
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_083323_063040_A41BFC75 
X-CRM114-Status: GOOD (  24.27  )
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

Thanks for the guidance.

I created the upstream kernel Bugzilla report here:

https://bugzilla.kernel.org/show_bug.cgi?id=3D221921

I also have the Fedora report open as Bugzilla #2523243.

I included the system information, firmware details, reproduction
steps, PCIe/AER errors, and the kernel log from the failed
suspend/resume.

Thanks,
Omar

On Tue, Aug 25, 2026 at 10:36=E2=80=AFAM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 8/24/2026 11:41 PM, Omar Abuzaid wrote:
> > Qualcomm Atheros QCA9377 using ath10k_pci can cause a complete system
> > hard lock when resuming from deep/S3 suspend. During the failed
> > resume, the kernel log shows repeated PCIe AER Physical Layer and Data
> > Link Layer errors involving the QCA9377.
> >
> > Unloading ath10k_pci before suspend prevents the problem.
> >
> > System
> >
> > Fedora Linux 44
> >
> > Kernel:
> > 7.1.10-200.fc44.x86_64
> >
> > Architecture:
> > x86_64
> >
> > Kernel taint:
> > 0
> >
> > BIOS:
> > 1.32.0
> > 09/03/2024
> >
> > Suspend modes:
> > s2idle [deep]
> >
> > Wi-Fi device:
> > Qualcomm Atheros QCA9377 802.11ac Wireless Network Adapter [168c:0042] =
(rev 31)
> >
> > Subsystem:
> > Dell Device [1028:1810]
> >
> > Driver:
> > ath10k_pci
> >
> > Problem
> >
> > When the system resumes from deep/S3 suspend with ath10k_pci loaded,
> > the entire system can hard-freeze.
> >
> > When this happens:
> >
> > The system becomes completely unresponsive.
> > Caps Lock does not toggle.
> > Magic SysRq does not respond.
> > A forced power-off is required.
> >
> > The kernel log around resume contains repeated PCIe AER errors such as:
> >
> > ath10k_pci 0000:02:00.0: PCIe Bus Error: severity=3DCorrectable,
> > type=3DPhysical Layer, (Receiver ID)
> > ath10k_pci 0000:02:00.0: device [168c:0042] error status/mask=3D000000c=
1/00006000
> > ath10k_pci 0000:02:00.0: [ 0] RxErr (First)
> >
> > pcieport 0000:00:1c.7: AER: Multiple Correctable error message
> > received from 0000:02:00.0
> >
> > ath10k_pci 0000:02:00.0: PCIe Bus Error: severity=3DCorrectable,
> > type=3DData Link Layer, (Receiver ID)
> >
> > There are also ACPI errors during resume:
> >
> > ACPI BIOS Error (bug): Could not resolve symbol [_SB.PCI0.GLAN.GPEH],
> > AE_NOT_FOUND
> > ACPI Error: Aborting method _GPE._L6D due to previous error (AE_NOT_FOU=
ND)
> > ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_L6D]
> >
> > Steps to reproduce
> >
> > Boot normally with ath10k_pci loaded.
> > Confirm the QCA9377 is using ath10k_pci.
> > Suspend using deep/S3 suspend.
> > Wake the system.
> > The system may completely hard-lock during resume.
> >
> > Isolation test / workaround
> >
> > Before suspend:
> >
> > sudo modprobe -r ath10k_pci
> > systemctl suspend
> >
> > With ath10k_pci unloaded, the system resumes normally without the hard =
lock.
> >
> > After resume:
> >
> > sudo modprobe ath10k_pci
> >
> > The driver reloads and Wi-Fi reconnects normally.
> >
> > Simply unloading and reloading ath10k_pci without suspending also
> > works normally.
> >
> > PCIe information
> >
> > LnkCap: Speed 2.5GT/s, Width x1, ASPM L0s L1
> > LnkCtl: ASPM L0s L1 Enabled
> > LnkSta: Speed 2.5GT/s, Width x1
> >
> > L1 PM substates are enabled:
> >
> > PCI-PM_L1.2+
> > PCI-PM_L1.1+
> > ASPM_L1.2+
> > ASPM_L1.1+
> >
> > This appears to involve the QCA9377/ath10k PCIe resume or PCIe
> > power-management path, although I cannot determine whether the root
> > cause is ath10k, PCIe power management, device firmware, or system
> > ACPI firmware.
> >
> > I also filed this with Fedora as Bugzilla #2523243.
> >
> > I can provide the complete previous-boot kernel log and perform
> > additional tests if needed.
>
> Please see:
> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/bugrep=
ort.html
>
> Although that is an ath11k link, the same guidance should be used for ath=
10k,
> substituting ath10k for ath11k where necessary. Having a Bugzilla record
> allows the issue to be assigned and tracked.

