Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE7AC83F10
	for <ath10k@archiver.kernel.org>; Sat, 12 Jul 2025 06:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoITU62SQUOqjJ60zYOKiXN09WwQKOHafQ7dw0yybjI=; b=lHPlNtW/AfegtZX5TjfpXAYkHM
	Yy/aWDKOU6+JiEQlxOTqzNc31ZWt+Rs54jddy1jaT5Mg3WEaPT8qqi152n3yhlBOfLP4UEysuBoqD
	9rBTU79fLCimC6F1+0kFNFNQAux2n8TOBwS5iebvCW3h+akUXjYmnpt/cRt1wvJz8205hU4zFiUk+
	gJahOR9wEeaYxA0cKSeqD1ZGntU7JfX8S1bivKuSoQJNQzBQkOKZ2H0mLbPHmn8h6v3q6uhwc5pHm
	YBP3Lv+cy8cr9SQhfL5dEMrC4GNnobPnD/bU/MpvJj92PAQ0XC79Se3BKq1bJLwpuWw8tHc0Hmbd4
	1WiZ0Q8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaU2Y-0000000GLAJ-0j8y;
	Sat, 12 Jul 2025 06:48:54 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaU2V-0000000GL9w-3eQJ
	for ath10k@lists.infradead.org;
	Sat, 12 Jul 2025 06:48:53 +0000
Received: by mail-yb1-xb42.google.com with SMTP id 3f1490d57ef6-e7569ccf04cso2380684276.0
        for <ath10k@lists.infradead.org>; Fri, 11 Jul 2025 23:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752302930; x=1752907730; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoITU62SQUOqjJ60zYOKiXN09WwQKOHafQ7dw0yybjI=;
        b=JQe+QVR+wDUXN8vvhkycDuLllGjWSaHgyDIMljZN9H+MOs8REY5tA83TRDbatrqyE3
         knlof26Vrm2NwUnAq049upqHt2eaC0S55+OCjW6TFwOMAcmXC5eDNCdTxlx7JwcXrXZL
         J2njkJv1linrwpNUDHHuqky9e8a7eBenKHNLGCj2r0D4rHBa2xVKT+fXP+lJAb8l1t5G
         gEHZmN8Z06BfT2SZ3HkQcr6HLchmYhVS2BtiSKF1bhwFrXTkYC/kJBRDhG8z9ZX8cy2M
         GWo9BSPzEJlf4VK2KKftNls9YSINQao3M6X7reXaWWYfCE0g47YdeDB0De9oEajp0Lip
         di/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752302930; x=1752907730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NoITU62SQUOqjJ60zYOKiXN09WwQKOHafQ7dw0yybjI=;
        b=p87Luo+jmpICW6AiEyxdIdRufg069jZOVJ8HkTWAf8RH9k3j1lXqfGkQFOlzHOFymg
         ZBgEzhT2xb27v3dUn8ZFAcEzY0wjpD2gX8x8Nd7HTEKttbMGHxs9wqIA0sZPnHPEqdsd
         7vBgncIu7SIJ9NMIOXoMXTP5QtqUpSpYP24aXSnu4LUDDzI59CFhDfkIrJc6Z7+pCo1c
         IYORFODsfXJgLVZrCMwixcpfGgqpv228YfKY2LcPlFyDXPv1nu4CHjPfeVH06t8VQdMh
         bv4EXJ6zfPUP3JQVE0yqSs+aMAVNd/fbAOD3s5/fdmifHY7lCC/IReyNc6jQ09jBl4l+
         oCkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMDPk3HilrTTgWylrysA6gbgAAvsVg/RRmGFSWmHn8lcy3LtWYkCR54XF6zAAILtILrn0f9+w=@lists.infradead.org
X-Gm-Message-State: AOJu0YzfrX2rTWcbBWy3T84OAlUv+/F23kKeIoBPf8LZEmaWs93PsdZU
	UHhygFZW+goRC0Yc+r1LLnFSIEsOpxEStihmf7IFwiHNLn84o9jiIuZQS7UBSwSgns4ax6FUQ40
	8Ovkm98hU/XD6jZI/eKUNuKAnZ9vEvZ8=
X-Gm-Gg: ASbGncuBt19O4HospPpLC1YdQFWcFd+SjeimlJvtzEUrlrkDZc9zYUFMJkVbyPfZujo
	cE+Pg+rGstpRwpty/SJ05KvJLJ89OA4vULcyILp1xW1R7xHZtsLZOIM+CgHpzU9imr9Cgd+z9LN
	b7rfIECRzpfP0mljzGM1teU0tnIASZ96/QWFpLC0XcBcfkFP70PJSUbjOlRwKcbZE2nBpdDLdux
	Rbp/V2LAQ==
X-Google-Smtp-Source: AGHT+IGk2GtuNzqxa+gKFQr9ayybypizulvCNPS3E5NzFiSXc5j1f3+dJAsXJ7xrNYFRci9jPv4ohCAmyQ/XVL4LRzk=
X-Received: by 2002:a05:690c:fcc:b0:70e:29d2:fba1 with SMTP id
 00721157ae682-717d79eb927mr90617257b3.23.1752302925506; Fri, 11 Jul 2025
 23:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <FB546B0D-2209-4FA0-9DC9-A75C0BC9FA4F@gmail.com> <20250711163645.GA2294895@bhelgaas>
In-Reply-To: <20250711163645.GA2294895@bhelgaas>
From: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>
Date: Sat, 12 Jul 2025 12:18:34 +0530
X-Gm-Features: Ac12FXw_McJ9cVak4RJs7lYmIOUMmOI35Ioch1M3g7fMO3XpzdtWBzgGrKF48N4
Message-ID: <CAEmM+QiSZBoJV2n6944tYU7fcrzKRTUgsKRdqwDEkKkZiPVCMw@mail.gmail.com>
Subject: Re: Instability in ALL stable and LTS distro kernels (IRQ #16 being
 disabled, PCIe bus errors, ath10k_pci) in Dell Inspiron 5567
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_234851_907999_3B882830 
X-CRM114-Status: GOOD (  12.84  )
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

Compiled the usual way: the bzImage compiled within 4-5 minutes
(compared to 1 hour previously), and the modules compiled within 1
hour (compared to 8 hours previously). Also, the congestion strangely
didn't happen. It was instead silently followed by "No Internet".

Didn't add the kernel-level journalctl because I'm sure that the
normal journalctl includes the kernel-level stuff too:
https://gist.githubusercontent.com/BandhanPramanik/ddb0cb23eca03ca2ea43a1d8=
32a16180/raw/07b34aa3fa19da5afa4bb161454e3cb2081b9880/journalctl%2520v6.16-=
rc4-PATCH1

Please let me know what you think of the logs.

Bandhan

On Fri, Jul 11, 2025 at 10:06=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org>=
 wrote:
>
> On Fri, Jul 11, 2025 at 09:34:43PM +0530, Bandhan Pramanik wrote:
> > Hello,
> >
> > I really couldn't find on the internet how to compile a single file
> > now that I have compiled the whole kernel.
> >
> > Any ways to do that?
>
> If you apply the patch (cd to the linux/ directory, then "patch -p1 <
> email-file"), then run whatever "make" command you used before, it
> should rebuild that file and relink the whole kernel.
>
> Bjorn

