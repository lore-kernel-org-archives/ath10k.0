Return-Path: <SRS0=Ps4A=K4=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CADC4C47083
	for <ath10k@archiver.kernel.org>; Wed,  2 Jun 2021 22:52:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5162A60FDB
	for <ath10k@archiver.kernel.org>; Wed,  2 Jun 2021 22:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5162A60FDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bazbAQNxAVjzkF5dTkxP00PkrT1x2dORiqL7G5aaj5k=; b=qrOvNa940MdM37
	cGZJSergq4Lb6yGwFk/sB7os6k8ppDWEEvwnkffPiPCuQxad7XPUwrUFAhc+qddigZ0gFM5Lt16eq
	vqKF024EBrLcyHVf+/Jbsi/cBM+OYsYBgv7R1MfV8pR+OY37ZrBi/IO2mTrWO0e9vd75khAD7wmP6
	+ERUVNugHkajauSIl+8xjocZg4NS6Fto8ecDRx2+rntcNYI24VjOC0ocI6AH38mTMJTOxApEiXp4O
	YgRNSbTefuQWIyaoHmq1wS+nd/CjDF90VthjT/la3LexGK9D1NgmaDpdtT50VjAGtQzzO0HJxMBJT
	O5hZfift8EqUl45TXa/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loZiN-006Q4k-8e; Wed, 02 Jun 2021 22:51:55 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loZiC-006Q3j-0F
 for ath10k@lists.infradead.org; Wed, 02 Jun 2021 22:51:45 +0000
Received: by mail-lj1-x22e.google.com with SMTP id e2so4670004ljk.4
 for <ath10k@lists.infradead.org>; Wed, 02 Jun 2021 15:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ij3SXWTCN+9dB7mTVvay4q49mzvCUt7VB9xa4OQCn4U=;
 b=HUunR1qKj7DKAaLYSHc2CTq5DBlpV3tP1n9bK+HxFnIcWRw9iDRh0sjIVWtD/2AUE0
 aiMbBjTcHLDCj+1H9CoHWbAEtO7KmEnpoHfl+JqmRm6TogSPABnm84vWHVj9ylDVXRwR
 Ua5ZDhyhLqSNXy3K1Ql7Nz8wEFcMT/N3VTqf1WsQGNbczISPwanDCz9R5wi0WKw9bH54
 uYAkn+RGya50NNZm8heKbLCkzQZ5ChigL0U13LKyeqPMlmC2p3FX+7cacNfVbe2552dq
 eYSdRb7ZhHEshb+CF8AES+S3S4m4eGwPoQ72LuCPdwe57ohNUK7I7SjPUk3/r3iVb7N9
 38eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ij3SXWTCN+9dB7mTVvay4q49mzvCUt7VB9xa4OQCn4U=;
 b=t4uhXutxflbICjh979Z2CsN7gXHEz1cszYg6X6GiMZ0f/I51ZtqfP+x+iIseKrocSg
 1WacMdqRi+79/D191aKvPIu124KNlxePk7E9iiEi6RuKKS5AyUgUYRfMGe59GLONKAeq
 IVB4y89jRzn23HSZH3LXuQuBU1iMnK5IyuEiLLJUJvrtayMPVsdo2Hkmvqah0BP9quDa
 SZf/PYnuxT/Vrf4/uS1ALgnaFhDpWDLtLmi8GC0XsJWkhVXhTdN9RgcFK/sP/421lIgX
 KkgZ5ZHPDNO4lIVQmpvMCnPjqrZTAv9iRY6yRiwSIlT3jOow3TeyTBxlw9dj0r+nNDSf
 DgEA==
X-Gm-Message-State: AOAM531qjjS1aVP/t4mvt0PD//rf0iE2w5K+VbCMTKINgmqKJQ/N/d/J
 mgOHf7LoXA6x0NURYtbWaXl13zNWrecbSdww/Ys=
X-Google-Smtp-Source: ABdhPJx+9LZ9gMGy1HdEnT3q9aKDob4ubLjOVJO44vl1JLyua7cTBc+RLzpZusJQi9dsBnwoRttLA3R5MADijg1LksA=
X-Received: by 2002:a2e:824c:: with SMTP id j12mr26962032ljh.490.1622674300938; 
 Wed, 02 Jun 2021 15:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DPAr0XPHefewjF2fx7UL+7RvycAYLZdfosOUT6bwWHBA@mail.gmail.com>
In-Reply-To: <CAOMZO5DPAr0XPHefewjF2fx7UL+7RvycAYLZdfosOUT6bwWHBA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 2 Jun 2021 19:51:29 -0300
Message-ID: <CAOMZO5A3csY5GkczjXWeec188vUr08kWDnY-miv=9OU8pDToBw@mail.gmail.com>
Subject: Re: ath10k_sdio: Long time for loading firmware and RCU errors
To: Christian Hewitt <christianshewitt@gmail.com>, 
 Gary Bisson <gary.bisson@boundarydevices.com>, gerg@kernel.org,
 erik.stromdahl@gmail.com, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_155144_064274_1F833174 
X-CRM114-Status: GOOD (  10.91  )
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

On Tue, May 25, 2021 at 9:40 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi,
>
> I am using the QCA9377 chip on an imx6dl-pico-pi board running kernel
> 5.10.37 and I noticed that the firmware takes a long time to load
> (more than 3 minutes after boot):

Ok, I replaced eudev with mdev in Buildroot and now it loads the
QCA9377 firmware quickly.

> # wpa_supplicant  -iwlan0 -c /etc/wpa.conf &
> # Successfully initialized wpa_supplicant
> [  234.360447] NOHZ tick-stop error: Non-RCU local softirq work is
> pending, handler #08!!!
> [  234.390478] NOHZ tick-stop error: Non-RCU local softirq work is
> pending, handler #08!!!

These NOHZ messages still pop up.

Cheers

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
