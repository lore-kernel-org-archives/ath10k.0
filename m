Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A8B2C636CC
	for <ath10k@archiver.kernel.org>; Mon, 20 Feb 2023 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=klQef+f33+9grbpHl1lX4nDSSaQFNh2VvZxrD4ssj6I=; b=4W5H07ntn2DHKz
	HhbX/tOYebJHU9yuaS1g+EBw13wDhUWrfR0OGpIDcNBwL8lGXJKKyASqckAeG9CkeD8K9+PYZw/hI
	BW1fzcfeauD+0NCvcVOfWYvYFjiC41kVmQ0BOEkrxTnjNbRrp26lrfw/W3I3KkuJrz4PBwMhdR+++
	oytcx6did5Y7NpsTiiDw1n2s4jTl9Wd5of2ca5QupLAebdP0Q+MdJfb20kjgptwDe6M9wmHMf7gXa
	Br64PwZFlcQrIs/IdpVv+O9ue9jtAYQZ+2J/yZtTMIQfqDHgbDQcUTgFIR4YfHURTpZAd2xsA2t4m
	MqOpyVkHz9VyZ/ux+o7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU2rm-003Ypi-2e; Mon, 20 Feb 2023 09:53:50 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU2rh-003Yod-Jj
	for ath10k@lists.infradead.org; Mon, 20 Feb 2023 09:53:48 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-536aa45367eso14453887b3.13
        for <ath10k@lists.infradead.org>; Mon, 20 Feb 2023 01:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wOWqn+EAZZ7317oUrwJbDkD6fh11WKF6IR6078s/7WA=;
        b=C5teJZbQONCsIOB7m95k7jDdFnGVQ8naBFmRn/Yo1vSkMj+oGLgej+3+l6EkEQPLv/
         3D2gCBwbofhplqppytAt/Do0xQq5AmDuSe5DQqoETdzkVebMMPomOP+J5KEfWP0+NPby
         uR4oW97Yy4hSec1DPhjNE4opOey3nJJRyE8MxVzhilxVGm/nVllDejDa6TQdwFq2sc5D
         n8lk4yAnun1mBMqRHBjWCaf0ZB1h1ubfQ5KdhTh1LTRCrt4pyEmsRAvdpfsg3bXSBkTa
         pWejfSl3M6TqGiD+ej+Rv8C/ZZJrepcdxFdSyiCBGxn50Z2+/pextqxrIehlW/xk/06/
         XXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOWqn+EAZZ7317oUrwJbDkD6fh11WKF6IR6078s/7WA=;
        b=4OrIwEl7I5bI68foDQotT5GHAKK3WjV6XDP4ABG/QCMefyi21AK+12KhJtnYOmV+Cl
         WVyvzOTl4jWTOoe4UYVJ4BXNRI4u/wllh3LlQHDNenWmztNLQc67UQ+zUaFRvoJ7GTSn
         qgECQ5qF+nkjRe0fWxaH1KztnRyaSt8//7OrdG7JLazd0l9egmIGq9LtRRo3nbMqS/Aq
         dHn4SYMG15afD5pVVeslQ5/hohzqrByL8x+Z7c0Nyg66R637EGQFl6yowF69KfzCHjyV
         4InrPZupeJBRD6Vl1YD/R9MAtQfiY51zjscgukEg9KXdqSuEUSBKyNcG06CuNjdR52Ia
         O7DA==
X-Gm-Message-State: AO0yUKUeOpCRE3SJaC/Hlh1nbu1ATTbPeUE5FpCU0Q7KRU5KJZi9r7VJ
	MxSL5VJZiapNniY6JPucLD5JVPgtkH3BN899d67fBg==
X-Google-Smtp-Source: AK7set/2dwXd27/U0AMPCISzGm1O92AqYnl1I5+rauxbdw0/k5w5/se5XXm5tw7BKylzYbe6fJl/WoCPFr2mH7EUQXo=
X-Received: by 2002:a0d:c185:0:b0:527:3e8:5bab with SMTP id
 c127-20020a0dc185000000b0052703e85babmr358791ywd.306.1676886822812; Mon, 20
 Feb 2023 01:53:42 -0800 (PST)
MIME-Version: 1.0
References: <CAA8EJpqrHuTaN-bB6XoB7ZWNvfggNtMts3bBQwqMH8RpO1E3QQ@mail.gmail.com>
 <81448efc-5b77-5022-5b9f-3b5188509068@linaro.org> <875ybw513n.fsf@kernel.org>
In-Reply-To: <875ybw513n.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 Feb 2023 11:53:32 +0200
Message-ID: <CAA8EJpr4C=Rvq_uUVdC00KX70DMLcWHWuFOYfNn=fXzHdfXasg@mail.gmail.com>
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Lenovo Yoga C630 laptop
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_015345_685040_8B17BED7 
X-CRM114-Status: GOOD (  13.35  )
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

On Mon, 20 Feb 2023 at 07:59, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On 07/10/2022 15:22, Dmitry Baryshkov wrote:
> >> We'd like to ask for inclusion of the board file for the Lenovo Yoga
> >> C630 laptop. It is
> >> a WfA laptop using the Snapdragon SDM850 SoC.
> >
> > I noticed that you've updated the WCN3990's board-2.bin, but this file
> > was not included. Are there any issues with the submission?
>
> It's just that I haven't processed the pending ath10k board file
> submissions from the list yet, I do it quite infrequently.

Ack, thanks. I saw an update of wcn3990's board file in linux-firmware
and thus I wondered, what happened with this submission. Please excuse
me then.


-- 
With best wishes
Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
