Return-Path: <SRS0=QvZk=N3=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3085C433F5
	for <ath10k@archiver.kernel.org>; Sun,  5 Sep 2021 13:07:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D9116054F
	for <ath10k@archiver.kernel.org>; Sun,  5 Sep 2021 13:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D9116054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2EBblt64Xt8OaSs0AS397sK1/FsAA/XbBOj1AwUJx78=; b=4wYTHierVEFCxh
	48+TdKi4GnMI5slXyqZTBX8KRmijJv2z6ukAOx+AEUoP6OKm0e9Nsvt7DivaOdfcLGsIhFn3O6TPw
	qnsEt6F6rJsoQng1DuvivZs232r/kWKjAWI5iWUcjf7Ck5RXoQLE42xmSx6spJc00AKiBEolaY0px
	M3x03amLn6k64G54yMCcyChG7RZmCxC683Dp28G6GxdykqOMCBVjOBjYVC+6D3FBL25L4Fe7Dplna
	lA04BdTbPk1dWZ2hBa+9uyNm6q5VROQfwh8bu2IiS8UgcxSqcRBjSs51NWAO/qx+LmXgygFkrg2+U
	QDS8SgLEV99b3ACermyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMrs6-00FmQ6-7G; Sun, 05 Sep 2021 13:07:42 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMrs2-00FmPf-SQ
 for ath10k@lists.infradead.org; Sun, 05 Sep 2021 13:07:40 +0000
Received: by mail-lj1-x22a.google.com with SMTP id f2so6508431ljn.1
 for <ath10k@lists.infradead.org>; Sun, 05 Sep 2021 06:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FmzPpA+dcUgjZbxr1DCt/GuWMKRkFPIG7aUqTWmahn4=;
 b=hu6t/NPo+ndw6lu/D1S0qScqVt+TFIVdciS9z92uMh4Sd+JNV+RR/FXTXVditvrjXo
 7YKgCBYPV4U72+0hNVLkIIiGCMiQKkdQmDj91/1wPR0ysy3AluGpLolxwZ2T8rKsOygV
 U/ICerfrzU17COY9WGGUMwK2qso8D/gNXo+ClPG5hZ2e7d3J2rNWQJ0/HsM33Rb8Hol2
 DZ7BMs49GLb1hrFrLZRko3jGEwQh1h2OgP0bL+igQHykpSz1rdr9YkmF3uN9EieCsW4r
 zo7peyCCpAbx1Lhbp6eoEg8vSfqpT8ieOx6ywpTmmEUgKqO69FhRR3HOaDwBsVMOeV5K
 GVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FmzPpA+dcUgjZbxr1DCt/GuWMKRkFPIG7aUqTWmahn4=;
 b=C1CtEc3vbQAvDXwMi+wSBPM9xqkyQNmxahZn98YHaDRSyWkhukm/uCW1vvhjENtT0W
 93GEAV6HXmwdYgLPV4Uy26YtAxwBarz9Eox2BC8vdZHxYNW/XOyLxYBB6ePCi7DJRzGX
 hGnQDgx2wRy/gYL9Bq3YVnlTmPqbKv+/+vCpGUUlrQAflGO9eExEWHh+ljn3VHMtSQPB
 5aNJZ3C9yKRnoBL20KMGh2EBDsplBmmDNyuweNek/dIy9ZJo7quRejj40DERAAG59qyp
 whb0PGyGgKt/BQl1O3yPMZxH9fH/GmOv3acrgBFTxuHb6qEaQnF/ewM1b+62Ha3ZTreJ
 szyw==
X-Gm-Message-State: AOAM530qdY74dNbbSa405r2YUcr+G+nXZyfPoYRPrSg68mg4CQKWKdpX
 Gn0hKGlUj9xBUTB1zl1YpWACBvnYeXH7+BMC75w=
X-Google-Smtp-Source: ABdhPJyd1NjeaO8/hR94rUQYh/Ok0eOzyvASBMNvgaN3v8pqiVt34WooRsQnseUNz2CQTNmsQiozvZ/Vp5OXOX6RMLM=
X-Received: by 2002:a05:651c:4d4:: with SMTP id
 e20mr6577481lji.402.1630847255093; 
 Sun, 05 Sep 2021 06:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5AAvZic-NFbYYSVfOxY-27QukXMX68f9eDmhbqAkBRKRw@mail.gmail.com>
 <20210818154358.GS4126399@paulmck-ThinkPad-P17-Gen-1>
 <CAOMZO5A7drx9yXWXKTh4VfV4QHNGCPbH_vxeb=NGDghAm98CXA@mail.gmail.com>
 <CAOMZO5BY7JeFQJkU--KGRfNLTUnUVjnfar+37SvReXyBt9QJfA@mail.gmail.com>
 <20210818175604.GX4126399@paulmck-ThinkPad-P17-Gen-1> <87czpqbq98.ffs@tglx>
 <877dfyaxpx.ffs@tglx>
 <CAOMZO5BnPEnF-HNM7vCzeUrRW7BsQ-hhm4fcVmO_QieKf6oJsw@mail.gmail.com>
 <87y28b9nyn.ffs@tglx>
In-Reply-To: <87y28b9nyn.ffs@tglx>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 5 Sep 2021 10:07:24 -0300
Message-ID: <CAOMZO5D7wejn3CvGEvFyRLeOqpdxBOD+-9dTV3xVoPQgWpqUzA@mail.gmail.com>
Subject: Re: NOHZ tick-stop error with ath10k SDIO
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "Paul E . McKenney" <paulmck@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 ath10k@lists.infradead.org, 
 linux-mmc <linux-mmc@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Vasut <marex@denx.de>, qais.yousef@arm.com, 
 Frederic Weisbecker <frederic@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210905_060738_962611_F9CB463C 
X-CRM114-Status: UNSURE (   5.93  )
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

Hi Thomas,

On Sun, Sep 5, 2021 at 10:00 AM Thomas Gleixner <tglx@linutronix.de> wrote:

> Yes. This is correct. See above.

Thanks for your help. Appreciated.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
