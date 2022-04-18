Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2366CC433EF
	for <ath10k@archiver.kernel.org>; Mon, 18 Apr 2022 15:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBK1vy4tqW1mWn7if7PKTiNNjkvVWXtxj/tuumVpH6k=; b=QsBGaWcUY4LcEf
	BBabKLUfVCqFDlsgy6FRw1oCmNlCdExdI/Eb1D43Wfq88ASlI83nCXoXFUiEbB78NBXsF95nPyvPx
	NrNwHu7vjzTLW6mt8xftwPUv/pRE17chtbIbvrV2A9WZncs+vZ4nw0KEUX+hzRewv0/WThH6qYAYg
	n1JZTd7R0nI+xYw8I/BOs2ncP1f2Q6ip7MIysQ1w4lHiYagj4pj1MdN6GhXayZZWw8ceoTflp5uhU
	tVeVMcOVvo1DM4wRojmGPjpApjOIiAVuIolLNFxF/Q/Py+h7tW4XJ3hQicsZzBLXh9MbGLfPFNkwj
	HZCd4HElNWxLZLm8CXoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngTWh-00HVqe-FN; Mon, 18 Apr 2022 15:42:55 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngTWf-00HVqF-7Y
 for ath10k@lists.infradead.org; Mon, 18 Apr 2022 15:42:54 +0000
Received: by mail-vs1-xe32.google.com with SMTP id m14so12970912vsp.11
 for <ath10k@lists.infradead.org>; Mon, 18 Apr 2022 08:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hqHR0ImHwibt6Y6o1QCx2/fKCQEMa6EyUc6UvVMJ+Hw=;
 b=cRDHbz0O9ZpM4OKWlxmCnXq1sqezyoD4H0IoEg7fvbN5nD06uHZgjAR8koBHKZYkLs
 4wPhLtRPTszrjKhiOGClhG4hDuJ0HVr7YXCANbWabJdwVlZic3nYLBG6usuRFMROMdYV
 kCJO1p4sjhvn4wnRVrOQxAL8eSNDuhDa+ijQT6HVtz080cV6j4YPj/tpWWEDtDDAbDoa
 r8KjbDB2+03vVPvvPb2MJ+sNKNcRfVP83g2vsHzreNCJl94aB6ZRaHkeX2CVZoWdn2+r
 9kGuk9In2hc/D1F5NY3eaae9qLLBNW5A6mYh/cKliUCChBhB3euKkgluZxDkWSQwWUVs
 fCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hqHR0ImHwibt6Y6o1QCx2/fKCQEMa6EyUc6UvVMJ+Hw=;
 b=0zuqPaVLEzD7DQEHPrdEsapxqB4J25xF4Vayc2uQ/xDqOiUp28IM3usaTTEJ2jW3tW
 GO+44qwWnueWNprmWmaR8Tsy0GM67rCnfrcJCcyKc5iua4KW62qLoFGyAYKeo3NdlU8P
 XffQ95b8zW3Zt6S8SUil+VNAnQ5EQgIPk/1Df/TEbe0M9oVixmtmJ112FTKMnzr1uBrS
 Sb5y+QV+77cAXNbft27GpkiQq45AopLLeasky1lgtDR8t51/FWPqZTqjxvvlOQpSLcTC
 5AJNcRUuCLtAsWpLCKP5ZE7XXaMkzMvjmIBoSVDDTMPk1ExhR+/joLT7ghAALt8ApAZp
 yK+g==
X-Gm-Message-State: AOAM5328xW9b2K9lOBx3kHnxa/WJyOo5wjtKee3OQpdJimUFC7M7BxY3
 6yi1CYBEeBbWQB8IRXIJgXjYNrwaYcigKfz8pbg=
X-Google-Smtp-Source: ABdhPJyxeWq6xOgq8cewGCYVxa0bNYYedGRh+A5v6brUa2KfCCn2WD7RCvTLuJJHwEJPA/ZytddgAs33HDmGAXQDF3A=
X-Received: by 2002:a05:6102:a8e:b0:325:aa27:35a7 with SMTP id
 n14-20020a0561020a8e00b00325aa2735a7mr2839149vsg.50.1650296569875; Mon, 18
 Apr 2022 08:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220402153615.9593-1-ryazanov.s.a@gmail.com>
 <87v8vps4jg.fsf@kernel.org>
In-Reply-To: <87v8vps4jg.fsf@kernel.org>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date: Mon, 18 Apr 2022 18:42:39 +0300
Message-ID: <CAHNKnsSbjD_ok+qxj4=HnyNCEKWey34xNQwZwe1gYCKwYmxtAw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] ath10k: add encapsulation offloading support
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_084253_311996_56AFDBDD 
X-CRM114-Status: GOOD (  18.52  )
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

On Mon, Apr 4, 2022 at 10:15 AM Kalle Valo <kvalo@kernel.org> wrote:
> Sergey Ryazanov <ryazanov.s.a@gmail.com> writes:
>> Hello,
>>
>> this series introduces driver support for hardware encapsulation
>> offloading feature.
>>
>> The main goal of the series is an overall improvement of system
>> performance. On a QCA9563+QCA9888-based access point in bridged mode,
>> encapsulation offloading increases TCP 16-streams DL throughput from
>> 365 to 396 mbps (+8%) and UDP DL throughput from 436 to 483 mbps (+11%).
>>
>> The series consist of three patches, the first two prepare the code, and
>> the last one introduces the offloading support itself. The first patch
>> reworks transmission status reporting to make it flexible enough to
>> support 802.11 and Ethernet encapsulated frames reporting. The second
>> patch reworks the module parameter that configures the main
>> encapsulation format of frames that are passed from the driver to the
>> hardware. It makes it possible to configure more encapsulation methods
>> than just raw or not-raw. And, as stated before, the third patch
>> actually introduces offloading support. It changes a couple of frame
>> analysis places along the xmit path and starts reporting offloading
>> support to mac80211 via the corresponding hw attribute.
>>
>> The new feature has been extensively tested with QCA9888 and works well,
>> but it may introduces some regression for other untested chips. So the
>> series is just an RFC for now.
>
> This looks very good to me. But the testing part concerns me as well, it
> would be good to have some quick testing at least with QCA6174/QCA9377
> PCI devices to make sure we don't break those. Preferably also
> QCA6174/QCA9377 SDIO devices should be tested, they work somewhat
> differently. Can anyone help?

Is any brave tester trying to improve the performance of their system
with this change? Can I resend it as a regular patch?

-- 
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
